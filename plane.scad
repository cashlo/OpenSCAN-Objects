
use <Naca4.scad>


 difference(){
translate([-30,0,20])
rotate([90,0,-90])    
wing(100,20,10,250,0.7);
     
translate([-30,-105,20])
flop(13.7,9.7);
 }
 
 /*
intersection(){
translate([-30,0,20])
rotate([90,0,-90])    
wing(100,20,10,250,0.7);
     
translate([-30,-105,20])
    flop(13.7,9.7,4.5,150-0.5, true);
 }

 

translate([-90,-97,30])
difference(){
    cube([2,5,10]);
    #translate([5,2.5,7]) 
    rotate([0,-90,0])cylinder(10, 1, 1);
}
 */
 
intersection(){
fuselage(100);
translate([-100,-200,-50])cube([100,200,100]);
}



module flop(sweep_angle=5, dihedral_angle=5, r=5, l=150, joint=false){
    rotate([0,-90+dihedral_angle,sweep_angle])
    {
        translate([2,24,50]){
            cylinder(l, 5, 5, $fn=50);
            
            if(joint){
                    sphere(2.3, $fn=50);
                    translate([0,0,l]) sphere(2.3, $fn=50);
                                 
            }else{
                    translate([0,0,-2.5]) cylinder(l+5, 2, 2, $fn=50);
            }
            translate([-5,-20,0])    
            cube([10,20,l]);
        }
    }
}


//translate([0,0,10])
//cover();

module fuselage(width=100, naca=2412){
    difference(){
    fuselage_shape(width, naca);
    
    motor_mount();
    
    translate([0,-100/2-3,20]) cube([30,100,70], true);    
    
    #translate([-19,-40,25]) servo_mount();
    
    #translate([19,-40,25]) servo_mount();
        
        
    //cover
    translate([0,-100/2-3,27]) cube([30,110,20], true);    
        
        
    }
    
    translate([5,0,0]) camera_support();
    translate([-5,0,0]) camera_support();
}

module cover(width=100, naca=2412){
    intersection(){
        fuselage_shape(width, naca);
        translate([0,-100/2-3,27]) cube([30-0.5,110-0.5,20], true);   
    }
    translate([0,-100/2-3,17]) cube([30-0.5,100-0.5,3], true);
}

module fuselage_shape(width=100, naca=2412){
    hull(){
        translate([30,0,20])
        rotate([90,0,-90]) 
        scale(width/100) airfoil(naca);
        
        translate([-30,0,20])
        rotate([90,0,-90]) 
        scale(width/100) airfoil(naca);
        
        translate([0,-100/2,0]) cube([30,100,40], true);
        
        translate([0,-80,0]) cube([1,100,30], true);
    }
    
}

module wing(width=100, sweep_angle=5, dihedral_angle=5, length=100, tip_scale=1, naca=2412){
    hull(){
        scale(width/100) airfoil(naca);
        #translate([length*tan(sweep_angle),length*tan(dihedral_angle),length])
        scale(tip_scale)
        scale(width/100) airfoil(naca);
    }
}



length = 90;


module motor_mount(){
   
    translate([0,0,-8])
    cube([8,10,4],true);

    translate([10,0,10])
    rotate([90,0,0])
    cylinder(10,0.7,0.7, true);

    translate([-10,0,10])
    rotate([90,0,0])
    cylinder(10,0.7,0.7, true);

    translate([10,0,-10])
    rotate([90,0,0])
    cylinder(10,0.7,0.7, true);

    translate([-10,0,-10])
    rotate([90,0,0])
    cylinder(10,0.7,0.7, true);

}

module hex_mount(){
    cylinder(1, 4.5/2, 4.5/2, true, $fn=6);
    cylinder(10, 1, 1, true, $fn=20);
}





module camera_support(){
    intersection(){
    translate([0,0,-13])
    rotate([180+30,0,0])
    cube([2, 50, 20], true);
    translate([0,-20,-5]) cube([2, 40, 25], true);
    }
}

module servo_mount(){
        #cube([8.5,18,10], true);
    
        #translate([0,0,-5]) cube([8.5,27,12], true);
    
        translate([0,9+2,0])
        cylinder(20,1,1, true);
    
        translate([0,-9-2,0])
        cylinder(20,1,1, true);
    
}