import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:math' as math;

/// Interactive clock animation with zoom stages
/// Stage 1: Clock animation → Stage 2: Zoom in → Stage 3: Real-time rotation 
/// → Stage 4: Zoom again → Stage 5: Show app name
class ZoomClockAnimation extends StatefulWidget {
  final double size;
  final VoidCallback? onComplete;

  const ZoomClockAnimation({
    super.key,
    this.size = 220,
    this.onComplete,
  });

  @override
  State<ZoomClockAnimation> createState() => _ZoomClockAnimationState();
}

class _ZoomClockAnimationState extends State<ZoomClockAnimation>
    with TickerProviderStateMixin {
  int _stage = 1;
  double _rotation = 0;
  double _scale = 1.0;
  Offset? _lastPosition;
  
  late AnimationController _clockController;
  late AnimationController _zoomController;
  late Animation<double> _zoomAnimation;

  @override
  void initState() {
    super.initState();
    
    // Clock rotation controller for stage 1
    _clockController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )..repeat();
    
    // Zoom animation controller
    _zoomController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    
    _zoomAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _zoomController, curve: Curves.easeInOut),
    );
    
    _startStage1();
  }

  @override
  void dispose() {
    _clockController.dispose();
    _zoomController.dispose();
    super.dispose();
  }

  void _startStage1() {
    // Stage 1: Automatic clock animation
    setState(() {
      _stage = 1;
    });
  }

  void _advanceToNextStage() {
    if (_stage == 1) {
      // Zoom in to stage 2
      _zoomController.forward().then((_) {
        setState(() {
          _stage = 3; // Move to interactive mode
          _scale = _zoomAnimation.value;
        });
        _clockController.stop();
      });
    } else if (_stage == 3) {
      // Zoom in again to show app name
      _zoomController.reset();
      _zoomController.forward().then((_) {
        setState(() {
          _stage = 5; // Show app name
          _scale = _zoomAnimation.value * 1.5;
        });
        if (widget.onComplete != null) {
          widget.onComplete!();
        }
      });
    }
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    if (_stage != 3) return; // Only in interactive mode
    
    final RenderBox box = context.findRenderObject() as RenderBox;
    final center = Offset(box.size.width / 2, box.size.height / 2);
    final position = box.globalToLocal(details.globalPosition);
    
    final angle = math.atan2(
      position.dy - center.dy,
      position.dx - center.dx,
    );
    
    setState(() {
      _rotation = angle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.delta.dy < -5) { // Swipe up to zoom
          _advanceToNextStage();
        }
      },
      onPanUpdate: _handlePanUpdate,
      onDoubleTap: _advanceToNextStage,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Clock animation
          if (_stage < 5) _buildClock(),
          
          // App name (Stage 5)
          if (_stage == 5) _buildAppName(),
          
          // Instructions
          if (_stage == 1) _buildInstructions('Swipe up or double tap to zoom in'),
          if (_stage == 3) _buildInstructions('Drag to rotate the clock hands'),
        ],
      ),
    );
  }

  Widget _buildClock() {
    return AnimatedBuilder(
      animation: _stage == 1 ? _clockController : _zoomController,
      builder: (context, child) {
        final rotation = _stage == 1 
            ? _clockController.value * 2 * math.pi 
            : _rotation;
        
        final scale = _stage == 1 
            ? _scale 
            : _zoomAnimation.value * _scale;
        
        return Transform.scale(
          scale: scale,
          child: Transform.rotate(
            angle: rotation,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.3),
                    blurRadius: 30,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: Lottie.asset(
                'assets/animations/clock.json',
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAppName() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.scale(
            scale: value,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'PROJECT RAKSHA SUTRA',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 3,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Text(
                  'Your Digital Protection Thread',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.w500,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInstructions(String text) {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 500),
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
