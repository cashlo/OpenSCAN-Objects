cube_size = 50;
tube_size = 20;
edge_size = (cube_size-tube_size)/2;
hole_offset = cube_size/2-edge_size/2;

connector_width = 10;
connector_height = 3;

clearance = 0.2;

$fn=20;

difference(){
    base_piece(4);
    
}

module base_piece(multiple){
    base_size = cube_size+clearance;
    for(x = [0 : base_size : base_size*(multiple-1)]) {
    for(y = [0 : base_size : base_size*(multiple-1)]) {
        translate([x,y,0]){
            difference(){
                translate([0,0,-0.3])cube([base_size,base_size, connector_height+0.6], true);
                translate([0,0,-0.3])cube([tube_size,base_size-connector_width, connector_height+0.6], true);
                translate([0,0,-0.3])cube([base_size-connector_width,tube_size, connector_height+0.6], true);
                translate([ 0,0,-cube_size/2+connector_height/2]) face_connectors();
                face_plugs();
            }
            translate([ 0,0,-cube_size/2+connector_height/2]) face_plugs();
        }
    }}
}

module cube13() {
    difference(){
        base_cube();
        
        translate([0,0,cube_size/2]) tube2();
        tube1();
        translate([0,0,-cube_size/2]) tube1();
        translate([0,0,-cube_size/2]) rotate([0,0,90]) tube1();
    }   
}

module cube12() {
    difference(){
        base_cube();
        
        translate([0,0,cube_size/2]) tube1();
        translate([0,0,cube_size/2]) rotate([0,0,90]) tube1();
        #translate([0,0,cube_size/2]) rotate([90,0,0]) tube1();
        intersection(){
            #translate([0,0,-cube_size/2]) rotate([0,-90,0]) tube2();
            translate([-cube_size/2,-cube_size/2,-cube_size/2])
            cube([cube_size,cube_size,cube_size/2]);
        }
    }    
}

module base_cube(){
    difference(){
        cube([cube_size,cube_size,cube_size], true);
        face_connectors();
        rotate([180,0,0]) face_connectors();
    }
    face_plugs();
    rotate([180,0,0]) face_plugs();
}

module face_connectors(){
    translate([ hole_offset, hole_offset,cube_size/2-connector_height/2]) connector();
    translate([-hole_offset, hole_offset,cube_size/2-connector_height/2]) connector();
    translate([ hole_offset,-hole_offset,cube_size/2-connector_height/2]) connector();
    translate([-hole_offset,-hole_offset,cube_size/2-connector_height/2]) connector();    
}

module tube1() {
    rotate([90,0,0])    
    cylinder(cube_size, d1=tube_size, d2=tube_size, center = true);   
}
module tube2() {
    translate([edge_size+tube_size/2,edge_size+tube_size/2,0])
    rotate_extrude()
    translate([edge_size+tube_size/2,0,0])
    circle(d=tube_size);
}

module face_plugs(){
     for(r = [0 : 90 : 270]) {
        rotate([0,0,r])
        translate([ hole_offset, -hole_offset,cube_size/2-connector_height/2])
        plug();     
     }
 }

module connector() {
    cube([connector_width, connector_width,connector_height], true);
}


module plug() {
    plug_width = connector_width - clearance*3;
    translate([-connector_width/2+clearance, -connector_width/2+clearance,-connector_height/2])
    linear_extrude(connector_height*2-clearance)
    polygon([[0,0], [0,plug_width],[plug_width,0]]);
}

