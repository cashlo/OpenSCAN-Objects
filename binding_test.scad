
height=5; 

start=0.1;
step =0.02;

translate([0,-clearance,0]) puzzle_piece(0);

for (i = [1:6]){
    clearance = start+(i-1)*step;
    translate([15*i,-clearance,0]) puzzle_piece(clearance);
}

translate([50-5,15-5,height/2]) cube([100,5,height], true);
translate([50-10,-15/2,height/2]) cube([90,0.4,height], true);

module puzzle_piece(clearance){
    difference(){
        translate([0,0,height/2]) cube([10,15,height], true);
        translate([0,6,height-1]) rotate([0,0,90])linear_extrude(1) text(str(clearance), halign="right", valign="center", size=5);
        #translate([0,15/2,0]) rotate([45,0,0])cube([10,height/2,height/2], true);
    }
    
}