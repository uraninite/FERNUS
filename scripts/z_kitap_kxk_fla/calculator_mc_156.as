package z_kitap_kxk_fla
{
   import com.greensock.TweenMax;
   import com.greensock.easing.Expo;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public dynamic class calculator_mc_156 extends MovieClip
   {
       
      
      public var base:MovieClip;
      
      public var closeC:libClose;
      
      public var clr:MovieClip;
      
      public var div:MovieClip;
      
      public var eight:MovieClip;
      
      public var equ:MovieClip;
      
      public var five:MovieClip;
      
      public var four:MovieClip;
      
      public var memA:MovieClip;
      
      public var memC:MovieClip;
      
      public var memR:MovieClip;
      
      public var memS:MovieClip;
      
      public var mover:MovieClip;
      
      public var mul:MovieClip;
      
      public var nine:MovieClip;
      
      public var one:MovieClip;
      
      public var pm:MovieClip;
      
      public var point:MovieClip;
      
      public var pos:MovieClip;
      
      public var sci_button:MovieClip;
      
      public var sci_panel:MovieClip;
      
      public var seven:MovieClip;
      
      public var six:MovieClip;
      
      public var sub:MovieClip;
      
      public var three:MovieClip;
      
      public var two:MovieClip;
      
      public var zero:MovieClip;
      
      public var current:String;
      
      public var prev:String;
      
      public var memory:Number;
      
      public var toClear:Boolean;
      
      public var percent:Boolean;
      
      public var sign:Number;
      
      public var signs:Array;
      
      public var radians:Boolean;
      
      public var second:Boolean;
      
      public var sciMode;
      
      public function calculator_mc_156()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function toggleSecond(e:Event) : *
      {
         if(!this.second)
         {
            this.sci_panel.sin.setKey(44);
            this.sci_panel.cos.setKey(45);
            this.sci_panel.tan.setKey(46);
            this.sci_panel.sinh.setKey(47);
            this.sci_panel.cosh.setKey(48);
            this.sci_panel.tanh.setKey(49);
            this.sci_panel.log.setKey(50);
            this.sci_panel.ln.setKey(51);
            this.second = true;
         }
         else
         {
            this.sci_panel.sin.setKey(28);
            this.sci_panel.cos.setKey(29);
            this.sci_panel.tan.setKey(30);
            this.sci_panel.sinh.setKey(31);
            this.sci_panel.cosh.setKey(32);
            this.sci_panel.tanh.setKey(33);
            this.sci_panel.log.setKey(34);
            this.sci_panel.ln.setKey(35);
            this.second = false;
         }
      }
      
      public function trig(num:*) : *
      {
         if(!this.radians)
         {
            return num * Math.PI / 180;
         }
         return num;
      }
      
      public function factorial(num:Number) : *
      {
         var temp:* = undefined;
         var i:* = undefined;
         if(num > 270)
         {
            temp = "Infinity";
         }
         else
         {
            temp = num;
            for(i = temp; i > 1; i--)
            {
               temp *= i - 1;
            }
         }
         return temp;
      }
      
      public function toggleSci(e:Event) : *
      {
         TweenMax.killTweensOf(this.sci_panel);
         if(this.sciMode)
         {
            this.sci_panel.visible = true;
            TweenMax.to(this.sci_panel,1,{
               "x":220,
               "ease":Expo.easeInOut
            });
            this.sciMode = false;
         }
         else
         {
            this.sciMode = true;
            TweenMax.to(this.sci_panel,1,{
               "x":0,
               "ease":Expo.easeInOut,
               "visible":false
            });
         }
      }
      
      public function setMemory(type:*) : *
      {
         if(type == 0)
         {
            this.memory += parseFloat(this.current);
         }
         else
         {
            this.memory -= parseFloat(this.current);
         }
         if(this.memory != 0)
         {
            this.base.memory.visible = true;
         }
         else
         {
            this.base.memory.visible = false;
         }
      }
      
      public function getMemory() : *
      {
         if(this.memory != 0)
         {
            this.toClear = true;
            this.addNum(String(this.memory));
            this.toClear = true;
         }
      }
      
      public function clrMemory() : *
      {
         this.memory = 0;
         this.base.memory.visible = false;
      }
      
      public function clearScreen() : *
      {
         this.prev = "";
         this.setSign(0);
         this.addNum("0");
         this.toClear = true;
      }
      
      public function addNum(number:String) : *
      {
         if(number == "NaN")
         {
            number = "Error";
         }
         var len:* = !!number.match(/-/) ? 14 : 13;
         var cLen:* = number == "-" ? 14 : (!!this.current.match(/-/) ? 14 : 13);
         if(number.length >= len)
         {
            number = parseFloat(number).toPrecision(len - Math.min(parseFloat(number).toPrecision(len).length - len,len - 1));
            number = number.replace(/0+$/,"");
         }
         if(this.current.length < cLen || this.toClear)
         {
            if(this.toClear || this.current == "0")
            {
               this.current = number;
               this.toClear = false;
            }
            else
            {
               this.current += number;
            }
            this.base.screen.text = this.current;
         }
      }
      
      public function setSign(newSign:*) : *
      {
         if(!this.toClear)
         {
            this.calc();
         }
         this.sign = newSign;
         this.base.sign.text = this.signs[this.sign];
         this.prev = this.current;
         this.toClear = true;
      }
      
      public function calc() : *
      {
         var num:* = undefined;
         if(this.percent)
         {
            if(this.sign == 3 || this.sign == 4)
            {
               this.current = String(parseFloat(this.current) / 100);
            }
            else
            {
               this.current = String(parseFloat(this.prev) * (parseFloat(this.current) / 100));
            }
            this.percent = false;
         }
         if(this.sign == 1)
         {
            num = parseFloat(this.prev) + parseFloat(this.current);
         }
         else if(this.sign == 2)
         {
            num = parseFloat(this.prev) - parseFloat(this.current);
         }
         else if(this.sign == 3)
         {
            num = parseFloat(this.prev) * parseFloat(this.current);
         }
         else if(this.sign == 4)
         {
            num = parseFloat(this.prev) / parseFloat(this.current);
         }
         else if(this.sign == 5)
         {
            num = Math.pow(parseFloat(this.prev),parseFloat(this.current));
         }
         else if(this.sign == 6)
         {
            num = Math.pow(parseFloat(this.prev),1 / parseFloat(this.current));
         }
         else
         {
            num = parseFloat(this.current);
         }
         this.current = "";
         this.prev = "";
         this.addNum(num);
         this.toClear = true;
         this.setSign(0);
      }
      
      public function sinh(num:*) : *
      {
         return (Math.pow(Math.E,this.trig(num)) - Math.pow(Math.E,-this.trig(num))) / 2;
      }
      
      public function cosh(num:*) : *
      {
         return (Math.pow(Math.E,this.trig(num)) + Math.pow(Math.E,-this.trig(num))) / 2;
      }
      
      public function tanh(num:*) : *
      {
         return this.sinh(num) / this.cosh(num);
      }
      
      public function asinh(num:*) : *
      {
         return Math.log(num + Math.sqrt(Math.pow(num,2) + 1));
      }
      
      public function acosh(num:*) : *
      {
         return Math.log(num + Math.sqrt(Math.pow(num,2) - 1));
      }
      
      public function atanh(num:*) : *
      {
         return 0.5 * Math.log((1 + num) / (1 - num));
      }
      
      function frame1() : *
      {
         this.current = "0";
         this.prev = "0";
         this.memory = 0;
         this.toClear = true;
         this.percent = false;
         this.sign = 0;
         this.signs = ["","+","-","×","÷","^","√"];
         this.radians = false;
         this.second = false;
         this.sciMode = true;
         this.base.memory.visible = false;
         this.setSign(0);
         this.sci_button.addEventListener(MouseEvent.CLICK,this.toggleSci);
         this.zero.setKey(2);
         this.one.setKey(3);
         this.two.setKey(4);
         this.three.setKey(5);
         this.four.setKey(6);
         this.five.setKey(7);
         this.six.setKey(8);
         this.seven.setKey(9);
         this.eight.setKey(10);
         this.nine.setKey(11);
         this.point.setKey(12);
         this.div.setKey(13);
         this.mul.setKey(14);
         this.sub.setKey(15);
         this.pos.setKey(16);
         this.equ.setKey(17);
         this.clr.setKey(18);
         this.pm.setKey(19);
         this.memC.setKey(20);
         this.memA.setKey(21);
         this.memS.setKey(22);
         this.memR.setKey(23);
         this.sci_panel.pi.setKey(24);
         this.sci_panel.e.setKey(25);
         this.sci_panel.sqrt.setKey(26);
         this.sci_panel.nrt.setKey(27);
         this.sci_panel.sin.setKey(28);
         this.sci_panel.cos.setKey(29);
         this.sci_panel.tan.setKey(30);
         this.sci_panel.sinh.setKey(31);
         this.sci_panel.cosh.setKey(32);
         this.sci_panel.tanh.setKey(33);
         this.sci_panel.log.setKey(34);
         this.sci_panel.ln.setKey(35);
         this.sci_panel.sqr.setKey(36);
         this.sci_panel.cube.setKey(37);
         this.sci_panel.sci_pow.setKey(38);
         this.sci_panel.per.setKey(39);
         this.sci_panel.fac.setKey(40);
         this.sci_panel.frac.setKey(41);
         this.sci_panel.snd.setKey(42);
         this.sci_panel.rad.setKey(43);
         this.zero.btn.gotoAndStop(5);
         this.equ.btn.gotoAndStop(3);
         this.zero.addEventListener(MouseEvent.CLICK,function():*
         {
            addNum("0");
         });
         this.one.addEventListener(MouseEvent.CLICK,function():*
         {
            addNum("1");
         });
         this.two.addEventListener(MouseEvent.CLICK,function():*
         {
            addNum("2");
         });
         this.three.addEventListener(MouseEvent.CLICK,function():*
         {
            addNum("3");
         });
         this.four.addEventListener(MouseEvent.CLICK,function():*
         {
            addNum("4");
         });
         this.five.addEventListener(MouseEvent.CLICK,function():*
         {
            addNum("5");
         });
         this.six.addEventListener(MouseEvent.CLICK,function():*
         {
            addNum("6");
         });
         this.seven.addEventListener(MouseEvent.CLICK,function():*
         {
            addNum("7");
         });
         this.eight.addEventListener(MouseEvent.CLICK,function():*
         {
            addNum("8");
         });
         this.nine.addEventListener(MouseEvent.CLICK,function():*
         {
            addNum("9");
         });
         this.pm.addEventListener(MouseEvent.CLICK,function():*
         {
            toClear = true;
            addNum(String(parseFloat(current) * -1));
         });
         this.point.addEventListener(MouseEvent.CLICK,function():*
         {
            if(toClear || current == "0")
            {
               addNum("0.");
            }
            else if(!current.match(/\./))
            {
               addNum(".");
            }
         });
         this.div.addEventListener(MouseEvent.CLICK,function():*
         {
            setSign(4);
         });
         this.mul.addEventListener(MouseEvent.CLICK,function():*
         {
            setSign(3);
         });
         this.sub.addEventListener(MouseEvent.CLICK,function():*
         {
            setSign(2);
         });
         this.pos.addEventListener(MouseEvent.CLICK,function():*
         {
            setSign(1);
         });
         this.equ.addEventListener(MouseEvent.CLICK,function():*
         {
            calc();
         });
         this.clr.addEventListener(MouseEvent.CLICK,function():*
         {
            clearScreen();
         });
         this.memA.addEventListener(MouseEvent.CLICK,function():*
         {
            setMemory(0);
         });
         this.memS.addEventListener(MouseEvent.CLICK,function():*
         {
            setMemory(1);
         });
         this.memR.addEventListener(MouseEvent.CLICK,function():*
         {
            getMemory();
         });
         this.memC.addEventListener(MouseEvent.CLICK,function():*
         {
            clrMemory();
         });
         this.sci_panel.sin.addEventListener(MouseEvent.CLICK,function():*
         {
            toClear = true;
            addNum(String(!!second ? Math.asin(trig(parseFloat(current))) : Math.sin(trig(parseFloat(current)))));
            toClear = true;
         });
         this.sci_panel.cos.addEventListener(MouseEvent.CLICK,function():*
         {
            toClear = true;
            addNum(String(!!second ? Math.acos(trig(parseFloat(current))) : Math.cos(trig(parseFloat(current)))));
            toClear = true;
         });
         this.sci_panel.tan.addEventListener(MouseEvent.CLICK,function():*
         {
            toClear = true;
            addNum(String(!!second ? Math.atan(trig(parseFloat(current))) : Math.tan(trig(parseFloat(current)))));
            toClear = true;
         });
         this.sci_panel.sinh.addEventListener(MouseEvent.CLICK,function():*
         {
            toClear = true;
            addNum(String(!!second ? asinh(trig(parseFloat(current))) : sinh(trig(parseFloat(current)))));
            toClear = true;
         });
         this.sci_panel.cosh.addEventListener(MouseEvent.CLICK,function():*
         {
            toClear = true;
            addNum(String(!!second ? acosh(trig(parseFloat(current))) : cosh(trig(parseFloat(current)))));
            toClear = true;
         });
         this.sci_panel.tanh.addEventListener(MouseEvent.CLICK,function():*
         {
            toClear = true;
            addNum(String(!!second ? atanh(trig(parseFloat(current))) : tanh(trig(parseFloat(current)))));
            toClear = true;
         });
         this.sci_panel.log.addEventListener(MouseEvent.CLICK,function():*
         {
            toClear = true;
            addNum(String(!!second ? Math.pow(10,parseFloat(current)) : Math.log(parseFloat(current)) * Math.LOG10E));
            toClear = true;
         });
         this.sci_panel.ln.addEventListener(MouseEvent.CLICK,function():*
         {
            toClear = true;
            addNum(String(!!second ? Math.pow(Math.E,parseFloat(current)) : Math.log(parseFloat(current))));
            toClear = true;
         });
         this.sci_panel.pi.addEventListener(MouseEvent.CLICK,function():*
         {
            toClear = true;
            addNum(String(Math.PI));
            toClear = true;
         });
         this.sci_panel.e.addEventListener(MouseEvent.CLICK,function():*
         {
            toClear = true;
            addNum(String(Math.E));
            toClear = true;
         });
         this.sci_panel.sqr.addEventListener(MouseEvent.CLICK,function():*
         {
            toClear = true;
            addNum(String(Math.pow(parseFloat(current),2)));
            toClear = true;
         });
         this.sci_panel.cube.addEventListener(MouseEvent.CLICK,function():*
         {
            toClear = true;
            addNum(String(Math.pow(parseFloat(current),3)));
            toClear = true;
         });
         this.sci_panel.sci_pow.addEventListener(MouseEvent.CLICK,function():*
         {
            toClear = true;
            setSign(5);
         });
         this.sci_panel.sqrt.addEventListener(MouseEvent.CLICK,function():*
         {
            toClear = true;
            addNum(String(Math.sqrt(parseFloat(current))));
            toClear = true;
         });
         this.sci_panel.nrt.addEventListener(MouseEvent.CLICK,function():*
         {
            toClear = true;
            setSign(6);
         });
         this.sci_panel.per.addEventListener(MouseEvent.CLICK,function():*
         {
            toClear = true;
            percent = true;
            calc();
         });
         this.sci_panel.fac.addEventListener(MouseEvent.CLICK,function():*
         {
            toClear = true;
            addNum(String(factorial(parseFloat(current))));
            toClear = true;
         });
         this.sci_panel.frac.addEventListener(MouseEvent.CLICK,function():*
         {
            toClear = true;
            addNum(String(1 / parseFloat(current)));
            toClear = true;
         });
         this.sci_panel.rad.addEventListener(MouseEvent.CLICK,function():*
         {
            if(radians)
            {
               radians = false;
               base.trigType.text = "Deg";
            }
            else
            {
               radians = true;
               base.trigType.text = "Rad";
            }
         });
         this.sci_panel.snd.addEventListener(MouseEvent.CLICK,this.toggleSecond);
         this.sci_panel.visible = false;
      }
   }
}
