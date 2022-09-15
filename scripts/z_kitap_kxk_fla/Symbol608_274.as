package z_kitap_kxk_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public dynamic class Symbol608_274 extends MovieClip
   {
       
      
      public var close:MovieClip;
      
      public var mc1:MovieClip;
      
      public var mc2:MovieClip;
      
      public var mc3:MovieClip;
      
      public var mc4:MovieClip;
      
      public var _space:int;
      
      public var _m:MovieClip;
      
      public function Symbol608_274()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function start() : *
      {
         this.mc1.x = -this.mc1.width / 2 - this._space;
         this.mc2.y = -this.mc2.height / 2 - this._space;
         this.mc3.x = 1024 - this.mc3.width / 2 + this._space;
         this.mc4.y = 768 - this.mc4.height / 2 + this._space;
         this.mc1.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragMC);
         this.mc2.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragMC);
         this.mc3.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragMC);
         this.mc4.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragMC);
         this.close.scaleX = 1 / this.scaleX;
         this.close.scaleY = 1 / this.scaleY;
      }
      
      public function startDragMC(e:MouseEvent) : *
      {
         stage.addEventListener(MouseEvent.MOUSE_UP,this.stopDragMC);
         stage.addEventListener(Event.ENTER_FRAME,this.checkCoor);
         this._m = MovieClip(e.currentTarget);
         this._m.startDrag();
         this.setChildIndex(this._m,this.numChildren - 2);
      }
      
      public function stopDragMC(e:MouseEvent) : *
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopDragMC);
         stage.removeEventListener(Event.ENTER_FRAME,this.checkCoor);
         this._m.stopDrag();
      }
      
      public function checkCoor(e:Event) : *
      {
         this.mc1.y = 0;
         this.mc3.y = 0;
         this.mc2.x = 0;
         this.mc4.x = 0;
         if(this.mc1.x < -this.mc1.width + this._space)
         {
            this.mc1.x = -this.mc1.width + this._space;
         }
         if(-this._space < this.mc1.x)
         {
            this.mc1.x = -this._space;
         }
         if(1024 - this._space < this.mc3.x)
         {
            this.mc3.x = 1024 - this._space;
         }
         if(this.mc3.x < this._space)
         {
            this.mc3.x = this._space;
         }
         if(this.mc2.y < -this.mc2.height + this._space)
         {
            this.mc2.y = -this.mc2.height + this._space;
         }
         if(-this._space < this.mc2.y)
         {
            this.mc2.y = -this._space;
         }
         if(this.mc4.y < this._space)
         {
            this.mc4.y = this._space;
         }
         if(768 - this._space < this.mc4.y)
         {
            this.mc4.y = 768 - this._space;
         }
      }
      
      function frame1() : *
      {
         this._space = 50;
      }
   }
}
