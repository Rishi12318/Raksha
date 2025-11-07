import 'package:flutter/material.dart';

/// Social authentication buttons (Google, Facebook, Apple)
class SocialAuthButtons extends StatelessWidget {
  const SocialAuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialButton(
          icon: Icons.g_mobiledata,
          label: 'Google',
          onTap: () {
            // TODO: Implement Google Sign In
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Google Sign In coming soon')),
            );
          },
        ),
        const SizedBox(width: 16),
        _SocialButton(
          icon: Icons.facebook,
          label: 'Facebook',
          onTap: () {
            // TODO: Implement Facebook Sign In
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Facebook Sign In coming soon')),
            );
          },
        ),
        const SizedBox(width: 16),
        _SocialButton(
          icon: Icons.apple,
          label: 'Apple',
          onTap: () {
            // TODO: Implement Apple Sign In
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Apple Sign In coming soon')),
            );
          },
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _SocialButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
