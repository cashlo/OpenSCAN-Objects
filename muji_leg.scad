plug_r = 4;

cylinder(17, plug_r, plug_r);
cube([10, 50, 10], true);
translate([0,15,1])
cube([6.8, 15, 10], true);

translate([0,-15,1])
cube([6.8, 15, 10], true);
