use <chamfer.scad>;
use </home/cashlo/Downloads/ShipporiAntique-Regular.ttf>


leg_length = 50;


module plate(){
difference(){
translate([13,15,5])
intersection(){
    cube([3, 89, 30]);
    #
    translate([0,50,-490])
    sphere(520, $fn=200);
}    
    
    translate([0,18.7,13])
    rotate([90,0,90])
    linear_extrude(20)
    text("【クルクラ】", size=10, font="Shippori Antique:style=Regular"); 
}
}

plate();

/*
difference(){
    stand();
    translate([13,15,5])
    cube([4, 90, 50]);
}
*/

module stand(){
leg();
translate([0,120,0])
mirror([0,1,0])
leg();

translate([leg_length/2-20,0,0])
cube([20,120,5]);
}

module leg(){
    rotate([-90,0,0])
    linear_extrude(20)
    difference(){
        translate([0,5,0])
        hull(){
            circle(20);
            translate([leg_length,0,0]) circle(20);
        }
        translate([-20,0,0])square([100,100]);
    }
    translate([leg_length/2-20,5,0])
    difference(){
        union(){
            cube([20,10,120]);
            
            translate([5,0,0])
            cube([10,15,20]);
            
            
            translate([10,0,110])
            rotate([-90,0,0])
            cylinder(10, 34/2, 34/2);
            
            translate([20,00,60])
            rotate([-90,0,0])
            cylinder(10, 34/2, 34/2);
            
            
        }
        translate([10,0,120])
        rotate([-90,0,0])
        cylinder(40, 34/2, 34/2);
        
        translate([25,0,70])
        rotate([-90,0,0])
        cylinder(40, 34/2, 34/2);
        
    }
}