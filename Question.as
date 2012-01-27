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
		
		// Translates the string of a color name to the uint value of the color.
		// Is used so that way only the name of the color needs to be put into the xml data,
		// Making it easier to change the colors that are wanted.
		public function translateColor(Colorname:String):uint
		{
			if(Colorname=="BLUE") return Color.BLUE;
			if(Colorname=="RED") return Color.RED;
			return Color.BLUE;
		}
		
		
		// Function used to look through the XML Data and create the appropiate slots.
		// Event e is passed to the function because e is what contains the XML data.
		public function ProcessXMLData(e:Event)
		{
			// We don't want to record the white space, as being able to use white space in the XML data helps make
			// it easier to read.
			xmlData.ignoreWhite=true;
			xmlData=new XML(e.target.data);
			var slotNumber:uint=0;
			// Finds out which Molecule slot has the same name as the Molecule Name passed to the class
			// in the constructor.
			for(var i:int=0; i<xmlData.Molecule.length(); i++)
			{
				if(xmlData.Molecule[i].attribute("name")==molName)
				{
					slotNumber=i;
					break;
				}
			}
			// For loop created to go through the xml Data, and create a new slot for each slot in the <Molecule> chosen in the above for loop.
			for(var i:int=0; i<xmlData.Molecule[slotNumber].Slot.length(); i++)
			{
				var temp:Slot=new Slot(xmlData.Molecule[slotNumber].Slot[i].x, xmlData.Molecule[slotNumber].Slot[i].y, xmlData.Molecule[slotNumber].Slot[i].Name,translateColor(xmlData.Molecule[slotNumber].Slot[i].Color), 
								// Seperates each character of VisibleElectrons, giving each character their own slot in an array.
												 xmlData.Molecule[slotNumber].Slot[i].VisibleElectrons.split('')
												 , false);
				addChild(temp);
				slotList.push(temp);
			}
		}
		
		
		
		// Determines whether the drop is correct by looking through all the slots, and then checking if
		// it hit the slot, then checks if the slot is still available, and then checks if the correct
		// element was placed.
		public function isLegalDrop(dropObj:MovieClip):Boolean
		{
			var isLegal:Boolean = false;
			var fmt:TextFormat = new TextFormat();
			for (var i:int=0; i<slotList.length; i++)
			{
				var slotCheck:Slot = slotList[i];
				if (slotCheck.hitTestObject(dropObj))
				{
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

		// Reads the XML data, and then when the XML Data is done being read, sends an event to ProcessXMLData.
		public function initializeSlots()
		{
    		var xmlLoader:URLLoader = new URLLoader();
			xmlLoader.addEventListener(Event.COMPLETE, ProcessXMLData);
			xmlLoader.load(new URLRequest("Molecules.xml"));
		}

		// Clears all of the slots for the Question.
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

		// Is called anytime a slot is filled,
		// Runs through all of the slots, and checks if they are full.
		// If all slots are full, the Question is done, so it dispatches an event accordingly.
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