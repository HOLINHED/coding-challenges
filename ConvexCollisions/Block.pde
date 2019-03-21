class Shape {

  PVector[] points;
  int vx;
  int vy;
  int size;
  int angle;

  Shape(PVector[] points, int size, int angle) {
   this.points = points; 
   this.size = size;
   this.angle = angle;
  }
  
  void draw() {
    
    noFill();
    stroke(0);
    
    
    final float midX = points[0].x + (size/2);
    final float midY = points[0].y + (size/2);
    beginShape();
    for (PVector vector : points) {
      vertex(vector.x, vector.y);
      line(midX,midY,vector.x,vector.y);
      vector.x += vx;
      vector.y += vy;
    }
    endShape();
    
  }
  
  void setV(int vx, int vy) {
    this.vx = vx;
    this.vy = vy;
  }
  
  boolean isColliding(Shape other) {
  
    float px = points[0].x;
    float py = points[0].y;
    
    for (int i = 1; i < points.length; i++) {
    
      float x = points[i].x;
      float y = points[i].y;
      
      stroke(255,0,0);
      line(x,y,px,py);
      
      final float midx = other.points[0].x + other.size/2;
      final float midy = other.points[0].y + other.size/2;
      
      for (int j = 1; j< other.points.length; j++) {
        stroke(0,255,0);
        line(midx, midy, other.points[j].x, other.points[j].y);
        
        if (linesColliding(x,y,px,py,midx,midy,other.points[j].x, other.points[j].y)) {
          
          PVector coords = lineIntersection(x, y, px, py, midx, midy, other.points[j].x, other.points[j].y);
          ellipse(coords.x,coords.y, 10,10);
          
          return true;
        }
      }
      
      px = x;
      py = y;
    
    }
    
    return false;
  }
  
}

static PVector[] createRect(int x, int y, int size) {
    
  PVector[] points = new PVector[5]; 
    
  points[0] = new PVector(x,y);
  points[1] = new PVector(x + size, y);
  points[2] = new PVector(x + size, y + size);
  points[3] = new PVector(x, y + size);
  points[4] = new PVector(x,y);
    
  return points;
}

static boolean linesColliding(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
  float denominator = ((x2 - x1) * (y4 - y3)) - ((y2 - y1) * (x4 - x3));
  float numerator1 = ((y1 - y3) * (x4 - x3)) - ((x1 - x3) * (y4 - y3));
  float numerator2 = ((y1 - y3) * (x2 - x1)) - ((x1 - x3) * (y2 - y1));

  if (denominator == 0) return numerator1 == 0 && numerator2 == 0;

  float r = numerator1 / denominator;
  float s = numerator2 / denominator;

  return (r >= 0 && r <= 1) && (s >= 0 && s <= 1);
}

PVector lineIntersection(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {

  float uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
  float uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));

  if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) {
    return new PVector(x1 + (uA * (x2-x1)), y1 + (uA * (y2-y1)));
  }
  return null;
}
