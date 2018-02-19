// Y coordinate of first vertex A, X coordinate is fixed to 0
ay = 20; // [1:100]

// X coordinate of second vertex B
bx = 15; // [1:100]
// Y coordinate of second vertex B
by = -10; // [-100:-1]

// X coordinate of third vertex C
cx = -15; // [-100:-1]
// Y coordinate of third vertex C
cy = -30; // [-100:-1]

// Additional padding
padding = 0; // [0:100]

// Cut out for original triangle used to generate the curve
cut_out = "through"; // [none, half, through]

width = 100;

/* [Hidden] */
ax = 0;

va = [0, ay];
vb = [bx, by];
vnb = [-bx, by];
vc = [cx, cy];
vnc = [-cx, cy];

    ab = distance(va, vb);
    bc = distance(vb, vc);
    ca = distance(vc, va);


slices = 30;

for (s =[0:slices-1]) {
    
    a = s/slices;
    
    r = cos(a*180)/2 + 0.5;
    i = 1 - r;
    
    na = a + 1/slices;
    nr = cos(na*180)/2 + 0.5;
    ni = 1 - nr;
    
    echo(a=a, r=r, na=na, nr=nr);
    
    hull(){
        rotate([0, a*180, 0]) linear_extrude(0.1) ccw(va, vb*i + vnc*r, vc*i + vnb*r, padding, width);
        rotate([0, na*180, 0]) linear_extrude(0.1) ccw(va, vb*ni + vnc*nr, vc*ni + vnb*nr, padding, width);
    }
}

//for (a =[0:step:1-step]) {
//    
//    r = cos(a*180)/2 + 0.5;
//    i = 1 - r;
//    
//    
//    na = a + step;
//    nr = cos(na*180)/2 + 0.5;
//    ni = 1 - nr;
//    
//    echo(a=a, r=r, na=na, nr=nr);
//    
//    translate([0,0,200]) hull(){
//       rotate([0, a*180, 0]) linear_extrude(0.1) polygon([va, vb*i + vnc*r, vc*i + vnb*r]);
//       rotate([0, na*180, 0]) linear_extrude(0.1) polygon([va, vb*ni + vnc*nr, vc*ni + vnb*nr]);
//    }
//}

//    !union(){
//    a = $t;
//    i = 1 - a;
//    na = a + step;
//    ni = 1 - na;
//    translate([0,0,200]){ //hull(){
//       rotate([0, a*180, 0]) linear_extrude(0.1) polygon([va, vb*i + vnc*a, vc*i + vnb*a]);
//        
//    }
// }
    
module ccw(va, vb, vc, padding, width) {
    
//    echo(va=va, vb=vb, vc=vc);
    
    $fn=200;
    
    ab = distance(va, vb);
    bc = distance(vb, vc);
    ca = distance(vc, va);
    
    total = ab + bc + ca;
    sum_of_long_sides = max_2(ab, bc, ca);
    
    ratio = width/(sum_of_long_sides*2-total+padding*2);
    
//    echo(ratio=ratio);
    
    vab = vb - va;
    vac = vc - va;
    vba = va - vb;
    vbc = vc - vb;
    vca = va - vc;
    vcb = vb - vc;

    angle_vab = atan2(vab[1], vab[0]);
    angle_vac = atan2(vac[1], vac[0]);
    angle_vba = atan2(vba[1], vba[0]);
    angle_vbc = atan2(vbc[1], vbc[0]);
    angle_vca = atan2(vca[1], vca[0]);
    angle_vcb = atan2(vcb[1], vcb[0]);

    translate([ 0, -ratio*y_offset(ay, ab, bc, ca, padding), 0]) {
        translate(va*ratio) sector(ratio*(sum_of_long_sides + padding - bc),      angle_vab, angle_vac);
        translate(vc*ratio) sector(ratio*(sum_of_long_sides + padding - bc - ca), angle_vac, angle_vbc);
        translate(vb*ratio) sector(ratio*(sum_of_long_sides + padding - ca),      angle_vbc, angle_vba);
        translate(va*ratio) sector(ratio*(sum_of_long_sides + padding - ca - ab),      angle_vba, angle_vca);
        translate(vc*ratio) sector(ratio*(sum_of_long_sides + padding - ab),      angle_vca, angle_vcb);
        translate(vb*ratio) sector(ratio*(sum_of_long_sides + padding - bc - ab), angle_vcb, angle_vab);
    }
}

function distance(p1, p2) = sqrt( pow((p1[0]-p2[0]),2) + pow((p1[1]-p2[1]),2) );
function max_2(a, b, c) = a + b + c - min(a, b, c);
function y_offset(ay, ab, bc, ca, padding) = ay + max_2(ab, bc, ca) + padding - ab - ca;

module sector(r, a1, a2) {
    difference(){
        circle(r);
        rotate([0,0,a1]) translate([-r, 0]) square([r*2, r*2]);
        rotate([0,0,a2]) translate([-r, -r*2]) square([r*2, r*2]);
    }
}