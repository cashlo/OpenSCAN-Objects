
connector(3, 3, 50, 1, 2, 3, 2, true);

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
                    translate([-(board_t/2+wall_t),0,board_t/2])
                    arm(board_t, wall_t, arm_w, teeth_r, teeth_o, teeth_n);               
            }
        }
        
}




module arm(board_t, wall_t, arm_w, teeth_r, teeth_o, teeth_n) {
    difference(){
        cube([board_t+wall_t*2,arm_w,arm_w]);
        translate([wall_t,wall_t,wall_t]) cube([board_t,arm_w-wall_t,arm_w-wall_t]);
    }
    for(t = [1:teeth_n]){
        translate([wall_t, arm_w-teeth_o,arm_w-teeth_o-(teeth_o+teeth_r)*t ]) sphere(teeth_r);
        translate([wall_t, arm_w-teeth_o-(teeth_o+teeth_r)*t,arm_w-teeth_o ]) sphere(teeth_r);
        translate([board_t+wall_t, arm_w-teeth_o,arm_w-teeth_o-(teeth_o+teeth_r)*t ]) sphere(teeth_r);
        translate([board_t+wall_t, arm_w-teeth_o-(teeth_o+teeth_r)*t,arm_w-teeth_o ]) sphere(teeth_r);
    }
}