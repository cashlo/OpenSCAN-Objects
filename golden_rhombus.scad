phi = (1+sqrt(5))/2;

acute_height = sqrt(5*(10+2*sqrt(5)))*sqrt(1+phi*phi)/10;
obtuse_height = sqrt(5*(10-2*sqrt(5)))*sqrt(1+phi*phi)/10;

acute_offset = sqrt(-acute_height*acute_height+(1+phi*phi));
obtuse_offset = sqrt(-obtuse_height*obtuse_height+(1+phi*phi));


height = 0.7;
corner = 0.4;

size = 10;

$fn=50;

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


obtuse_golden_rhombohedron();

translate([40,0,0])
acute_golden_rhombohedron();