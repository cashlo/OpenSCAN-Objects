use </home/cashlo/Downloads/Jua-Regular.ttf>
/*
color("white")
linear_extrude(4)
text("은", size=25, spacing=0.95,
, font="Jua");

difference(){
color("pink")
linear_extrude(2)
offset(delta=3)    
text("은", size=25, spacing=0.95,
, font="Jua");


translate([15,20,0])    
scale([2,1,1]) cylinder(10,5,5);
}

translate([22,1,0])
rotate([0,0,-10]){
    
    color("white")
linear_extrude(4)
text("우", size=20, spacing=0.95,
, font="Jua");
    
    difference(){
    color("pink")
linear_extrude(2)
offset(delta=3)    
text("우", size=20, spacing=0.95,
, font="Jua");
    
        translate([10,15,0])    
scale([2,1,1]) cylinder(10,5,5);
    }
}

*/
color("yellow")
translate([-20,-10,10])
linear_extrude(4)
rotate([0,0,-10])
scale([1.2,1,1])
text("♡️", size=55, font="Jua");

module offset_text(text, offset, size, spacing=0.95) {

color("white")
linear_extrude(4)
text(text, size=size, spacing=spacing,
, font="Jua");


color("pink")
linear_extrude(2)
offset(delta=offset)    
text(text, size=size, spacing=spacing,
, font="Jua");


}