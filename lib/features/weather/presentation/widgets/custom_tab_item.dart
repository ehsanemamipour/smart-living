import 'package:flutter/material.dart';
import 'package:smart_living/core/theme/theme.dart';

class CustomTabItem extends StatelessWidget {
  const CustomTabItem({
    Key? key,
    required this.isSelected,
    required this.title,
  }) : super(key: key);

  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          title,
          style: theme.emphasisBody.copyWith(
            color: isSelected ? null : theme.textBlack.withOpacity(0.5),
          ),
        ),
        const SizedBox(height: 4),
        if (isSelected)
          Container(
            height: 4,
            width: 48,
            decoration: BoxDecoration(
              color: theme.orange,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        if (!isSelected) const SizedBox(height: 4),
      ],
    );
  }
}
