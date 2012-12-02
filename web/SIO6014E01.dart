library sio6014e01;

import 'dart:html';
import 'dart:math';
part 'city.dart';
part 'ConvertisseurCoordonnees.dart';
part 'a_star.dart';

void main() {
  query('#btnTestAStar').on.click.add(testAStar);
}



void testAStar(Event event) {
  //window.alert('test');

  List<City> cities = getCitiesList();

  generateRandomConnections(cities);

  afficherVilles(cities);
  
  // Print connections
  StringBuffer buffer = new StringBuffer();

  for(var city in cities) {
    for (var connection in city.connections) {
      buffer.addAll([city.name, ' - ', connection.name, ' || ']);
    }
  }

  //query("#text").text = buffer.toString();

  var algo = new AStar();
  List<City> path = algo.findPath(cities[0], cities[2]);
}

void afficherVilles(List<City> cities){
  ConvertisseurCoordonnees convertisseur = new ConvertisseurCoordonnees();
  int x, y;
  for (City city in cities) {
    x = convertisseur.obtenirCoordonneeHorizontale(city.longitude);
    y = convertisseur.obtenirCoordonneeVerticale(city.latitude);
    afficherVille(x, y);
  }
  
  }

void afficherVille(int x, int y){
  
  }




List<City> getCitiesList() {
  List<City> cities = new List<City>();

  cities.add(new City('Shanghai', 31.23, 121.47));
  cities.add(new City('Bombay', 18.96, 72.82));
  cities.add(new City('Karachi', 24.86, 67.01));
  cities.add(new City('Buenos Aires', -34.61, -58.37));
  cities.add(new City('Delhi', 28.67, 77.21));
  cities.add(new City('Istanbul', 41.1, 29.0));
  cities.add(new City('Manila', 14.62, 120.97));
  cities.add(new City('Sao Paulo', -23.53, -46.63));
  cities.add(new City('Moscow', 55.75, 37.62));
  cities.add(new City('Dhaka', 23.7, 90.39));
  cities.add(new City('Soul', 37.56, 126.99));
  cities.add(new City('Lagos', 6.5, 3.35));
  cities.add(new City('Kinshasa', -4.31, 15.32));
  cities.add(new City('Tokyo', 35.67, 139.77));
  cities.add(new City('Mexico City', 19.43, -99.14));
  cities.add(new City('Jakarta', -6.18, 106.83));
  cities.add(new City('New York', 40.67, -73.94));
  cities.add(new City('Tehran', 35.67, 51.43));
  cities.add(new City('Cairo', 30.06, 31.25));
  cities.add(new City('Lima', -12.07, -77.05));
  cities.add(new City('Peking', 39.93, 116.4));
  cities.add(new City('London', 51.52, -0.1));
  cities.add(new City('Bogota', 4.63, -74.09));
  cities.add(new City('Lahore', 31.56, 74.35));
  cities.add(new City('Rio de Janeiro', -22.91, -43.2));
  cities.add(new City('Bangkok', 13.73, 100.5));
  cities.add(new City('Bagdad', 33.33, 44.44));
  cities.add(new City('Bangalore', 12.97, 77.56));
  cities.add(new City('Santiago', -33.46, -70.64));
  cities.add(new City('Calcutta', 22.57, 88.36));
  cities.add(new City('Singapore', 1.3, 103.85));
  cities.add(new City('Toronto', 43.65, -79.38));
  cities.add(new City('Rangoon', 16.79, 96.15));
  cities.add(new City('Ibadan', 7.38, 3.93));
  cities.add(new City('Riyadh', 24.65, 46.77));
  cities.add(new City('Madras', 13.09, 80.27));
  cities.add(new City('Chongqing', 29.57, 106.58));
  cities.add(new City('Ho Chi Minh City', 10.78, 106.69));
  cities.add(new City('Xian', 34.27, 108.9));
  cities.add(new City('Wuhan', 30.58, 114.27));
  cities.add(new City('Alexandria', 31.22, 29.95));
  cities.add(new City('Saint Petersburg', 59.93, 30.32));
  cities.add(new City('Hyderabad', 17.4, 78.48));
  cities.add(new City('Chengdu', 30.67, 104.07));
  cities.add(new City('Abidjan', 5.33, -4.03));
  cities.add(new City('Ankara', 39.93, 32.85));
  cities.add(new City('Ahmadabad', 23.03, 72.58));
  cities.add(new City('Los Angeles', 34.11, -118.41));
  cities.add(new City('Tianjin', 39.13, 117.2));
  cities.add(new City('Chattagam', 22.33, 91.81));
  cities.add(new City('Sydney', -33.87, 151.21));
  cities.add(new City('Yokohama', 35.47, 139.62));
  cities.add(new City('Melbourne', -37.81, 144.96));
  cities.add(new City('Shenyang', 41.8, 123.45));
  cities.add(new City('Cape Town', -33.93, 18.46));
  cities.add(new City('Berlin', 52.52, 13.38));
  cities.add(new City('Pusan', 35.11, 129.03));
  cities.add(new City('Montreal', 45.52, -73.57));
  cities.add(new City('Harbin', 45.75, 126.65));
  cities.add(new City('Durban', -29.87, 30.99));
  cities.add(new City('Gizeh', 30.01, 31.21));
  cities.add(new City('Nanjing', 32.05, 118.78));
  cities.add(new City('Casablanca', 33.6, -7.62));
  cities.add(new City('Pune', 18.53, 73.84));
  cities.add(new City('Addis Abeba', 9.03, 38.74));
  cities.add(new City('Pyongyang', 39.02, 125.75));
  cities.add(new City('Surat', 21.2, 72.82));
  cities.add(new City('Madrid', 40.42, -3.71));
  cities.add(new City('Guangzhou', 23.12, 113.25));
  cities.add(new City('Jiddah', 21.5, 39.17));
  cities.add(new City('Kanpur', 26.47, 80.33));
  cities.add(new City('Nairobi', -1.29, 36.82));
  cities.add(new City('Jaipur', 26.92, 75.8));
  cities.add(new City('Dar es Salaam', -6.82, 39.28));
  cities.add(new City('Salvador', -12.97, -38.5));
  cities.add(new City('Chicago', 41.84, -87.68));
  cities.add(new City('Taiyuan', 37.87, 112.55));
  cities.add(new City('al-Mawsil', 36.34, 43.14));
  cities.add(new City('Faisalabad', 31.41, 73.11));
  cities.add(new City('Changchun', 43.87, 125.35));
  cities.add(new City('Izmir', 38.43, 27.15));
  cities.add(new City('Taibei', 25.02, 121.45));
  cities.add(new City('Osaka', 34.68, 135.5));
  cities.add(new City('Lakhnau', 26.85, 80.92));
  cities.add(new City('Kiev', 50.43, 30.52));
  cities.add(new City('Luanda', -8.82, 13.24));
  cities.add(new City('Inchon', 37.48, 126.64));
  cities.add(new City('Rome', 41.89, 12.5));
  cities.add(new City('Dakar', 14.72, -17.48));
  cities.add(new City('Belo Horizonte', -19.92, -43.94));
  cities.add(new City('Fortaleza', -3.78, -38.59));
  cities.add(new City('Mashhad', 36.27, 59.57));
  cities.add(new City('Maracaibo', 10.73, -71.66));
  cities.add(new City('Kabul', 34.53, 69.17));
  cities.add(new City('Santo Domingo', 18.48, -69.91));
  cities.add(new City('Taegu', 35.87, 128.6));
  cities.add(new City('Brasilia', -15.78, -47.91));
  cities.add(new City('Umm Durman', 15.65, 32.48));
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
