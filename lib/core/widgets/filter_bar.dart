import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _FilterBar extends StatelessWidget {
  const _FilterBar();

  @override
  Widget build(BuildContext context) {
    final filters = ["Sort By", "All Filter", "Rush Deal", "Location", "Pop"];

    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) => Chip(
          label: Text(filters[i]),
          backgroundColor: Colors.white,
        ),
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemCount: filters.length,
      ),
    );
  }
}
