phi = (1+sqrt(5))/2;

acute_height = sqrt(5*(10+2*sqrt(5)))*sqrt(1+phi*phi)/10;
obtuse_height = sqrt(5*(10-2*sqrt(5)))*sqrt(1+phi*phi)/10;

acute_offset = sqrt(-acute_height*acute_height+(1+phi*phi));
obtuse_offset = sqrt(-obtuse_height*obtuse_height+(1+phi*phi));


height = 0.7;
corner = 0.8;

size = 10;

$fn=50;

hole_size = 0.7;
hole_offset = 4;

module golden_rhombus (){
    hull(){
        translate([phi*size-corner, 0, 0])sphere(corner);
        translate([0, -size+corner, 0])sphere(corner);
        translate([-phi*size+corner, 0, 0])sphere(corner);
        translate([0, size-corner, 0])sphere(corner);
    }
}

module obtuse_golden_rhombohedron (){
    hull(){
        translate([0,obtuse_offset*10,obtuse_height*10])
        golden_rhombus();

        golden_rhombus();
    }
}


module acute_golden_rhombohedron (){
    hull(){
        translate([acute_offset*10,0,acute_height*10])
        golden_rhombus();

        golden_rhombus();
    }
}

module ammann_acute_golden_rhombohedron_1 (){
    acute_golden_rhombohedron();
    translate([phi*size-corner-hole_offset,0,-corner])
    sphere(hole_size);
}

obtuse_golden_rhombohedron();

//ammann_acute_golden_rhombohedron_1();

//acute_golden_rhombohedron();