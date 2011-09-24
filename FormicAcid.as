package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextFormat;

	
	public class FormicAcid extends MovieClip implements IQuestion{
		
		private var hitSlot:Slot;
		
		public function FormicAcid(x:Number, y:Number) {
		this.x=x;
		this.y=y;
		// constructor code
		}
		
		public function isLegalDrop(dropObj:MovieClip):Boolean
		{
			var isLegal:Boolean = false;
			var fmt:TextFormat = new TextFormat();

			// C O1 O2 H1 H2  
			if(slot_C.hitTestObject(dropObj))
			{
				if(!slot_C.isAvailable())
					return false;
				else if((dropObj.symbol.text == "C"))
				{
					hitSlot = slot_C;
					slot_C.setElectronVisible(true,true,true,false,false,false,false,true);
					slot_C.setElectronColor(0xFF0000);
					slot_C.setContent(dropObj);
					fmt.color = 0xFF0000; // red
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
					slot_O1.setElectronVisible(true,true,true,true,false,false,true,true);
					slot_O1.setElectronColor(0x770077);
					hitSlot = slot_O1;
					slot_O1.setContent(dropObj);
					fmt.color = 0x770077; 
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
					slot_O2.setElectronVisible(true,true,true,false,true,true,false,true);
					slot_O2.setElectronColor(0x770077);
					hitSlot = slot_O2;
					slot_O2.setContent(dropObj);
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
					slot_H1.setElectronVisible(false,false,true,false,false,false,false,false);
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
					slot_H2.setElectronVisible(false,false,false,false,false,false,false,true);
					slot_H2.setElectronColor(0x223077);
					slot_H2.setContent(dropObj);
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
			if(slot_O1.getContent()!=null)slot_O1.getContent().parent.removeChild(slot_O1.getContent());
			if(slot_O2.getContent()!=null)slot_O2.getContent().parent.removeChild(slot_O2.getContent());
			if(slot_H1.getContent()!=null)slot_H1.getContent().parent.removeChild(slot_H1.getContent());
			if(slot_H2.getContent()!=null)slot_H2.getContent().parent.removeChild(slot_H2.getContent());
			if(slot_C.getContent()!=null)slot_C.getContent().parent.removeChild(slot_C.getContent());
		}
		
		private function isFinish()
		{
			if(!slot_C.isAvailable()&&!slot_O1.isAvailable()&&!slot_O2.isAvailable()&&!slot_H1.isAvailable()&&!slot_H2.isAvailable())
			{
				dispatchEvent(new Event("CORRECT_ANSWER_RECEIVED",true,false));
			}
		}
	}
	
}

