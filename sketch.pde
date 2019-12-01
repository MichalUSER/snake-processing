Food food;
Snake snake;
void setup() {
  size(700, 600);
  frameRate(15);
  food = new Food();
  snake = new Snake(food);
  snake.init();
}

void draw() {
  background(0);
  snake.show();
  food.show();
}
