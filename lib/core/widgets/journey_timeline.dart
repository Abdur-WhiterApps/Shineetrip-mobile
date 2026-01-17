import 'package:flutter/material.dart';

class JourneyTimeline extends StatelessWidget {
  const JourneyTimeline({super.key});

  static const Color golden = Color(0xFFC9A24D);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _timeBox("11:55PM, 12 Nov", "New Delhi"),
        Expanded(child: _dotLine()),
        _timeBox("6:25 AM, 13 Nov", "Kanpur Central"),
      ],
    );
  }

  Widget _dotLine() => Row(
    children: [
      _dot(),
      const Expanded(child: Divider()),
      _dot(),
    ],
  );

  Widget _dot() => Container(
    width: 6,
    height: 6,
    decoration: const BoxDecoration(
      color: golden,
      shape: BoxShape.circle,
    ),
  );

  Widget _timeBox(String time, String city) => Column(
    children: [
      Text(time,
          style: const TextStyle(fontWeight: FontWeight.w600)),
      const SizedBox(height: 2),
      Text(city, style: const TextStyle(fontSize: 12)),
    ],
  );
}
