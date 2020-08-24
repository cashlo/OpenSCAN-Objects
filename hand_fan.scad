use <MCAD/bearing.scad>;
use <MCAD/involute_gears.scad>;
use <getriebe.scad>

bearing_margin = 0.2;
gear_thickness = bearingWidth();


//bearing();

if(1){
pfeilrad(2,20,gear_thickness,bearingInnerDiameter()+bearing_margin,schraegungswinkel=20);
}

if(0){
translate([2/2*(15+45),0,0])
pfeilrad(2,45,gear_thickness,bearingInnerDiameter(),schraegungswinkel=20);
}

if(1){
translate([2/2*(80-20),0,0])
rotate([0,0,2])
pfeilhohlrad(2,80,gear_thickness,bearingInnerDiameter(),schraegungswinkel=20);

translate([2/2*(20+10),0,0])
pfeilrad(2,10,gear_thickness,bearingInnerDiameter(),schraegungswinkel=20);

translate([2/2*(20+10),0,gear_thickness+2])
pfeilrad(2,20,gear_thickness,bearingInnerDiameter(),schraegungswinkel=20);

}

translate([2/2*(80-15),0,gear_thickness+2])
pfeilrad(2,15,gear_thickness,bearingInnerDiameter(),schraegungswinkel=20);


$fn = 50;

module holder(h,d){
    difference() {
    union() {
        cylinder(h,d=d);
        
        translate([0,0,-1])
        cylinder(1,d=d+1);
    
        translate([0,0,h])            
        cylinder(1,d1=d+0.5, d2=d);
    }
    #translate([0,0,h+1]) cube([2,d+1,10], true);
    }
    
}


if(0){

holder(bearingWidth()+bearing_margin,bearingInnerDiameter()-bearing_margin);

translate([2/2*(15+45),0,0])
holder(bearingWidth()+bearing_margin,bearingInnerDiameter()-bearing_margin);

translate([0,0,-2]) {
    cylinder(1,d=bearingInnerDiameter()+4);
    
    translate([2/2*(15+45),0,0])
    cylinder(1,d=bearingInnerDiameter()+4);
    
    translate([0,-(bearingInnerDiameter()+4)/2,0])
    cube([2/2*(15+45), bearingInnerDiameter()+4, 1]);
    
}

}

translate([2/2*(80-15),0,gear_thickness*2+2]){
    
translate([0,0,2])
for(i=[1:3])
rotate([0,0,360/3*i])    
blade(16, 80, gear_thickness/2, 3, 10);

translate([0,0,2+gear_thickness/2])
for(i=[1:3])
rotate([0,0,360/3*i-10])    
blade(16, 80, gear_thickness/2, 3, 3);




difference(){
    cylinder(gear_thickness+2,d=17*2);
    cylinder(gear_thickness+2,d=bearingInnerDiameter());
}
}



module blade(r1, r2, h, t, twist){
    linear_extrude(h, twist=twist) {
        translate([r1,-t,0]){
            square([(r2-r1)/2,t]);
            translate([(r2-r1)/2,0,0]) rotate([0,0,10]) square([(r2-r1)/2,t]);
        }
    }
}