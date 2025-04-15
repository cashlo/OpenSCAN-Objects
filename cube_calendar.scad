
size = 15;
digi_depth = 3;
level = 10;

frame_size = 2;

translate([size*2.5,size,size])
rotate([180,0,0])
number_cube (["0","1","2","6","8","7"]);

translate([size*2.5,size*2.15,0])
rotate([90,0,0])
number_cube (["0","1","2","3","4","5"]);


//translate([size*2,0,0]) number_cube (["0","1","2","6","7","8"]);

translate([size*1.5,size*2.5,0]) 
    month(["January", "February", "March", "April"]);
translate([size*2.25,size*2.5,0]) 
    month(["May", "June","July", "August"]);
translate([size*3,size*2.5,size/2]) 
rotate([0,90,0])
    month(["September", "October", "November", "December"]);

translate([0,0,size*2])
rotate([0,-75+180,0])
stand(0.3, 1);

difference(){
frame();

#
translate([size*0.8,size*4.8,0.5])
rotate([0,0,-90])
linear_extrude(4){
scale(0.65)
brand();
translate([0,-7,0])
text("コミケ105", size=3.5, font = "BestTen\\-CRT");
translate([0,-14,0])
text("30/12 東Y40a", size=3.5, font = "BestTen\\-CRT");

}
}

module brand(){
translate([0,-1.5,0])
import("x.svg");

translate([10,0,0])
text("@CashTHLo", size=6, font = "BestTen\\-CRT");
}

module frame(){
    translate([-size/4,-size/4,0]){
    difference(){
    hull(){
        cylinder(frame_size, frame_size, frame_size, $fn=8);
        translate([size*4,0,0]) cylinder(frame_size, frame_size, frame_size, $fn=8);
        translate([0,size*5,0]) cylinder(frame_size, frame_size, frame_size, $fn=8);
        translate([size*4,size*5,0]) cylinder(frame_size, frame_size, frame_size, $fn=8);
        
    }
    translate([0,0,-0.5])
    cube([size*4,size*5,frame_size+1]);
    }
    
    translate([0,size*2.75,0])
    cube([size*1.5,size*2.25,frame_size]);
    
    translate([0,size*0.25,0])
    cube([size*4,0.8,0.5]);
    
    translate([0,size*1.25-0.8,0])
    cube([size*4,0.8,0.5]);
    
    translate([0,size*1.4,0])
    cube([size*4,0.8,0.5]);
    
    translate([0,size*2.4-0.8,0])
    cube([size*4,0.8,0.5]);
    
    
    translate([0,size*2.75,0])
    cube([size*4,0.8,0.5]);
    
    translate([0,size*4.75-0.8,0])
    cube([size*4,0.8,0.5]);
    
    translate([size*1.45,0,0])
    cube([0.8,size*5,0.5]);
    }
}

module stand(offset, boarder) {
    difference(){
        
        cube((size+boarder+offset)*2);
        translate([0,boarder,size+boarder+offset]) cube([(size+offset),(size+offset)*2,(size+offset)]);
        translate([0,boarder,size/2+boarder]) cube([size*3/2+offset,(size+offset)*2,size/2+offset]);
        #rotate([0, 75, 0]) {
            cube((size+boarder+offset)*2);
            translate([-size*2,0,size*2]) cube((size+boarder+offset)*2);
            translate([0,0,size*2]) cube((size+boarder+offset)*2);
            }
    }
}

module month(months) {
    difference(){
        cube([size/2,size*2,size/2]);
        translate([size/4,size,0]) rotate([0, 0, 90]) word(months[0], size/4, digi_depth, level);
        translate([size/2,size,size/4]) rotate([-90, 0, 90]) word(months[1], size/4, digi_depth, level);
        translate([size/4,size,size/2]) rotate([180, 0, 90]) word(months[2], size/4, digi_depth, level);
        translate([0,size,size/4]) rotate([90, 0, 90]) word(months[3], size/4, digi_depth, level);
    }
}

module number_cube (numbers){
    difference(){
        cube(size);
        translate([size/2,size/2,0]) rotate([0, 0, 90]) word(numbers[0],size*0.7, digi_depth, level);
        translate([0,size/2,size/2]) rotate([0, 90, 0]) word(numbers[1],size*0.7, digi_depth, level);
        translate([size/2,0,size/2]) rotate([0, 90, 90]) word(numbers[2],size*0.7, digi_depth, level);
        translate([size/2,size,size/2]) rotate([180, 90, 90]) word(numbers[3],size*0.7, digi_depth, level);
        translate([size,size/2,size/2]) rotate([0, 270, 0]) word(numbers[4],size*0.7, digi_depth, level);
        translate([size/2,size/2,size]) rotate([0, 180, 90]) word(numbers[5],size*0.7, digi_depth, level);
    };
}

module word(text, size, depth, level) {
    for (i = [0:1/level:1]){
        translate([0,0,i*depth])
        linear_extrude(height = depth/level, center = false, convexity = 10)
        offset(-i)
        rotate([0, 180, 0])
        text(
            text,
            size = size,
            font = "Bahnschrift:style=Regular",
            valign = "center",
            halign = "center"
        );
    }
}
