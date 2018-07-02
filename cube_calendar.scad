size = 10;
digi_depth = 3;
level = 10;

//number_cube (["0","1","2","3","4","5"]);

//translate([size*2,0,0]) number_cube (["0","1","2","6","7","8"]);

//translate([size*1,size*2,0]) month(["January", "February", "March", "April"]);
//translate([size*2,size*2,0]) month(["May", "June","July", "August"]);
//translate([size*3,size*2,0]) month(["September", "October", "November", "December"]);

stand(0.3, 1);

module stand(offset, boarder) {
    difference(){
        
        cube((size+boarder+offset)*2);
        translate([0,boarder,size+boarder+offset]) cube([(size+offset),(size+offset)*2,(size+offset)]);
        translate([0,boarder,size/2+boarder]) cube([size*3/2+offset,(size+offset)*2,size/2+offset]);
        rotate([0, 75, 0]) {
            cube((size+boarder)*2);
            translate([-size*2,0,size*2]) cube((size+boarder)*2);
            translate([0,0,size*2]) cube((size+boarder)*2);
            }
    }
}

module month(months) {
    difference(){
        cube([size/2,size*2,size/2]);
        translate([size/4,size,0]) rotate([0, 0, 90]) word(months[0], size-7.5, digi_depth, level);
        translate([size/2,size,size/4]) rotate([-90, 0, 90]) word(months[1], size-7.5, digi_depth, level);
        translate([size/4,size,size/2]) rotate([180, 0, 90]) word(months[2], size-7.5, digi_depth, level);
        translate([0,size,size/4]) rotate([90, 0, 90]) word(months[3], size-7.5, digi_depth, level);
    }
}

module number_cube (numbers){
    difference(){
        cube(size);
        translate([size/2,size/2,0]) rotate([0, 0, 90]) word(numbers[0],size-3, digi_depth, level);
        translate([0,size/2,size/2]) rotate([0, 90, 0]) word(numbers[1],size-3, digi_depth, level);
        translate([size/2,0,size/2]) rotate([0, 90, 90]) word(numbers[2],size-3, digi_depth, level);
        translate([size/2,size,size/2]) rotate([180, 90, 90]) word(numbers[3],size-3, digi_depth, level);
        translate([size,size/2,size/2]) rotate([0, 270, 0]) word(numbers[4],size-3, digi_depth, level);
        translate([size/2,size/2,size]) rotate([0, 180, 90]) word(numbers[5],size-3, digi_depth, level);
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