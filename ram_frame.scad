ram_width = 134;
ram_height = 31;
ram_thick = 4;

frame_size = 5;

number_of_ram = 2;


difference(){
cube([ram_width+frame_size*2,ram_height*number_of_ram+frame_size*(number_of_ram+1),5]);
    
for(i=[0:number_of_ram]){
    translate([frame_size,(ram_height+frame_size)*i+frame_size,0])
    cube([ram_width,ram_height,ram_thick]);    
    
}
}