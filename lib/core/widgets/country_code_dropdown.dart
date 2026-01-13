import 'package:flutter/material.dart';

class CountryDropdown extends StatefulWidget {
  const CountryDropdown({super.key});

  @override
  State<CountryDropdown> createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  String selected = "+91";

  final countries = [
    {"code": "+91", "label": "🇮🇳 India (+91)"},
    {"code": "+1", "label": "🇺🇸 USA (+1)"},
    {"code": "+44", "label": "🇬🇧 UK (+44)"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFF9FAFB),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selected,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: countries.map((c) {
            return DropdownMenuItem(
              value: c['code'],
              child: Text(c['label']!),
            );
          }).toList(),
          onChanged: (v) {
            setState(() => selected = v!);
          },
        ),
      ),
    );
  }
}
