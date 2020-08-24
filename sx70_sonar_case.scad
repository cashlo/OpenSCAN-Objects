$fn=50;


offset = 0.1;

rotate([0,90,0])
difference(){
    cylinder(100-2, r=3);
    translate([0,0,-5])cylinder(110, r=3-1.3);
    translate([-3+1.3,0,-5])cube([5,5,110]);
    translate([-5,-5,0]) cube([5,5,16+offset]);
    translate([-3+1.3,-5,+1]) cube([5,5,16+offset]);
    
    translate([-5,-5,16+10-offset]) cube([5,5,65+offset*2]);
    #translate([-3+1.3,-5,16+10-offset-1]) cube([5,5,65+offset*2+2]);
    translate([0,-5,-5])cube([5,5,110]);
    
    
}

translate([-offset,0,3-1.3]) cube([100-2+offset,10,1.3]);

translate([-offset,0,0]){
    difference(){
        rotate([-90,0,0])
        cylinder(10, r=3);
        
        translate([0,0,-5+3-1.3]) cube([5,20,5]);
    }

    translate([-3,0,-5.5+3-1.3]) cube([3,10,5.5+1.3-3]);
    
}

translate([-offset,0,0])
difference(){
    union(){
        sphere(3);
        translate([0,0,-5.5+3-1.3]) cylinder(5.5+1.3-3, r=3);
    }
    translate([0,-3,-5])cube([6,6,10]);
    
    #translate([-1,-1.5,-10+3-1.3-3+offset])cube([1,1.5,10]);
}