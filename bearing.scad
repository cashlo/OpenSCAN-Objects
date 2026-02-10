ball_d = 7.4+0.2;
ring_d = 40;
backing = 3;
height = 10;
gap = ball_d/2;
spacer_t = gap - 1;
ball_n = 8;


//outer_ring();
//inner_ring();

module spacer(){

color("pink")
difference(){
cylinder(height, r=ring_d/2+spacer_t/2, center=true);
cylinder(height+1, r=ring_d/2-spacer_t/2, center=true);

for(i=[0:ball_n])
rotate([0,0,i*360/ball_n])
translate([ring_d/2,0,0]){
sphere(ball_d/2+0.3);

#sphere(ball_d/2);

translate([0,0,-ball_d/4])
rotate([45,0,0])
translate([-ball_d/2,0,0])
cube([ball_d*2,ball_d*2,ball_d*2]);
}

}
}


module outer_ring(){
    difference(){
    cylinder(height, r=ring_d/2+ball_d/2+backing, center=true, $fn=8);

    cylinder(height+1, r=ring_d/2+gap/2, center=true);

    rotate_extrude($fn=100)
    translate([-ring_d/2,0,0])
    ball_track_2d();

    //translate([0,0,-50])
    //cube([100, 100, 100]);
    }
}

module inner_ring(){
    difference(){
    cylinder(height, r=ring_d/2-gap/2, center=true);

    cylinder(height+1, r=ring_d/2-ball_d/2-backing, center=true);

    rotate_extrude($fn=100)
    translate([-ring_d/2,0,0])
    mirror([1,0,0])
    ball_track_2d();

    //translate([0,0,-50])
    //cube([100, 100, 100]);
    }
}

module ball_track_2d(){
circle(ball_d/2);

rotate([0,0,-45])
translate([-ball_d/2,0,0])
square(ball_d);

rotate([0,0,-135])
translate([-ball_d/2,0,0])
square(ball_d);
}