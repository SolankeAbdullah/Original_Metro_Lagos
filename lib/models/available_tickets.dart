import 'package:real_metro/models/train.dart';

class Available {
  final Train train;
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
    Available(
      train: Train(
        departure: 'New York City',
        departureDestination: 'Philadelphia',
        arrival: 'Washington D.C.',
        arrivalDestination: 'Richmond',
        dateOfDeparture: '2023-08-05',
        timeOfDeparture: '09:15 AM',
        duration: '3h 45m',
      ),
      date: '05, Aug, Fri',
      availableTickets: 25,
    ),
    Available(
      train: Train(
        departure: 'Chicago',
        departureDestination: 'St. Louis',
        arrival: 'Nashville',
        arrivalDestination: 'Atlanta',
        dateOfDeparture: '2023-08-10',
        timeOfDeparture: '10:00 AM',
        duration: '4h 30m',
      ),
      date: '10, Aug, Wed',
      availableTickets: 18,
    ),
    Available(
      train: Train(
        departure: 'Los Angeles',
        departureDestination: 'San Francisco',
        arrival: 'San Diego',
        arrivalDestination: 'Las Vegas',
        dateOfDeparture: '2023-08-15',
        timeOfDeparture: '11:30 AM',
        duration: '5h 15m',
      ),
      date: '15, Aug, Mon',
      availableTickets: 30,
    ),
    Available(
      train: Train(
        departure: 'Miami',
        departureDestination: 'Orlando',
        arrival: 'Tampa',
        arrivalDestination: 'Jacksonville',
        dateOfDeparture: '2023-08-20',
        timeOfDeparture: '12:45 PM',
        duration: '2h 30m',
      ),
      date: '20, Aug, Sat',
      availableTickets: 22,
    ),
    Available(
      train: Train(
        departure: 'Denver',
        departureDestination: 'Salt Lake City',
        arrival: 'Phoenix',
        arrivalDestination: 'Albuquerque',
        dateOfDeparture: '2023-08-25',
        timeOfDeparture: '10:15 AM',
        duration: '4h 45m',
      ),
      date: '25, Aug, Thu',
      availableTickets: 12,
    ),
    Available(
      train: Train(
        departure: 'Seattle',
        departureDestination: 'Portland',
        arrival: 'Spokane',
        arrivalDestination: 'Boise',
        dateOfDeparture: '2023-08-30',
        timeOfDeparture: '08:00 AM',
        duration: '3h 15m',
      ),
      date: '30, Aug, Tue',
      availableTickets: 15,
    ),
    Available(
      train: Train(
        departure: 'Dallas',
        departureDestination: 'Houston',
        arrival: 'Austin',
        arrivalDestination: 'San Antonio',
        dateOfDeparture: '2023-09-05',
        timeOfDeparture: '09:30 AM',
        duration: '2h 45m',
      ),
      date: '05, Sep, Mon',
      availableTickets: 28,
    ),

    // Add more data as needed
  ];
}
