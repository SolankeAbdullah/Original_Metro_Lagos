class Station {
  final String name;
  final String location;
  final DateTime departureTime;
  final DateTime arrivalTime;

  Station({
    required this.name,
    required this.location,
    required this.departureTime,
    required this.arrivalTime,
  });
}

// Data for stations and locations
// List of Station instances
List<Station> trainStations = [
  Station(
      name: 'Station A',
      location: 'Location A',
      departureTime: DateTime.now(),
      arrivalTime: DateTime.now().add(Duration(hours: 2))),
  Station(
      name: 'Station B',
      location: 'Location B',
      departureTime: DateTime.now(),
      arrivalTime: DateTime.now().add(Duration(hours: 4))),
  Station(
      name: 'Station C',
      location: 'Location C',
      departureTime: DateTime.now(),
      arrivalTime: DateTime.now().add(Duration(hours: 6))),
  // Add more stations and locations here
];

Future<List<Station>> fetchStationDetails() async {
  // Simulate a delay to mimic API call
  await Future.delayed(Duration(seconds: 2));

  return trainStations;
}
