import 'package:flutter/material.dart';

class CouponCard extends StatelessWidget {
  final String code;
  final String amount;

  const CouponCard({
    super.key,
    required this.code,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                code,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Coupon discount Amount of ₹100\nApplied",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          Text(
            "₹$amount",
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
