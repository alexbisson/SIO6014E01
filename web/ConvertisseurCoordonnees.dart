part of sio6014e01;

class ConvertisseurCoordonnees {

  int obtenirCoordonneeHorizontale(num longitude){
    int x;
//+180 pour mettre la longitude entre 0 et 360
//1024 = largeur de l'image
    x = ((longitude + 180)/360*1024).toInt(); 
    return x;
  }

  int obtenirCoordonneeVerticale(num latitude){
    int y;
    //+90 pour mettre la longitude entre 0 et 180
    //512 = hauteur de l'image
    y = ((latitude + 90)/180*512).toInt();
    return 512 - y; 
  }

}
