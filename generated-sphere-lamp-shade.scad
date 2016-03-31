radius = 80;
thickness = 10;
number_of_vertices = 30;
width = 5;
connection_rate = 10;
seed = 3;

adapter_inner_diameter = 41;
adapter_mid_diameter = 60;
adapter_outer_diameter = 80;
adapter_height = 3;

translate([0,0,radius]) difference() {
    cylinder(h=adapter_height, d=adapter_outer_diameter, center=true);
    cylinder(h=adapter_height+1, d=adapter_inner_diameter, center=true);
}
difference() {
    random_shade(radius, thickness, number_of_vertices, width, connection_rate,seed);
    translate([0,0,radius]) cylinder(h=thickness*2, d=adapter_mid_diameter, center=true);
    translate([0,0,radius+adapter_height/2]) cylinder(h=thickness*2, d=adapter_outer_diameter);
}
module random_shade(radius, thickness, number_of_vertices, width, connection_rate,seed) {

    random_vect = rands(0,1,number_of_vertices*2 + number_of_vertices*(number_of_vertices-1),seed);

    vertices = [ for (i=[0:number_of_vertices])
                [0,acos(random_vect[i*2]*2-1),random_vect[i*2+1]*360] ];

    /*
    for(i=[0:number_of_vertices]) {
        azimuth = rands(0,360,1)[0];
        polar = acos(rands(-1,1,1)[0]);
        vertices[i] = [0,polar,azimuth];
        //rotate([0,polar,azimuth]) cylinder(radius*2, width/2, width/2);
    }
    */
    intersection() {
        difference() {
            sphere(radius+thickness);
            sphere(radius);
        }

        for(i=[0:number_of_vertices]) {
            if (i+1 < number_of_vertices) for(j=[i+1:number_of_vertices]) {
                if (random_vect[number_of_vertices*2 + (i+1)*j - 1]*100 < connection_rate) hull(){
                    rotate(vertices[i]) cylinder(radius*10, width/2, width/2);
                    rotate(vertices[j]) cylinder(radius*10, width/2, width/2);
                }
            }
        }

    }
}

