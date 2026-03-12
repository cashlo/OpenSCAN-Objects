include <BOSL2/std.scad>

hook_z = 1;
hook_x = 30;
hook_y = 10;
padding = 5;
padding_z = 0.8;

pick_z = hook_z - 0.4;
pick_x = hook_x - 0.6;
pick_y = hook_y + 1;

pick();
%for(i=[0:4])
left((hook_x+20)*i)
hook(with_test_cube=true, connection_z=0.2*(i+1));


module pick(){

    fwd(pick_y*2)
    cuboid([pick_x, pick_y, 10], anchor=BACK+BOT);


    hull(){
    fwd(pick_y*2-1)
    cuboid([pick_x, 1, pick_z], anchor=BACK+BOT);

    fwd(hook_y/2)
    cuboid([pick_x*0.8, 1, pick_z], anchor=BACK+BOT);
    }

    hull(){
    fwd(hook_y/2)
    cuboid([pick_x*0.8, 1, pick_z], anchor=BACK+BOT);
    
    fwd(hook_y*1.5-1-0.5)
    cuboid([pick_x*0.8, 1, hook_z+padding_z], anchor=BACK+BOT);
    
    }
}


module hook(with_test_cube=false, connection_z = 0.2){
    if(with_test_cube){
    difference(){
    cuboid([hook_x+padding*2, 30, 5], anchor=FRONT+BOT);
    
    left(17)
    linear_extrude(10)
    back(10)
    text(str("c_z:", connection_z), size = 8);
    }
    }


    difference(){
    hull(){
    cuboid([hook_x+padding*2, hook_y, connection_z], anchor=BACK+BOT);

    fwd(hook_y)
    cuboid([hook_x+padding*2, hook_y, hook_z+padding_z], anchor=BACK+BOT);
    }

    hull(){
    fwd(hook_y*2-1)
    cuboid([hook_x, 1, hook_z], anchor=BACK+BOT);

    fwd(hook_y/2)
    cuboid([hook_x*0.8, hook_y, hook_z], anchor=BACK+BOT);
    }

    fwd(hook_y/2)
    cuboid([hook_x*0.8, hook_y, hook_z+padding_z+1], anchor=BACK+BOT);
    }
}
