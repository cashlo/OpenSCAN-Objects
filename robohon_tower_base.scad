difference(){
    union(){
        cube([70,70,100]);

        translate([7.5,0,0]) foot();
        translate([70-7.5-10,0,0]) foot();
        
        translate([0,70,0])
        rotate([0,0,-90]){
            translate([7.5,0,0]) foot();
            translate([70-7.5-10,0,0]) foot();            
        }
        
        translate([70,0,0])
        rotate([0,0,90]){
            translate([7.5,0,0]) foot();
            translate([70-7.5-10,0,0]) foot();     
        }
        
        translate([70,70,0])
        rotate([0,0,180]){
            translate([7.5,0,0]) foot();
            translate([70-7.5-10,0,0]) foot();     
    
    }
        
    }
    translate([-0.1,-0.1,100])cube([70.2,70.2,100]);
    translate([-50,-50,-200])cube([200,200,200]);
    
    translate([70/2-10,0,0]){
        cube([20,10,30]);
        translate([10,0,30])scale([1,1,0.8])rotate([-90,0,0])cylinder(10,d=20);
    }
    
}

module foot(){
    difference(){
        translate([0,-15,0])
        rotate([-5,0,0])
        cube([10,20,150]);
        
        
        #translate([0,-40,100])
        rotate([-30,0,0])
        cube([10,20,150]);
        
        }


    translate([0,-30,0])
    rotate([-30,0,0])
    cube([10,20,50]);    
 }