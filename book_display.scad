thickness = 0.8;
book_thick = 30;
book_edge = 30;

linear_extrude(150){
square([100, thickness]);
square([thickness, book_edge]);

translate([-book_thick,book_edge,0])
square([book_thick+thickness, thickness]);

translate([-book_thick,book_edge/2,0])
square([thickness, book_edge/2+thickness]);
}
