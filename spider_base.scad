d = 100;
thick = 2.5;

$fn=50;
base();
drawer();

module base(){
difference(){
cylinder(25, d/2+2, d/2+2);
translate([0,0,10])    
cylinder(25, d/2, d/2);
for(i=[-10:10])
translate([4*i,0,0])cube([1,200,20], true);

translate([0,0,7.5])
cube([150,20, 5], true);
}
}


module drawer(){
difference(){
intersection(){
    translate([0,0,7.5])
    cube([150,20-0.2, 5-0.2], true);
    
    cylinder(15, d/2+2, d/2+2);
}

translate([0,0,10])    
cylinder(25, d/2, d/2);

translate([0,0,10])
cube([80,15,4], true);


}
    
}