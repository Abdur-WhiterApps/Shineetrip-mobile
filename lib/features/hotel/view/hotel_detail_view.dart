import 'package:flutter/material.dart';
import 'package:shineetrip_mobile/core/theme/app_colors.dart';
import 'package:shineetrip_mobile/features/booking/view/book_hotel_view.dart';

import '../../../core/widgets/image_carousel.dart';
import '../../../core/widgets/room_price_card.dart';

class HotelDetailView extends StatefulWidget {
  const HotelDetailView({super.key});

  @override
  State<HotelDetailView> createState() => _HotelDetailViewState();
}

class _HotelDetailViewState extends State<HotelDetailView> {
  int selectedRoomIndex = 2;

  final List<String> roomImages = [
    'assets/images/bed1.jpg',
    'assets/images/bed2.jpg',
    'assets/images/bed3.jpg',
    'assets/images/bed1.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildSearchCard(),
          _buildFilterChips(),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hotel The Ventus Near Mall Road",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Mahipalpur | 1.5km drive to Mall Road",
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),

                  const SizedBox(height: 16),

                  _roomTile("Deluxe Room", 0),
                  _roomTile("Suites Extra Deluxe Room", 1),
                  _roomTile("Standard Room", 2),

                  const SizedBox(height: 16),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: ImageCarousel(
                      images: roomImages,
                      height: 230,
                      viewportFraction: 1,
                      autoPlay: false,
                    ),
                  ),

                  const SizedBox(height: 10),

                  SizedBox(
                    height: 70,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: roomImages.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (_, i) => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          roomImages[i],
                          width: 90,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const RoomPriceCard(
                    title: "Room Only",
                    subtitle: "Standard Rate",
                    price: "2,389",
                    oldPrice: "3,690",
                    highlight: true,
                  ),

                  const RoomPriceCard(
                    title: "Bed & Breakfast",
                    subtitle: "Standard Rate",
                    price: "2,389",
                    oldPrice: "3,690",
                  ),

                  const RoomPriceCard(
                    title: "Room With Breakfast, Lunch or Dinner",
                    subtitle: "Standard Rate",
                    price: "2,389",
                    oldPrice: "3,690",
                  ),

                  const SizedBox(height: 16),

                  _priceActionRow(),

                  const SizedBox(height: 24),

                  _buildReviewsSection(),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceActionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "INR 2,389",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.green,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => BookHotelView()),
            );
          },
          child: const Text(
            "Book Now",
            style: TextStyle(
              color: AppColors.background,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _roomTile(String title, int index) {
    final selected = selectedRoomIndex == index;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: selected ? Colors.black : Colors.grey.shade300,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade800,
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }

  Widget _buildReviewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Review By Customer",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        _reviewCard(),
      ],
    );
  }

  Widget _reviewCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              CircleAvatar(radius: 18),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  "Adeeb Smiths\n6 years on shine trip",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Icon(Icons.star, size: 14, color: Colors.green),
              Icon(Icons.star, size: 14, color: Colors.green),
              Icon(Icons.star, size: 14, color: Colors.green),
              Icon(Icons.star, size: 14, color: Colors.green),
              Icon(Icons.star, size: 14, color: Colors.green),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "Lorem ipsum trare kaling. Var. Dovis dra at helvete...",
            style: TextStyle(fontSize: 13),
          ),
          const SizedBox(height: 10),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.grey.shade300, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: const Text(
              "Show more",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: const Icon(Icons.menu, color: Colors.black),
    title: const Text(
      "SHINEETRIP",
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
    ),
  );

  Widget _buildSearchCard() => Container(
    margin: const EdgeInsets.all(12),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Row(
      children: const [
        Icon(Icons.arrow_back_ios_new, size: 16),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            "LUCKNOW\n23 NOV – 24 NOV, 1 ROOM, 2 GUEST",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Text("INR"),
        Icon(Icons.keyboard_arrow_down),
      ],
    ),
  );

  Widget _buildFilterChips() => SizedBox(
    height: 42,
    child: ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      children: [
        _chip("Sort By"),
        _chip("Filter"),
        _chip("Rush Deal"),
        _chip("Location"),
      ],
    ),
  );

  Widget _chip(String t) => Container(
    margin: const EdgeInsets.only(right: 8),
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(t, style: const TextStyle(fontSize: 12)),
  );
}
