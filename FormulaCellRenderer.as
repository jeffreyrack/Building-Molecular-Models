package  {
	
	import fl.containers.UILoader;
	import fl.controls.listClasses.ListData;
	import fl.controls.listClasses.ICellRenderer;
	
	public class FormulaCellRenderer extends UILoader implements ICellRenderer
	{
		protected var _data:Object;
		protected var _listData:ListData;
		protected var _selected:Boolean;
		
		public function FormulaCellRenderer()
		{
			super();
		}
		
		public function get data():Object
		{
			return _data;
		}
		
		public function set data(value:Object):void
		{
			_data = value;
			source = value.Formula;
		}
		
		public function get listData():ListData
		{
			return _listData;
		}
		
		public function set listData(value:ListData):void
		{
			_listData = value;
		}
		
		public function get selected():Boolean
		{
			return _selected;
		}
		
		public function set selected(value:Boolean):void
		{
			_selected = value;
		}
		
		public function setMouseState(state:String):void
		{
		}
	
	}
		
}
