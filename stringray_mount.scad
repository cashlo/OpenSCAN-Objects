include <BOSL2/std.scad>

spacing = 20;
space_rod_size = 5;

/* [Test Rod] */
rod_len = 20;             // center of shaft to scale-contact tip (mm); at 50 mm (5 cm), 352 g = 1.76 kg*cm
rod_w   = 6.0;            // rod width (y)
rod_h   = 3.0;            // rod thickness below z = 0 (matches horn_floor)
tip_h   = 5.4;            // contact bump height at x = -rod_len (points up when printed top-down)

/* [Servo: Blue Arrow AF D43S (from factory drawing)] */
// Shaft axis is x = y = 0; long side of servo along x with far end toward +x
srv_w = 8.30;   srv_x0 = -4.20;   srv_x1 = 15.80;   srv_h = 19.50;          // body 20.00 × 8.30, top face at 19.50
srv_tab_x0 = -7.95;  srv_tab_x1 = 19.55;  srv_tab_w = 8.30;                 // ears: 27.50 long, 8.30 wide,
srv_tab_t = 0.85;  srv_tab_drop = 3.45;   srv_tab_holes = [-6.00, 17.80];   //   15.20 … 16.05 up, Ø2.0 holes 23.80 apart
srv_boss_d = 8.30;  srv_boss_h = 4.80;                                      // raised boss to 24.30 (19.50 + 4.80)
srv_lobe_x = 4.20;  srv_lobe_r = 2.50;
srv_spline_h = 2.70;  srv_spline_d = 3.60;                                  // spline OD 3.60, to 27.00 (24.30 + 2.70)

/* [Horn Pad & Bridge Parameters] */
spline_bore  = 3.8;      // press fit on the Ø3.60 spline (use part="spline_fit_test" to test 3.55 / 3.70 / 3.85)
horn_floor   = 3.0;       // material above the spline top (screw head sunk in it, 1.2 mm floor under head)
horn_proud   = 0.0;       // extra clearance above z_hp0 if needed
horn_screw_d = 2.2;       // horn screw clearance
horn_head_d  = 4.4;       // counterbore diameter, open to z = 0
horn_head_h  = 1.8;       // counterbore depth from z = 0
layer_h      = 0.2;       // print layer height for the 2-layer counterbore bridge
horn_pad_d   = 10.5;      // outer diameter of the spline hub

module servo_mount(){
    difference(){
        cuboid([10,8.3,8], anchor=LEFT);
        right(10-3.5)
        cuboid([3.5,8.3,0.9], anchor=LEFT);
        
        right(10-1.8)cyl(20, d=1.4);
        right(10-1.8)cyl(20, d=2, anchor=BOTTOM);
        right(10-1.8)
        up(8/4)
        cyl(20, d=3.5, anchor=BOTTOM);
        
        
    }
}

module rod_mount(){
    difference(){
        cuboid([5,4,10]);
        cuboid([5,1,10], anchor=LEFT);
        cyl(20, d=1.5, $fn=10);
        
        right(1.5)ycyl(20, d=1.4);
        right(1.5)ycyl(20, d=2, anchor=BACK);
        #right(1.5)
        fwd(4/4)
        ycyl(20, d=3.5, anchor=BACK);
    }
}

z_spline = -horn_floor;                   // spline top (-3.0)
z_boss   = z_spline - srv_spline_h;       // gear boss top (-5.7)
z_st     = z_boss - srv_boss_h;           // servo shoulder / top face (-10.5)
z_tab    = z_st - srv_tab_drop;           // top of mounting ears (-13.95)
z_bot    = z_st - srv_h;                  // bottom of servo body (-30.0)
z_hp0    = z_boss + 0.3;                  // horn pad bottom (-5.4)

module horn_pad() {           // in place (top at z = 0), seated horn_proud higher than the drawing's spline top
    zb = z_hp0 + horn_proud;
    difference() {
        union() {
            up(zb) cyl(d=horn_pad_d, h=-zb, anchor=BOT, chamfer1=0.4);
            // Simple lever rod extending to x = -rod_len (flat top at z = 0)
            hull() {
                cyl(d=horn_pad_d, h=rod_h, anchor=TOP);
                left(rod_len) cyl(d=rod_w, h=rod_h, anchor=TOP);
            }
            // Underside stiffening rib & calibrated contact tip at x = -rod_len
            hull() {
                up(zb) cyl(d=3.4, h=-zb, anchor=BOT);
                left(rod_len) up(-tip_h) cyl(d1=2.4, d2=rod_w, h=tip_h, anchor=BOT);
            }
        }
        down(0.01) up(zb) cyl(d=spline_bore, h=z_spline - z_hp0 + 0.01, anchor=BOT, chamfer1=-0.4, $fn=40);
        cyl(d=horn_screw_d, h=20, $fn=24);
        up(0.01) cyl(d=horn_head_d, h=horn_head_h, anchor=TOP, $fn=32);
        // printed top-down, the counterbore's floor would hang in the air: bridge it in two layers instead
        // (a slot the screw's width across the counterbore, then a square), then the round hole carries on
        down(horn_head_h - 0.01) cuboid([horn_head_d + 0.1, horn_screw_d, layer_h + 0.01], anchor=TOP);
        down(horn_head_h + layer_h - 0.01) cuboid([horn_screw_d, horn_screw_d, layer_h + 0.01], anchor=TOP);

        
        left(horn_pad_d/2)
        down(rod_h)
        xcyl(rod_len, d=1.5, anchor=RIGHT, $fn=10);
        
        #left(horn_pad_d/2)
        down(rod_h)
        cuboid([rod_len,1,rod_h], anchor=RIGHT+BOTTOM);
        
        
    }
}

up(30) horn_pad();


intersection(){
xrot(45) cuboid([spacing,space_rod_size,space_rod_size]);
cuboid([spacing,space_rod_size,space_rod_size]);
}

zrot(90)
down(5)
rod_mount();

xflip_copy()
right(spacing/2)
servo_mount();
