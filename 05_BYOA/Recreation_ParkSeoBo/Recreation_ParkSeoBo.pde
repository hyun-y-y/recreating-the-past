void setup() {
  size(800, 800);
  noLoop();
}

void draw() {
    background(mouseX, mouseY, 116);
    
    for (int x = 0; x < width; x = x + 7) {
      strokeWeight(4);
      stroke(104, 105, 111);
      line(x, 0, x, height);
    }
      
    for (int x = 0; x < width; x = x + 7) {
      strokeWeight(3);
      stroke(187, 201, 210);
      line(x, 0, x, height);
    }  
    for (int y = 160; y < height; y = y + 160){
      strokeWeight(2);
      stroke(217, 226, 232, 70);
      line(0, y, width, y);
    }
        
    if (keyPressed) {
      if (key == 's') {
        noStroke();
        fill(187, 201, 210);
        rect(350, 200, mouseX, mouseY);
      }
    }
    
      if (keyPressed) {
        if (key == 'd') {
          noStroke();
          fill(187, 201, 210);
          rect(100, 100, mouseX, mouseY);
        }
      }
    
}

void mouseMoved(){
  redraw();
}
