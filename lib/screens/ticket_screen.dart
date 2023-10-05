import 'package:flutter/material.dart';

import 'package:real_metro/models/train.dart';
import 'package:real_metro/screens/available_screen.dart';
import 'package:real_metro/shared_widget.dart/train_details_widget.dart';

class MyTicketsScreen extends StatelessWidget {
  const MyTicketsScreen({Key? key}) : super(key: key);

  // Asynchronously fetch the train list
  Future<List<Train>> _fetchTrainList() async {
    return Train.trainList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 30,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8),
                  prefixIcon: const Icon(Icons.search_outlined),
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder<List<Train>>(
                future: _fetchTrainList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    final trainList = snapshot.data!;
                    return ListView.builder(
                      itemCount: trainList.length,
                      itemBuilder: (context, index) {
                        final train = trainList[index];
                        return Column(children: [
                          InkWell(
                            onTap: () {
                              // Navigate to the "Call" page when the container is tapped
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
                          ),
                        ]);
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
      ),
    );
  }
}
