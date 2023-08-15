import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:real_metro/screens/ticket_screen.dart';

import 'profile_screen.dart';
import 'settings_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(userName: 'John Doe'),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.userName});
  final logger = Logger();
  final String userName;

  void _onSearchTicketsPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProfilePage(
                userName: "",
              )),
    ).then((value) {
      // This code block will be executed when returning from the ProfilePage
      Navigator.pop(context);
      // Add any necessary actions or logic here.
    });
  }

  @override
  Widget build(BuildContext context) {
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
            const UserAccountsDrawerHeader(
              accountName: Text('Soloanke Abdullah'),
              accountEmail: Text('solankeabdullah@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://scontent.fabv2-2.fna.fbcdn.net/v/t1.18169-9/429991_121524334639716_1908521857_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFrIqg8hn1nqYMQ4sL-lk1h7VdRlB21WTXtV1GUHbVZNRCxsdUbdtCN2m5UO1RZchgP9nUEhB-UGWdO2qzTne-f&_nc_ohc=mSxd1S3or-oAX8pBW0A&_nc_ht=scontent.fabv2-2.fna&oh=00_AfCh4B_QHXcrB_33c4E-zR5sWKCsBCZim3QIBMTuCJqsBw&oe=64F73137'),
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
              Text('Hello! $userName'),
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
                      Stack(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          SharedContainer(
                            title: 'Departure Station',
                            description: 'Ikeja, Lagos',
                            height: 66,
                            width: (mediaQueryData) =>
                                mediaQueryData.size.height,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          const Positioned(
                            right: 8,
                            top: 8,
                            child: Icon(Icons.swap_vert_circle),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Stack(
                        children: [
                          SharedContainer(
                            title: "Arrival station",
                            description: 'Ibadan, Oyo state',
                            height: 66,
                            width: (mediaQueryData) =>
                                mediaQueryData.size.height,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          const Positioned(
                            right: 8,
                            top: 8,
                            child: Icon(Icons.swap_vert_circle),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: SharedContainer(
                              title: "Departure",
                              description: 'Jun 24, 2023',
                              height: 64,
                              width: (mediaQueryData) =>
                                  mediaQueryData.size.width * 0.40,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          SharedContainer(
                            title: "Arrival station",
                            description: 'Jun 24, 2023',
                            height: 64,
                            width: (mediaQueryData) =>
                                mediaQueryData.size.width * 0.40,
                            borderRadius: BorderRadius.circular(20),
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
              UpcomingTicketsContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class SharedContainer extends StatelessWidget {
  final String title;
  final String description;
  final double height;
  final double Function(MediaQueryData) width;
  final BorderRadius borderRadius;
  const SharedContainer({
    super.key,
    required this.title,
    required this.description,
    this.height = 60,
    required this.width,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height,
              width: width(MediaQuery.of(context)),
              decoration: BoxDecoration(
                color: const Color(0xFFFDFDFD),
                border: Border.all(color: Colors.blueAccent, width: 1),
                borderRadius: borderRadius,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 3),
                    blurRadius: 6,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 12),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class UpcomingTicketsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String currentTime = DateTime.now().toString();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Upcoming  Tickets',
              style: TextStyle(
                  color: Color(0xFF042D97), fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            height: 64,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 162, 146, 146)
                  .withOpacity(0.9)
                  .withAlpha(144),
              border: Border.all(style: BorderStyle.none),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Departure"),
                          SizedBox(
                            height: 4,
                          ),
                          Text("Guse Abuja")
                        ],
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Icon(Icons.forward_10_rounded),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text("Departure"),
                        SizedBox(
                          height: 4,
                        ),
                        Text("Guse Abuja")
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            // ignore: sized_box_for_whitespace
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 46,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 162, 146, 146)
                    .withOpacity(0.9)
                    .withAlpha(144),
                border: Border.all(style: BorderStyle.none),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Date: Sep 10 2023',
                    style: TextStyle(fontSize: 14, color: Color(0xFF042D97)),
                  ),
                  // Add a vertical divider
                  Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.access_time,
                            size: 12,
                            color: Color(0xFF042D97),
                          ),
                          SizedBox(
                            width: 1.2,
                          ),
                          Text(
                            '20:00',
                            style: TextStyle(
                                color: Color(0xFF042D97), fontSize: 12),
                          ),
                        ]),
                  ),

                  Row(
                    children: const [
                      Text(
                        'Duration: 9 hours',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF042D97)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            height: 64,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 162, 146, 146)
                  .withOpacity(0.9)
                  .withAlpha(144),
              border: Border.all(style: BorderStyle.none),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Departure"),
                          SizedBox(
                            height: 4,
                          ),
                          Text("Guse Abuja")
                        ],
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Icon(Icons.forward_10_rounded),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text("Departure"),
                        SizedBox(
                          height: 4,
                        ),
                        Text("Guse Abuja")
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            // ignore: sized_box_for_whitespace
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 46,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 162, 146, 146)
                    .withOpacity(0.9)
                    .withAlpha(144),
                border: Border.all(style: BorderStyle.none),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Date: Sep 10 2023',
                    style: TextStyle(fontSize: 14, color: Color(0xFF042D97)),
                  ),

                  // Add a vertical divider
                  Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.access_time,
                            size: 12,
                            color: Color(0xFF042D97),
                          ),
                          SizedBox(
                            width: 1.2,
                          ),
                          Text(
                            '20:00',
                            style: TextStyle(
                                color: Color(0xFF042D97), fontSize: 12),
                          ),
                        ]),
                  ),
                  // Add another vertical divider
                  Row(
                    children: const [
                      Text(
                        'Duration: 9 hours',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF042D97)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
