import 'dart:html';
part 'city.dart';
part 'aStar.dart';

void main() {
//  query("#text")
//    ..text = "Click me!"
//    ..on.click.add(reverseText);

  query('#btnTestAStar').on.click.add(testAStar);
}

void reverseText(Event event) {
  var text = query("#text").text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.add(text[i]);
  }
  query("#text").text = buffer.toString();
}

void testAStar(Event event) {
  //window.alert('test');

  List<City> cities = getCitiesList();

  var algo = new AStar();
  algo.findPath(cities[0], cities[1]);


}

List<City> getCitiesList() {
  List<City> cities = new List<City>();
  var city = new City();

  city.name = 'Berlin';
  city.connectedCities['Buenos Aires'] = 11912.0;
  city.connectedCities['Cairo'] = 2889.0;
  city.connectedCities['Calcutta'] = 7030.0;
  city.connectedCities['Cape Town'] = 9625.5;
  city.connectedCities['Caracas'] = 8444.2;
  city.connectedCities['Chicago'] = 7089.1;

  cities.add(city);

  city = new City();
  city.name = 'Hong Kong';
  city.connectedCities['Berlin'] = 8754.8;
  city.connectedCities['Buenos Aires'] = 18462.3;

  cities.add(city);

  city = new City();
  city.name = 'London';
  city.connectedCities['Hong Kong'] = 9627.1;
  city.connectedCities['Los Angeles'] = 8661.5;

  cities.add(city);

  return cities;
}
