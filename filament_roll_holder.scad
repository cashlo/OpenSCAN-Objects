wire_space = 32.3-2.6;
wire_width  = 4;
roll_r         = 120;

mount_x = 103;
mount_y = 10;

bearing_hole = 8;

holder_arm();

//bar();

module bar(){

    difference(){
    union(){
    rotate([90,0,0])
    cylinder(80, 20, 20, $fn=100);

    translate([0,-40,0])
    cube([9.6,120,20], true);
    }
    
    
    translate([0,0,-60])
    cube([200,200,100], true);
    
    #translate([0,6,-4.8])
    cube([200,10.4,10.4], true);
    
    #translate([0,-86,-4.8])
    cube([200,10.4,10.4], true);
    
    #translate([0,0,5])
    cube([1,200,1], true);
    }
}

module hook(){
    cube([10,mount_y,roll_r]);
    
    translate([0,0,0])
    cube([30,10,10]);
    
    translate([21,0,0])
    cube([10,10,20]);
}

module holder_arm(){
difference(){
    cube([mount_x, mount_y, 10]);
    for(i = [0:wire_space:100])
        translate([i+5,0,0])
        cube([wire_width,30, 5]);
    }
    
translate([(mount_x-10)/2,0,-roll_r])
difference(){
hook();

translate([4.5,4.5,-10])
#cube([1,1,roll_r+40]);

for(i=[0:5]){
    translate([-10,4.5,4.5+i*20])
    #cube([60,1,1]);
}
}

}

module roll_core(){
translate([mount_x/2,0,-roll_r+10])
rotate([90,0,0]){

difference(){


union(){
translate([0,0,5+7.5])
cylinder(5, bearing_hole/2, bearing_hole/2-0.4);

cylinder(13, bearing_hole/2-0.4, bearing_hole/2-0.4);
}
cube([20,1,50], true);
}

cylinder(5, 12/2, 12/2);
}
}