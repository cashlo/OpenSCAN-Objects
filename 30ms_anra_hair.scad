difference(){
    cube([9.3,3.2,1.4], true);
    translate([0,-(3.2-2)/2,0])
    cube([6.8,2,1.4], true);
}
cube([3.5,1.5,1.4], true);

$fn=40;
size1 = 3;
size2 = 4;
base_height = 0.5;
ring_offset = 0.3;
pointy = true;

translate([6.5,0,0])
rotate([-90,0,-35])
hair_pin();

translate([-6.5,0,0])
rotate([-90,0,35])
hair_pin();

 module hair_pin() {


 translate([0,0,base_height])
 color("gray")
 cylinder(  h=size1,    r1=size1,    r2=0);
 
 color("gray")
 cylinder(  h=base_height,    r1=size2,    r2=size1);
 

 translate([0,0,base_height])
 color("gold")
intersection(){
 cylinder(  size1+ring_offset,    size1+ring_offset,    0);
 sphere_ring();
 }
 }
 module sphere_ring() {
     for(i=[0:12])
         rotate([0,0,360/12*i])
         translate([size1,0,])
         sphere(1);
     
}
