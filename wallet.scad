card_size = [85.5,54];
card_thick = 0.8*4;
offset = 0.2;
wallet_boarder = 2;
wallet_thick = 1.2;
clip_width = 50;
clip_lenght = 40;

clip_r = 7;
clip_angle = 20;

push_hole_size = 20;

$fn = 100;


difference(){
#linear_extrude(wallet_thick*2 + card_thick + offset*2)
offset(wallet_boarder)
square(card_size);

translate([0,0,wallet_thick])    
linear_extrude(card_thick + offset*2)
scale([2,1,1])
offset(offset)
square(card_size);

linear_extrude(wallet_thick*2 + card_thick + offset*2 + 2)
hull(){
translate([card_size[0]/3,card_size[1]/2,0])
circle(push_hole_size);

translate([card_size[0]*2/3,card_size[1]/2,0])
circle(push_hole_size);
}  
}

translate([0,-wallet_boarder,clip_r])
difference(){
    translate([(card_size[0]-clip_width)/2,0,0])
    rotate([0,90,0])
    cylinder(h=clip_width, r=clip_r);
    
    translate([(card_size[0]-clip_width)/2,0,0])
    rotate([0,90,0])
    cylinder(h=clip_width, r=clip_r-wallet_thick);
    
    #
    rotate([-clip_angle,0,0])
    cube([card_size[0], card_size[1], clip_r*2]);
    
    rotate([-90,0,0])
    cube([card_size[0], card_size[1], clip_r*2]);
}

translate([0,-wallet_boarder,clip_r])
translate([(card_size[0]-clip_width)/2,0,0])
rotate([-clip_angle,0,0])
translate([0,-0.1,clip_r-wallet_thick])
cube([clip_width, clip_lenght,wallet_thick]);