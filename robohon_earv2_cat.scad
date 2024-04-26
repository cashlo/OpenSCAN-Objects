difference(){
    //ear();
    //translate([0,0,-1]) cylinder(h=3,d=25);
}
difference(){
    translate([25,0,0])
    rotate([95,-4,0])
    //minkowski(){
        cat_ear();
    //    sphere(2);
    //}
    
    intersection(){
        #translate([0,-25,-50+0.1]) cube(50);
        #translate([0,0,-20]) sphere(30);
    }
    
    //translate([0,-25,0.5]) cube(50);
}
module cat_ear(){
    half_cat_ear();
    rotate([0,0,180]) half_cat_ear();
}

module half_cat_ear(){
    scale([1,0.5,0.2])
    translate([0,5,0])
    difference(){
        sphere(20);
        translate([0,0,15]) sphere(20);
        translate([-20,-5,-20])cube(40);
    }
}

module ear(){
    
    $fn=150;
    sphere_size=200;
    intersection(){
        cylinder(h=0.5,d1=36,d2=34);
        //translate([0,0,-sphere_size+1])
        //rotate([45,45,0])
        //sphere(sphere_size);
    }
    translate([0,0,-0.5])cylinder(h=0.5,d1=35,d2=36);
    
    difference(){
        translate([0,0,-0.5])cylinder(h=0.5,d1=36,d2=36);
        #translate([20,7,-1])
        rotate([0,0,360/6])cube([50,50,50]);
    }

    translate([-36/2+1.6,0,-1])cube([0.8,4,1], true);
    translate([-36/2+1.5,0,-2])cube([1,4,1], true);

    rotate([0,0,360/3]){
        translate([-36/2+1.6,0,-1])cube([0.8,4,1], true);
        translate([-36/2+1.5,0,-2])cube([1,4,1], true);
    }

    rotate([0,0,360/6]){
        translate([-36/2+3,0,-1.5])cube([3,0.7,2], true);
    }

    rotate([0,0,360/6+180]){
        translate([-36/2+1,0,-1.5])cube([1,5,2], true);
        translate([-36/2+1,0,-3.5])cube([1,3,2], true);
        translate([-36/2+0.7,0,-4.25])cube([1.2,3,0.5], true);
        
    }
}

