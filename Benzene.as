package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextFormat;

	
	public class Benzene extends MovieClip implements IQuestion{
		
		private var hitSlot:Slot;
		
		public function Benzene(x:Number, y:Number) {
		this.x=x;
		this.y=y;
		// constructor code
		}
		
		public function isLegalDrop(dropObj:MovieClip):Boolean
		{
			var isLegal:Boolean = false;
			var fmt:TextFormat = new TextFormat();

			// C1 C2 C3 C4 C5 C6 H1 H2 H3 H4 H5 H6
			if(slot_C1.hitTestObject(dropObj))
			{
				if(!slot_C1.isAvailable())
					return false;
				else if((dropObj.symbol.text == "C"))
				{
					hitSlot = slot_C1;
					slot_C1.setElectronVisible(false,false,true,true,false,true,false,true);
					slot_C1.setElectronColor(0xFF0000);
					slot_C1.setContent(dropObj);
					fmt.color = 0xFF0000; // red
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}
			
			else if(slot_C2.hitTestObject(dropObj))
			{
				if(!slot_C2.isAvailable())
					return false;
				else if((dropObj.symbol.text == "C"))
				{
					hitSlot = slot_C2;
					slot_C2.setElectronVisible(true,false,true,false,false,false,true,true);
					slot_C2.setElectronColor(0xFF0000);
					slot_C2.setContent(dropObj);
					fmt.color = 0xFF0000; // red
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}
			else if(slot_C3.hitTestObject(dropObj))
			{
				if(!slot_C3.isAvailable())
					return false;
				else if((dropObj.symbol.text == "C"))
				{
					hitSlot = slot_C3;
					slot_C3.setElectronVisible(false,false,false,true,true,true,true,false);
					slot_C3.setElectronColor(0xFF0000);
					slot_C3.setContent(dropObj);
					fmt.color = 0xFF0000; // red
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}
			else if(slot_C4.hitTestObject(dropObj))
			{
				if(!slot_C4.isAvailable())
					return false;
				else if((dropObj.symbol.text == "C"))
				{
					hitSlot = slot_C4;
					slot_C4.setElectronVisible(false,true,true,true,false,false,false,true);
					slot_C4.setElectronColor(0xFF0000);
					slot_C4.setContent(dropObj);
					fmt.color = 0xFF0000; // red
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}
			
			else if(slot_C5.hitTestObject(dropObj))
			{
				if(!slot_C5.isAvailable())
					return false;
				else if((dropObj.symbol.text == "C"))
				{
					hitSlot = slot_C5;
					slot_C5.setElectronVisible(false,false,true,false,false,true,true,true);
					slot_C5.setElectronColor(0xFF0000);
					slot_C5.setContent(dropObj);
					fmt.color = 0xFF0000; // red
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}
			else if(slot_C6.hitTestObject(dropObj))
			{
				if(!slot_C6.isAvailable())
					return false;
				else if((dropObj.symbol.text == "C"))
				{
					hitSlot = slot_C6;
					slot_C6.setElectronVisible(true,true,true,false,false,false,true,false);
					slot_C6.setElectronColor(0xFF0000);
					slot_C6.setContent(dropObj);
					fmt.color = 0xFF0000; // red
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}


			else if(slot_H1.hitTestObject(dropObj))
			{
				if(!slot_H1.isAvailable())
					return false;
				else if((dropObj.symbol.text == "H"))
				{
					hitSlot = slot_H1;
					slot_H1.setElectronVisible(false,false,false,false,false,true,false,false);
					slot_H1.setElectronColor(0x223077);
					slot_H1.setContent(dropObj);
					fmt.color = 0x223077;
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}
			else if(slot_H2.hitTestObject(dropObj))
			{
				if(!slot_H2.isAvailable())
					return false;
				else if((dropObj.symbol.text == "H"))
				{
					hitSlot = slot_H2;
					slot_H2.setElectronVisible(false,false,true,false,false,false,false,false);
					slot_H2.setElectronColor(0x223077);
					slot_H2.setContent(dropObj);
					fmt.color = 0x223077;
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}
			else if(slot_H3.hitTestObject(dropObj))
			{
				if(!slot_H3.isAvailable())
					return false;
				else if((dropObj.symbol.text == "H"))
				{
					hitSlot = slot_H3;
					slot_H3.setElectronVisible(false,false,false,false,false,false,true,false);
					slot_H3.setElectronColor(0x223077);
					slot_H3.setContent(dropObj);
					fmt.color = 0x223077;
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}
			else if(slot_H4.hitTestObject(dropObj))
			{
				if(!slot_H4.isAvailable())
					return false;
				else if((dropObj.symbol.text == "H"))
				{
					hitSlot = slot_H4;
					slot_H4.setElectronVisible(false,false,true,false,false,false,false,false);
					slot_H4.setElectronColor(0x223077);
					slot_H4.setContent(dropObj);
					fmt.color = 0x223077;
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}			

			else if(slot_H5.hitTestObject(dropObj))
			{
				if(!slot_H5.isAvailable())
					return false;
				else if((dropObj.symbol.text == "H"))
				{
					hitSlot = slot_H5;
					slot_H5.setElectronVisible(false,false,false,false,false,false,false,true);
					slot_H5.setElectronColor(0x223077);
					slot_H5.setContent(dropObj);
					fmt.color = 0x223077;
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}
			else if(slot_H6.hitTestObject(dropObj))
			{
				if(!slot_H6.isAvailable())
					return false;
				else if((dropObj.symbol.text == "H"))
				{
					hitSlot = slot_H6;
					slot_H6.setElectronVisible(true,false,false,false,false,false,false,false);
					slot_H6.setElectronColor(0x223077);
					slot_H6.setContent(dropObj);
					fmt.color = 0x223077;
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}	
			
			return false;
		
		}
		public function getHitSlot():Slot
		{
			return hitSlot;
		}
		
		public function clearAnswer():void
		{
			if(slot_H1.getContent()!=null)slot_H1.getContent().parent.removeChild(slot_H1.getContent());
			if(slot_H2.getContent()!=null)slot_H2.getContent().parent.removeChild(slot_H2.getContent());
			if(slot_H3.getContent()!=null)slot_H3.getContent().parent.removeChild(slot_H3.getContent());
			if(slot_H4.getContent()!=null)slot_H4.getContent().parent.removeChild(slot_H4.getContent());
			if(slot_H5.getContent()!=null)slot_H5.getContent().parent.removeChild(slot_H5.getContent());
			if(slot_H6.getContent()!=null)slot_H6.getContent().parent.removeChild(slot_H6.getContent());
			
			if(slot_C1.getContent()!=null)slot_C1.getContent().parent.removeChild(slot_C1.getContent());
			if(slot_C2.getContent()!=null)slot_C2.getContent().parent.removeChild(slot_C2.getContent());
			if(slot_C3.getContent()!=null)slot_C3.getContent().parent.removeChild(slot_C3.getContent());
			if(slot_C4.getContent()!=null)slot_C4.getContent().parent.removeChild(slot_C4.getContent());
			if(slot_C5.getContent()!=null)slot_C5.getContent().parent.removeChild(slot_C5.getContent());
			if(slot_C6.getContent()!=null)slot_C6.getContent().parent.removeChild(slot_C6.getContent());


		}
		
		private function isFinish()
		{
			if(!slot_C1.isAvailable()&&!slot_C2.isAvailable()&&!slot_C3.isAvailable()&&!slot_C4.isAvailable()&&!slot_C5.isAvailable()&&!slot_C6.isAvailable()&&!slot_H1.isAvailable()&&!slot_H2.isAvailable()&&!slot_H3.isAvailable()&&!slot_H4.isAvailable()&&!slot_H5.isAvailable()&&!slot_H6.isAvailable())
			{
				dispatchEvent(new Event("CORRECT_ANSWER_RECEIVED",true,false));
			}
		}
	}
	
}
