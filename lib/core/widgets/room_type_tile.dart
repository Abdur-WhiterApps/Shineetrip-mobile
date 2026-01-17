import 'package:flutter/material.dart';

class RoomTypeTile extends StatelessWidget {
  final String title;
  final bool selected;

  const RoomTypeTile({
    super.key,
    required this.title,
    this.selected = false, required void Function() onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: selected ? Colors.black : Colors.grey.shade300,
            width: selected ? 2 : 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(fontWeight: FontWeight.w500)),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
