package  {
	import flash.display.Sprite
	import flash.events.Event;
	
	public class BallView extends Sprite
	{
		const MAX_X:int=800;
		public var vx:Number;
		public var vy:Number;
		public var id:String;
		public var ay:Number=0.2;//aceleración
		
		public function BallView() 
		{
			// constructor code
		}
		public function move(_vx:Number,_vy:Number ):void
		{
			vx=_vx //velocidad X
			vy=_vy //velicidad Y
			this.addEventListener(Event.ENTER_FRAME,ENTER_FRAME_handler)
		}
		function ENTER_FRAME_handler(e:Event):void
		{
			this.x+=vx
			this.y+=vy
			vy+=ay;//dismunir velocidad en y
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
