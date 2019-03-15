Box box1;
Box box2;

public void setup() {
  size(500,500);
  
  // instantiates boxes (x, y, mass, size, velocity) 
  box1 = new Box((width / 2) - 37, (height - 50) - 74, 200, 74, 5);
  box2 = new Box(20, (height - 50) - 36, 40, 36, 0);
  
}

public void draw() {
  background(150);

  // draws + updates boxes
  box1.draw(); 
  box2.draw();
  
  // checks collision
  if (box1.isColliding(box2)) {
    
    // gets new velocities
    final double v1 = box1.elastic(box2);
    final double v2 = box2.elastic(box1);
    
    box1.setV(v1);
    box2.setV(v2);
  };
  
  // draws floor
  fill(0);
  rect(0,height - 50, width, 50);
}
