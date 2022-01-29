stand_radius = 45;


difference(){
    linear_extrude(5) circle(d=145);
    linear_extrude(5) circle(d=stand_radius-10);
    
    
    linear_extrude(3)
    for(i = [1:5]){
        rotate([0,0,360/5*i])
        translate([stand_radius, 0, 0])
        paper_roll();
    }
    
    linear_extrude(5)
    for(i = [1:5]){
        rotate([0,0,360/5*i + 365/10])
        translate([stand_radius+40, 0, 0])
        circle(d=45);
    }
}
module paper_roll(){

difference(){
    circle(d=43);
    circle(d=41);
}
}

#circle(d=128);