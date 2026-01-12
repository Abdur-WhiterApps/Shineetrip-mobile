import 'package:flutter/material.dart';

class CountryCodeDropdown extends StatefulWidget {
  const CountryCodeDropdown({super.key});

  @override
  State<CountryCodeDropdown> createState() => _CountryCodeDropdownState();
}

class _CountryCodeDropdownState extends State<CountryCodeDropdown> {
  String selected = "+91";

  final List<Map<String, String>> countries = [
    {"code": "+91", "name": "India"},
    {"code": "+1", "name": "USA"},
    {"code": "+44", "name": "UK"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selected,
          isExpanded: true,
          items: countries.map((c) {
            return DropdownMenuItem(
              value: c['code'],
              child: Text("🇮🇳 ${c['name']} (${c['code']})"),
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
