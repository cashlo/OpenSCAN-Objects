size = 10;
$fn=200;

intersection() {
        sphere(size);
        translate([size, 0, 0]) sphere(size);
        translate([size/2, sqrt(3)*size/2, 0]) sphere(size);
        translate([size/2, size/2/sqrt(3), sqrt(2/3)*size]) sphere(size);
}