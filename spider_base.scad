d = 100;
glass_dome_inner_d = 94;
thick = 2.5;

$fn=50;
base();
//drawer();

module base(){
difference(){
cylinder(20, d/2+2, d/2+2);
    
translate([0,0,7])    
cylinder(25, d/2, d/2);
    
translate([0,0,2])    
cylinder(25, glass_dome_inner_d/2, glass_dome_inner_d/2);
    
for(i=[-8:8])
translate([4*i,0,5])cube([0.8,200,6], true);

translate([30,0,4.5])
cube([50,20, 5], true);
}
}

plug();
module plug() {

intersection(){
    difference(){
        cylinder(20, d/2+4, d/2+4);
        cylinder(20, d/2, d/2);
    }
    translate([30,0,4.5])
    cube([50,25-0.5, 5-0.5], true);
}    
    difference(){
       translate([28,0,4.5])
       cube([50,20-0.5, 5-0.5], true);
       cylinder(20, 94/2, 94/2); 
    }
}


module drawer(){
difference(){
intersection(){
    translate([30,0,4.5])
    cube([50,20-0.3, 5-0.3], true);
    
    cylinder(15, d/2+2, d/2+2);
}

translate([0,0,7])    
cylinder(25, d/2, d/2);

translate([0,0,7])
cube([d-20,15,4], true);

#translate([d/2+thick+1,0,7])
rotate([0,45,0])
cube([5,20,5], true);

#translate([-d/2-thick-1,0,7])
rotate([0,45,0])
cube([5,20,5], true);

}
    
}