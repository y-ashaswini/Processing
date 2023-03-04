int w = 10;
Cell cell;

void setup() {
  size(800, 640);
  background(0);
  cell = new Cell(width, height);
  frameRate(5);
}

void draw() {
  cell.printCells();
  cell.moveCells();
}
