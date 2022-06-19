thick = 2;
clear = 0.2;

size = 27;

capsule_bottom();

module capsule_top(){
    intersection(){
        translate([0,0,size/2])cube([size,size,size], true);
        difference(){
            sphere(size/2);
            sphere(size/2-thick);
            cylinder(2,size/2-thick/2,size/2-thick/2);
            #translate([0,0,2])
            cylinder(3,size/2-thick/2,size/2-thick*2);
        }
    }
}

module capsule_bottom(){
    intersection(){
        translate([0,0,size/2])cube([size,size,size], true);
        difference(){
            sphere(size/2);
            sphere(size/2-thick);
        }
        cylinder(size,size/2-thick/2,40);
    }
    difference(){
        #translate([0,0,-2])
            cylinder(3-clear,size/2-thick/2-clear,size/2-thick/2-clear);
        translate([0,0,-2])
            cylinder(3,size/2-thick,size/2-thick);
    }
}