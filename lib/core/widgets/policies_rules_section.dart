import 'package:flutter/material.dart';

class PoliciesRulesSection extends StatelessWidget {
  const PoliciesRulesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Policies, Rules and Restrictions",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 8),
          Text(
            "• Airlines require government issued photo identification upon check-in.\n\n"
                "• Any changes to your flight reservations may incur additional airline charges.\n\n"
                "• Passenger visa and health requirements may apply for this itinerary.\n\n"
                "• Please read important information governing airline baggage liability limitations.",
            style: TextStyle(
              fontSize: 13.5,
              height: 1.45,
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w400,
            ),
          ),

        ],
      ),
    );
  }
}
