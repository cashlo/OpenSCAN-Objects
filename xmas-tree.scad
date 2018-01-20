height = 200;
width = 0.55;
min_width = 0.8;
tree_r = 0.6;
branch_w = 7;
branch_r = 0.065;
seed = 4;
clearance = 0.25;

print_top = false;
print_mid = false;
print_bottom = true;


if (print_top) difference() {
    linear_extrude(branch_w/3) {
        tree(height, branch_w, branch_r, seed);
        translate([0, -height*width/2]) square([branch_w, height*width]);
    }
    #translate ([height/3+clearance/2,0,branch_w/6])
    rotate([120,0,0])
    cube([height*2/3+clearance, branch_w, branch_w/3+clearance], true);
    
    translate ([height/6+clearance/2,0,branch_w/6])
    rotate([240,0,0])
    cube([height*1/3+clearance, branch_w, branch_w/3+clearance], true);
}

 if (print_mid)translate ([height,height*width*1.2,0]) rotate([0,0,180]) difference() {
    linear_extrude(branch_w/3) {
        tree(height, branch_w, branch_r, seed+1);
        translate([0, -height*width/2]) square([branch_w, height*width]);
    } 
    
    #translate ([height/6+clearance/2,0,branch_w/6])
    rotate([120,0,0])
    cube([height*1/3+clearance, branch_w, branch_w/3+clearance], true);
    
    #translate ([height*5/6+clearance/2,0,branch_w/6])
    rotate([-120,0,0])
    cube([height*1/3+clearance, branch_w, branch_w/3+clearance], true);
}
if (print_bottom) translate ([0,height*width*2.4,0]) difference() {
    linear_extrude(branch_w/3) {
        tree(height, branch_w, branch_r, seed+2);
        translate([0, -height*width/2]) square([branch_w, height*width]);
    }
    
    #translate ([height*2/3+clearance/2,0,branch_w/6])
    rotate([120,0,0])
    cube([height*2/3+clearance, branch_w, branch_w/3+clearance], true);
    
    translate ([height*2/3+clearance/2,0,branch_w/6])
    rotate([240,0,0])
    cube([height*2/3+clearance, branch_w, branch_w/3+clearance], true);
}



module tree(height, branch_w, branch_r, seed) {
    if (height > branch_w && branch_w > min_width) {
        branch_d = branch_r*height;
        translate([0,-branch_w/2,0]) square([height, branch_w]);
        for (r = [80, -80]){
            branch_offset = rands(-branch_d+branch_w,branch_d*2-branch_w,height/branch_d,seed+r);
            for (i = [2: 1: height/branch_d]) {
                ratio = width*(1-i*branch_d/height)*rands(tree_r,1,1,seed+i+r)[0];
                if(i*branch_d+branch_offset[i] < height)
                translate([i*branch_d+branch_offset[i],0,0])
                rotate([0,0,r])
                tree(height*ratio,branch_w*tree_r, branch_r*2, seed+i+r);
            }
        }    
    }

}

module tree_base() {
    translate([0,-branch_w/2,0]) square([height, branch_w]);
    translate([0,-height/4,0]) square([branch_w, height/2]);
}