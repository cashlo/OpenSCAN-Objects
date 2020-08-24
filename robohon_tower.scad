difference(){
    cube([70,70,100]);
    translate([(70-54)/2,0,100-5]) cube([54, 70, 11]);
    translate([70/3,0,50])cube([1,10,10]);
    translate([70/2,0,30])cube([1,10,10]);
    
    translate([0,70,0])
    rotate([0,0,-90])
    translate([70/2,0,30])cube([1,10,10]);
    
    translate([70,0,0])
    rotate([0,0,90])
    translate([70/2-10,0,0]){
        cube([20,10,30]);
        translate([10,0,50])cube([1,10,10]);
        translate([10,0,30])scale([1,1,0.8])rotate([-90,0,0])cylinder(10,d=20);
    }
    
    translate([70,70,0])
    rotate([0,0,180]) {
        translate([70/3,0,30])cube([1,10,10]);
        translate([70/3*2,0,50])cube([1,10,10]);
    }
}

battlement_size = 7;

battlement();

translate([0,70,0])
rotate([0,0,-90])
battlement();

translate([70,0,0])
rotate([0,0,90])
battlement();

translate([70,70,0])
rotate([0,0,180])
battlement();


module battlement(){
    for (i = [0:battlement_size*2:70-battlement_size]) {
        translate([i+battlement_size/3, -battlement_size/2-0.1, 100-battlement_size])
        cube([battlement_size*3/2, battlement_size/2, battlement_size*2.5]);
    }


    
    difference(){
    union(){
    translate([0,-battlement_size/2-0.1,100-battlement_size*3])
    cube([70+battlement_size/2+0.1, battlement_size/2+0.1,battlement_size*3]);
    
    translate([0,-battlement_size/(2*3/2),100-battlement_size*(3+1/6)])
    cube([70+battlement_size/(2*3/2), battlement_size/2*3/2,battlement_size/2]);

    translate([0,-battlement_size/2/3,100-battlement_size*(3+2/6)])
    cube([70+battlement_size/2/3, battlement_size/2/3,battlement_size/2]);
        
    }
        for (j = [0:battlement_size*1.5:70+battlement_size]) {
            translate([j-battlement_size/1.5,-battlement_size/2-0.2,100-battlement_size*4]){
                cube([battlement_size,battlement_size,battlement_size*2]);
                
                translate([battlement_size/2,battlement_size/2+0.2,battlement_size*2])
                rotate([90,0,0])
                cylinder(battlement_size/2+0.2,d=battlement_size);
            }
        }
    }
    
    
    
}