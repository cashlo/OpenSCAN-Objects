clear = 0.2;
edge = 5;
slotlist = 
[
    [14.4,71],      // MI battery
    [16,  71],      // QC3 battery
    [11.9,75],      // Fairphone
    [7,   67],      // iPhone 6
    [8,   76.7],    // Pixel 2 XL
    [6,   73.3],    // mama wallet
    [7.7, 62],      // mama card
    [16.6,68],      // my wallet
];


module slot_cutout(){ 
    for (i = [0:len(slotlist)]) {
        slot = slotlist[i];
        translate([sumto([for(s = slotlist)s.x],i-1)+i*5,0,0]) cube([slot.x, slot.y, 100]);
    }
}

sum_x = sumto([for(s = slotlist)s.x],len(slotlist)-1);
keywell_width = (sum_x+edge*(len(slotlist)-1))/2;


difference(){
    cube([sum_x+edge*(len(slotlist)+1),150,30]);
    translate([edge,edge,edge]) slot_cutout();
    translate([edge,max([for(s = slotlist)s.y])+edge*2,edge])      cube([(sum_x+edge*(len(slotlist)-1))/2,50,100]);
    translate([edge*2+(sum_x+edge*(len(slotlist)-1))/2,max([for(s = slotlist)s.y])+edge*2,edge]) cube([(sum_x+edge*(len(slotlist)-1))/2,50,100]);
    
}

function sumto(v, i) = (i < 0 ? 0 : sumto(v, i-1) + v[i]);
echo(sumto([for(s = slotlist)s.x],2));
