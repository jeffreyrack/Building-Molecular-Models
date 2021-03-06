﻿package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextFormat;

	
	public class Cyclohexane extends MovieClip implements IQuestion{
		
		private var hitSlot:Slot;
		
		public function Cyclohexane(x:Number, y:Number) {
			this.x=x;
			this.y=y;
			// constructor code
		}
		
		public function isLegalDrop(dropObj:MovieClip):Boolean
		{
			var isLegal:Boolean = false;
			var fmt:TextFormat = new TextFormat();

			// C1 C2 C3 C4 C5 C6 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12
			if(slot_C1.hitTestObject(dropObj))
			{
				if(!slot_C1.isAvailable())
					return false;
				else if((dropObj.symbol.text == "C"))
				{
					hitSlot = slot_C1;
					slot_C1.setElectronVisible(true,false,true,false,false,true,false,true);
					slot_C1.setElectronColor(Color.RED);
					slot_C1.setContent(dropObj);
					fmt.color = Color.RED; // red
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
					slot_C2.setElectronVisible(true,false,true,false,false,true,false,true);
					slot_C2.setElectronColor(Color.RED);
					slot_C2.setContent(dropObj);
					fmt.color = Color.RED; // red
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
					slot_C3.setElectronVisible(true,false,false,false,false,true,true,true);
					slot_C3.setElectronColor(Color.RED);
					slot_C3.setContent(dropObj);
					fmt.color = Color.RED; // red
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
					slot_C4.setElectronVisible(true,false,true,true,false,true,false,false);
					slot_C4.setElectronColor(Color.RED);
					slot_C4.setContent(dropObj);
					fmt.color = Color.RED; // red
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
					slot_C5.setElectronVisible(true,false,true,false,false,true,false,true);
					slot_C5.setElectronColor(Color.RED);
					slot_C5.setContent(dropObj);
					fmt.color = Color.RED; // red
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
					slot_C6.setElectronVisible(true,false,true,false,false,true,false,true);
					slot_C6.setElectronColor(Color.RED);
					slot_C6.setContent(dropObj);
					fmt.color = Color.RED; // red
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
					slot_H1.setElectronColor(Color.BLUE);
					slot_H1.setContent(dropObj);
					fmt.color = Color.BLUE;
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
					slot_H2.setElectronVisible(false,false,false,false,false,true,false,false);
					slot_H2.setElectronColor(Color.BLUE);
					slot_H2.setContent(dropObj);
					fmt.color = Color.BLUE;
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
					slot_H3.setElectronVisible(false,false,true,false,false,false,false,false);
					slot_H3.setElectronColor(Color.BLUE);
					slot_H3.setContent(dropObj);
					fmt.color = Color.BLUE;
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
					slot_H4.setElectronVisible(false,false,false,false,false,false,false,true);
					slot_H4.setElectronColor(Color.BLUE);
					slot_H4.setContent(dropObj);
					fmt.color = Color.BLUE;
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
					slot_H5.setElectronVisible(false,false,true,false,false,false,false,false);
					slot_H5.setElectronColor(Color.BLUE);
					slot_H5.setContent(dropObj);
					fmt.color = Color.BLUE;
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
					slot_H6.setElectronVisible(false,false,false,true,false,false,false,false);
					slot_H6.setElectronColor(Color.BLUE);
					slot_H6.setContent(dropObj);
					fmt.color = Color.BLUE;
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}	
			else if(slot_H7.hitTestObject(dropObj))
			{
				if(!slot_H7.isAvailable())
					return false;
				else if((dropObj.symbol.text == "H"))
				{
					hitSlot = slot_H7;
					slot_H7.setElectronVisible(false,false,false,false,false,false,false,true);
					slot_H7.setElectronColor(Color.BLUE);
					slot_H7.setContent(dropObj);
					fmt.color = Color.BLUE;
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}		
			else if(slot_H8.hitTestObject(dropObj))
			{
				if(!slot_H8.isAvailable())
					return false;
				else if((dropObj.symbol.text == "H"))
				{
					hitSlot = slot_H8;
					slot_H8.setElectronVisible(false,false,false,false,false,false,true,false);
					slot_H8.setElectronColor(Color.BLUE);
					slot_H8.setContent(dropObj);
					fmt.color = Color.BLUE;
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}		
			else if(slot_H9.hitTestObject(dropObj))
			{
				if(!slot_H9.isAvailable())
					return false;
				else if((dropObj.symbol.text == "H"))
				{
					hitSlot = slot_H9;
					slot_H9.setElectronVisible(false,false,true,false,false,false,false,false);
					slot_H9.setElectronColor(Color.BLUE);
					slot_H9.setContent(dropObj);
					fmt.color = Color.BLUE;
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}		
			else if(slot_H10.hitTestObject(dropObj))
			{
				if(!slot_H10.isAvailable())
					return false;
				else if((dropObj.symbol.text == "H"))
				{
					hitSlot = slot_H10;
					slot_H10.setElectronVisible(false,false,false,false,false,false,false,true);
					slot_H10.setElectronColor(Color.BLUE);
					slot_H10.setContent(dropObj);
					fmt.color = Color.BLUE;
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}		
			else if(slot_H11.hitTestObject(dropObj))
			{
				if(!slot_H11.isAvailable())
					return false;
				else if((dropObj.symbol.text == "H"))
				{
					hitSlot = slot_H11;
					slot_H11.setElectronVisible(true,false,false,false,false,false,false,false);
					slot_H11.setElectronColor(Color.BLUE);
					slot_H11.setContent(dropObj);
					fmt.color = Color.BLUE;
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}		
			else if(slot_H12.hitTestObject(dropObj))
			{
				if(!slot_H12.isAvailable())
					return false;
				else if((dropObj.symbol.text == "H"))
				{
					hitSlot = slot_H12;
					slot_H12.setElectronVisible(true,false,false,false,false,false,false,false);
					slot_H12.setElectronColor(Color.BLUE);
					slot_H12.setContent(dropObj);
					fmt.color = Color.BLUE;
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
			if(slot_H7.getContent()!=null)slot_H7.getContent().parent.removeChild(slot_H7.getContent());
			if(slot_H8.getContent()!=null)slot_H8.getContent().parent.removeChild(slot_H8.getContent());
			if(slot_H9.getContent()!=null)slot_H9.getContent().parent.removeChild(slot_H9.getContent());
			if(slot_H10.getContent()!=null)slot_H10.getContent().parent.removeChild(slot_H10.getContent());
			if(slot_H11.getContent()!=null)slot_H11.getContent().parent.removeChild(slot_H11.getContent());
			if(slot_H12.getContent()!=null)slot_H12.getContent().parent.removeChild(slot_H12.getContent());

			if(slot_C1.getContent()!=null)slot_C1.getContent().parent.removeChild(slot_C1.getContent());
			if(slot_C2.getContent()!=null)slot_C2.getContent().parent.removeChild(slot_C2.getContent());
			if(slot_C3.getContent()!=null)slot_C3.getContent().parent.removeChild(slot_C3.getContent());
			if(slot_C4.getContent()!=null)slot_C4.getContent().parent.removeChild(slot_C4.getContent());
			if(slot_C5.getContent()!=null)slot_C5.getContent().parent.removeChild(slot_C5.getContent());
			if(slot_C6.getContent()!=null)slot_C6.getContent().parent.removeChild(slot_C6.getContent());

		}
		
		private function isFinish()
		{
			if(!slot_C1.isAvailable()&&!slot_C2.isAvailable()&&!slot_C3.isAvailable()&&!slot_C4.isAvailable()&&!slot_C5.isAvailable()&&!slot_C6.isAvailable()&&!slot_H1.isAvailable()&&!slot_H2.isAvailable()&&!slot_H3.isAvailable()&&!slot_H4.isAvailable()&&!slot_H5.isAvailable()&&!slot_H6.isAvailable()&&!slot_H7.isAvailable()&&!slot_H8.isAvailable()&&!slot_H9.isAvailable()&&!slot_H10.isAvailable()&&!slot_H11.isAvailable()&&!slot_H12.isAvailable())
			{
				dispatchEvent(new Event("CORRECT_ANSWER_RECEIVED",true,false));
			}
		}
	}
	
}
