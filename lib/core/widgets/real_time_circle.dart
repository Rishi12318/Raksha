import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// A real-time animated circle component with rotation controls
class RealTimeCircle extends StatefulWidget {
  /// Initial rotation angle in degrees
  final double initialRotation;
  
  /// Circle size
  final double size;
  
  /// Circle color
  final Color? color;
  
  /// Whether to show control buttons
  final bool showControls;
  
  /// Whether to use Lottie animation instead of custom drawn clock
  final bool useLottieAnimation;
  
  /// Path to Lottie animation file (if useLottieAnimation is true)
  final String? lottieAssetPath;
  
  /// Callback when rotation changes
  final ValueChanged<double>? onRotationChanged;

  const RealTimeCircle({
    super.key,
    this.initialRotation = 0.0,
    this.size = 200.0,
    this.color,
    this.showControls = true,
    this.useLottieAnimation = false,
    this.lottieAssetPath,
    this.onRotationChanged,
  });

  @override
  State<RealTimeCircle> createState() => _RealTimeCircleState();
}

class _RealTimeCircleState extends State<RealTimeCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  
  double _currentRotation = 0.0;
  double _targetRotation = 0.0;

  @override
  void initState() {
    super.initState();
    _currentRotation = widget.initialRotation;
    _targetRotation = widget.initialRotation;
    
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    
    _rotationAnimation = Tween<double>(
      begin: _currentRotation,
      end: _targetRotation,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    
    _rotationAnimation.addListener(() {
      setState(() {
        _currentRotation = _rotationAnimation.value;
      });
      widget.onRotationChanged?.call(_currentRotation);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animateToRotation(double targetRotation) {
    _targetRotation = targetRotation;
    _rotationAnimation = Tween<double>(
      begin: _currentRotation,
      end: _targetRotation,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward(from: 0.0);
  }

  /// Add 90 degrees to rotation
  void add() {
    final newRotation = _targetRotation + 90;
    _animateToRotation(newRotation);
  }

  /// Subtract 90 degrees from rotation
  void subtract() {
    final newRotation = _targetRotation - 90;
    _animateToRotation(newRotation);
  }

  /// Multiply rotation by 0.5
  void multiply() {
    final newRotation = _targetRotation * 0.5;
    _animateToRotation(newRotation);
  }

  @override
  Widget build(BuildContext context) {
    final circleColor = widget.color ?? Theme.of(context).colorScheme.primary;
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Animated Circle
        Transform.rotate(
          angle: _currentRotation * (math.pi / 180), // Convert degrees to radians
          child: SizedBox(
            width: widget.size,
            height: widget.size,
            child: widget.useLottieAnimation
                ? _buildLottieAnimation()
                : _buildCustomClock(circleColor),
          ),
        ),
        
        // Control Buttons
        if (widget.showControls) ...[
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add button
              _ControlButton(
                icon: Icons.add,
                label: 'Add',
                onPressed: add,
                color: Colors.green,
              ),
              const SizedBox(width: 12),
              // Subtract button
              _ControlButton(
                icon: Icons.remove,
                label: 'Sub',
                onPressed: subtract,
                color: Colors.red,
              ),
              const SizedBox(width: 12),
              // Multiply button
              _ControlButton(
                icon: Icons.close,
                label: 'Mul',
                onPressed: multiply,
                color: Colors.blue,
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Display current rotation
          Text(
            'Rotation: ${_currentRotation.toStringAsFixed(1)}°',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ],
    );
  }

  /// Build custom drawn clock
  Widget _buildCustomClock(Color circleColor) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: circleColor.withOpacity(0.1),
        border: Border.all(
          color: circleColor,
          width: 4,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Clock hands or indicators
          CustomPaint(
            size: Size(widget.size, widget.size),
            painter: _CirclePainter(
              color: circleColor,
              rotation: _currentRotation,
            ),
          ),
          // Center dot
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: circleColor,
            ),
          ),
        ],
      ),
    );
  }

  /// Build Lottie animation clock
  Widget _buildLottieAnimation() {
    final lottiePath = widget.lottieAssetPath ?? 'assets/animations/clock.json';
    
    return Lottie.asset(
      lottiePath,
      width: widget.size,
      height: widget.size,
      fit: BoxFit.contain,
      repeat: true,
      animate: true,
    );
  }
}

/// Custom painter for drawing clock-like indicators
class _CirclePainter extends CustomPainter {
  final Color color;
  final double rotation;

  _CirclePainter({
    required this.color,
    required this.rotation,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    // Draw 12 hour markers
    for (int i = 0; i < 12; i++) {
      final angle = (i * 30 - 90) * (math.pi / 180);
      final startX = center.dx + (radius - 15) * math.cos(angle);
      final startY = center.dy + (radius - 15) * math.sin(angle);
      final endX = center.dx + (radius - 5) * math.cos(angle);
      final endY = center.dy + (radius - 5) * math.sin(angle);

      canvas.drawLine(
        Offset(startX, startY),
        Offset(endX, endY),
        paint,
      );
    }

    // Draw main hand (12 o'clock position)
    final handPaint = Paint()
      ..color = color
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final handAngle = (rotation - 90) * (math.pi / 180);
    final handEndX = center.dx + (radius - 20) * math.cos(handAngle);
    final handEndY = center.dy + (radius - 20) * math.sin(handAngle);

    canvas.drawLine(
      center,
      Offset(handEndX, handEndY),
      handPaint,
    );
  }

  @override
  bool shouldRepaint(_CirclePainter oldDelegate) {
    return oldDelegate.rotation != rotation || oldDelegate.color != color;
  }
}

/// Control button widget
class _ControlButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color color;

  const _ControlButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

