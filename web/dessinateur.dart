part of sio6014e01;

class Dessinateur {
  
  void dessinerVilles(List<City> cities){
    ConvertisseurCoordonnees convertisseur = new ConvertisseurCoordonnees();
    int x, y;
    CanvasElement canvas = document.query('#carteCanevas');
    CanvasRenderingContext2D context = canvas.getContext('2d');
    for (City city in cities) {
      x = convertisseur.obtenirCoordonneeHorizontale(city.longitude);
      y = convertisseur.obtenirCoordonneeVerticale(city.latitude);
      dessinerVille(x, y, context);
    }
  }
  
  void dessinerVille(int x, int y, CanvasRenderingContext2D context){
    context.arc(x, y, 0.5, 0, 2 * PI, false);
    context.fillStyle = 'red';
    context.fill();
  }
}
