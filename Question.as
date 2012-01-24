package 
{

	import flash.display.*;
	import flash.events.Event;
	import flash.text.TextFormat;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class Question extends MovieClip implements IQuestion
	{
		var slotList:Vector.<Slot>;
		private var hitSlot:Slot;
		var xmlData:XML;
		var molName:String;
		var Title:MovieClip;
		
		public function Question(x:int, y:int, moleculeName:String)
		{
			this.x = x;
			this.y = y;
			slotList=new Vector.<Slot>();
			initializeSlots();
			xmlData=new XML();
			molName=moleculeName;
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
			var slotNumber:uint=0;
			for(var i:int=0; i<xmlData.Molecule.length(); i++){
				if(xmlData.Molecule[i].attribute("name")==molName){
					slotNumber=i;
					trace("slotNumber is = i");
					break;
				}
			}
			
			for(var i:int=0; i<xmlData.Molecule[slotNumber].Slot.length(); i++){
				var temp:Slot=new Slot(xmlData.Molecule[slotNumber].Slot[i].x, xmlData.Molecule[slotNumber].Slot[i].y, xmlData.Molecule[slotNumber].Slot[i].Name,translateColor(xmlData.Molecule[slotNumber].Slot[i].Color), 
									   new Array(parseToBool(xmlData.Molecule[slotNumber].Slot[i].Array.a), parseToBool(xmlData.Molecule[slotNumber].Slot[i].Array.b), parseToBool(xmlData.Molecule[slotNumber].Slot[i].Array.c),
												 parseToBool(xmlData.Molecule[slotNumber].Slot[i].Array.d), parseToBool(xmlData.Molecule[slotNumber].Slot[i].Array.e), parseToBool(xmlData.Molecule[slotNumber].Slot[i].Array.f),
												 parseToBool(xmlData.Molecule[slotNumber].Slot[i].Array.g), parseToBool(xmlData.Molecule[slotNumber].Slot[i].Array.h)), false);
				addChild(temp);
				slotList.push(temp);
			}
			createProperTitle();
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
					trace("it hit the testObject");
					// Rackauckas If the slot isn't available, an object can't be dropped here.
					if (! slotCheck.isAvailable())
					{
						trace("not available");
						return false;
					}
					else if ((dropObj.symbol.text == slotCheck.elementContained))
					{
						trace("has the correct name");
						hitSlot = slotCheck;
						slotCheck.makeElectronsVisible();
						slotCheck.setContent(dropObj);
						isFinish();
						return true;
					}
					trace("other");
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
	
	private function createProperTitle(){
		/*
		Title=new Water();
		Title.visible=true;
		Title.x=238.95;
		Title.y=87;
		*/
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