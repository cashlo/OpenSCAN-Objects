//cylinder(d=17.5, h=37.5);

translate([37.5,0,0]) cube([5,20,10]);

difference(){
translate([-5,0,0]) cube([37.5+5,20,3]);


translate([0,60,-50])
rotate([45,0,0])
linear_extrude(100)
polygon([[0,0],[0.25, 5],[0.25,100],[-0.25,100],[-0.25,5]]);}