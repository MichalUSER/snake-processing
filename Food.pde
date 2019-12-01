class Food {
  int x = 0;
  int y = 0;
  
  void generate() {
    x = int(random(1, 34));
    y = int(random(1, 29));
    x = x*20;
    y = y*20;
  }
  
  void show() {
    FoodPart foodPart = new FoodPart(x, y, "red");
    foodPart.show();
  }
}
