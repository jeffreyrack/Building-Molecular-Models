package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextFormat;

	
	public class SulfuricAcid extends MovieClip implements IQuestion{
		
		private var hitSlot:Slot;
		
		public function SulfuricAcid(x:Number, y:Number) {
			this.x=x;
			this.y=y;
			// constructor code
		}
		
		public function isLegalDrop(dropObj:MovieClip):Boolean
		{
			var isLegal:Boolean = false;
			var fmt:TextFormat = new TextFormat();

			// H1 H2 S O1 O2 O3 O4
			if(slot_H1.hitTestObject(dropObj))
			{
				if(!slot_H1.isAvailable())
					return false;
				else if((dropObj.symbol.text == "H"))
				{
					hitSlot = slot_H1;
					slot_H1.setElectronVisible(false,false,true,false,false,false,false,false);
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
					slot_H2.setElectronVisible(false,false,false,false,false,false,true,false);
					slot_H2.setElectronColor(Color.BLUE);
					slot_H2.setContent(dropObj);
					fmt.color = Color.BLUE;
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}
			else if(slot_S.hitTestObject(dropObj))
			{
				if(!slot_S.isAvailable())
					return false;
				else if((dropObj.symbol.text == "S"))
				{
					hitSlot = slot_S;
					slot_S.setElectronVisible(true,true,true,false,true,true,false,true);
					slot_S.setElectronColor(0x88AA12);
					slot_S.setContent(dropObj);
					fmt.color = 0x88AA12;
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}
			
			else if(slot_O1.hitTestObject(dropObj))
			{
				if(!slot_O1.isAvailable())
					return false;
				else if((dropObj.symbol.text == "O"))
				{
					hitSlot = slot_O1;
					slot_O1.setElectronVisible(true,true,true,true,false,false,true,true);
					slot_O1.setElectronColor(Color.RED);
					slot_O1.setContent(dropObj);
					fmt.color = Color.RED;
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}			
			else if(slot_O2.hitTestObject(dropObj))
			{
				if(!slot_O2.isAvailable())
					return false;
				else if((dropObj.symbol.text == "O"))
				{
					hitSlot = slot_O2;
					slot_O2.setElectronVisible(true,true,true,false,true,true,false,true);
					slot_O2.setElectronColor(Color.RED);
					slot_O2.setContent(dropObj);
					fmt.color = Color.RED;
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}
			
			else if(slot_O3.hitTestObject(dropObj))
			{
				if(!slot_O3.isAvailable())
					return false;
				else if((dropObj.symbol.text == "O"))
				{
					hitSlot = slot_O3;
					slot_O3.setElectronVisible(true,true,false,true,true,true,false,true);
					slot_O3.setElectronColor(Color.RED);
					slot_O3.setContent(dropObj);
					fmt.color = Color.RED;
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}
			else if(slot_O4.hitTestObject(dropObj))
			{
				if(!slot_O4.isAvailable())
					return false;
				else if((dropObj.symbol.text == "O"))
				{
					hitSlot = slot_O4;
					slot_O4.setElectronVisible(false,false,true,true,true,true,true,true);
					slot_O4.setElectronColor(Color.RED);
					slot_O4.setContent(dropObj);
					fmt.color = Color.RED;
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
						// H1 H2 S O1 O2 O3 O4

			if(slot_H1.getContent()!=null)slot_H1.getContent().parent.removeChild(slot_H1.getContent());
			if(slot_H2.getContent()!=null)slot_H2.getContent().parent.removeChild(slot_H2.getContent());
			
			if(slot_O1.getContent()!=null)slot_O1.getContent().parent.removeChild(slot_O1.getContent());
			if(slot_O2.getContent()!=null)slot_O2.getContent().parent.removeChild(slot_O2.getContent());
			if(slot_O3.getContent()!=null)slot_O3.getContent().parent.removeChild(slot_O3.getContent());
			if(slot_O4.getContent()!=null)slot_O4.getContent().parent.removeChild(slot_O4.getContent());
			
			if(slot_S.getContent()!=null)slot_S.getContent().parent.removeChild(slot_S.getContent());



		}
		
		private function isFinish()
		{
			if(!slot_O1.isAvailable()&&!slot_O2.isAvailable()&&!slot_O3.isAvailable()&&!slot_O4.isAvailable()&&!slot_H1.isAvailable()&&!slot_H2.isAvailable()&&!slot_S.isAvailable())
			{
				dispatchEvent(new Event("CORRECT_ANSWER_RECEIVED",true,false));
			}
		}
	}
	
}
