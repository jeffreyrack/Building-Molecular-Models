package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextFormat;


	
	public class Water extends MovieClip implements IQuestion {
		 var slot_H1:Slot;
		 var slot_H2:Slot;
		 var slot_O1:Slot;
		
		public function Water(x:int, y:int) {
			this.x=x;
			this.y=y;
			initializeSlots();
			
		}
		private var hitSlot:Slot;
		
		public function isLegalDrop(dropObj:MovieClip):Boolean
		{
			var isLegal:Boolean = false;
			var fmt:TextFormat = new TextFormat();

			// O1 H1 H2 
			// Rackauckas if the object was dragged over the first slot, then this if is entered.
			if(slot_O1.hitTestObject(dropObj))
			{
				// Rackauckas If the slot isn't available, an object can't be dropped here.
				if(!slot_O1.isAvailable())
					return false;
					// If the symbol is an O, it's all good.
				else if((dropObj.symbol.text == "O"))
				{
					hitSlot = slot_O1;
					slot_O1.setElectronVisible(true,true,true,true,false,true,false,true);
					slot_O1.setElectronColor(Color.RED);
					slot_O1.setContent(dropObj);
					fmt.color = Color.RED;; // red
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
					slot_H2.setElectronVisible(true,false,false,false,false,false,false,false);
					slot_H2.setElectronColor(Color.BLUE);
					slot_H2.setContent(dropObj);
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
		
		public function initializeSlots(){
			slot_H1=new Slot();
			slot_H1.visible=true;
			slot_H1.x=238.95;
			slot_H1.y=87;
			addChild(slot_H1);
			slot_H2=new Slot();
			slot_H2.visible=true;
			slot_H2.x=287.45;
			slot_H2.y=136;
			addChild(slot_H2);
			slot_O1=new Slot();
			slot_O1.visible=true;
			slot_O1.x=287.45;
			slot_O1.y=87;
			addChild(slot_O1);
		}
		// Rackauckas If the slot isn't null, the slot gets the child removed.
		public function clearAnswer():void
		{
			
			if(slot_H1.getContent()!=null) slot_H1.getContent().parent.removeChild(slot_H1.getContent());
			if(slot_H2.getContent()!=null) slot_H2.getContent().parent.removeChild(slot_H2.getContent());
			if(slot_O1.getContent()!=null) slot_O1.getContent().parent.removeChild(slot_O1.getContent());
		}
		// Rackauckas If all 3 slots are filled, then the answer must be correct.
		private function isFinish()
		{
			if(!slot_O1.isAvailable()&&!slot_H1.isAvailable()&&!slot_H2.isAvailable())
			{
				dispatchEvent(new Event("CORRECT_ANSWER_RECEIVED",true,false));
			}
		}
	}
	
}
