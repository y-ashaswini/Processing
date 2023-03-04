class Cell {
  //int[][] cells = {
  //    {0,0,0,0,0},
  //    {0,0,1,0,0},
  //    {0,0,1,0,0},
  //    {0,0,1,0,0},
  //    {0,0,0,0,0},
  //  };
    
  int[][] cells = {{}};
  int[][] next = {{}};
  int w = 10;
  int rows,cols;
  
  Cell(int cols, int rows) {
    this.rows = rows;
    this.cols = cols;
    cells = new int[rows][cols];
    next = new int[rows][cols];
    for(int i = 0; i < rows; i++) {
      for(int j = 0; j < cols; j++) {
        cells[i][j] = (int)random(2);
      }     
    }
  }
    
  void printCells() {
    //stroke(255);
    for(int i = 0; i < rows; i++) {
      for(int j = 0; j < cols; j++) {
        if(cells[i][j] == 0) {
          stroke(0);
          fill(0);
        } else {
          stroke(255);
          fill(255);
        }
        rect(i*w, j*w, w, w);
        //ellipse(i*w, j*w, w, w);
      }     
    } 
  }
  
  
  void moveCells() {
    for (int x = 1; x < rows - 1; x++) {
      for (int y = 1; y < cols - 1; y++) {
        int nb=0;
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {
            nb += cells[x+i][y+j];
           }
        }
        
        nb -= cells[x][y];
        next[x][y] = ruleset(nb, x, y, cells);
      }
    }
    
    cells = next;
  }
  
  
  int ruleset(int nb, int x, int y, int[][] arr) {
    //if((arr[x][y] == 1) && ((nb <  2) || (nb > 3))) {
    //  return 0;
    //}
    if((arr[x][y] == 1) && ((nb <  2) || (nb >= 3))) {
      return 0;
    }
    //else if((arr[x][y] == 0) && ((nb == 3) || (nb == 0 ))) {
    //  return 1;
    //}
    else if((arr[x][y] == 0) && (nb == 3)) {
      return 1;
    }
    else {
      return arr[x][y];
    }
  }  
}
