import controlP5.*;

ControlP5 cp5;
int state;
int symmetry;
float r;
float g;
float b;

void setup() {
  size(900, 800);
  frameRate(60);
  background(255);
  cp5 = new ControlP5(this);
  drawButtons();
  noStroke();
}

public void drawButtons(){
  String[] symmetries = {"*632","632","*442","442","4*2","3*3","*333","333","2*22","*2222","22*","22x","2222","*x","**","xx","o"};
  for(int i=0;i<symmetries.length;i++){
    cp5.addButton(symmetries[i]).setBroadcast(false).setValue(0).setPosition(350,145+i*30).setSize(200,30).setBroadcast(true);
  }
}

public void deleteButtons(){
  String[] symmetries = {"*632","632","*442","442","4*2","3*3","*333","333","2*22","*2222","22*","22x","2222","*x","**","xx","o"};
  for(int i=0;i<symmetries.length;i++){
    cp5.getController(symmetries[i]).remove();
  }
}

public float[] rotatePoint(float x, float y, int angle){
  float[] coords = new float[2];
  coords[0] = x*cos(angle)-y*sin(angle);
  coords[1] = x*sin(angle)+y*cos(angle);
  return coords;
}

public boolean inRegion(int x,int y,int sym){
  if(sym==3 || sym==16|| sym==15 || sym==9 || sym==13){
    if(x>=0 && x<=100 && y>=0 && y<=100){
      return true;
    }
    return false;
  }
  else if(sym==12 || sym == 14 || sym==10){
    if(x>=0 && x<=200 && y>=0 && y<=100){
      return true;
    }
    return false;
  }
  else if(sym==2){
    if(x-y>=0 && y<=100 && x<=100 && x>=0 && y>=0){
      return true;
    }
    return false;
  }
  else if(sym == 4){
    if(x+y<=100 && x>=0 && y>=0){
      return true;
    }
    return false;
  }
  else if(sym == 8){
    if(0.5*x+y<=100 && x>=0 && y>=0){
      return true;
    }
    return false;
  }

  return false;
}

public void drawBorder(int sym){
  if(sym==3 || sym==16 || sym==15 || sym==9 || sym==13){
    rect(0,0,100,100);
  }
  else if(sym==12 || sym == 14 || sym==10){
    rect(0,0,200,100);
  }
  else if(sym==2){
    triangle(0,0,100,0,100,100);
  }
  else if(sym == 4){
    triangle(0,0,100,0,0,100);
  }
  else if(sym == 8){
    triangle(0,0,200,0,0,100);
  }

}
 
public void draw(){
 if(state==1){
   drawButtons();
 }
 if(state==2){
  deleteButtons();
  background(255);
  cp5.addSlider("red",0,255,r,840,100,20,120);
  cp5.addSlider("green",0,255,g,840,340,20,120);
  cp5.addSlider("blue",0,255,b,840,580,20,120);
  state=3;
 }
 if(state==3){
   //draw border
   //then allow user to draw
   //add sliders to edit colour
   
   noFill();
   stroke(0);
   drawBorder(symmetry);
   noStroke();
   fill(r,g,b);
   rect(800,0,100,900);
   
   if(mousePressed && inRegion(mouseX,mouseY,symmetry)){
     fill(r,g,b);
     if(symmetry==3){
       for(int i=0;i<4;i++){
         for(int j=0;j<4;j++){
           ellipse(mouseX+200*i,mouseY+200*j,10,10);
           ellipse(200+200*i-mouseY,mouseX+200*j,10,10);   
           ellipse(200*i-mouseX+200,200*j-mouseY+200,10,10);
           ellipse(mouseY+200*i,200*j-mouseX+200,10,10);
         }
       }
     }
     else if(symmetry==12){
       for(int i=0;i<8;i++){
         for(int j=0;j<4;j++){
           ellipse(mouseX+200*j,mouseY+200*i,10,10);
           ellipse(200*j-mouseX+200,200*i-mouseY+200,10,10);
           //ellipse(mouseX+200*i,200*(j+1)-mouseY,10,10);
         }
       }
     }
     else if(symmetry==16){
       for(int i=0;i<8;i++){
         for(int j=0;j<8;j++){
           ellipse(mouseX+100*j,mouseY+100*i,10,10);
         }
       }
     }
     else if(symmetry == 14){
       for(int i=0;i<4;i++){
         for(int j=0;j<4;j++){
           ellipse(mouseX+200*i,mouseY+200*j,10,10);
           ellipse(mouseX+200*i,200*j+200-mouseY,10,10);
         }
       }
     }
     else if(symmetry == 15){
       for(int i=0;i<4;i++){
         for(int j=0;j<8;j++){
           ellipse(mouseX+100*j,mouseY+200*i,10,10);
           ellipse(-mouseX+100*j+100,200*i+mouseY+100,10,10);
         }
       }
     }
     else if(symmetry == 9){
       for(int i=0;i<4;i++){
         for(int j=0;j<4;j++){
           ellipse(mouseX+200*i,mouseY+200*j,10,10);
           ellipse(200-mouseX+200*i,mouseY+200*j,10,10);
           ellipse(mouseX+200*i,200-mouseY+200*j,10,10);
           ellipse(200*i-mouseX+200,200*j-mouseY+200,10,10);
         }
       }
     }
     else if(symmetry==10){
       for(int i=0;i<2;i++){
         for(int j=0;j<4;j++){
           ellipse(mouseX+400*i,mouseY+200*j,10,10);
           ellipse(mouseX+400*i,200-mouseY+200*j,10,10);
           ellipse(-mouseX+400*i+400,200*j-mouseY+100,10,10);
           ellipse(-mouseX+400*i+400,200*j+mouseY+100,10,10);
         }
       }
     }
     else if(symmetry==2){
       for(int i=0;i<4;i++){
         for(int j=0;j<4;j++){
           ellipse(mouseX+200*i,mouseY+200*j,10,10);
           ellipse(mouseY+200*i,mouseX+200*j,10,10);
           ellipse(200-mouseX+200*i,mouseY+200*j,10,10);
           ellipse(100-mouseY+100+200*i,100-mouseX+100+200*j,10,10);
           ellipse(200+200*i-mouseY,mouseX+200*j,10,10);
           ellipse(200*i-mouseX+200,200*j-mouseY+200,10,10);
           ellipse(mouseY+200*i,200*j-mouseX+200,10,10);
           ellipse(mouseX+200*i,200*j-mouseY+200,10,10);
         }
       }
     }
     else if(symmetry == 4){
       for(int i=0;i<4;i++){
         for(int j=0;j<4;j++){
           ellipse(mouseX+200*i,mouseY+200*j,10,10);
           ellipse(200+200*i-mouseY,mouseX+200*j,10,10);   
           ellipse(200*i-mouseX+200,200*j-mouseY+200,10,10);
           ellipse(mouseY+200*i,200*j-mouseX+200,10,10);
           ellipse(mouseX+200*i+100,100-mouseY+200*j,10,10);
           ellipse(100+200*i-mouseY,100-mouseX+200*j,10,10);
           ellipse(200*i-mouseX+100,200*j+mouseY+100,10,10);
           ellipse(mouseY+200*i+100,200*j+mouseX+100,10,10);
         }
       }
     }
     else if(symmetry==8){
       for(int i=0;i<2;i++){
         for(int j=0;j<4;j++){
           ellipse(mouseX+400*i,mouseY+200*j,10,10);
           ellipse(mouseX+400*i+200,mouseY+200*j+100,10,10);
         }
       }
     }
     else if(symmetry==13){
       for(int i=0;i<4;i++){
         for(int j=0;j<4;j++){
           ellipse(mouseX+200*i,mouseY+200*j,10,10);
           ellipse(mouseX+200*i+100,mouseY+200*j+100,10,10);
           ellipse(200-mouseX+200*i,mouseY+200*j,10,10);
           ellipse(100-mouseX+200*i,mouseY+200*j+100,10,10);
         }
       } 
     }
   }
 }
}
 
public void controlEvent(ControlEvent theEvent) { //get which one, delete all buttons and render the small frame for user drawing.
  String[] symmetries = {"*632","632","*442","442","4*2","3*3","*333","333","2*22","*2222","22*","22x","2222","*x","**","xx","o"};
  if(theEvent.isController()){
    String name = theEvent.getController().getName();
    for(int i=0;i<symmetries.length;i++){
      if(name.equals(symmetries[i])){
        state = 2;
        symmetry = i;
        println(symmetry);
      }
    }
    if(name.equals("red")){
      r = theEvent.getController().getValue();
    }
    else if(name.equals("green")){
      g = theEvent.getController().getValue();
    }
    else if(name.equals("blue")){
      b = theEvent.getController().getValue();
    }
  }
}
