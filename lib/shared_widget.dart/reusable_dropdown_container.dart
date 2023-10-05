import 'package:flutter/material.dart';

import '../models/train.dart';

class ReusableDropdownContainer extends StatelessWidget {
  final double? width;
  final String labelText;
  final String selectedValue;
  final List<Train> trainList;
  final ValueChanged<Train?> onSelected;
  final String displayProperty;

  ReusableDropdownContainer({
    Key? key,
    this.width, // Change `double width` to `double? width`
    required this.labelText,
    required this.selectedValue,
    required this.trainList,
    required this.onSelected,
    required this.displayProperty,
  });

  @override
  Widget build(BuildContext context) {
    final double containerWidth = width ?? MediaQuery.of(context).size.width;
    // Use the provided width if not null, otherwise use 90% of screen width

    final borderRadius = BorderRadius.circular(10);

    return Container(
      width: containerWidth, // Use the calculated width
      height: 66,
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
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  labelText,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
                  overflow: TextOverflow
                      .ellipsis, // Truncate and add ellipsis if necessary
                  maxLines: 1, // Display only one line of text
                ),
              ],
            ),
          ),
          Text(
            selectedValue,
            style: TextStyle(fontSize: 18),
          ),
          PopupMenuButton<Train>(
            icon: Icon(Icons.arrow_drop_down, color: Colors.blueAccent),
            onSelected: onSelected,
            itemBuilder: (BuildContext context) {
              return trainList.map((Train train) {
                return PopupMenuItem<Train>(
                  value: train,
                  child: Text(_getPropertyValue(
                      train)), // Display the specified property
                );
              }).toList();
            },
          ),
        ],
      ),
    );
  }

  String _getPropertyValue(Train train) {
    switch (displayProperty) {
      case 'departure':
        return train.departure;
      case 'arrival':
        return train.arrival;
      case 'duration':
        return train.duration;
      default:
        return '';
    }
  }
}
