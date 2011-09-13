package  {
	import flash.events.Event;

	public class MenuSelectEvent extends Event{

		private var m_SelectedIndex:int = 0;

		public function MenuSelectEvent(index:int){
			super("MENU_SELECTED",true,false)
			this.m_SelectedIndex = index;
		}
						
		public function get selectedIndex():int
		{
			return m_SelectedIndex;
	}

	}
	
}
