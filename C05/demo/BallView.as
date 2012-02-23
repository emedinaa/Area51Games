package  {
	import flash.display.Sprite
	import flash.events.Event;
	import flash.display.MovieClip;
	
	public class BallView extends Sprite
	{
		const MAX_X:int=1500;
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
			}else
			{
				validate(Client(this.parent)['mc2'])
			}
		}
		
		public function callDead():void
		{
			trace("callDead ",this.parent);
			Client(this.parent).dead(this.name)
		}
		public function validate(_mc:MovieClip):void
		{
			if(this.hitTestObject(_mc))
			{
				_mc.alpha=0.5;
				
				this.removeEventListener(Event.ENTER_FRAME,ENTER_FRAME_handler)
				callDead()
			}
		}
	}
	
}
