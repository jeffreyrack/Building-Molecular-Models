package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextFormat;


	
	public class CarbonDioxide extends MovieClip implements IQuestion {
		
		
		public function CarbonDioxide(x:Number, y:Number) {
			this.x=x;
			this.y=y;
		}
		private var hitSlot:Slot;
				
		public function isLegalDrop(dropObj:MovieClip):Boolean
		{
			var isLegal:Boolean = false;
			var fmt:TextFormat = new TextFormat();

			// C O1 O2 
			if(slot_C.hitTestObject(dropObj))
			{
				if(!slot_C.isAvailable())
					return false;
				else if((dropObj.symbol.text == "C"))
				{
					hitSlot = slot_C;
					slot_C.setElectronVisible(false,false,true,true,false,false,true,true);
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
					hitSlot = slot_O1;
					slot_O1.setElectronVisible(true,true,false,false,true,true,true,true);
					slot_O1.setElectronColor(0x223077);
					slot_O1.setContent(dropObj);
					fmt.color = 0x223077;
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
					slot_O2.setElectronVisible(true,true,true,true,true,true,false,false);
					slot_O2.setElectronColor(0x223077);
					slot_O2.setContent(dropObj);
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

			
			if(slot_C.getContent()!=null)slot_C.getContent().parent.removeChild(slot_C.getContent());
		}
		
		private function isFinish()
		{
			if(!slot_C.isAvailable()&&!slot_O1.isAvailable()&&!slot_O2.isAvailable())
			{
				dispatchEvent(new Event("CORRECT_ANSWER_RECEIVED",true,false));
			}
		}
	}
	
}
