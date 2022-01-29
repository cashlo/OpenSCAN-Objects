$fn=200;

difference() {
    cylinder(80, d=80);
    translate([0,0,7.5])
    cylinder(81, d=80-10);
    
    difference() {
    translate([-10,-20,30])
    rotate([90,0,0])
    linear_extrude(20)
    text("眞子様", font="UD Digi Kyokasho NP\\-R:style=Bold", size=15,spacing=0.8, valign ="center", halign ="center");
    cylinder(81, d=80-5);
    }
    
    rotate([0,0,180])
    difference() {
    translate([-10,-20,30])
    rotate([90,0,0])
    linear_extrude(20)
    text("毛毛様", font="UD Digi Kyokasho NP\\-R:style=Bold", size=15,spacing=0.8, valign ="center", halign ="center");
    cylinder(81, d=80-5);        
    }   

}
