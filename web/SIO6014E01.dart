library sio6014e01;

import 'dart:html';
import 'dart:math';
part 'city.dart';
part 'convertisseur_coordonnees.dart';
part 'dessinateur.dart';
part 'a_star.dart';

void main() {
  query('#btnTestAStar').on.click.add(testAStar);
  List<City> cities = getCitiesList();
  afficherVilles(cities);
  generateRandomConnections(cities);
  afficherVols(cities);
  
}



void testAStar(Event event) {
  //window.alert('test');

  List<City> cities = getCitiesList();

  generateRandomConnections(cities);

  // Print connections
  StringBuffer buffer = new StringBuffer();

  for(var city in cities) {
    for (var connection in city.connections) {
      buffer.addAll([city.name, ' - ', connection.name, ' || ']);
    }
  }

  var algo = new AStar();
  List<City> path = algo.findPath(cities[0], cities[2]);
}

void afficherVilles(List<City> cities){
  Dessinateur dessinateur = new Dessinateur();
  dessinateur.dessinerVilles(cities);
}

void afficherVols(List<City> cities){
  Dessinateur dessinateur = new Dessinateur();
  dessinateur.dessinerVols(cities);
}






List<City> getCitiesList() {
  List<City> cities = new List<City>();

  cities.add(new City('Shanghai', 31.23, 121.47));
  cities.add(new City('Bombay', 18.96, 72.82));
  cities.add(new City('Buenos Aires', -34.61, -58.37));
  cities.add(new City('Istanbul', 41.1, 29.0));
  cities.add(new City('Moscow', 55.75, 37.62));
  cities.add(new City('Mexico City', 19.43, -99.14));
  cities.add(new City('Jakarta', -6.18, 106.83));
  cities.add(new City('New York', 40.67, -73.94));
  cities.add(new City('Cairo', 30.06, 31.25));
  cities.add(new City('Lima', -12.07, -77.05));
  cities.add(new City('Peking', 39.93, 116.4));
  cities.add(new City('London', 51.52, -0.1));
  cities.add(new City('Rio de Janeiro', -22.91, -43.2));
  cities.add(new City('Bangkok', 13.73, 100.5));
  cities.add(new City('Bagdad', 33.33, 44.44));
  cities.add(new City('Singapore', 1.3, 103.85));
  cities.add(new City('Riyadh', 24.65, 46.77));
  cities.add(new City('Madras', 13.09, 80.27));
  cities.add(new City('Saint Petersburg', 59.93, 30.32));
  cities.add(new City('Abidjan', 5.33, -4.03));
  cities.add(new City('Los Angeles', 34.11, -118.41));
  cities.add(new City('Sydney', -33.87, 151.21));
  cities.add(new City('Melbourne', -37.81, 144.96));
  cities.add(new City('Cape Town', -33.93, 18.46));
  cities.add(new City('Berlin', 52.52, 13.38));
  cities.add(new City('Montreal', 45.52, -73.57));
  cities.add(new City('Harbin', 45.75, 126.65));
  cities.add(new City('Durban', -29.87, 30.99));
  cities.add(new City('Casablanca', 33.6, -7.62));
  cities.add(new City('Addis Abeba', 9.03, 38.74));
  cities.add(new City('Madrid', 40.42, -3.71));
  cities.add(new City('Jiddah', 21.5, 39.17));
  cities.add(new City('Nairobi', -1.29, 36.82));
  cities.add(new City('Chicago', 41.84, -87.68));
  cities.add(new City('Kiev', 50.43, 30.52));
  cities.add(new City('Osaka', 34.68, 135.5));
  cities.add(new City('Luanda', -8.82, 13.24));
  cities.add(new City('Rome', 41.89, 12.5));
  cities.add(new City('Dakar', 14.72, -17.48));
  cities.add(new City('Fortaleza', -3.78, -38.59));
  cities.add(new City('Mashhad', 36.27, 59.57));
  cities.add(new City('Maracaibo', 10.73, -71.66));
  cities.add(new City('Brasilia', -15.78, -47.91));
  cities.add(new City('Nagpur', 21.16, 79.08));

  return cities;
}

void generateRandomConnections(List<City> cities) {

  // Nombre de connexions sortantes qu'on va creer par ville
  // Il va avoir plus de connexions en bout de lignes puisque chaque
  // connexion est créée dans 2 villes
  int minConnections = 2;
  int maxConnections = 6;

  Random rnd = new Random();

  for (City city in cities) {
    // Nombre de connexions pour la ville (valeur max en parametre est exclue)
    int connectionCount = rnd.nextInt(maxConnections - minConnections + 1) + minConnections;

    while (connectionCount > 0) {
   // Piger une ville aléatoire comme destination
      City destination = cities[rnd.nextInt(cities.length)];

      if (!destination.connections.contains(city)) {
        city.connections.add(destination);
        destination.connections.add(city);
        connectionCount = connectionCount - 1;
      }
    }

  }
}
