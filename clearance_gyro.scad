height = 5;
radis = 50;
delta = 4;
clearance = 0.2;
layers = 6;
step = 0.02;
$fn=20;

ring(radis,delta, height, clearance, true, false);
for(i = [1:layers-2]){
    rotate([0,0,90*i]) ring(radis-delta*i,delta, height, clearance-step*i, true, true);
}
rotate([0,0,90*(layers-1)])
ring(radis-delta*(layers-1),delta, height, clearance--step*(layers-1), false, true);

module ring(r, d, h, clearance, ip, op) {
    plug_d = d*0.6;
    intersection(){
        union(){
            difference(){
                sphere(r+d);
                sphere(r+clearance);
                
                if(op){
                    #rotate([0,0,90])
                    translate([r+d-plug_d,0,0])
                    plug(h, plug_d, h*0.7+d/3, h*0.7);
                    
                    rotate([0,0,-90])
                    translate([r+d-plug_d,0,0])
                    plug(h, plug_d, h*0.7+d/3, h*0.7);
                }
                
                rotate([0,0,45])
                translate([0,-r-d/2,0])
                rotate([90,0,0])
                linear_extrude(d)
                text(str(clearance), halign="center", valign="center", size=h*0.8);}
                
                if(ip){
                    translate([r-plug_d+clearance,0,0])
                    plug(h, plug_d, h*0.7+d/3-clearance, h*0.7-clearance);
                    
                    rotate([0,0,180])
                    translate([r-plug_d+clearance,0,0])
                    plug(h, plug_d, h*0.7+d/3-clearance, h*0.7-clearance);
                }
                
                
        }
        cube([(r+d)*2,(r+d)*2, h], true);
    }
}


module plug(h, d, r1, r2) {
    r_max = max(r1,r2);
    intersection(){
        union(){
            rotate([0,90,0]) cylinder(d, r1, r2);
            translate([d/4,0,0])sphere(d/2);
            
        }
        cube([r_max*2,r_max*2, h], true);
    }
 }