import 'package:real_metro/models/train.dart';

class Available {
  final Train train; // Add a Train parameter
  final String date;
  final int availableTickets;

  Available({
    required this.train,
    required this.date,
    required this.availableTickets,
  });

  static final List<Available> ticketsList = [
    Available(
      train: Train(
        departure: 'Guse Abuja',
        departureDestination: 'Kano',
        arrival: 'Lagos',
        arrivalDestination: 'Port Harcourt',
        dateOfDeparture: '2023-07-30',
        timeOfDeparture: '08:30 AM',
        duration: '5h 30m',
      ),
      date: '25, jun, Sun',
      availableTickets: 15,
    ),
    // Add more data as needed
  ];
}
