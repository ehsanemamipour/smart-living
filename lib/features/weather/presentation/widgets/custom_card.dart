import 'package:flutter/material.dart';
import 'package:smart_living/core/theme/theme.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.icon,
    required this.bottomWidget,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final Widget icon;
  final Widget bottomWidget;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 158,
      width: 156,
      padding: const EdgeInsets.only(right: 14, left: 14, bottom: 16),
      decoration: BoxDecoration(
        color: theme.white.withOpacity(0.72),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: theme.textBlack.withOpacity(0.08),
              blurRadius: 16,
              offset: const Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: theme.primaryHeading,
              ),
              icon
            ],
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: theme.emphasisBody,
          ),
          const Spacer(),
          bottomWidget
        ],
      ),
    );
  }
}
