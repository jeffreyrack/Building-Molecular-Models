package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class SodiumBiCabonate extends MovieClip implements IQuestion {
		
		
		private var hitSlot:Slot;
		
		public function SodiumBiCabonate() {
		}
		
		public function isLegalDrop(dropObj:MovieClip):Boolean
		{
			var isLegal:Boolean = false;
			// na o1 o2 o3 c h
			if(slot_Na.hitTestObject(dropObj))
			{
				if(!slot_Na.isAvailable())
					return false;
				else if((dropObj.symbol.text == "Na"))
				{
					hitSlot = slot_Na;
					slot_Na.setElectronVisible(false,false,false,false,true,false,false,false);
					slot_Na.setElectronColor(Color.RED);
					slot_Na.setContent(dropObj);
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
					slot_O1.setElectronColor(Color.PURPLE);
					slot_O1.setContent(dropObj);
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
					slot_O2.setElectronVisible(false,true,true,true,false,true,true,true);
					slot_O2.setElectronColor(Color.PURPLE);
					hitSlot = slot_O2;
					slot_O2.setContent(dropObj);
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
					slot_O3.setElectronColor(Color.PURPLE);
					slot_O3.setContent(dropObj);
					isFinish();
					return true;
				}
			}
			else if(slot_C.hitTestObject(dropObj))
			{
				if(!slot_C.isAvailable())
					return false;
				else if((dropObj.symbol.text == "C"))
				{
					hitSlot = slot_C;
					slot_C.setElectronVisible(true,false,true,false,false,false,true,true);
					slot_C.setElectronColor(Color.BLUE);
					slot_C.setContent(dropObj);
					isFinish();
					return true;
				}
			}
			else if(slot_H.hitTestObject(dropObj))
			{
				if(!slot_H.isAvailable())
					return false;
				else if((dropObj.symbol.text == "H"))
				{
					hitSlot = slot_H;
					slot_H.setElectronVisible(false,false,false,false,false,false,true,false);
					slot_H.setElectronColor(0x007700);
					slot_H.setContent(dropObj);
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
			if(slot_Na.getContent()!=null)slot_Na.getContent().parent.removeChild(slot_Na.getContent());
			if(slot_O1.getContent()!=null)slot_O1.getContent().parent.removeChild(slot_O1.getContent());
			if(slot_O2.getContent()!=null)slot_O2.getContent().parent.removeChild(slot_O2.getContent());
			if(slot_O3.getContent()!=null)slot_O3.getContent().parent.removeChild(slot_O3.getContent());
			if(slot_H.getContent()!=null)slot_H.getContent().parent.removeChild(slot_H.getContent());
			if(slot_C.getContent()!=null)slot_C.getContent().parent.removeChild(slot_C.getContent());
		}
		
		private function isFinish()
		{
			if(!slot_Na.isAvailable()&&!slot_O1.isAvailable()&&!slot_O2.isAvailable()&&!slot_O3.isAvailable()&&!slot_C.isAvailable()&&!slot_H.isAvailable())
			{
				dispatchEvent(new Event("CORRECT_ANSWER_RECEIVED",true,false));
			}
		}
	}
	
}
