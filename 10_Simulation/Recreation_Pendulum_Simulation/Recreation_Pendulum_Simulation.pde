float r1 = 150;
float r2 = 150;
float r3 = 150;

float m1 = 15;
float m2 = 15; 
float m3 = 15;

float a1 = PI/2;
float a2 = PI/2;
float a3 = PI/2;

float a1_v = 0;
float a2_v = 0;
float a3_v = 0;

float g = 1;
float px = -1;
float py = -1;
float px2 = -1;
float py2 = -1;
float px3 = -1;
float py3 = -1;
float cx, cy;

PGraphics canvas;

void setup(){
  size(1000,700);
  cx = width/2;
  cy = 200;
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(38, 38, 33);
  canvas.endDraw();
}


void draw(){
  background(38, 38, 33);
  imageMode(CORNER);
  image(canvas, 0, 0, width, height);
  
  float num1 = -g * (2 * m1 + m2) * sin(a1);
  float num2 = -m2 * g * sin(a1-2*a2);
  float num3 = -2*sin(a1-a2)*m2;
  float num4 = a2_v*a2_v*r2+a1_v*a1_v*r1*cos(a1-a2);
  float den = r1 * (2*m1+m2-m2*cos(2*a1-2*a2));
  float a1_a = (num1 + num2 + num3*num4) / den;
  
  num1 = 2 * sin(a1-a2);
  num2 = (a1_v*a1_v*r1*(m1+m2));
  num3 = g * (m1 + m2) * cos(a1);
  num4 = a2_v*a2_v*r2*m2*cos(a1-a2);
  den = r2 * (2*m1+m2-m2*cos(2*a1-2*a2));
  float a2_a = (num1*(num2+num3+num4)) / den;
  
  num1 = 2 * sin(a3-a2);
  num2 = (a2_v*a2_v*r2*(m2+m3));
  num3 = g * (m2 + m3) * cos(a2);
  num4 = a3_v*a3_v*r3*m3*cos(a2-a3);
  den = r3 * (2*m2+m3-m3*cos(2*a2-2*a3));
  float a3_a = (num1*(num2+num3+num4)) / den;
  
  translate(cx, cy);
  stroke(213, 242, 226);
  strokeWeight(4);
  
  float x1 = r1 * sin(a1);
  float y1 = r1 * cos(a1);
  
  float x2 = x1 + r2 * sin(a2);
  float y2 = y1 + r2 * cos(a2);
  
  float x3 = x2 + r3 * sin(a3);
  float y3 = y2 + r3 * cos(a3);
  
  line(0, 0, x1, y1);
  fill(213, 242, 226);
  ellipse(0, 0, m1, m1);
  
  line(0, 0, x1, y1);
  fill(213, 242, 226);
  ellipse(x1, y1, m1, m1);

  line(x1, y1, x2, y2);
  fill(213, 242, 226);
  ellipse(x2, y2, m2, m2);
  
  line(x2, y2, x3, y3);
  fill(213, 242, 226);
  ellipse(x3, y3, m3, m3);
  
  a1_v += a1_a;
  a2_v += a2_a;
  a3_v += a3_a;
  a1 += a1_v;
  a2 += a2_v;
  a3 += a3_v;
  
  canvas.beginDraw();
  canvas.translate(cx, cy);

  if(frameCount > 1){
    canvas.strokeWeight(1);
    canvas.stroke(255);
    canvas.line(px, py, x1, y1);
    
    canvas.strokeWeight(2);
    canvas.stroke(255);
    canvas.line(px2, py2, x2, y2);
    
    canvas.strokeWeight(0.5);
    canvas.stroke(255);
    canvas.line(px3, py3, x3, y3);
    
    //canvas.strokeWeight(4);
    //canvas.point(x2, y2);
  }
  canvas.endDraw();
  
  px = x1;
  py = y1;
  px2 = x2;
  py2 = y2;
  px3 = x3;
  py3 = y3;
  
  
}
