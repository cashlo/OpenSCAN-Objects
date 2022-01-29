translate([1,0,0]){
difference(){
    cylinder(h=30, d=20, $fn=6);
    cylinder(h=30, d=14);    
}
translate([17,0,0]) difference(){
    cylinder(h=30, d=20, $fn=6);
    cylinder(h=30, d=14);    
}
}
linear_extrude(5)
offset(r = 1)
text("真子", font="UD Digi Kyokasho NP\\-R:style=Bold", size=40,spacing=0.6, valign ="center", halign ="center");