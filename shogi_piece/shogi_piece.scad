//A = 25.3;
//B = 29.3;
//C = 8.6;

//a1 = 83.5;
//a2 = 115.5;
//a3 = 85;

module shogi_piece(A, B, C,a1 ,a2 ,a3) {
    difference(){
        linear_extrude(C)
        shogi_shape(A, B, a1, a2);
        
       translate([0,0,C]) rotate([a3-90,0,0]) cube([A,B*2,C]);
       translate([0,0,-C]) rotate([90-a3,0,0]) cube([A,B*2,C]); 
        
    }
}

module shogi_shape(A, B, a1, a2) {

        difference(){
        square([A,B]);
          rotate([0,0,-90+a1]) translate([-A,0,0]) square([A,B]);
          translate([A,0,0]) rotate([0,0,90-a1]) square([A,B]);
          translate([A/2,B,0]) rotate([0,0,180-a1-a2]) square([A,B]);
          translate([A/2,B,0]) rotate([0,0,a1+a2-90]) square([A,B]);
        }
}

word_levels = 10;
word_scale = 0.3;
word_offset = 0.15;
word_file = "minasejs2_cleanup.dxf";

size1 = [25.3, 29.3, 8.6, 83.5, 115.5, 85];

king1 = [[-79,-225,0], 0, 0.3];
king2 = [[-109.5,-224,0], 0, 0.3];
rook = [[-21,-240.5,0], 1, 0.32];
dragon = [[-52.5,-239.5,0], 0, 0.32];
bishop = [[-152,-239,0], 0, 0.32];
horse = [[-17.5,-198.5,0], 0, 0.32];
gold = [[-79.2,-186,0], 0.4, 0.30];
silver = [[-114,-186.5,0], 0.4, 0.30];
promotedsilver = [[-20.2,-148,0], 0, 0.30];
knight = [[-106,-147.5,0], 0, 0.30];
promotedknight = [[-131,-148,0], 0, 0.30];
lance = [[-41.7,-112.7,0], 0, 0.30];
promotedlance = [[-94,-113,0], 0, 0.30];
pawn = [[-42.2,-79,0], 0, 0.30];
tokin = [[-93,-46,0], 0, 0.30];

module word(word_pos, word_scale, A, B, a1, a2) {
    for (i = [0:1/word_levels:1]){
    translate([0,0,-i-1/word_levels])
    linear_extrude(height = 1/word_levels, center = false, convexity = 10)
    offset(-i)
    intersection() {
        translate(word_pos)  scale([word_scale,word_scale,1]) import(word_file);
        translate([A*word_offset/2,B*word_offset/2,0]) scale([1-word_offset,1-word_offset,1])       shogi_shape(A, B, a1, a2);
    }
}
}

module shogi_piece_with_words(A,B,C,a1,a2,a3,face_word, back_word) {
    difference(){
        shogi_piece(A, B, C, a1, a2, a3);
        # translate([0,0,C]) rotate([a3-90+0.01,0,face_word[1]])  word(face_word[0], face_word[2], A, B, a1, a2);
        #if (back_word) translate([A,0,0]) rotate([a3-90+0.01,180,back_word[1]]) word(back_word[0], back_word[2], A, B, a1, a2);
    }  
}

shogi_piece_with_words(A=19.5, B = 24.5,C = 7.0,a1 = 81.5,a2 = 115.5,a3 = 85,face_word = pawn, back_word = tokin);

// shogi_piece_with_words(A=19.9, B = 25.4,C = 7.0,a1 = 83.5,a2 = 115.5,a3 = 85,face_word = pawn, back_word = tokin);

//shogi_piece_with_words(A=21.7, B = 26.3,C = 7.3,a1 = 83.5,a2 = 115.5,a3 = 85,face_word = knight, back_word = promotedknight);

// translate([2*21.7, 0, 0]) shogi_piece_with_words(A=25.3, B = 29.3,C = 8.6,a1 = 83.5,a2 = 115.5,a3 = 85,face_word = bishop, back_word = horse);



// #surface(file = "minasejs-king1.png", center = true, convexity = 5);
// linear_extrude(height = 10, center = true, convexity = 10, scale=0.3)
