import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_metro/models/available_tickets.dart';
import 'package:real_metro/models/train.dart';
import 'package:real_metro/providers/refresh_notifier.dart';
import 'package:real_metro/shared_widget.dart/train_details_widget.dart';

import 'locations_screen.dart';

class AvailableExpress extends ConsumerWidget {
  final Train train;

  AvailableExpress({Key? key, required this.train}) : super(key: key);

  Future<List<Available>> _fetchAvailableTickets() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate API call delay

    return Available.ticketsList;
  }

  Future<List<Train>> _fetchTrainList() async {
    return Train.trainList;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 234, 232, 232),
          iconTheme: const IconThemeData(color: Colors.black38),
          elevation: 0.0,
          title: const Center(
            child: Text(
              'Train List',
              textAlign: TextAlign.center,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                // Trigger refresh logic here
                ref.read(refreshProvider.notifier).startRefresh();
                // You can call your API fetching logic here
                _fetchTrainList().then((_) {
                  ref.read(refreshProvider.notifier).finishRefresh();
                });
              },
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigate back to MyTicketsScreen
            },
          ),
        ),
        body: Consumer(
          builder: (context, watch, _) {
            final isRefreshing = ref.watch(refreshProvider);

            return Padding(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                children: [
                  TrainDetailsWidget(train), // Pass a Train instance
                  const SizedBox(height: 1.8),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Lagos Express",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF002B9B),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 1.6,
                  ),
                  Expanded(
                    child: FutureBuilder<List<Available>>(
                      future: _fetchAvailableTickets(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                                ConnectionState.waiting ||
                            isRefreshing) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasData) {
                          final ticketList = snapshot.data!;
                          return ListView.builder(
                            itemCount: ticketList.length * 5,
                            itemBuilder: (context, index) {
                              final available =
                                  ticketList[index % ticketList.length];
                              return availableexpresses(
                                available: available,
                                train: train,
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: Text('Error loading data'),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class availableexpresses extends StatelessWidget {
  availableexpresses({
    super.key,
    required this.available,
    required this.train,
  });

  final Available available;
  final Train train;
  final Station station = Station(
    name: 'Lagos',
    location: 'Lagos Location',
    departureTime:
        DateTime(2023, 7, 29, 8, 0), // Replace with actual departure time
    arrivalTime:
        DateTime(2023, 7, 29, 10, 47), // Replace with actual arrival time
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Debug: Check if this is printed when tapped
        print('Container tapped. Navigating to LocationScreen...');

        // Navigate to LocationScreen when the Container is clicked
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LocationScreen(
              station: station,
              train: train,
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              available.date,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Available Tickets: ${available.availableTickets}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
