import 'package:flutter/material.dart';
import '../../../core/widgets/payment_success_card.dart';
import '../../../core/widgets/journey_timeline.dart';
import '../../../core/widgets/billing_breakdown.dart';
import '../../../core/widgets/policies_rules_section.dart';

class PaymentDoneView extends StatelessWidget {
  const PaymentDoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: _appBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const PaymentSuccessCard(),
            const SizedBox(height: 20),

            const Text(
              "Thank Johan Doe for choosing Shinettrip",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            const Text(
              "A confirmation email has been sent to JohanDoe@gmail.com.",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),

            const SizedBox(height: 20),

            /// TRAIN + TICKET SAME ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Shram Shkti Exp",
                    style: TextStyle(fontWeight: FontWeight.w700)),
                Text("ShineTicket ID: BS002485",
                    style: TextStyle(fontSize: 12)),
              ],
            ),
            const SizedBox(height: 4),
            const Text("22121 (Tuesday)",
                style: TextStyle(color: Colors.grey)),

            const SizedBox(height: 14),
            const JourneyTimeline(),

            const SizedBox(height: 24),

            const Text(
              "Cost and billing Information",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),

            const BillingBreakdown(),
            const SizedBox(height: 24),
            const PoliciesRulesSection(),

          ],
        ),
      ),
    );
  }

  AppBar _appBar() => AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: const Icon(Icons.menu, color: Colors.black),
    title: const Text("SHINEETRIP",
        style: TextStyle(color: Colors.black)),
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 12),
        child: CircleAvatar(radius: 16),
      ),
    ],
  );
}
