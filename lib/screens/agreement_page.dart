import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AgreementPage extends StatefulWidget {
  const AgreementPage({super.key});

  @override
  State<AgreementPage> createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {
  final ScrollController _scrollController = ScrollController();
  bool _hasScrolledToBottom = false;
  bool _agreedToTerms = false;
  bool _agreedToPrivacy = false;
  bool _agreedToLocation = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 50) {
      if (!_hasScrolledToBottom) {
        setState(() {
          _hasScrolledToBottom = true;
        });
      }
    }
  }

  bool get _canProceed =>
      _hasScrolledToBottom &&
      _agreedToTerms &&
      _agreedToPrivacy &&
      _agreedToLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Terms & Conditions',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Agreement Content
          Expanded(
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                controller: _scrollController,
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'USER AGREEMENT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Introduction
                    _buildBlackBox(
                      title: 'Welcome to Raksha Sutra',
                      content:
                          'This agreement governs your use of the Raksha Sutra safety application. Please read carefully before proceeding.',
                    ),
                    const SizedBox(height: 20),

                    // Terms of Service
                    _buildWhiteBox(
                      title: '1. Terms of Service',
                      content:
                          'By using Raksha Sutra, you agree to:\n\n'
                          '• Provide accurate personal information\n'
                          '• Use the app only for personal safety purposes\n'
                          '• Not misuse emergency features\n'
                          '• Keep your login credentials secure\n'
                          '• Update your information when necessary',
                    ),
                    const SizedBox(height: 20),

                    // Privacy Policy
                    _buildBlackBox(
                      title: '2. Privacy Policy',
                      content:
                          'We collect and process:\n\n'
                          '• Personal identification information\n'
                          '• Real-time GPS location data\n'
                          '• Activity and movement patterns\n'
                          '• Emergency contact information\n'
                          '• Device information and usage data\n\n'
                          'Your data is encrypted and securely stored.',
                    ),
                    const SizedBox(height: 20),

                    // Location Services
                    _buildWhiteBox(
                      title: '3. Location Services',
                      content:
                          'This app requires continuous location access to:\n\n'
                          '• Track your real-time location\n'
                          '• Send location to authorized persons\n'
                          '• Trigger geofence alerts\n'
                          '• Provide emergency services your location\n\n'
                          'Location data is shared only with your authorized contacts.',
                    ),
                    const SizedBox(height: 20),

                    // Data Sharing
                    _buildBlackBox(
                      title: '4. Data Sharing',
                      content:
                          'Your information may be shared with:\n\n'
                          '• Authorized persons you designate\n'
                          '• Emergency services (police, ambulance)\n'
                          '• Legal authorities when required by law\n\n'
                          'We will NEVER sell your personal data to third parties.',
                    ),
                    const SizedBox(height: 20),

                    // Emergency Features
                    _buildWhiteBox(
                      title: '5. Emergency Features',
                      content:
                          'When you activate emergency mode:\n\n'
                          '• Your location is immediately shared\n'
                          '• Authorized contacts are notified\n'
                          '• Audio/video recording may start\n'
                          '• Local authorities may be contacted\n\n'
                          'False alarms may result in account suspension.',
                    ),
                    const SizedBox(height: 20),

                    // User Responsibilities
                    _buildBlackBox(
                      title: '6. User Responsibilities',
                      content:
                          'You are responsible for:\n\n'
                          '• Maintaining device battery and connectivity\n'
                          '• Keeping the app updated\n'
                          '• Verifying authorized person details\n'
                          '• Using emergency features responsibly\n'
                          '• Complying with local laws and regulations',
                    ),
                    const SizedBox(height: 20),

                    // Liability
                    _buildWhiteBox(
                      title: '7. Limitation of Liability',
                      content:
                          'While we strive for 100% reliability:\n\n'
                          '• We cannot guarantee uninterrupted service\n'
                          '• Network/device issues may affect functionality\n'
                          '• Emergency response times may vary\n'
                          '• The app is a safety tool, not a guarantee\n\n'
                          'Always call emergency services (112) in critical situations.',
                    ),
                    const SizedBox(height: 20),

                    // Termination
                    _buildBlackBox(
                      title: '8. Account Termination',
                      content:
                          'We reserve the right to:\n\n'
                          '• Suspend accounts for misuse\n'
                          '• Terminate service without prior notice\n'
                          '• Delete data after account closure\n'
                          '• Cooperate with law enforcement\n\n'
                          'You may delete your account anytime from settings.',
                    ),
                    const SizedBox(height: 20),

                    // Updates
                    _buildWhiteBox(
                      title: '9. Agreement Updates',
                      content:
                          'This agreement may be updated periodically. Continued use of the app constitutes acceptance of any changes. Major changes will be notified via email or in-app notification.',
                    ),
                    const SizedBox(height: 20),

                    // Contact
                    _buildBlackBox(
                      title: '10. Contact Information',
                      content:
                          'For questions or concerns:\n\n'
                          'Email: support@rakshasutra.com\n'
                          'Phone: +91 1800-RAKSHA\n'
                          'Website: www.rakshasutra.com\n\n'
                          'Response time: 24-48 hours',
                    ),
                    const SizedBox(height: 40),

                    // Scroll indicator
                    if (!_hasScrolledToBottom)
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.arrow_downward, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                'Scroll to bottom to continue',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),

          // Checkboxes and Accept Button
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Terms Checkbox
                _buildCheckbox(
                  value: _agreedToTerms,
                  enabled: _hasScrolledToBottom,
                  onChanged: (value) {
                    setState(() {
                      _agreedToTerms = value ?? false;
                    });
                  },
                  label: 'I agree to the Terms of Service',
                ),
                const SizedBox(height: 12),

                // Privacy Checkbox
                _buildCheckbox(
                  value: _agreedToPrivacy,
                  enabled: _hasScrolledToBottom,
                  onChanged: (value) {
                    setState(() {
                      _agreedToPrivacy = value ?? false;
                    });
                  },
                  label: 'I agree to the Privacy Policy',
                ),
                const SizedBox(height: 12),

                // Location Checkbox
                _buildCheckbox(
                  value: _agreedToLocation,
                  enabled: _hasScrolledToBottom,
                  onChanged: (value) {
                    setState(() {
                      _agreedToLocation = value ?? false;
                    });
                  },
                  label: 'I consent to location tracking and data sharing',
                ),
                const SizedBox(height: 20),

                // Accept Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _canProceed
                        ? () {
                            // Navigate to connecting screen
                            context.go('/connecting');
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: Colors.grey.shade400,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: _canProceed ? 4 : 0,
                    ),
                    child: Text(
                      _canProceed ? 'Accept & Continue' : 'Please Read & Agree',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlackBox({required String title, required String content}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: TextStyle(
              color: Colors.white.withOpacity(0.95),
              fontSize: 15,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWhiteBox({required String title, required String content}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 15,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckbox({
    required bool value,
    required bool enabled,
    required ValueChanged<bool?> onChanged,
    required String label,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: enabled ? Colors.black : Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: CheckboxListTile(
        value: value,
        enabled: enabled,
        onChanged: onChanged,
        activeColor: Colors.black,
        title: Text(
          label,
          style: TextStyle(
            color: enabled ? Colors.black : Colors.grey,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
