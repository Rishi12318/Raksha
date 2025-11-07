import 'package:flutter/material.dart';
import '../../../../core/widgets/real_time_circle.dart';

/// Demo screen showcasing the RealTimeCircle component
class RealTimeCircleDemo extends StatelessWidget {
  const RealTimeCircleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-Time Circle Demo'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Real-Time Circle Component with Lottie Animation
                RealTimeCircle(
                  size: 250,
                  showControls: true,
                  initialRotation: 0.0,
                  useLottieAnimation: true,
                  lottieAssetPath: 'assets/animations/clock.json',
                  onRotationChanged: (rotation) {
                    // Optional: Handle rotation changes
                    debugPrint('Current rotation: $rotation degrees');
                  },
                ),
                const SizedBox(height: 48),
                
                // Instructions
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'How to Use',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 16),
                        _buildInstruction(
                          context,
                          Icons.add,
                          'Add',
                          'Adds 90° to the rotation',
                          Colors.green,
                        ),
                        const SizedBox(height: 12),
                        _buildInstruction(
                          context,
                          Icons.remove,
                          'Sub',
                          'Subtracts 90° from the rotation',
                          Colors.red,
                        ),
                        const SizedBox(height: 12),
                        _buildInstruction(
                          context,
                          Icons.close,
                          'Mul',
                          'Multiplies the rotation by 0.5',
                          Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                
                // Customization Example (Custom Drawn)
                Text(
                  'Custom Drawn Example',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                RealTimeCircle(
                  size: 180,
                  showControls: true,
                  initialRotation: 45.0,
                  color: Colors.purple,
                  useLottieAnimation: false, // Use custom drawn clock
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInstruction(
    BuildContext context,
    IconData icon,
    String title,
    String description,
    Color color,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

