

float angle;

void setup() {
  size(800, 800);
  surface.setLocation(957, 0);
  noStroke();
  fill(0, 153, 102, 128);
}

void draw() {
  background(20);
  
  float x = width;
  float dia = map(mouseX, 0, width, 1, 80);
  int num = 80;
  
  translate(width/2, height/2);
  for (float a=0; a<360; a+=22.5){
    rotate(radians(a));
    
    pushMatrix();
    for (int i=0; i<num; i++){
      scale(0.95);
      rotate(radians(angle));
      ellipse(x, 0, dia, dia);
    }
    popMatrix();
    
    pushMatrix();
    for (int i=0; i<num; i++){
      scale(0.95);
      rotate(-radians(angle));
      ellipse(x, 0, dia, dia);
    }
    popMatrix();
    
    pushMatrix();
    for (int i=0; i<num; i++){
      scale(0.50);
      rotate(radians(angle));
      ellipse(x, 0, dia, dia);
    }
    popMatrix();
    
        pushMatrix();
    for (int i=0; i<num; i++){
      scale(0.50);
      rotate(-radians(angle));
      ellipse(x, 0, dia, dia);
    }
    popMatrix();
  }
  angle+=0.01;
}
