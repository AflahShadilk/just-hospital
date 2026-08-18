import 'package:flutter/material.dart';
import 'package:justhospital/core/app/theme/app_theme.dart';

class HospitalSearchField extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const HospitalSearchField({
    super.key,
    required this.onChanged,
  });

  @override
  State<HospitalSearchField> createState() =>
      _HospitalSearchFieldState();
}

class _HospitalSearchFieldState
    extends State<HospitalSearchField> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _searchController.clear();

    widget.onChanged('');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: TextField(
        controller: _searchController,
        onChanged: widget.onChanged,
        textInputAction: TextInputAction.search,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          hintText: 'Search hospitals or specialities',
          prefixIcon: const Icon(
            Icons.search_rounded,
          ),
          suffixIcon: ValueListenableBuilder<TextEditingValue>(
            valueListenable: _searchController,
            builder: (
              context,
              value,
              child,
            ) {
              if (value.text.isEmpty) {
                return const SizedBox.shrink();
              }

              return IconButton(
                onPressed: _clearSearch,
                tooltip: 'Clear search',
                icon: const Icon(
                  Icons.close_rounded,
                ),
                color: AppTheme.secondaryTextColor,
              );
            },
          ),
        ),
      ),
    );
  }
}