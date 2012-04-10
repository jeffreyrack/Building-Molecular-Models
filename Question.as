package 
{

	import flash.display.*;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.StyleSheet;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.engine.TextBlock;

	public class Question extends MovieClip implements IQuestion
	{
		// Contains all of the slots making it easy to sort through all of the slots.
		var slotList:Vector.<Slot>;
		// The slot that an object was dropped on.
		private var hitSlot:Slot;
		// Is used for reading the xml Data.
		var xmlData:XML;
		// The name of the molecule, passed to the Question in the constructer.
		var molName:String;
		// The chemical symbol for the Molecule, which is read from the xml file.
		var chemSymbol:String;
		// The textField which contains the Title of the element (The name, and then the
		// chemical symbol below it.
		var Title:TextField = new TextField();
		
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
			if(Colorname=="BROWN") return Color.BROWN;
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
			chemSymbol=xmlData.Molecule[slotNumber].Title.Symbol;
			// For loop created to go through the xml Data, and create a new slot for each slot in the <Molecule> chosen in the above for loop.
			for(var i:int=0; i<xmlData.Molecule[slotNumber].Slot.length(); i++)
			{
				var temp:Slot=new Slot(xmlData.Molecule[slotNumber].Slot[i].x, xmlData.Molecule[slotNumber].Slot[i].y, xmlData.Molecule[slotNumber].Slot[i].Name,translateColor(xmlData.Molecule[slotNumber].Slot[i].Color), 
								// Seperates each character of VisibleElectrons, giving each character their own slot in an array.
												 xmlData.Molecule[slotNumber].Slot[i].VisibleElectrons.split('')
												 , false);
				temp.scaleX=xmlData.Molecule[slotNumber].Slot[i].Scale;
				temp.scaleY=xmlData.Molecule[slotNumber].Slot[i].Scale;
				if(xmlData.Molecule[slotNumber].Slot[i].Position!="None") CalculatePosition(slotList[i-1], temp, xmlData.Molecule[slotNumber].Slot[i].Position);
				addChild(temp);
				slotList.push(temp);
			}
			CreateTitle();
			Title.x=xmlData.Molecule[slotNumber].Title.x;
			Title.y=xmlData.Molecule[slotNumber].Title.y;
		}
		
		private function CalculatePosition(prev:Slot, temp:Slot, Position:String)
		{
			// Multiply the base difference by the scale to calculate the space wanted.
			var difference:int=53*temp.scaleX;
			// Conditional Statements to Determine whether to increase left/right, or decrease. Possibly set bools.
			if(Position=="Right"){
				temp.x=prev.x+difference;
				temp.y=prev.y;
			} else if(Position=="Left"){
				temp.x=prev.x-difference;
				temp.y=prev.y;
			} else if(Position=="Above"){
				temp.x=prev.x;
				temp.y=prev.y-difference;
			} else if(Position=="Below"){
				temp.x=prev.x;
				temp.y=prev.y+difference;
			} else if(Position=="Upper Right"){
				temp.x=prev.x+difference;
				temp.y=prev.y-difference;
			} else if(Position=="Upper Left"){
				temp.x=prev.x-difference;
				temp.y=prev.y-difference;
			} else if(Position=="Lower Right"){
				temp.x=prev.x+difference;
				temp.y=prev.y+difference;
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
						dropObj.scaleX=slotCheck.scaleX;
						dropObj.scaleY=slotCheck.scaleY;
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
		// Is used to create the element Title underneath the slots.
		// First line of the title should be the name of the element, second is the chemical symbol.
		// Creates a css class, and then applies it to the text in order to apply the affects.
		// I'm not sure if this is the best way of going about it, as it seems to me that it's very sloppy.
		// Title.font, Title.color etc. did not seem to exist.  Perhaps I capitalized when I shouldn't have?
		private function CreateTitle(){
			Title.multiline = true;
			Title.width=250;
			Title.selectable=false;
			Title.height=250;
			var CSS:String = ".Title{color:#000066; font-family:Arial; font-size:22px; font-weight:bold;}";
var ss:StyleSheet = new StyleSheet();
ss.parseCSS(CSS);
Title.styleSheet = ss;
Title.htmlText = '<div align="center"><span class="Title">' + molName + " \n"+ chemSymbol;
addChild(Title);
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