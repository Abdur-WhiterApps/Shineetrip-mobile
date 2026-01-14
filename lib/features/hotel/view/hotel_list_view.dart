import 'package:flutter/material.dart';
import '../../../core/widgets/hotel_card.dart';
import '../../../core/widgets/filter_bar.dart';
import '../../../core/widgets/primary_button.dart';

class HotelListView extends StatelessWidget {
  const HotelListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: _appBar(context),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
         // _FilterBar(),
          SizedBox(height: 12),
          Text(
            "Showing Properties in Lucknow",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          HotelCard(),
          SizedBox(height: 16),
          HotelCard(),
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lucknow",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          Text(
            "23 NOV - 24 NOV, 1 ROOM, 2 GUEST",
            style: TextStyle(fontSize: 11, color: Colors.grey),
          ),
        ],
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Text(
            "INR",
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    );
  }
}
