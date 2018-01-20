ax = 0;
ay = 10;
va = [ax, ay];

bx = 10;
by = -10;
vb = [bx, by];

cx = -10;
cy = -10;
vc = [cx, cy];

ab = distance(va, vb);
bc = distance(vb, vc);
ca = distance(vc, va);

sum_of_long_sides = ab + bc + ca - min(ab, bc, ca);


echo(ab=ab);
echo(bc=bc);
echo(ca=ca);
echo(sum_of_long_sides);

padding = 0;

translate([0, ay]) circle(1);
translate([bx, by]) circle(1);
translate([cx, cy]) circle(1);

vab = vb - va;
angle = atan2(vab[1], vab[0]);

vac = vc - va;
angle = atan2(vac[1], vac[0]);
echo(vac=vac);
echo(angle=angle);



function distance(p1, p2) = sqrt( pow((p1[0]-p2[0]),2) + pow((p1[1]-p2[1]),2) );

sector(10, 10, 170);
module sector(r, a1, a2) {
    difference(){
        circle(r);
        rotate([0,0,a1]) translate([-r*2, -r]) square([r*2, r*2]);
        rotate([0,0,a2]) translate([0, -r]) square([r*2, r*2]);
    }
}