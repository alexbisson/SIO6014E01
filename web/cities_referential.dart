part of sio6014e01;

class CitiesReferential {
  List<City> cities;
  
  
  CitiesReferential(){
    cities = getCities();
    sortCities();
  }
  
  //Trier les villes selon le nom. Principalement pour l'affichage dans le listes déroulantes
  void sortCities(){
    cities.sort(
        (a,b){
          String nom1 = a.name;
          String nom2 = b.name;
          int comparaison = nom1.compareTo(nom2);
          if(comparaison == 0)return 0;
          else if(comparaison == 1) return 1;
          else return -1;
        }         
    );
  }
  
  //Permet d'obtenir une ville selon son nom
  City getCity(String name){
    assert(name != null);
    for(var city in cities) {
      if(city.name == name){
        return city;
      }
    }
    return null;
  } 
  
  //Retourne la liste de toutes les villes disponibles
  List<City> getCities() {
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
//    cities.add(new City('Addis Abeba', 9.03, 38.74));
//    cities.add(new City('Madrid', 40.42, -3.71));
//    cities.add(new City('Jiddah', 21.5, 39.17));
//    cities.add(new City('Nairobi', -1.29, 36.82));
//    cities.add(new City('Chicago', 41.84, -87.68));
//    cities.add(new City('Kiev', 50.43, 30.52));
//    cities.add(new City('Osaka', 34.68, 135.5));
//    cities.add(new City('Luanda', -8.82, 13.24));
//    cities.add(new City('Rome', 41.89, 12.5));
//    cities.add(new City('Dakar', 14.72, -17.48));
//    cities.add(new City('Fortaleza', -3.78, -38.59));
//    cities.add(new City('Mashhad', 36.27, 59.57));
//    cities.add(new City('Maracaibo', 10.73, -71.66));
//    cities.add(new City('Brasilia', -15.78, -47.91));
//    cities.add(new City('Nagpur', 21.16, 79.08));

    return cities;
  }
}
