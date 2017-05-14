translate([0,0,250]) hammer_head();

translate([0,0,50]) hammer_handle();

translate([0,0,10]) daruma();

for (i =[1:5])
translate([0,0,-30*i])
level ();
module daruma(height = 40, radius = 22, circle_r = 40) {
    $fn = 80;
difference(){
    level(height, radius , circle_r);
    translate([0,radius*1.2,height/6]) rotate([0,90,0]) cylinder(  50,   height/3, height/3,true);
}
    level(height, radius-3 , circle_r);
}



module level(height = 20, radius = 20, circle_r = 20) {
$fn = 80;
difference(){
rotate_extrude(convexity = 10)
    translate([radius-circle_r,0,0])
intersection(){
    circle(circle_r);
    translate([circle_r*2-radius,0,0]) square([circle_r*2,height], center=true);
}
hammer_handle(height, 3.5);
}
}

module hammer_handle(height = 140, radius = 2.5) {
    cylinder(height,radius,radius,$fn=6);
}

module hammer_head(height = 50, radius = 10) {
    difference(){
        rotate([0,90,0]) cylinder(height,radius,radius,true,$fn=6);
        hammer_handle(height, 3);
    }
}