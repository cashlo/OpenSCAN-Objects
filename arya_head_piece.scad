$fn=80;
size1 = 30;
size2 = 37;
base_height = 4;
pointy = true;

if(!pointy){
 color("black")
translate([0,0,base_height+30-9.2])
difference(){
    sphere(6.5);
    translate([0,0,-3])cube([20,20,10], true);
}
}

 translate([0,0,base_height])
 color("black")
 difference(){
     if(pointy)
        cylinder(  30,    size1-0.2,    0);
     else
        cylinder(  30-5,    size1-0.2,    5);
     cylinder(  30-1.2,    size1-0.2-1.2,    0);
  }
 //color("gray")
 //cylinder(  5,    12,    0);
 

 difference(){
  color("black")
     union(){
        translate([0,0,1])
         cylinder(  base_height-1,    size2,    size1+1-0.2);
         cylinder(  1,    size2-1,    size2);
     }
 translate([0,0,0.4])
 cylinder(  base_height-0.4,    size2-10,    size1-0.2-1.2);
     
     for(i=[0:1])
     rotate([0,0,90*i])
     translate([0,0,1.5])
     cube([100,2.5,2.5], true);
     
     intersection(){
      cylinder(  0.8,    size2-10,    size2-10);
    
     for(i=[0:3])
     rotate([0,0,90*i])
     translate([5,5,0])
     cube([100,100,0.8]);
     
 }
 }
 
 
 /*
  
 translate([0,0,base_height])
 color("gold")
intersection(){
difference(){
 cylinder(  size1+1,    size1+1,    0);
 cylinder(  size1,    size1,    0);
}
 sphere_ring();
 }
 module sphere_ring() {
     for(i=[0:12])
         rotate([0,0,360/12*i])
         translate([size1+1,0,-2])
         sphere(9);
     
}
*/