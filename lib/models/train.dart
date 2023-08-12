class Train {
  final String departure;
  final String departureDestination;
  final String arrival;
  final String arrivalDestination;
  final String dateOfDeparture;
  final String timeOfDeparture;
  final String duration;

  Train({
    required this.departure,
    required this.departureDestination,
    required this.arrival,
    required this.arrivalDestination,
    required this.dateOfDeparture,
    required this.timeOfDeparture,
    required this.duration,
  });

  // Replace this with your actual API call to fetch the train list data
  static Future<List<Train>> _fetchTrainList() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate API call delay
    return trainList;
  }

  // Dummy API response (replace with actual API call)
  static final List<Train> trainList = [
    Train(
      departure: 'Guse Abuja',
      departureDestination: 'Kano',
      arrival: 'Lagos',
      arrivalDestination: 'Port Harcourt',
      dateOfDeparture: '2023-07-30',
      timeOfDeparture: '08:30 AM',
      duration: '5h 30m',
    ),

    // Add more train data as needed
  ];
}
