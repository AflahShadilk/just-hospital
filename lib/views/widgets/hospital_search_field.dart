import 'package:flutter/material.dart';

class HospitalSearchField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const HospitalSearchField({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: TextField(
        onChanged: onChanged,
        textInputAction: TextInputAction.search,
        decoration: const InputDecoration(
          hintText: 'Search hospital or speciality',
          prefixIcon: Icon(
            Icons.search,
          ),
        ),
      ),
    );
  }
}