$fn=100;


/*
difference(){
linear_extrude(5)
offset(1.2)
whiskers_form();
    
translate([0,0,1.2])
linear_extrude(5)
whiskers_form();
}

translate([0,30,0]){
    linear_extrude(1)
    offset(1.3)
    whiskers_form();
    
    linear_extrude(2)
    offset(-0.2)
    whiskers_form();
    
}
*/

linear_extrude(1)
translate([0,60,0])
offset(-0.5)
whiskers_form();

module whiskers_form() {
    offset(5)
    intersection(){
        translate([-30,0,0])square([60, 100]);
        difference(){
            circle(70);
            circle(69);
        }
    }
}