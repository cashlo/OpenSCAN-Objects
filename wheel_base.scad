include <BOSL2/std.scad>
include <servo_teeth.scad>



base_x = 30+7.76+40;
base_y = 120;
wheel_dist = 70;

base_r = 50;
n_of_wheels = 2;

top_z = 5;

roller_y = 15;

//difference(){
//difference(){
//cuboid([43, 43, 7.76],chamfer=1, anchor=BOT);
//rollercan_mount();
//}
//}

//mecanum_base();


up(50) big_wheel_attachment();


module big_wheel_attachment(){
difference(){
cyl(9, d=80, anchor=BOT, chamfer=1, $fn=200);



for(i=[0:3])
rotate([0,0,90*i+45]){
translate([10,0,0])
cylinder(10, 3.5/2, 3.5/2);

translate([10,0,6])
cylinder(10, 6/2, 6/2);
}

}
}

module wheel_attachment_mecanum(){

up(9)
difference(){
union(){
up(5)cyl(6.5,d2=7 ,d1=7.6, $fn=6, anchor=BOT);
cyl(5, d=7.6, $fn=6, anchor=BOT);
}
cyl(20, d=2.9, $fn=6, anchor=BOT);

#up(7) 
cuboid([0.1, 10, 10], anchor=BOT);
}

difference(){
cyl(9, d=33.2, anchor=BOT);


for(i=[0:10:360])
rotate([0,0,i])
left(34/2)
rotate([0,0,30])
cuboid([3, 0.8, 30], anchor=LEFT+BOT);


for(i=[0:3])
rotate([0,0,90*i+45]){
translate([10,0,0])
cylinder(10, 3.5/2, 3.5/2);

translate([10,0,6])
cylinder(10, 6/2, 6/2);
}

cyl(20, d=2.9, $fn=6, anchor=BOT);

}

}


module wheel_attachment_omni(){

up(6.2)
difference(){
union(){
up(20)cyl(10,d2=11 ,d1=12.2, anchor=BOT);
cyl(20, d=12.2, anchor=BOT);
cyl(1, d=8, anchor=TOP);
}
#
for(i=[0:40:360])
rotate([0,0,i])
left(8)
rotate([0,0,20])
cuboid([5, 0.8, 30], anchor=LEFT+BOT);
}

difference(){
cylinder(6, 30/2, 30/2);


for(i=[0:3])
rotate([0,0,90*i+45])
translate([10,0,0])
cylinder(10, 3.5/2, 3.5/2);

}

}

module mecanum_base(){

    //for(j=[0:1])
    //mirror([0,j,0])
    //back(wheel_dist/2)
    
//    for(i=[0:1])
//    mirror([i,0,0])
//    rotate([0,0,90])
//    translate([0,-27/2,43+top_z])
//    3d_mouth_with_hole();

    difference(){
        cuboid([base_x, base_y,  43+top_z],chamfer=1, anchor=BOT);
        inner_x = base_x-roller_y*2-7.76*2+0.01;
        echo("inner_x: ", inner_x)
        
        #up(top_z)
        cuboid([inner_x, base_y-top_z*2, 40.2-top_z], anchor=BOT);
        
        
        
        xflip_copy()
        yflip_copy()
        rotate([0,0,90])
        back(base_x/2)
        left(wheel_dist/2){
            cuboid([40.2,roller_y,40.2], anchor=BACK+BOT);
            cuboid([17,roller_y,43+top_z+1], anchor=BACK+BOT);
            up(40.2)
            left(17/2)
            #cuboid([17+50,base_x,top_z+10], anchor=BACK+BOT+LEFT);
            
            up(20) cuboid([wheel_dist+40,roller_y,17], anchor=BACK);
            
            up(20)
            right(20)
           cuboid([wheel_dist-40.2,base_x,17], anchor=BACK+LEFT);
            up(20)
            back(-roller_y)
            rotate([90,0,0])
            rollercan_mount();
        }
       
       //up(30) 
       //cuboid([0.1, base_y*2, (43+top_z)*2]);
    }
    
    
    
} 

module omni_base(){
    

    difference(){
        hull()
        for(i=[0:n_of_wheels])
        rotate([0,0,360/n_of_wheels*i])
        back(base_r)
        cuboid([43, 43, 43+top_z],chamfer=1, anchor=BACK+BOT);
    
        
        for(i=[0:n_of_wheels])
        rotate([0,0,360/n_of_wheels*i])
        back(base_r)
        cuboid([40.2,roller_y,40.2], anchor=BACK+BOT);
        
        for(i=[0:n_of_wheels])
        rotate([0,0,360/n_of_wheels*i])
        back(base_r)
        cuboid([17,roller_y,43+top_z+1], anchor=BACK+BOT);
        
        
        for(i=[0:n_of_wheels])
        rotate([0,0,360/n_of_wheels*i])
        up(20)
        back(base_r-roller_y)
        rotate([90,0,0])
        rollercan_mount();
        
        hull()
        for(i=[0:n_of_wheels])
        #rotate([0,0,360/n_of_wheels*i])
        up(top_z)
        back(base_r-roller_y-10)
        cuboid([38, 38, 38+top_z],chamfer=1, anchor=BACK+BOT);
    
    }
    
}





module rollercan_mount(){
    for(i=[0:3])
    rotate([0,0,90*i])
    translate([32/2,32/2,0]) 
    technic_hole();
}

module technic_hole(){
    cyl(7.76, d=5.0, anchor=BOT);
    cyl(0.8,  d=6.2, anchor=BOT);
    up(7.76-0.8)
    cyl(0.8,  d=6.2, anchor=BOT);
}
