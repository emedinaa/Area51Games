package  {
	import flash.display.Sprite
	import flash.events.Event;
	
	public class BallView extends Sprite
	{
		const MAX_X:int=800;
		public var vx:Number;
		public var vy:Number;
		public var id:String;
		
		public function BallView() 
		{
			// constructor code
		}
		public function move(_vx:Number,_vy:Number ):void
		{
			vx=_vx
			vy=_vy
			this.addEventListener(Event.ENTER_FRAME,ENTER_FRAME_handler)
		}
		function ENTER_FRAME_handler(e:Event):void
		{
			this.x+=vx
			this.y+=vy
			if(this.x>=MAX_X)
			{
				//remover evento
				this.removeEventListener(Event.ENTER_FRAME,ENTER_FRAME_handler)
				callDead()
			}
		}
		
		public function callDead():void
		{
			trace("callDead ",this.parent);
			Client(this.parent).dead(this.name)
		}
	}
	
}
