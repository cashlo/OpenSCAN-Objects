use <arc.scad>;
difference() {
3D_arc(h=10,w=2,r=100,deg=130,fn=200);
3D_arc(h=10,w=0.5,r=100,deg=125,fn=200);
}
difference() {
    cylinder(h=3, d=60);
    cylinder(h=3, d=41);
}

translate([-2.5,25,0])cube([5,74,3],false);
rotate([0,0,60])translate([-2.5,25,0])cube([5,74,3],false);
rotate([0,0,-60])translate([-2.5,25,0])cube([5,74,3],false);
