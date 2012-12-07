part of sio6014e01;

class ConvertisseurCoordonnees {

  int largeur, hauteur;
  ConvertisseurCoordonnees(this.largeur, this.hauteur);
  
  int obtenirCoordonneeHorizontale(num longitude){
    assert(longitude > -180 && longitude < 180);
    int x = ((longitude + 180)/360*largeur).toInt();
    return x;
  }

  int obtenirCoordonneeVerticale(num latitude){
    assert(latitude > -90 && latitude < 90);
    int y = ((latitude + 90)/180*hauteur).toInt();
    return hauteur - y; 
  }

}
