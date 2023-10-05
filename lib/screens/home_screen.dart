import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:real_metro/screens/ticket_screen.dart';

import '../models/user.dart';
import '../shared_widget.dart/reusable_dropdown_container.dart';
import '../shared_widget.dart/train_details_widget.dart';
import 'available_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';
import "dart:ui_web";

import 'package:real_metro/models/train.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.userName});
  final String userName;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final logger = Logger();

  void _onSearchTicketsPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyTicketsScreen()),
    ).then((value) {
      // This code block will be executed when returning from the ProfilePage
      Navigator.pop(context);
    });
  }

  Train? selectedTrain = Train.trainList[0];
  final List<Train> trainList = Train.trainList;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    User user = User(
      firstName: '',
      lastName: '',
      phoneNumber: '',
      email: '',
      password: '',
      picture:
          'https://scontent.fabv2-2.fna.fbcdn.net/v/t1.18169-9/429991_121524334639716_1908521857_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFrIqg8hn1nqYMQ4sL-lk1h7VdRlB21WTXtV1GUHbVZNRCxsdUbdtCN2m5UO1RZchgP9nUEhB-UGWdO2qzTne-f&_nc_ohc=mSxd1S3or-oAX8pBW0A&_nc_ht=scontent.fabv2-2.fna&oh=00_AfCh4B_QHXcrB_33c4E-zR5sWKCsBCZim3QIBMTuCJqsBw&oe=64F73137',
    );
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black38),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePage(
                          userName: '',
                        )),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('${user.firstName} ${user.lastName}'),
              accountEmail: Text(user.email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(user.picture),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                logger.d('Tapped Home');
                // Navigate to home screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(
                            userName: '',
                          )),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to settings screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(
                      userName: '',
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('History'),
              onTap: () {
                // Navigate to history screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.description),
              title: const Text('Terms and Condition'),
              onTap: () {
                // Navigate to terms and condition screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Privacy & Policy'),
              onTap: () {
                // Navigate to privacy & policy screen
              },
            ),
            const Divider(),
            const SizedBox(
              height: 78,
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Perform logout action
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Change this based on selected tab
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event, color: Colors.black),
            label: 'My Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.black),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          logger.d('Tapped index: $index');
          // Handle bottom navigation item tap
          switch (index) {
            case 0:
              // Navigate to HomeScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(
                          userName: '',
                        )),
              );
              break;
            case 1:
              // Navigate to SearchScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
              break;
            case 2:
              // Navigate to MyTicketsScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyTicketsScreen()),
              );
              break;
            case 3:
              // Navigate to SettingsScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SettingsScreen(
                          userName: '',
                        )),
              );
              break;
          }
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text('Hello! ${widget.userName}'),
              const SizedBox(height: 4),
              const Text(
                'Where are you going?',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 14),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 298 + 89,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 162, 146, 146)
                      .withOpacity(0.9)
                      .withAlpha(144),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(23, 29, 23, 29),
                  child: Column(
                    children: [
                      ReusableDropdownContainer(
                        labelText: 'Departure Station',
                        selectedValue:
                            selectedTrain?.departure ?? 'Select Departure',
                        trainList: trainList,
                        onSelected: (Train? newValue) {
                          setState(() {
                            selectedTrain = newValue;
                          });
                        },
                        displayProperty: 'departure',
                        width: width * 0.9,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ReusableDropdownContainer(
                        width: width * 0.9,
                        labelText: 'Arrival Station',
                        selectedValue:
                            selectedTrain?.arrival ?? 'Select Arrival',
                        trainList: trainList,
                        onSelected: (Train? newValue) {
                          setState(() {
                            selectedTrain = newValue;
                          });
                        },
                        displayProperty: 'arrival',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ReusableDropdownContainer(
                            width: screenWidth * 0.30,
                            labelText: 'Arrival Station',
                            selectedValue:
                                selectedTrain?.arrival ?? 'Select Arrival',
                            trainList: trainList,
                            onSelected: (Train? newValue) {
                              setState(() {
                                selectedTrain = newValue;
                              });
                            },
                            displayProperty: 'arrival',
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          ReusableDropdownContainer(
                            width: screenWidth * 0.30,
                            labelText: 'Duration',
                            selectedValue:
                                selectedTrain?.duration ?? 'Select Duration',
                            trainList: trainList,
                            onSelected: (Train? newValue) {
                              setState(() {
                                selectedTrain = newValue;
                              });
                            },
                            displayProperty: 'duration',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      ElevatedButton(
                        onPressed: () => _onSearchTicketsPressed(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF042D97),
                          fixedSize: const Size(270, 50),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text("Search for Tickets"),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 26),
              TrainListWidget(trainListFuture: fetchTrainList()),
            ],
          ),
        ),
      ),
    );
  }
}

Future<List<Train>> fetchTrainList() async {
  await Future.delayed(const Duration(seconds: 2)); // Simulate API call delay
  return Train.trainList;
}

class TrainListWidget extends StatelessWidget {
  final Future<List<Train>> trainListFuture;

  const TrainListWidget({required this.trainListFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Train>>(
      future: trainListFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          final trainList = snapshot.data!;
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: trainList.length,
            itemBuilder: (context, index) {
              final train = trainList[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AvailableExpress(
                        train: train,
                      ),
                    ),
                  );
                },
                child: TrainDetailsWidget(train),
              );
            },
          );
        } else if (snapshot.hasError) {
          // Handle error cases here
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return const Center(
            child: Text('No data available.'),
          );
        }
      },
    );
  }
}

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    Key? key,
    required this.buttonLabel,
    required this.onPressed,
  }) : super(key: key);
  final String buttonLabel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 60),
        backgroundColor: const Color(0xFF0D6EFD),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Center(
        child: Text(buttonLabel),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Screen'),
      ),
      body: const Center(
        child: Text('This is the Search Screen'),
      ),
    );
  }
}
