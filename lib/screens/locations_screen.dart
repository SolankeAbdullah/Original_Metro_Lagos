import 'package:flutter/material.dart';
import 'package:real_metro/screens/distributedscreens.dart';

import '../models/train.dart' as Train;

//import 'package:google_maps_flutter/google_maps_flutter.dart';

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

class LocationScreen extends StatelessWidget {
  final Station station;
  final Train.Train train;

  LocationScreen({required this.station, required this.train});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Train Location'),
      ),
      body: Column(
        children: [
          Container(
            height: 270,
            width: width,
            decoration: const BoxDecoration(color: Colors.blueGrey),
            /* child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(37.4219999, -122.0840575), // Example coordinates
                zoom: 15,
              ),
              // You can add markers, polylines, etc. here for train route tracking.
            ),*/
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(train.departure), // Use train.departure here
                  const SizedBox(height: 25),
                  Text(
                    "Departure Time: ${getTimeFromStation(station.departureTime)}",
                  ),
                ],
              ),
              const Divider(),
              Column(
                children: [
                  const Text("Challenge"),
                  const SizedBox(height: 7.67),
                  const Icon(Icons.compare_arrows_outlined),
                  const SizedBox(height: 5.8),
                  Text(
                    "Time Remaining: ${getTimeRemaining(station.arrivalTime)}",
                  ),
                ],
              ),
              const Divider(),
              Column(
                children: [
                  Text(train
                      .arrivalDestination), // Use train.arrivalDestination here
                  const SizedBox(height: 25),
                  Text(
                    "Expected Arrival Time: ${getTimeFromStation(station.arrivalTime)}",
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Terminal "),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PassengerDetailsScreen(),
                ),
              );
            },
            child: const Text('Passenger Details'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Navigate back to MyHomePage
            },
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}

String getTimeFromStation(DateTime time) {
  return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
}

String getTimeRemaining(DateTime arrivalTime) {
  final now = DateTime.now();
  final difference = arrivalTime.difference(now);
  final remainingMinutes = difference.inMinutes;
  return "${remainingMinutes} mins";
}

class PassengerDetailsScreen extends StatefulWidget {
  @override
  _PassengerDetailsScreenState createState() => _PassengerDetailsScreenState();
}

class _PassengerDetailsScreenState extends State<PassengerDetailsScreen> {
  final TextEditingController _coachController = TextEditingController();
  String _selectedReservationChoice = 'Select Reservation Choice';
  List<String> reservationChoices = [
    'None',
    'Choice 2',
    'Choice 3',
  ];
  bool _payWithCards = true;
  bool _isYesSelected = false;

  @override
  void dispose() {
    _coachController.dispose();
    // Dispose of the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    const padding = EdgeInsets.all(16.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Passenger Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: padding,
          child: Column(
            children: [
              Container(
                color: Colors.blueAccent,
                width: width,
                child: Padding(
                  padding: padding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Other Preference"),
                      const SizedBox(
                        height: 15.8,
                      ),
                      const Text("Book only if confirmed berths are located"),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _coachController,
                        decoration: const InputDecoration(
                          hintText: 'Enter preferred coach allocated',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Reservation Choice'),
                          PopupMenuButton<String>(
                            icon: const Icon(Icons.arrow_drop_down),
                            onSelected: (choice) {
                              setState(() {
                                _selectedReservationChoice = choice;
                              });
                            },
                            itemBuilder: (BuildContext context) {
                              return reservationChoices.map((choice) {
                                return PopupMenuItem<String>(
                                  value: choice,
                                  child: Text(choice),
                                );
                              }).toList();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                width: width,
              ),
              Container(
                color: Colors.lightGreen,
                padding: padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select the payment mode to proceed',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    RadioListTile<bool>(
                      title: const Text('Pay through Credit & Debit Cards'),
                      value: true,
                      groupValue: _payWithCards,
                      onChanged: (value) {
                        setState(() {
                          _payWithCards = value!;
                        });
                      },
                    ),
                    RadioListTile<bool>(
                      title: const Text('Pay through Transfer'),
                      value: false,
                      groupValue: _payWithCards,
                      onChanged: (value) {
                        setState(() {
                          _payWithCards = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Color.fromARGB(255, 70, 72, 75),
                width: width,
                child: Padding(
                  padding: padding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Do you want to take Travel Insurance"),
                      ListTile(
                        title: const Text('NGN 2,500'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio<bool>(
                              value: true,
                              groupValue: _isYesSelected,
                              onChanged: (value) {
                                setState(() {
                                  _isYesSelected = value!;
                                });
                              },
                            ),
                            const Text('Yes'),
                            Radio<bool>(
                              value: false,
                              groupValue: _isYesSelected,
                              onChanged: (value) {
                                setState(() {
                                  _isYesSelected = value!;
                                });
                              },
                            ),
                            const Text('No'),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const [
                            TextSpan(
                              text: "By clicking ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                            TextSpan(
                              text: "Review Journey Details",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  " you accept\nTerms & Conditions of the travel insurance policy",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 18),
                      Padding(
                        padding: padding,
                        child: Container(
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 173, 185, 206),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: padding,
                                  child: Column(
                                    children: [
                                      Text("Per Person"),
                                      SizedBox(
                                        height: 19,
                                      ),
                                      Text("NGN 5000")
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TrainCard(),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 78, 82, 84),
                                          borderRadius:
                                              BorderRadius.circular(18)),
                                      height: 80,
                                      width: width * 0.2,
                                      child: const Center(
                                        child: Text(
                                          " Train Class",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 222, 155, 155),
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Other widgets here
            ],
          ),
        ),
      ),
    );
  }
}
