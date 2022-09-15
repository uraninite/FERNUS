package z_kitap_kxk_fla
{
   import fl.controls.RadioButton;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class Symbol279_421 extends MovieClip
   {
       
      
      public var bdelete:MovieClip;
      
      public var bsave:MovieClip;
      
      public var close:libClose;
      
      public var imageBG:MovieClip;
      
      public var mcPicker:MovieClip;
      
      public var radioDate0:RadioButton;
      
      public var radioDate1:RadioButton;
      
      public var txtInfo:TextField;
      
      public var txtName:TextField;
      
      public function Symbol279_421()
      {
         super();
         this.__setProp_radioDate0_Symbol279_Layer2_0();
         this.__setProp_radioDate1_Symbol279_Layer2_0();
      }
      
      function __setProp_radioDate0_Symbol279_Layer2_0() : *
      {
         try
         {
            this.radioDate0["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         this.radioDate0.enabled = true;
         this.radioDate0.groupName = "RadioButtonGroupAh";
         this.radioDate0.label = "Süresiz";
         this.radioDate0.labelPlacement = "right";
         this.radioDate0.selected = false;
         this.radioDate0.value = "";
         this.radioDate0.visible = true;
         try
         {
            this.radioDate0["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      function __setProp_radioDate1_Symbol279_Layer2_0() : *
      {
         try
         {
            this.radioDate1["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         this.radioDate1.enabled = true;
         this.radioDate1.groupName = "RadioButtonGroupAh";
         this.radioDate1.label = "Süreli";
         this.radioDate1.labelPlacement = "right";
         this.radioDate1.selected = false;
         this.radioDate1.value = "";
         this.radioDate1.visible = true;
         try
         {
            this.radioDate1["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}
