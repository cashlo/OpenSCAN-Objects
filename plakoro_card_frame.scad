include <BOSL2/std.scad>

card_y = 30;
card_x = 60;
card_r = 2.5;

//card();

intersection(){
    down(1)
    back(card_y/2-6.5)
    right(card_x/2-6.5)
    rotate([0,0,47.5])
    cuboid([0.8,card_y+3.2,0.7], anchor=BOT);
    
    cuboid([card_x+3.2,card_y+3.2,2], rounding=card_r+3.2/2, edges="Z");
}

difference(){
    cuboid([card_x+3.2,card_y+3.2,2], rounding=card_r+3.2/2, edges="Z");
    cuboid([card_x-0.8,card_y-0.8,4], rounding=card_r, edges="Z");
    hull(){
        cuboid([card_x+0.4,card_y+0.4,0.5], rounding=card_r, edges="Z");
        up(0.5)
        cuboid([card_x-0.8,card_y-0.8,0.5], rounding=card_r, edges="Z");
    }
    right(4)
    cuboid([card_x+0.2,card_y-0.4,0.5], rounding=card_r+3.2/2, edges="Z");
    
    right(4)
    cuboid([card_x,card_y-0.8,2], rounding=card_r+3.2/2, edges="Z", anchor=BOT);
    
}

module card(){

    cuboid([card_x,card_y,0.3], rounding=card_r, edges="Z");

}
