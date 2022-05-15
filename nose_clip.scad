thick = 0.8;
mask_thick = 0.7;


difference(){
    rotate([0,0,-45])
    rotate_extrude(angle = 90)
    translate([7,0,0]){
    $fn = 6;
    difference(){
        square([thick*2+mask_thick*2, 10]);
        translate([thick,thick,0])
        square([mask_thick*2, 10]);
    }

    translate([thick*2+mask_thick,thick*3+5,0])
    circle(mask_thick);

    translate([thick,thick*5+5,0])
    circle(mask_thick);
    }
translate([7+thick*1.8,-1,thick])
cube([10,2,10]);
}