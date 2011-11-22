package 
{

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextFormat;



	public class Water extends MovieClip implements IQuestion
	{
		var slotList:Vector.<Slot>;
		private var hitSlot:Slot;
		
		public function Water(x:int, y:int)
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
			var slot_H1:Slot=new Slot(238.95, 87, "H", Color.BLUE, new Array(false, false, true, false, false, false, false, false), false);
			addChild(slot_H1);
		
			var slot_H2:Slot=new Slot(287.45, 136, "H", Color.BLUE, new Array(true, false, false, false, false, false, false, false), false);
			addChild(slot_H2);
			
			var slot_O1:Slot=new Slot(287.45, 87, "O", Color.RED, new Array(true, true, true, true, false, true, false, true), false);
			addChild(slot_O1);
			
			slotList.push(slot_H1);
			slotList.push(slot_H2);
			slotList.push(slot_O1);
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