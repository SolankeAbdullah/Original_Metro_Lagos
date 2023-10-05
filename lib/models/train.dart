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
  Future<List<Train>> fetchTrainList() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate API call delay
    return Train.trainList;
  }

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
    Train(
      departure: 'Duste',
      departureDestination: 'Jigawa',
      arrival: 'Lagos',
      arrivalDestination: 'Port Harcourt',
      dateOfDeparture: '2023-07-30',
      timeOfDeparture: '08:30 AM',
      duration: '5h 30m',
    ),
    Train(
      departure: 'London ',
      departureDestination: 'Bauchi',
      arrival: 'Lagos',
      arrivalDestination: 'Port Harcourt',
      dateOfDeparture: '2023-07-30',
      timeOfDeparture: '08:30 AM',
      duration: '5h 30m',
    ),
    Train(
      departure: 'Los Angeles',
      departureDestination: 'San Francisco',
      arrival: 'San Diego',
      arrivalDestination: 'Las Vegas',
      dateOfDeparture: '2023-08-15',
      timeOfDeparture: '11:30 AM',
      duration: '5h 15m',
    ),
    Train(
      departure: 'Chicago',
      departureDestination: 'St. Louis',
      arrival: 'Nashville',
      arrivalDestination: 'Atlanta',
      dateOfDeparture: '2023-08-10',
      timeOfDeparture: '10:00 AM',
      duration: '4h 30m',
    ),
    Train(
      departure: 'New York City',
      departureDestination: 'Philadelphia',
      arrival: 'Washington D.C.',
      arrivalDestination: 'Richmond',
      dateOfDeparture: '2023-08-05',
      timeOfDeparture: '09:15 AM',
      duration: '3h 45m',
    ),
    Train(
      departure: 'Miami',
      departureDestination: 'Orlando',
      arrival: 'Tampa',
      arrivalDestination: 'Jacksonville',
      dateOfDeparture: '2023-08-20',
      timeOfDeparture: '12:45 PM',
      duration: '2h 30m',
    ),
    Train(
      departure: 'Seattle',
      departureDestination: 'Portland',
      arrival: 'Spokane',
      arrivalDestination: 'Boise',
      dateOfDeparture: '2023-08-30',
      timeOfDeparture: '08:00 AM',
      duration: '3h 15m',
    ),
    Train(
      departure: 'Dallas',
      departureDestination: 'Houston',
      arrival: 'Austin',
      arrivalDestination: 'San Antonio',
      dateOfDeparture: '2023-09-05',
      timeOfDeparture: '09:30 AM',
      duration: '2h 45m',
    ),
  ];
}
