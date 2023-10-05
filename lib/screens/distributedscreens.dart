import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class StationDetailsScreen extends StatelessWidget {
  final Station station;
  final Train train;

  StationDetailsScreen({required this.station, required this.train});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Station Details'),
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
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Station Name: ${station.name}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Location: ${station.location}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 19.98,
            ),
            const Align(
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
              margin: const EdgeInsets.only(top: 16.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lightGreen),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
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
                  const Text(
                    'Estimate: 2 hours',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 29),
                  const Row(
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
                  const Text(
                    'Estimate: ₦3000',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
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
                    child: const Text('Passenger Details'),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Back to Home'),
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

class MyApp extends StatelessWidget {
  // Remove the constructor parameter from here
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Station List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TrainCard());
  }
}

class TrainListScreen extends StatelessWidget {
  const TrainListScreen({super.key, required this.train});
  final Train train;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Station List'),
      ),
      body: FutureBuilder<List<Station>>(
        future: fetchStationDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
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
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                station.name,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                station.location,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Text('No data available.');
          }
        },
      ),
    );
  }
}

class PassengerDetailsScreen extends ConsumerWidget {
  final Train train;

  PassengerDetailsScreen({required this.train});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedStation = ref.watch(selectedStationProvider);

    // Access the list of Station instances
    final List<Station> trainStations = ref.watch(stationDetailsProvider);

    // Extract station names from the list of Station instances
    final List<String> boardingStationNames =
        trainStations.map((station) => station.name).toList();
    final passengerDetails = ref.watch(passengerDetailsProvider);
    final fullNameController =
        TextEditingController(text: passengerDetails.fullName);
    final ageController = TextEditingController(text: passengerDetails.age);
    final phoneNumberController =
        TextEditingController(text: passengerDetails.phoneNumber);
    final emailController = TextEditingController(text: passengerDetails.email);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Passenger Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back when arrow icon is pressed
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            TrainDetailsWidget(train),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50, // Adjust the height as needed
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Boarding Station',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DropdownButton<String>(
                    value: selectedStation,
                    items: boardingStationNames.map((String stationName) {
                      return DropdownMenuItem<String>(
                        value: stationName,
                        child: Text(stationName),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Call the function to update the selected station
                      _updateSelectedStation(ref, newValue);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 19,
            ),
            Container(
              height: 550,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lightGreen),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Add Passenger Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    controller: fullNameController,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      hintText: 'Enter your full name',
                    ),
                    onChanged: (value) {
                      ref
                          .read(passengerDetailsProvider.notifier)
                          .updateFullName(value);
                    },
                  ),
                  TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      labelText: 'Age',
                      hintText: 'Enter your age',
                    ),
                    onChanged: (value) {
                      ref
                          .read(passengerDetailsProvider.notifier)
                          .updateAge(value);
                    },
                  ),
                  TextFormField(
                    controller: phoneNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Enter your phone number',
                    ),
                    onChanged: (value) {
                      ref
                          .read(passengerDetailsProvider.notifier)
                          .updatePhoneNumber(value);
                    },
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                    ),
                    onChanged: (value) {
                      ref
                          .read(passengerDetailsProvider.notifier)
                          .updateEmail(value);
                    },
                  ),
                  const Text(
                    'Gender',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<String>(
                        value: 'Male',
                        groupValue: passengerDetails.gender,
                        onChanged: (value) {
                          ref
                              .read(passengerDetailsProvider.notifier)
                              .updateGender(value ?? 'Male');
                        },
                      ),
                      const Text('Male'),
                      Radio<String>(
                        value: 'Female',
                        groupValue: passengerDetails.gender,
                        onChanged: (value) {
                          ref
                              .read(passengerDetailsProvider.notifier)
                              .updateGender(value ?? 'Female');
                        },
                      ),
                      const Text('Female'),
                    ],
                  ),
                  /*  DropDownField(
                    controller: passengerDetails.state,
                    hintText: 'Select a state',
                    labelText: 'State',
                    items: ['State A', 'State B', 'State C'], // Replace with your state data
                  ),
                  DropDownField(
                    controller: passengerDetails.nationality,
                    hintText: 'Select nationality',
                    labelText: 'Nationality',
                    items: ['Nationality A', 'Nationality B', 'Nationality C'], // Replace with your nationality data
                  ),*/
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NextPage(),
                        ),
                      );
                    },
                    child: const Text('Proceed to Next Page'),
                  ),
                ],
              ),
            ),
          ], // Add your content here
        ),
      ),
    );
  }

  void _updateSelectedStation(WidgetRef ref, String? newValue) {
    ref.read(selectedStationProvider.notifier).state = newValue ?? '';
  }
}

class NextPage extends ConsumerWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passengerDetails = ref.watch(passengerDetailsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Passenger Details:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Full Name: ${passengerDetails.fullName}'),
            Text('Age: ${passengerDetails.age}'),
            Text('Gender: ${passengerDetails.gender}'),
          ],
        ),
      ),
    );
  }
}

class TrainDetailsWidget extends StatelessWidget {
  final Train train;

  const TrainDetailsWidget(this.train, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 162, 146, 146)
            .withOpacity(0.9)
            .withAlpha(144),
        border: Border.all(style: BorderStyle.none),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Departure:\n${train.departure} - ${train.departureDestination}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Center(
                child: Icon(Icons.arrow_forward),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Arrival",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 0.6,
                  ),
                  Text(
                    '${train.arrival} - ${train.arrivalDestination}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Date: ${train.dateOfDeparture}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 16,
                      color: Color(0xFF042D97),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      ' ${train.timeOfDeparture}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Duration: ${train.duration}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TrainProfile {
  final String name;
  final String typeOfFare;
  final double amount;
  final String minor;

  TrainProfile({
    required this.name,
    required this.typeOfFare,
    required this.amount,
    required this.minor,
  });
}

Future<List<TrainProfile>> fetchTrainProfiles() async {
  // Simulate an API call with a delay of 2 seconds
  await Future.delayed(const Duration(seconds: 2));

  // Dummy API response (replace with actual API call)
  final List<TrainProfile> profiles = [
    TrainProfile(
      name: 'First Class',
      typeOfFare: 'Adult Fare',
      amount: 20000.0,
      minor: 'None',
    ),
    TrainProfile(
      name: 'Economy Class',
      typeOfFare: 'Adult Fare',
      amount: 15000.0,
      minor: 'None',
    ),
    TrainProfile(
      name: 'Business Class',
      typeOfFare: 'Adult Fare',
      amount: 25000.0,
      minor: 'None',
    ),
    TrainProfile(
      name: 'Child Fare',
      typeOfFare: 'Child Fare',
      amount: 10000.0,
      minor: 'Child',
    ),
    TrainProfile(
      name: 'Senior Fare',
      typeOfFare: 'Senior Fare',
      amount: 18000.0,
      minor: 'Senior Citizen',
    ),
    // Add more profiles as needed
  ];

  return profiles;
}

class TrainCard extends StatelessWidget {
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

    return FutureBuilder<List<TrainProfile>>(
      future: fetchTrainProfiles(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final profiles = snapshot.data!;

          return ListView.builder(
            itemCount: profiles.length,
            itemBuilder: (context, index) {
              final profile = profiles[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: Text(profile.name),
                    subtitle: Text(profile.typeOfFare),
                    trailing: Text('\$${profile.amount.toStringAsFixed(2)}'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  TrainListScreen(train: train))));
                    },
                  ),
                ),
              );
            },
          );
        } else {
          return const Text('No data available.');
        }
      },
    );
  }
}

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

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

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

// List of Station instances
List<Station> trainStations = [
  Station(
      name: 'Station A',
      location: 'Location A',
      departureTime: DateTime.now(),
      arrivalTime: DateTime.now().add(const Duration(hours: 2))),
  Station(
      name: 'Station B',
      location: 'Location B',
      departureTime: DateTime.now(),
      arrivalTime: DateTime.now().add(const Duration(hours: 4))),
  Station(
      name: 'Station C',
      location: 'Location C',
      departureTime: DateTime.now(),
      arrivalTime: DateTime.now().add(const Duration(hours: 6))),
  // Add more stations and locations here
];

Future<List<Station>> fetchStationDetails() async {
  // Simulate a delay to mimic API call
  await Future.delayed(const Duration(seconds: 2));

  return trainStations;
}

// Create a Riverpod provider for the list of Station instances
final stationDetailsProvider = Provider<List<Station>>((ref) {
  return trainStations;
});

final selectedStationProvider = StateProvider<String>((ref) => 'Station A');

final passengerDetailsProvider =
    StateNotifierProvider<PassengerDetailsNotifier, PassengerDetails>(
  (ref) => PassengerDetailsNotifier(),
);

class PassengerDetails {
  final String fullName;
  final String age;
  final String gender;
  final String phoneNumber; // Added phoneNumber field
  final String email; // Added email field

  PassengerDetails({
    this.fullName = '',
    this.age = '',
    this.gender = 'Male',
    this.phoneNumber = '', // Default phoneNumber
    this.email = '', // Default email
  });

  PassengerDetails copyWith({
    String? fullName,
    String? age,
    String? gender,
    String? phoneNumber,
    String? email,
  }) {
    return PassengerDetails(
      fullName: fullName ?? this.fullName,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
    );
  }
}

class PassengerDetailsNotifier extends StateNotifier<PassengerDetails> {
  PassengerDetailsNotifier() : super(PassengerDetails());

  void updateFullName(String fullName) {
    state = state.copyWith(fullName: fullName);
  }

  void updateAge(String age) {
    state = state.copyWith(age: age);
  }

  void updateGender(String gender) {
    state = state.copyWith(gender: gender);
  }

  void updatePhoneNumber(String phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber);
  }

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void resetPassengerDetails() {
    state = PassengerDetails(); // Reset passenger details to initial state
  }

  bool validatePassengerDetails() {
    // Implement your validation logic here
    // Check if fullName, age, gender, phone number, email, etc. are valid
    // Return true if valid, false otherwise
    // You can use this method to validate details before proceeding
    return true;
  }

  void clearErrorMessages() {
    // Clear any error messages or flags related to passenger details validation
    // You can implement this if you have error handling in your app
  }
}
