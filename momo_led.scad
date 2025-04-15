use <C:\Users\cashr\Downloads\Kosugi_Maru\KosugiMaru-Regular.ttf>
use <C:\Users\cashr\OneDrive\Documents\GitHub\OpenSCAN-Objects\text_on.scad>
use <C:\Users\cashr\OneDrive\Documents\GitHub\OpenSCAN-Objects\fontmetrics.scad>
use <C:\Users\cashr\Downloads\Kosugi_Maru,Playwrite_FR_Trad\Playwrite_FR_Trad\PlaywriteFRTrad-VariableFont_wght.ttf>

text_on_circle(t="Couleur Clarity",r=100,font="PlaywriteFRTrad");
curve_text("Couleur Clarity", 3.5);



module curve_text(text,spacing=1,r=120) {
for (i=[0:len(text)]){
        rotate([0,0,-i*spacing+20])
        translate([0,r,0])
        text(text[i], font="PlaywriteFRTrad");
}
}

difference(){
    led_sign();
    #translate([114,68,0])
    cylinder(50, 4, 4);
    
    #translate([60,100,0])
    cylinder(50, 4, 4);
    
    #translate([114,0,0])
    cylinder(50, 4, 4);
    
    
    #translate([12,68,0])
    cylinder(50, 4, 4);
    
    #translate([10,-3,0])
    cylinder(50, 4, 4);
    
    
    #translate([130,0,0])
    cylinder(50, 4, 4);
    
    #translate([129,65,0])
    cylinder(50, 4, 4);
    
    #translate([134,98,0])
    cylinder(50, 4, 4);
    
    translate([160,92,0])
    cylinder(50, 4, 4);
    
    #translate([165,65,0])
    cylinder(50, 4, 4);
    
    #translate([200,-3,0])
    cylinder(50, 4, 4);   
   
  
  
    #translate([45,-18,0])
    cylinder(50, 4, 4);

    
    #translate([80,-38,0])
    cylinder(50, 4, 4);
    
    #translate([82,-68,0])
    cylinder(50, 4, 4);
    
    #translate([18,-38,0])
    cylinder(50, 4, 4);
    
    #translate([16,-68,0])
    cylinder(50, 4, 4);
    
    #translate([100,-63,0])
    cylinder(50, 4, 4);
  
  translate([117,0,0]){
    #translate([45,-18,0])
    cylinder(50, 4, 4);

    
    #translate([80,-38,0])
    cylinder(50, 4, 4);
    
    #translate([82,-68,0])
    cylinder(50, 4, 4);
      
    #translate([18,-38,0])
    cylinder(50, 4, 4);
    
    #translate([16,-68,0])
    cylinder(50, 4, 4);
    
    #translate([100,-63,0])
    cylinder(50, 4, 4);    
      
  }
  
}

module led_sign(){
    offset_text("大河", 15, 90);
    translate([0,-115,0])
    offset_text("もも", 15, 90);
}


module offset_text(text, offset, size, spacing=0.95) {



difference(){
color("pink")
linear_extrude(12)
offset(delta=offset)    
text(text, size=size, spacing=spacing,
, font="KosugiMaru");
    
    
color("white")
translate([0,0,2])
linear_extrude(12)
text(text, size=size, spacing=spacing,
, font="KosugiMaru");
}
    
}
