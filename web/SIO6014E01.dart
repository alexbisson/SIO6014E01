library sio6014e01;

import 'dart:html';
import 'dart:math';
part 'city.dart';
part 'coordinate_converter.dart';
part 'drawing_manager.dart';
part 'a_star.dart';
part 'cities_referential.dart';
part 'html_page_manager.dart';
part 'line.dart';



CitiesReferential citiesReferential = new CitiesReferential();
HtmlPageManager htmlPageManager = new HtmlPageManager();

void main() {
  query('#btnTestAStar').on.click.add(testAStar);
  generateRandomConnections();   
  htmlPageManager.displayCitiesAndFlights();
  htmlPageManager.fillDropDownLists();
}

void testAStar(Event event) {
//Vider l'espace réponse
  htmlPageManager.displayAnswerText(""); 
  AStar algo = new AStar();
  City origin = citiesReferential.getCity((query('#origin') as SelectElement).selectedOptions[0].text );
  City destination = citiesReferential.getCity((query('#destination') as SelectElement).selectedOptions[0].text );
  if(origin.name !== destination.name){
    List<City> path = algo.findPath(origin, destination);
    if(path.length<2){
      htmlPageManager.displayAnswerText("Aucun chemin possible, trouvez un autre moyen de transport");
    }else{
      htmlPageManager.displayShortestPath(path);  
    }
  }else{
    htmlPageManager.displayCitiesAndFlights();//Efface le chemin précédent
    htmlPageManager.displayAnswerText("Origine = Destination, ne prenez pas l'avion ;-)");
  }
}


void generateRandomConnections() {

  // Nombre de connexions sortantes qu'on va creer par ville
  // Il va avoir plus de connexions en bout de lignes puisque chaque
  // connexion est créée dans 2 villes
  int minConnections = 1;
  int maxConnections = 3;
  Random rnd = new Random();

  for (City city in citiesReferential.cities) {
    // Nombre de connexions pour la ville (valeur max en parametre est exclue)
    int connectionCount = rnd.nextInt(maxConnections - minConnections + 1) + minConnections;

    while (connectionCount > 0) {
   // Piger une ville aléatoire comme destination
      City destination = citiesReferential.cities[rnd.nextInt(citiesReferential.cities.length)];

      if (!destination.connections.contains(city)) {
        city.connections.add(destination);
        destination.connections.add(city);
        connectionCount = connectionCount - 1;
      }
    }

  }
}
