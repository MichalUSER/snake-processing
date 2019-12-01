class SnakePart {
  String showColor = "";
  float x;
  float y;
  
  SnakePart(float xNew, float yNew, String showColorNew) {
    x = xNew;
    y = yNew;
    showColor = showColorNew;
  }
  
  void setColor() {
    if(showColor == "white") {
      fill(240);
    } else if(showColor == "red") {
      fill(232, 0, 0);
    } else if(showColor == "grey") {
      fill(200);
    }
  }
  
  void show() {
    noStroke();
    setColor();
    rect(x, y, 20, 20);
  }
}
