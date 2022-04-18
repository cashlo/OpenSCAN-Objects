phi = (1+sqrt(5))/2;

f2fheight = sqrt(5*(10+2*sqrt(5)))*sqrt(1+phi*phi)/10;
xoffset = sqrt(-f2fheight*f2fheight+(1+phi*phi));

height = 0.7;
offset = 0.2;

module golden_rhombus (){
    polygon([
        [phi, 0],
        [0, 1],
        [-phi, 0],
        [0, -1]
    ], [[0,1,2,3]]);
}


hull(){
translate([xoffset*10,0,f2fheight*10])
linear_extrude(000000.1)
scale(10)
golden_rhombus();

linear_extrude(000000.1)
scale(10)
golden_rhombus();
}



module paper(){
linear_extrude(height)
scale(10)
golden_rhombus();

linear_extrude(height)
scale(10)
translate([phi+offset/10,1+offset/10,0])
golden_rhombus();

linear_extrude(height)
scale(10)
translate([0,2+offset*2/10,0])
golden_rhombus();

linear_extrude(height)
scale(10)
translate([phi+offset/10,3+offset*3/10,0])
golden_rhombus();

linear_extrude(height)
scale(10)
translate([0,4+offset*4/10,0])
golden_rhombus();



translate([3,0,0])
cube([phi*7,8*5,0.3]);
}