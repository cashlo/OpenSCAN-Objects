A = 25.3;
B = 29.3;
C = 8.6;

a1 = 83.5;
a2 = 115.5;
a3 = 85;

module shogi_piece(A=25.3, B = 29.3,C = 8.6,a1 = 83.5,a2 = 115.5,a3 = 85) {
    difference(){
        linear_extrude(C)
        difference(){
        square([A,B]);
          rotate([0,0,-90+a1]) translate([-A,0,0]) square([A,B]);
          translate([A,0,0]) rotate([0,0,90-a1]) square([A,B]);
          translate([A/2,B,0]) rotate([0,0,180-a1-a2]) square([A,B]);
          translate([A/2,B,0]) rotate([0,0,a1+a2-90]) square([A,B]);
        }
        
       translate([0,0,C]) rotate([a3-90,0,0]) cube([A,B*2,C]);
       rotate([90-a3,0,0]) translate([0,0,-C]) cube([A,B*2,C]); 
        
    }
}

//shogi_piece(A=25.3, B = 29.3,C = 8.6,a1 = 83.5,a2 = 115.5,a3 = 85);

#scale([1, 1, 0.1]) surface(file = "minasejs-king1.png", center = true, convexity = 5);