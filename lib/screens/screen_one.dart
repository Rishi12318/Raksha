import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/widgets/real_time_circle.dart';

/// Interactive Screen One with zoom animations
class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> with TickerProviderStateMixin {
  // Animation controllers
  late AnimationController _pulseController;
  late AnimationController _glowController;
  late AnimationController _zoomController;
  late AnimationController _titleController;
  
  // Animations
  late Animation<double> _pulseAnimation;
  late Animation<double> _glowAnimation;
  late Animation<double> _zoomAnimation;
  late Animation<double> _titleScaleAnimation;
  late Animation<double> _titleOpacityAnimation;
  
  // State
  int _clickCount = 0; // 0 = initial, 1 = first zoom, 2 = full screen
  bool _showTitle = false;

  @override
  void initState() {
    super.initState();
    
    // Pulse animation for breathing effect
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _pulseController,
        curve: Curves.easeInOut,
      ),
    );
    
    // Glow animation for outer ring
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    
    _glowAnimation = Tween<double>(begin: 0.3, end: 0.8).animate(
      CurvedAnimation(
        parent: _glowController,
        curve: Curves.easeInOut,
      ),
    );
    
    // Zoom animation for clock
    _zoomController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
      upperBound: 5.0, // Allow zooming up to 5x
    );
    
    _zoomAnimation = Tween<double>(begin: 1.0, end: 2.5).animate(
      CurvedAnimation(
        parent: _zoomController,
        curve: Curves.easeInOut,
      ),
    );
    
    // Title animation
    _titleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    
    _titleScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _titleController,
        curve: Curves.elasticOut,
      ),
    );
    
    _titleOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _titleController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _glowController.dispose();
    _zoomController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  void _handleClockTap() {
    setState(() {
      _clickCount++;
      
      if (_clickCount == 1) {
        // First click: Zoom in the clock AND show title
        _zoomController.forward();
        _showTitle = true;
        // Show title after zoom animation starts
        Future.delayed(const Duration(milliseconds: 400), () {
          if (mounted) {
            _titleController.forward();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const mauve = Color(0xFFD6BEFA); // Mauve
    const lavenderFloral = Color(0xFFCB94F7); // Lavender (floral)
    
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              mauve,
              lavenderFloral,
            ],
            stops: [0.0, 1.0],
          ),
        ),
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Clock Animation with Interactive Zoom
              AnimatedBuilder(
                animation: Listenable.merge([
                  _pulseAnimation,
                  _glowAnimation,
                  _zoomAnimation,
                ]),
                builder: (context, child) {
                  // On first click, zoom to full screen (scale 4.0)
                  final currentScale = _clickCount >= 1 
                      ? 4.0 
                      : _zoomAnimation.value;
                  
                  return Transform.scale(
                    scale: currentScale,
                    child: GestureDetector(
                      onTap: _clickCount < 1 ? _handleClockTap : null,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Outer pulsing glow ring
                          if (_clickCount < 1)
                            ScaleTransition(
                              scale: _pulseAnimation,
                              child: Container(
                                width: 280,
                                height: 280,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white.withOpacity(_glowAnimation.value),
                                      blurRadius: 40,
                                      spreadRadius: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          // Middle pulsing ring
                          if (_clickCount < 1)
                            ScaleTransition(
                              scale: Tween<double>(
                                begin: 1.0,
                                end: 1.05,
                              ).animate(_pulseAnimation),
                              child: Container(
                                width: 240,
                                height: 240,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.3),
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          // Clock Animation
                          ScaleTransition(
                            scale: _clickCount < 1 ? _pulseAnimation : const AlwaysStoppedAnimation(1.0),
                            child: RealTimeCircle(
                              size: 220,
                              showControls: false,
                              useLottieAnimation: true,
                              lottieAssetPath: 'assets/animations/clock.json',
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              
              // Title appears on second click
              if (_showTitle)
                AnimatedBuilder(
                  animation: _titleController,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _titleOpacityAnimation.value,
                      child: Transform.scale(
                        scale: _titleScaleAnimation.value,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Project Name in Bold Black
                            Text(
                              'PROJECT RAKSHA SUTRA',
                              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    letterSpacing: 3,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 60),
                            // Sign Up and Sign In Buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Sign Up Button
                                ElevatedButton(
                                  onPressed: () {
                                    context.push('/sign-up');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 32,
                                      vertical: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                // Sign In Button
                                OutlinedButton(
                                  onPressed: () {
                                    context.push('/sign-in');
                                  },
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    side: const BorderSide(
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 32,
                                      vertical: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              
              // Hint text (only shown initially)
              if (_clickCount == 0)
                Positioned(
                  bottom: 100,
                  child: AnimatedOpacity(
                    opacity: _clickCount == 0 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.brown.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Tap the watch to zoom in',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

