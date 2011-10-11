package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;

	
	public class Ethane extends MovieClip implements IQuestion{
		
		private var hitSlot:Slot;
		
		public function Ethane(x:Number, y:Number) {
		this.x=x;
		this.y=y;
		// constructor code
		}
		
		public function isLegalDrop(dropObj:MovieClip):Boolean
		{
			var isLegal:Boolean = false;
			// C1 C2 H1 H2 H3 H4 H5 H6
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
					slot_H5.setElectronVisible(true,false,false,false,false,false,false,false);
					slot_H5.setElectronColor(Color.BLUE);
					slot_H5.setContent(dropObj);
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
					slot_H6.setElectronColor(Color.BLUE);
					slot_H6.setContent(dropObj);
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
		}
		
		private function isFinish()
		{
			if(!slot_C1.isAvailable()&&!slot_C2.isAvailable()&&!slot_H1.isAvailable()&&!slot_H2.isAvailable()&&!slot_H3.isAvailable()&&!slot_H4.isAvailable()&&!slot_H5.isAvailable()&&!slot_H6.isAvailable())
			{
				dispatchEvent(new Event("CORRECT_ANSWER_RECEIVED",true,false));
			}
		}
	}
	
}
