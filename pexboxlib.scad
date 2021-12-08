
rsize=37;
psize=23;

module tbody(){
   cylinder(r=rsize+35/2,h=10,$fn=100); 
   translate([0,0,10]) cylinder(r=rsize+5,h=15,$fn=100);   
}

module h5mmthru(cneeded)
{
    translate([0,0,-26]) cylinder(r=5.4/2,h=30,$fn=100);
    if (cneeded==1){ 
        translate([0,0,1]) cylinder(r=9.1/2,h=2.1,$fn=100);
        }
}

module h5mmthread()
{
    translate([0,0,-28.9]) cylinder(r=5/2,h=30,$fn=100); 
    translate([0,0,1]) cylinder(r=9.1/2,h=2.1,$fn=100);
    
}

module tmount_screwholes()
{
 translate([0,rsize+10,0]) h5mmthread();
 rotate([0,0,90]) translate([0,rsize+10,0])  h5mmthread();
 rotate([0,0,180]) translate([0,rsize+10,0]) h5mmthread();
 rotate([0,0,270]) translate([0,rsize+10,0]) h5mmthread();
}

module tmount_holes(cneeded)
{
 translate([0,rsize+10,0]) h5mmthru(cneeded);
 rotate([0,0,90]) translate([0,rsize+10,0])  h5mmthru(cneeded); 
 rotate([0,0,180]) translate([0,rsize+10,0])  h5mmthru(cneeded); 
 rotate([0,0,270]) translate([0,rsize+10,0])  h5mmthru(cneeded);
}

module tholes()
{
 tmount_holes(1);
    
 rotate([0,0,45]) translate([0,rsize+2,10]) rotate([-90,0,0]) h5mmthread(); 
 rotate([0,0,45+90]) translate([0,rsize+2,10]) rotate([-90,0,0]) h5mmthread();  
 rotate([0,0,45+180]) translate([0,rsize+2,10]) rotate([-90,0,0]) h5mmthread();
 rotate([0,0,45+270]) translate([0,rsize+2,10]) rotate([-90,0,0]) h5mmthread();      
    
    
    
}

module tmount(){
  difference(){
    tbody();
    translate([0,0,-1]) cylinder(r=rsize,h=30,$fn=100);
    translate([0,0,7]) tholes();
    }
}


module iomount()
{
    translate([0,-1,0]) rotate([90,0,0]) tmount_holes(0);
    translate([0,.5,0])  rotate([90,0,0]) cylinder(r=rsize,h=1,$fn=100);
    translate([0,25,0])  rotate([90,0,0]) cylinder(r=psize/2,h=30,$fn=100);
}

module pscrews()
{
    difference(){ 
       cylinder(r=10.4/2,h=8,$fn=100);
       cylinder(r=5.4/2,h=9,$fn=100); 
    }
    
}

module pboxbody()
{
     difference(){
        cube([320,320,150]);
        translate([8,8,8]) cube([320-16,320-16,320-16]);
        } 
     for (mx = [30:30:270]){
       for (my = [30:60:270]){  
            translate([mx+2,my,7.7]) pscrews();
            //if (mx < 280){
             translate([mx+15+2,my+30,7.7]) pscrews();     
            // }   
            }
        }
}

module pbox()
{
    difference(){
        pboxbody();
        translate([90,0,70]) iomount();
        translate([220,0,70]) iomount();
        rotate([0,0,90]) translate([90,0,70])  rotate([180,0,0]) iomount();
        rotate([0,0,90]) translate([220,0,70]) rotate([180,0,0])  iomount();
        rotate([0,0,90]) translate([90,-320,70])  iomount();
        rotate([0,0,90]) translate([220,-320,70]) iomount();
        translate([90,320,70])  rotate([180,0,0]) iomount();
        translate([220,320,70]) rotate([180,0,0]) iomount();
        translate([5,5,150-20]) cylinder(r=5.4/2,h=21,$fn=100);
        translate([320-5,5,150-20]) cylinder(r=5.4/2,h=21,$fn=100);
        translate([5,320-5,150-20]) cylinder(r=5.4/2,h=21,$fn=100);
        translate([320-5,320-5,150-20]) cylinder(r=5.4/2,h=21,$fn=100);
        translate([5,5,-1]) cylinder(r=5.4/2,h=21,$fn=100);
        translate([320-5,5,-1]) cylinder(r=5.4/2,h=21,$fn=100);
        translate([5,320-5,-1]) cylinder(r=5.4/2,h=21,$fn=100);
        translate([320-5,320-5,-1]) cylinder(r=5.4/2,h=21,$fn=100);
        
        translate([160,5,-1]) cylinder(r=5.4/2,h=21,$fn=100);
        translate([320-5,160,-1]) cylinder(r=5.4/2,h=21,$fn=100);
        translate([160,320-5,-1]) cylinder(r=5.4/2,h=21,$fn=100);
        translate([5,160,-1]) cylinder(r=5.4/2,h=21,$fn=100);
    } 
      
    
}


//pbox();