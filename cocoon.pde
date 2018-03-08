int ITER = 700000;
int flou = 50;
int j = 2;
float rd;
float x, y;
int c = 200;
int d = 300;
int b = 300;
int der = c/2;

void setup() {
  size(1920,1080);
  pixelDensity(2);
  noFill();
  strokeWeight(.2);
  stroke(200,18);
}

void draw() {
  noLoop();
  background(10);
  translate(width/2,height/2);
  for(int a = 0; a < ITER/j; a++) {
    rd = random(width)-width/2;
    beginShape();
    for(int i = 0; i < j; i++) {
      rd = rd + random(-der,der);
      x = rd+random(-flou/2,flou/2);
      if(random(2) > 1){
        y = f(x);
      } else {
        y = g(x);
      }
      vertex(x,y);
    }
    endShape(TRIANGLES);
  }
  d+=10;
  saveFrame("screenshots/net" + round(random(9999)) + ".png");
}




float f(float x) {
  return cos(x/d)*random(b)+random(-flou/2,flou/2)+sin(rd/200)*100;
}

float g(float x) {
  return -cos(x/c)*random(b)+random(-flou/2,flou/2)+cos(x/300)*50-60;
}