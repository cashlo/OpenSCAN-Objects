 module cylinder_outer(height,radius,fn){
   fudge = 1/cos(180/fn);
   cylinder(h=height,r=radius*fudge,$fn=fn);}
   
intersection(){
    difference(){
        translate([0,0,10]) sphere(10);
        translate([0,0,10]) sphere(9);
        
    }
    cylinder(h=10, d=40);
}
    
   
difference(){
    union(){
        translate([0,0,-1])cylinder(h=1, d1=65, d2=80);
        cylinder(h=10, d=40);
    }
    translate([0,0,-1]) cylinder(h=10, d=40-1);
    
    cylinder_outer(20,15.2/2,6);
    for(angle = [0 : 15 : 360]){
        rotate([0,0,angle+30])
        translate([11,0,0])
        cylinder(h=20, d=2, $fn=6);
        
        rotate([0,0,angle+15/2])
        translate([13,0,0])
        //rotate([0,0,-30])
        cylinder(h=20, d=2, $fn=6);
        
        rotate([0,0,angle+15])
        translate([15,0,0])
        //rotate([0,0,-30])
        cylinder(h=20, d=2, $fn=6);
        
        rotate([0,0,angle+15/2])
        translate([17,0,0])
        //rotate([0,0,-30])
        cylinder(h=20, d=2, $fn=6);
    }
}

difference(){
    for(i = [0 : 3]){
        rotate([0,0,90*i])
        intersection(){
            spiral();
            translate([0,0,-10])cylinder(h=10, d=80);
        }
    }
    translate([0,0,-10])cylinder(h=10, d=40);
}

module spiral(){
    angle=30;

    for(i = [1 : 6]){
    rotate([0,0,i*angle])
    //rotate([45,0,0])

    translate([0,44*pow(cos(angle),i),-3])
    rotate([45,0,0]){
        cube([44*pow(cos(angle),i-1)*sin(angle)*1.08,6,6]);
        
    }
    }
}