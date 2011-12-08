package 
{

	import flash.display.*;
	import flash.events.Event;
	import flash.text.TextFormat;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class Water extends MovieClip implements IQuestion
	{
		var slotList:Vector.<Slot>;
		private var hitSlot:Slot;
		var xmlData:XML;
		
		public function Water(x:int, y:int)
		{
			this.x = x;
			this.y = y;
			slotList=new Vector.<Slot>();
			initializeSlots();
			xmlData=new XML();
		}
		public function translateColor(Colorname:String):uint{
			if(Colorname=="BLUE") return Color.BLUE;
			if(Colorname=="RED") return Color.RED;
			return Color.BLUE;
		}
		public function parseToBool(temp:int):Boolean{
			if(temp==0) return false;
			else return true;
		}
		public function ProcessXMLData(e:Event){
			xmlData.ignoreWhite=true;
			xmlData=new XML(e.target.data);
			trace(xmlData.Molecule[0].attribute("name"));
			for(var i:int=0; i<xmlData.Molecule[0].Slot.length(); i++){
				var temp:Slot=new Slot(xmlData.Molecule[0].Slot[i].x, xmlData.Molecule[0].Slot[i].y, xmlData.Molecule[0].Slot[i].Name,translateColor(xmlData.Molecule[0].Slot[i].Color), 
									   new Array(parseToBool(xmlData.Molecule[0].Slot[i].Array.a), parseToBool(xmlData.Molecule[0].Slot[i].Array.b), parseToBool(xmlData.Molecule[0].Slot[i].Array.c),
												 parseToBool(xmlData.Molecule[0].Slot[i].Array.d), parseToBool(xmlData.Molecule[0].Slot[i].Array.e), parseToBool(xmlData.Molecule[0].Slot[i].Array.f),
												 parseToBool(xmlData.Molecule[0].Slot[i].Array.g), parseToBool(xmlData.Molecule[0].Slot[i].Array.h)), false);
				addChild(temp);
				slotList.push(temp);
			}
			trace("Success!");
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
	
    		var xmlLoader:URLLoader = new URLLoader();
			xmlLoader.addEventListener(Event.COMPLETE, ProcessXMLData);
			xmlLoader.load(new URLRequest("Molecules.xml"));
			/*
			var slot_H1:Slot=new Slot(238.95, 87, "H", Color.BLUE, new Array(false, false, true, false, false, false, false, false), false);
			addChild(slot_H1);
		
			var slot_H2:Slot=new Slot(287.45, 136, "H", Color.BLUE, new Array(true, false, false, false, false, false, false, false), false);
			addChild(slot_H2);
			
			var slot_O1:Slot=new Slot(287.45, 87, "O", Color.RED, new Array(true, true, true, true, false, true, false, true), false);
			addChild(slot_O1);
			
			slotList.push(slot_H1);
			slotList.push(slot_H2);
			slotList.push(slot_O1);
			*/
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