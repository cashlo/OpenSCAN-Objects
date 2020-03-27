width=130;
height=40;
thick=2;
sensor_d=38;
sensor_ring=2;

difference(){
    union(){
        cube([width,thick,height]);
        translate([width/2,thick,sensor_d/2+sensor_ring])
        rotate([90,0,0])
        cylinder(h=thick*2, d=sensor_d+sensor_ring*2, center=true);        
    }
    #translate([width/2,thick,sensor_d/2+sensor_ring55555555555])
    rotate([90,0,0])
    cylinder(h=thick*2, d=sensor_d, center=true);
}