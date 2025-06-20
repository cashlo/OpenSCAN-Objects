vase_size = 72;
cover_size = 93;

base_z = 10;
stand_z = 120;

// Heptagram (7-Pointed Star) Generator

// --- Parameters ---
// Radius from the center to the outer points of the star
radius = 67; 

// The number of points on the star
points = 7; 

// How many vertices to skip when connecting the lines.
// 2 creates the standard, acute heptagram {7/2}.
// 3 creates the obtuse heptagram {7/3}.
skip = 2;

// The thickness of the 2D shape when extruded into 3D
height = 80;
outer_radius = radius; 

// --- Calculations ---
// The number of points
n = 7; 
// The angle of a single slice of the circle
slice_angle = 360 / n; // ~51.43°

// Calculate the radius of the inner vertices of the star.
// This uses trigonometry based on the star's geometry.
inner_radius = outer_radius * cos(slice_angle) / cos(slice_angle / 2);

twist = 57;
scale = 0.5;

module amdusias_seal(size, height) {
linear_extrude(height)
scale([size/57,size/57,1])
import(file = "67-Amdusias_seal.svg", center=true);
}


difference(){
translate([0,0,stand_z-10])
    cylinder(10, cover_size/2, cover_size/2);
    cylinder(stand_z+10, vase_size/2, vase_size/2);
    

    seal_size = vase_size/2+0.5;
    translate([0,0,stand_z-1])
    amdusias_seal(vase_size/2+0.5, 2);
    
    translate([0,0,stand_z-4])
    cylinder(5, vase_size/2+1, vase_size/2+1);
    
    
}

difference(){
heptagram_leg();
cylinder(stand_z+10, vase_size/2, vase_size/2);

}

difference(){
cylinder(base_z, vase_size/2, vase_size/2);
    translate([0,0,base_z-1])
    amdusias_seal(vase_size/2, 2);
}

// --- Module Logic ---
// This module calculates the points and draws the polygon
module heptagram(r, n, k, h, twist=0, scale=1) {
    // Generate the list of vertex coordinates for a regular polygon
// We will combine two parts: the 7 outer points (triangles)
// and the central heptagon that connects them.

linear_extrude(height = h, twist= twist, scale=scale)
union() {
    
    // 1. Create the 7 outer triangles
    for (i = [0 : n-1]) {
        rotate([0, 0, i * slice_angle]) 
        polygon(points=[
            [outer_radius, 0], // The outer tip of the star
            [inner_radius * cos(slice_angle/2), inner_radius * sin(slice_angle/2)], // Inner vertex
            [inner_radius * cos(-slice_angle/2), inner_radius * sin(-slice_angle/2)] // Other inner vertex
        ]);
    }
    
        // 2. Create the central heptagon to fill the middle
    polygon(points=[
        for (i = [0:n-1]) [
            inner_radius * cos(i * slice_angle + slice_angle/2),
            inner_radius * sin(i * slice_angle + slice_angle/2)
        ]
    ]);
    
}
}

// --- Render the Heptagram ---
module heptagram_leg(){
heptagram(radius, points, skip, height, twist=twist, scale=scale);

translate([0,0,stand_z-10])
rotate([0,180,0])
heptagram(radius, points, skip, height, twist=twist, scale=scale);
}