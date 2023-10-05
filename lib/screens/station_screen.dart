import 'package:flutter/material.dart';
import 'package:real_metro/shared_widget.dart/train_details_widget.dart';
import 'dart:async';
import '../models/station.dart';
import '../models/train.dart';

class StationDetailsScreen extends StatelessWidget {
  final Station station;
  final Train train;

  StationDetailsScreen({required this.station, required this.train});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Station Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Station Name: ${station.name}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Location: ${station.location}',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 19.98,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Session",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.lightGreen,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              margin: EdgeInsets.only(top: 16.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lightGreen),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.lightGreen),
                      SizedBox(width: 8),
                      Text(
                        'Duration:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Estimate: 2 hours',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 29),
                  Row(
                    children: [
                      Icon(Icons.attach_money, color: Colors.lightGreen),
                      SizedBox(width: 8),
                      Text(
                        'Cost:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Estimate: ₦3000',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PassengerDetailsScreen(
                            train: train,
                          ),
                        ),
                      );
                    },
                    child: Text('Passenger Details'),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Back to Home'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Train train = Train(
      departure: 'Guse Abuja',
      departureDestination: 'Kano',
      arrival: 'Lagos',
      arrivalDestination: 'Port Harcourt',
      dateOfDeparture: '2023-07-30',
      timeOfDeparture: '08:30 AM',
      duration: '5h 30m',
    ); // Initialize your Train object here

    return MaterialApp(
      title: 'Station List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TrainListScreen(
        train: train,
      ),
    );
  }
}

class TrainListScreen extends StatelessWidget {
  const TrainListScreen({super.key, required this.train});
  final Train train;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Station List'),
      ),
      body: FutureBuilder<List<Station>>(
        future: fetchStationDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator()); // Loading indicator
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            final stationList = snapshot.data!;

            return ListView.builder(
              itemCount: stationList.length,
              itemBuilder: (context, index) {
                final station = stationList[index];
                return InkWell(
                  onTap: () {
                    // Navigate to station details screen with station data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StationDetailsScreen(
                          station: station,
                          train: train,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                station.name,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(
                                station.location,
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Text('No data available.');
          }
        },
      ),
    );
  }
}

class PassengerDetailsScreen extends StatelessWidget {
  const PassengerDetailsScreen({super.key, required this.train});
  final Train train;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [TrainDetailsWidget(train)],
      ),
    );
  }
}
