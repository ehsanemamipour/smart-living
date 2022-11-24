import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_living/core/theme/theme.dart';

class CustomIconBox extends StatelessWidget {
  const CustomIconBox({
    Key? key,
    required this.isSelected,
    required this.title,
    required this.path,
    required this.height,
    required this.width,
  }) : super(key: key);

  final bool isSelected;
  final String title;
  final String path;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          height: 56,
          width: 56,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: isSelected
                ? theme.textBlack
                : theme.textBlack.withOpacity(0.05),
          ),
          child: SvgPicture.asset(
            path,
            color: isSelected ? theme.white : theme.textBlack,
            width: width,
            height: height,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: theme.smallEmphasisBody.copyWith(
            color: isSelected ? null : theme.textBlack.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
