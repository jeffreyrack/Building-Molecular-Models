package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextFormat;

	
	public class Glycine extends MovieClip implements IQuestion{
		var slotList:Vector.<Slot>;
		private var hitSlot:Slot;
		
		public function Glycine(x:int, y:int)
		{
			this.x = x;
			this.y = y;
			slotList=new Vector.<Slot>();
			initializeSlots();

		}
		

		public function isLegalDrop(dropObj:MovieClip):Boolean
		{
			var isLegal:Boolean = false;
			var fmt:TextFormat = new TextFormat();

			for (var i:int=0; i<slotList.length; i++)
			{
				var slotCheck:Slot = slotList[i];
				if (slotCheck.hitTestObject(dropObj))
				{
					// Rackauckas If the slot isn't available, an object can't be dropped here.
					if (! slotCheck.isAvailable())
					{
						return false;
					}
					else if ((dropObj.symbol.text == slotCheck.elementContained))
					{
						hitSlot = slotCheck;
						slotCheck.makeElectronsVisible();
						slotCheck.setContent(dropObj);
						isFinish();
						return true;
					}
				}
			}
			return false;
		}
		
		
		public function getHitSlot():Slot
		{
			return hitSlot;
		}


		public function initializeSlots()
		{
			var slot_H1:Slot=new Slot(210, -52, "H", Color.BLUE, new Array(false,false,false,false,false,true,false,false), false);
			var slot_H2:Slot=new Slot(257.95, -52, "H", Color.BLUE, new Array(false,false,false,false,false,true,false,false), false);
			var slot_H3:Slot=new Slot(353.85, -52, "H", Color.BLUE, new Array(false,false,false,false,false,false,false,true), false);
			var slot_H4:Slot=new Slot(210, 44, "H", Color.BLUE, new Array(true,false,false,false,false,false,false,false), false);
			var slot_H5:Slot=new Slot(257.95, 44, "H", Color.BLUE, new Array(true,false,false,false,false,false,false,false), false);
			var slot_O1:Slot=new Slot(305.95, -52, "O", Color.RED, new Array(false,false,true,false,false,true,false,false), false);
			var slot_O2:Slot=new Slot(305.95, 44, "O", Color.RED, new Array(true,true,false,false,false,false,false,false), false);
			var slot_N:Slot=new Slot(210, -4, "N", Color.BROWN, new Array(true,false,true,false,false,true,true,true), false);
			var slot_C1:Slot=new Slot(257.95, -4, "C", Color.PURPLE, new Array(true,false,true,false,false,true,false,true), false);
			var slot_C2:Slot=new Slot(305.95, -4, "C", Color.PURPLE, new Array(true,false,false,false,true,true,false,true), false);
			
			addChild(slot_H1);
			slotList.push(slot_H1);
			addChild(slot_H2);
			slotList.push(slot_H2);
			addChild(slot_H3);
			slotList.push(slot_H3);
			addChild(slot_H4);
			slotList.push(slot_H4);
			addChild(slot_H5);
			slotList.push(slot_H5);
			addChild(slot_O1);
			slotList.push(slot_O1);
			addChild(slot_O2);
			slotList.push(slot_O2);
			addChild(slot_N);
			slotList.push(slot_N);
			addChild(slot_C1);
			slotList.push(slot_C1);
			addChild(slot_C2);
			slotList.push(slot_C2);
		}


		public function clearAnswer():void
		{
			for (var i:int=0; i<slotList.length; i++)
			{
				var checkSlot:Slot = slotList[i];
				if (checkSlot.getContent() != null)
				{
					checkSlot.getContent().parent.removeChild(checkSlot.getContent());
				}
			}
		}
	
	
	
		private function isFinish()
		{
			for (var i:int=0; i<slotList.length; i++)
			{
				var checkSlot:Slot = slotList[i];
				if (checkSlot.isAvailable())
				{
					return;
				}
			}
			dispatchEvent(new Event("CORRECT_ANSWER_RECEIVED",true,false));
		}
	}


}
