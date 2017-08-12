intersection(){
    octahedron(30+6);
    translate([0,1.5,0]) connector(3, 3, 30, 0.7, 2, 3, 4, true);
}

//arm(3, 3, 30, 0.7, 2, 3, 2, true);

module connector(board_t, wall_t, arm_w, teeth_r, teeth_o, teeth_n, side_n, back) {
        
        for(r = [0:side_n-1]){
            rotate ([0, r*90, 0])
                translate([-(board_t/2+wall_t),0,board_t/2])
                arm(board_t, wall_t, arm_w, teeth_r, teeth_o, teeth_n);
        }
        
        
        if(back && side_n > 1) {
            for(r = [1:side_n-1])
                rotate ([90*r, 0, 90])
                    translate([-(board_t+wall_t),board_t/2,board_t/2])
                    arm(board_t, wall_t, arm_w, teeth_r, teeth_o, teeth_n);
            
            if(side_n == 4) {
                 rotate ([90*4, 0, 90])
                    translate([-(board_t+wall_t),board_t/2,board_t/2])
                    arm(board_t, wall_t, arm_w, teeth_r, teeth_o, teeth_n);               
            }
        }
        
}




module arm(board_t, wall_t, arm_w, teeth_r, teeth_o, teeth_n) {
    difference(){
        translate([0,-wall_t-board_t,-wall_t-board_t]) cube([board_t+wall_t*2,arm_w+board_t+wall_t,arm_w+board_t+wall_t]);
        translate([wall_t,wall_t,wall_t]) cube([board_t,arm_w-wall_t,arm_w-wall_t]);
    }
    for(t = [1:teeth_n]){
        #translate([wall_t, arm_w/2-teeth_o+(teeth_o+teeth_r)*t ,arm_w/2-teeth_o-(teeth_o+teeth_r)*t ]) sphere(teeth_r);
        #translate([wall_t, arm_w/2-teeth_o-(teeth_o+teeth_r)*t ,arm_w/2-teeth_o+(teeth_o+teeth_r)*t ]) sphere(teeth_r);
        #translate([wall_t+board_t, arm_w/2-teeth_o+(teeth_o+teeth_r)*t ,arm_w/2-teeth_o-(teeth_o+teeth_r)*t ]) sphere(teeth_r);
        #translate([wall_t+board_t, arm_w/2-teeth_o-(teeth_o+teeth_r)*t ,arm_w/2-teeth_o+(teeth_o+teeth_r)*t ]) sphere(teeth_r);
    }
}
module octahedron (w) {
    polyhedron(
  points=[ [w,0,0],[0,w,0],[-w,0,0],[0,-w,0],
           [0,0,w], [0,0,-w] ],   
  faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4], 
            [0,5,1],[1,5,2],[2,5,3],[3,5,0]]      
 );
}

