import 'package:flutter/material.dart';

class FareSummaryCard extends StatelessWidget {
  const FareSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Fare Summary",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),

        _row("Base Fare per adult", "₹662"),
        _row("Reservation Charge", "₹40"),
        _row("Superfast charge", "₹55"),
        _row("Travel fare", "₹300"),

        const Divider(height: 24),

        _row(
          "Total Price per adult",
          "₹1100",
          isBold: true,
        ),

        const SizedBox(height: 14),

        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC9A24D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {},
            child: const Text(
              "Confirm & Pay",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _row(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
