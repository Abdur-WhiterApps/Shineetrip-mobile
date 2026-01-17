import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/stat_row.dart';
import '../../hotel/view/hotel_list_view.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../../../core/widgets/glass_feature_card.dart';
import '../../../core/widgets/destination_card.dart';
import '../../../core/widgets/contact_info_tile.dart';
import '../../../core/widgets/enquiry_container.dart';
import '../../../core/widgets/text_input.dart';
import '../../../core/widgets/primary_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController cityCtrl = TextEditingController(text: "Manali");
  final TextEditingController checkInCtrl =
  TextEditingController(text: "Fri, 21 Nov 2025");
  final TextEditingController checkOutCtrl =
  TextEditingController(text: "Fri, 21 Nov 2025");
  final TextEditingController roomCtrl =
  TextEditingController(text: "1 Room, 2 Adult");
  bool _showHotelSearch = false;
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadHomeData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _bottomNav(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                _showHotelSearch ? _hotelSearchWidget() : _glassFeatureSection(),
                const SizedBox(height: 16),


                const StatsRow(),

                const SizedBox(height: 28),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Popular Destinations",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 12),
                SizedBox(
                  height: 220,
                  child: ListView(
                    padding: const EdgeInsets.only(left: 16),
                    scrollDirection: Axis.horizontal,
                    children: const [
                      DestinationCard(
                        image: 'assets/images/popular.png',
                        title: 'New York',
                        subtitle: 'The glorious city of dreams',
                      ),
                      SizedBox(width: 12),
                      DestinationCard(
                        image: 'assets/images/Hotelgs.jpg',
                        title: 'Paris',
                        subtitle: 'City of love',
                      ),
                      SizedBox(width: 12),
                      DestinationCard(
                        image: 'assets/images/hotel.jpg',
                        title: 'Dubai',
                        subtitle: 'Luxury & skyline',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),


                _testimonialSection(),

                const SizedBox(height: 40),


                _getInTouchSection(),

                const SizedBox(height: 24),

                _enquirySection(context),
              ],
            ),
          );
        },
      ),
    );
  }


  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black),
        onPressed: () {},
      ),
      title: Image.asset('assets/images/logo.png', height: 28),
      centerTitle: true,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage('assets/images/TajHotel.jpg'),
          ),
        ),
      ],
    );
  }

  Widget _glassFeatureSection() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/hotel.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _showHotelSearch = true;
              });
            },
            child: const GlassFeatureCard(
              icon: Icons.hotel,
              title: "Hotels",
            ),
          ),
          const GlassFeatureCard(icon: Icons.flight, title: "Flights"),
          const GlassFeatureCard(icon: Icons.train, title: "Trains"),
          const GlassFeatureCard(icon: Icons.directions_bus, title: "Bus"),
          const GlassFeatureCard(icon: Icons.event, title: "Events"),
          const GlassFeatureCard(icon: Icons.card_travel, title: "Packages"),
        ],
      ),
    );
  }

  Widget _testimonialSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF2E3F3C),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Traveler Testimonials",
                style: TextStyle(color: Colors.white, fontSize: 18)),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
              ],
            ),
            SizedBox(height: 12),
            Text(
              "Our honeymoon in Manali was nothing short of magical. "
                  "The itinerary was perfectly planned and unforgettable.",
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 12),
            Text(
              "— Priya & Rahul Sharma, Mumbai",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getInTouchSection() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("We Would Love to Hear From You",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          ContactInfoTile(
            icon: Icons.call,
            title: "CALL US",
            value: "+91 98765 43210",
            subtitle: "Available 24/7",
          ),
          SizedBox(height: 16),
          ContactInfoTile(
            icon: Icons.email,
            title: "EMAIL US",
            value: "info@shineetrip.com",
            subtitle: "Response within 2 hours",
          ),
          SizedBox(height: 16),
          ContactInfoTile(
            icon: Icons.location_on,
            title: "OUR OFFICES",
            value: "Himachal | Mumbai",
            subtitle: "Chandigarh | Kathmandu",
          ),
        ],
      ),
    );
  }

  Widget _enquirySection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          EnquiryContainer(
            child: Column(
              children: const [
                TextInput(hint: "First Name"),
                SizedBox(height: 10),
                TextInput(hint: "Last Name"),
                SizedBox(height: 10),
                TextInput(hint: "Email Address"),
                SizedBox(height: 10),
                TextInput(hint: "Phone Number"),
                SizedBox(height: 10),
                TextInput(hint: "Preferred Destination"),
                SizedBox(height: 10),
                TextInput(hint: "Your Message"),
              ],
            ),
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            title: "Send Enquiry",
            onTap: () {
              context.read<HomeBloc>().add(SubmitEnquiry());
            },
          ),
        ],
      ),
    );
  }

  BottomNavigationBar _bottomNav() {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: const Color(0xFFC9A24D),
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
      ],
    );
  }
  Widget _hotelSearchWidget() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/hotel.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _searchInputTile(
            label: "CITY, AREA OR PROPERTY",
            controller: cityCtrl,
            icon: Icons.location_on,
          ),
          const SizedBox(height: 12),

          _searchInputTile(
            label: "CHECK-IN",
            controller: checkInCtrl,
            icon: Icons.calendar_today,
            readOnly: true,
            onTap: () {
            },
          ),
          const SizedBox(height: 12),

          _searchInputTile(
            label: "CHECK-OUT",
            controller: checkOutCtrl,
            icon: Icons.calendar_today,
            readOnly: true,
            onTap: () {
            },
          ),
          const SizedBox(height: 12),

          _searchInputTile(
            label: "ROOM & GUEST",
            controller: roomCtrl,
            icon: Icons.people,
            readOnly: true,
            onTap: () {
            },
          ),

          const SizedBox(height: 16),
          _priceRow(),
          const SizedBox(height: 16),

          PrimaryButton(
            title: "Search",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const HotelListView(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _searchInputTile({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          icon: Icon(icon, color: const Color(0xFFC9A24D)),
          labelText: label,
          border: InputBorder.none,
        ),
      ),
    );
  }


  Widget _priceRow() {
    final prices = ["₹0 - ₹1500", "₹1500 - ₹2500", "₹2500 - ₹5000", "₹5000+"];

    return Wrap(
      spacing: 8,
      children: prices
          .map(
            (p) => Chip(
          label: Text(p),
          backgroundColor: Colors.white,
        ),
      )
          .toList(),
    );
  }
}
