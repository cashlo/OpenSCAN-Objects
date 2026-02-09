

module 3d_mouth_with_hole(){
    difference(){
        3d_mouth();
        #translate([0,0,3])
        rotate([90,0,0])
        cylinder(10, 3.2/2, 3.2/2, $fn=20);
    }
}


module 3d_mouth(){
    translate([-8,0,0]){
        translate([0,0,4])
        linear_extrude(2) mouth();
        linear_extrude(6) mouth(t=1.5, so=1, si=1.5, gap=7, og=0.5);
        linear_extrude(2) mouth();
    }
}


module mouth(t=2.5, so=1, si=1.5, gap=6, og=0){

teeth = so+t+si;

polygon([[0,0], [og,0], [og+so, 3.5], [og+so+t, 3.5], [og+so+t+si, 0], 
         [og+teeth+gap, 0], [og+teeth+gap+si, 3.5], [og+teeth+gap+si+t, 3.5], [og+teeth*2+gap, 0], [og+teeth*2+gap+og, 0],
         [og+teeth*2+gap+og, -3.5], [0, -3.5], 
         ]);
         
 }