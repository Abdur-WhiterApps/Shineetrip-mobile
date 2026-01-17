import 'package:flutter/material.dart';

class TravelAdvisoryBox extends StatelessWidget {
  const TravelAdvisoryBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFC9A24D)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.info_outline, size: 18, color: Color(0xFFC9A24D)),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  "Please read health advisories by relevant authorities.",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Text(
                "KNOW MORE",
                style: TextStyle(
                  fontSize: 11,
                  color: Color(0xFFC9A24D),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "By proceeding with the booking, I confirm that I have and I accept the Cancellation & Refund Policy, Privacy Policy, User Agreement and Terms of Services",
            style: TextStyle(fontSize: 11, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
