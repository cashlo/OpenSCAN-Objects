sphere_size = 10;
sphere_offset = 12;
$fn=100;

//hand_snv_thingy(11, 0);
//translate([0,0,-10])
//hand_thingy();

flower_core();
//flower_base();

module hand_snv_thingy(ring_size, offset){
    intersection(){
        for(i=[1:10])
            rotate(360/10*i)
            translate([10,0,0])
            sphere(4);
        
        difference(){
            sphere(21/2+0.8+offset);
            sphere(21/2-0.4);
        }
        
        union(){
        cylinder(10,20,20);
        translate([0,0,-3])
        cylinder(3,ring_size+offset,ring_size+offset);
        }
    }


}

module hand_thingy(){

 /*
    intersection(){
        for(i=[1:10])
            rotate(360/10*i)
            translate([10,0,0])
            sphere(4);
        
        difference(){
            sphere(20/2);
            sphere(20/2-0.8);
        }
    }
*/
    color("LightBlue")
    difference(){
    sphere(21/2+1.8);
    sphere(21/2-0.2);
    translate([-15,-15,2])
    cube([30,30,30]);
    
    hand_snv_thingy(11, 0.2);
    }
}


module flower_core(){
 translate([0,0,3])
 scale([1,1,0.3])
 sphere(sphere_size*0.8);
 
 translate([0,0,-30/0.8+1])
 rotate([0,0,35])
 cylinder(30/0.8, 2.3, 2.3, $fn=5);
}

module flower_base(){
difference(){ 
color("LightBlue")
 for(i=[1:5])
 rotate(360/5*i)
 translate([sphere_offset,0,0])
 scale([1,1,0.3])
 sphere(sphere_size);
 
 
 
 translate([0,0,3])
 scale([1,1,0.3])
 sphere(sphere_size*0.8);
 
 }
 }
