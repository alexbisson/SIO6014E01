part of sio6014e01;

class ConvertisseurCoordonnees {

  int obtenirCoordonneeHorizontale(num longitude){
    int x;
    CanvasElement canvas = document.query('#carteCanevas');
    int largeurCanevas = canvas.width;
    x = ((longitude + 180)/360*largeurCanevas).toInt();
    return x;
  }

  int obtenirCoordonneeVerticale(num latitude){
    int y;
    CanvasElement canvas = document.query('#carteCanevas');
    int hauteurCanevas = canvas.height;
    y = ((latitude + 90)/180*hauteurCanevas).toInt();
    return hauteurCanevas - y; 
  }

}
