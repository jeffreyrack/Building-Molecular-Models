package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextFormat;

	
	public class MethylAlchohol extends MovieClip implements IQuestion{
		
		private var hitSlot:Slot;
		
		public function MethylAlchohol(x:Number, y:Number) {
			this.x=x;
			this.y=y;
			// constructor code
		}
		
		public function isLegalDrop(dropObj:MovieClip):Boolean
		{
			var isLegal:Boolean = false;
			var fmt:TextFormat = new TextFormat();

			// C O H1 H2 H3 H4 
			if(slot_C.hitTestObject(dropObj))
			{
				if(!slot_C.isAvailable())
					return false;
				else if((dropObj.symbol.text == "C"))
				{
					hitSlot = slot_C;
					slot_C.setElectronVisible(true,false,true,false,false,true,false,true);
					slot_C.setElectronColor(Color.RED);
					slot_C.setContent(dropObj);
					fmt.color = Color.RED; // red
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}

			else if(slot_O.hitTestObject(dropObj))
			{
				if(!slot_O.isAvailable())
					return false;
				else if((dropObj.symbol.text == "O"))
				{
					slot_O.setElectronVisible(true,true,false,true,true,true,false,true);
					slot_O.setElectronColor(0x770077);
					hitSlot = slot_O;
					slot_O.setContent(dropObj);
					fmt.color = 0x770077; 
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
					slot_H2.setElectronVisible(false,false,true,false,false,false,false,false);
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
					slot_H3.setElectronVisible(false,false,false,false,false,false,true,false);
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
					slot_H4.setElectronVisible(true,false,false,false,false,false,false,false);
					slot_H4.setElectronColor(Color.BLUE);
					slot_H4.setContent(dropObj);
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
			if(slot_O.getContent()!=null)slot_O.getContent().parent.removeChild(slot_O.getContent());
			if(slot_H1.getContent()!=null)slot_H1.getContent().parent.removeChild(slot_H1.getContent());
			if(slot_H2.getContent()!=null)slot_H2.getContent().parent.removeChild(slot_H2.getContent());
			if(slot_H3.getContent()!=null)slot_H3.getContent().parent.removeChild(slot_H3.getContent());
			if(slot_H4.getContent()!=null)slot_H4.getContent().parent.removeChild(slot_H4.getContent());
			if(slot_C.getContent()!=null)slot_C.getContent().parent.removeChild(slot_C.getContent());
		}
		
		private function isFinish()
		{
			if(!slot_C.isAvailable()&&!slot_O.isAvailable()&&!slot_H1.isAvailable()&&!slot_H2.isAvailable()&&!slot_H3.isAvailable()&&!slot_H4.isAvailable())
			{
				dispatchEvent(new Event("CORRECT_ANSWER_RECEIVED",true,false));
			}
		}
	}
	
}
