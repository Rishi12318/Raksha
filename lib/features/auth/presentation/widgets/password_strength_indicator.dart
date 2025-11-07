import 'package:flutter/material.dart';

/// Password strength indicator with visual feedback
class PasswordStrengthIndicator extends StatelessWidget {
  final double strength; // 0.0 to 1.0

  const PasswordStrengthIndicator({
    super.key,
    required this.strength,
  });

  @override
  Widget build(BuildContext context) {
    Color getColor() {
      if (strength < 0.25) return Colors.red;
      if (strength < 0.5) return Colors.orange;
      if (strength < 0.75) return Colors.yellow;
      return Colors.green;
    }

    String getLabel() {
      if (strength < 0.25) return 'Weak';
      if (strength < 0.5) return 'Fair';
      if (strength < 0.75) return 'Good';
      return 'Strong';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: strength,
                  backgroundColor: Colors.white.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(getColor()),
                  minHeight: 6,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              getLabel(),
              style: TextStyle(
                color: getColor(),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
