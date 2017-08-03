int w = 600;
int border = 50;
float h = sqrt(w*w - (w/2)*(w/2));
int depth = 1;

void settings()
{  
  size(w, (int)h);
}

void setup() {
  smooth();
  noLoop();
}

void draw()
{  
  background(255);
  fill(0);
  text("Depth:"+depth, 10, 30); 
  drawTriSierpinsky(0, depth, new PVector(border, h-border), new PVector(width/2, border), new PVector(width-border, h-border));
}

void drawTriSierpinsky(int level, int maxLevels, PVector l, PVector t, PVector r)
{

  level++;

  if (level > maxLevels) {
    return;
  }
  fill(random(0, 255), random(0, 255), random(0, 255));
  triangle(l.x, l.y, t.x, t.y, r.x, r.y);

  PVector a = PVector.add(l, PVector.div(PVector.sub(t, l), 2));
  PVector b = PVector.add(r, PVector.div(PVector.sub(t, r), 2));
  PVector c = PVector.add(l, PVector.div(PVector.sub(r, l), 2));

  drawTriSierpinsky(level, maxLevels, a, t, b);
  drawTriSierpinsky(level, maxLevels, l, a, c);
  drawTriSierpinsky(level, maxLevels, c, b, r);
}

void mouseClicked() {
   depth++; 
   redraw();
}