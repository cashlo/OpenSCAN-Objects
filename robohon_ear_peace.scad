difference(){
    ear();
    translate([0,0,-1]) cylinder(h=3,d=27);
}
width = 3;
rotate([0,0,360/6]){
rotate([0,0,-90])
translate([-width/2,-width/2,-0.5])cube([36/2,width,0.5]);

rotate([0,0,45])
translate([-width/2,-width/2,-0.5])cube([36/2,width,0.5]);

rotate([0,0,90])
translate([-width/2,-width/2,-0.5])cube([36/2,width,0.5]);

rotate([0,0,135])
translate([-width/2,-width/2,-0.5])cube([36/2,width,0.5]);
}

module ear(){
    
    $fn=150;
    sphere_size=200;
    intersection(){
        cylinder(h=1,d=36);
        translate([0,0,-sphere_size+1])
        rotate([45,45,0])
        sphere(sphere_size);
    }
    translate([0,0,-0.5])cylinder(h=0.5,d=36);

    translate([-36/2+1.6,0,-1])cube([0.8,2,1], true);
    translate([-36/2+1.5,0,-2])cube([1,2,1], true);

    rotate([0,0,360/3]){
        translate([-36/2+1.6,0,-1])cube([0.8,2,1], true);
        translate([-36/2+1.5,0,-2])cube([1,2,1], true);
    }

    rotate([0,0,360/6]){
        translate([-36/2+3,0,-1.5])cube([3,0.7,2], true);
    }

    rotate([0,0,360/6+180]){
        translate([-36/2+1.3,0,-1.5])cube([1,5,2], true);
        translate([-36/2+1.3,0,-3.5])cube([1,3,2], true);
        translate([-36/2+1,0,-4.25])cube([1.2,3,0.5], true);
        
    }
}

