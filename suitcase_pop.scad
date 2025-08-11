include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/threading.scad>

handle_y = 22;
handle_x = 30;

width = 10;
height = 20;

thread_d = 10;

pop_tube_d = 8.5;
pop_offset = 5;

color("gray")
flat_screw();
pop_holder();

module pop_holder(){

difference(){
    cuboid([width*2+handle_x+thread_d,width*2+handle_y,height], chamfer=2, trimcorners=false, align=V_RIGHT);
    
    translate([width,0,0])
    cuboid([handle_x+50,handle_y,50],align=V_RIGHT);
    
    #translate([handle_x+width*2,(handle_y+width)/2,0])
    threaded_rod(d=thread_d, l=width*2, internal=true, orient=ORIENT_Y);
    
    #translate([handle_x+width*2,-(handle_y+width)/2,0])
    cyl(d=thread_d+1.5, l=width*2, orient=ORIENT_Y);
    
    #translate([handle_x+width*2,-(handle_y)/2-width,0])
    difference(){
    cyl(d=thread_d+7, l=width, orient=ORIENT_Y);
    
    translate([0,width/2,0])
    for(i=[0:6:360]){
        rotate([180,i,0])
        cyl(d=1, l=thread_d/2+5, orient=ORIENT_X, align=V_RIGHT);
    }
    }
}

difference(){
translate([0,handle_y+pop_offset/2,0])
cuboid([width+pop_tube_d,width+pop_tube_d+pop_offset,height], chamfer=2, trimcorners=false, align=V_RIGHT);

translate([width/2+pop_tube_d/2,handle_y+pop_offset,height/2])
#cyl(d=pop_tube_d, l=height, orient=ORIENT_Z);

translate([width/2+pop_tube_d/2,handle_y+pop_offset,-height/2])
#cyl(d=3.5, l=height, orient=ORIENT_Z);
}
}

module flat_screw(){
translate([handle_x+width*4,-handle_y/2-width*1.5,0]){


    difference(){
        screw();
        
        translate([0,0,thread_d*0.3])
        cuboid([150,150,10], align=V_UP);
        
        translate([0,0,-thread_d*0.3])
        cuboid([150,150,10], align=V_DOWN);
        
        
    }
}

}


module screw(){
translate([0,-width*2/3,0])
cuboid([thread_d*3, thread_d, thread_d], chamfer=1, trimcorners=false, align=V_BACK);


cyl(d=thread_d+6, l=width, orient=ORIENT_Y, align=V_BACK);

translate([0,width,0])
cyl(d=thread_d+1, l=width*2, orient=ORIENT_Y, align=V_BACK);

translate([0,width*3,0])
threaded_rod(d=thread_d, l=width*2, bevel2=true, orient=ORIENT_Y, align=V_BACK);



translate([0,width,0])
for(i=[0:6:360]){
    rotate([0,i,0])
    cyl(d=1, l=thread_d/2+3, orient=ORIENT_X, align=V_RIGHT);
    }

}