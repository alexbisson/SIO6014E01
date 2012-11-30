
class AStar {
  void findPath(City origin, City goal) {

    // The set of nodes already evaluated
    List<City> closedSet = new List<City>();

    // The set of nodes already evaluated
    List<City> openSet = new List<City>();

    // The map of navigated nodes
    Map<City, City> cameFrom = new Map<City, City>();

    Map<City, double> gScore = new Map<City, double>();
    Map<City, double> fScore = new Map<City, double>();

    openSet.add(origin);



  }
}
