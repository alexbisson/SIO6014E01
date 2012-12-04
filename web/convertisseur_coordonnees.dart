part of sio6014e01;

class ConvertisseurCoordonnees {

  int largeur, hauteur;
  ConvertisseurCoordonnees(this.largeur, this.hauteur);
  
  int obtenirCoordonneeHorizontale(num longitude){
    int x = ((longitude + 180)/360*largeur).toInt();
    return x;
  }

  int obtenirCoordonneeVerticale(num latitude){
    int y = ((latitude + 90)/180*hauteur).toInt();
    return hauteur - y; 
  }

}
