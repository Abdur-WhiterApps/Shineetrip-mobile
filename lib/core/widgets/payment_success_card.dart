import 'package:flutter/material.dart';

class PaymentSuccessCard extends StatelessWidget {
  const PaymentSuccessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2ECC71), Color(0xFF1E8449)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: const [
          Icon(Icons.check_circle_outline,
              color: Colors.white, size: 48),
          SizedBox(height: 10),
          Text(
            "Payment Done",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10),
          Text(
            "Flight availability can change quickly due to fluctuating fares. "
                "If booking fails within 72 hours, full refund will be issued.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
