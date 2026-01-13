import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/stat_row.dart';
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


                _glassFeatureSection(),

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
                        image: 'assets/images/newyork.jpg',
                        title: 'New York',
                        subtitle: 'The glorious city of dreams',
                      ),
                      SizedBox(width: 12),
                      DestinationCard(
                        image: 'assets/images/paris.jpg',
                        title: 'Paris',
                        subtitle: 'City of love',
                      ),
                      SizedBox(width: 12),
                      DestinationCard(
                        image: 'assets/images/dubai.jpg',
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
            backgroundImage: AssetImage('assets/images/profile.png'),
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
          image: AssetImage('assets/images/banner.jpg'),
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
        children: const [
          GlassFeatureCard(icon: Icons.hotel, title: "Hotels"),
          GlassFeatureCard(icon: Icons.flight, title: "Flights"),
          GlassFeatureCard(icon: Icons.train, title: "Trains"),
          GlassFeatureCard(icon: Icons.directions_bus, title: "Bus"),
          GlassFeatureCard(icon: Icons.event, title: "Events"),
          GlassFeatureCard(icon: Icons.card_travel, title: "Packages"),
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
}
