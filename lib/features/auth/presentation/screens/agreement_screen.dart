import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';

/// Agreement Screen - Terms & Conditions and Privacy Policy
/// Users must accept before accessing authentication
class AgreementScreen extends StatefulWidget {
  const AgreementScreen({super.key});

  @override
  State<AgreementScreen> createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
  bool _acceptTerms = false;
  bool _acceptPrivacy = false;
  bool _acceptDataCollection = false;
  final ScrollController _scrollController = ScrollController();
  bool _hasScrolledToBottom = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_checkScrollPosition);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_checkScrollPosition);
    _scrollController.dispose();
    super.dispose();
  }

  void _checkScrollPosition() {
    if (_scrollController.position.pixels >= 
        _scrollController.position.maxScrollExtent - 50) {
      if (!_hasScrolledToBottom) {
        setState(() => _hasScrolledToBottom = true);
      }
    }
  }

  bool get _canContinue => 
      _acceptTerms && _acceptPrivacy && _acceptDataCollection && _hasScrolledToBottom;

  void _handleContinue() {
    if (_canContinue) {
      // TODO: Save agreement acceptance with timestamp
      context.go('/auth');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _hasScrolledToBottom 
                ? 'Please accept all terms to continue'
                : 'Please scroll to the bottom and read all terms',
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryGradientStart = Color(0xFF1A237E);
    const primaryGradientEnd = Color(0xFF00BCD4);
    
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [primaryGradientStart, primaryGradientEnd],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => context.pop(),
                    ),
                    const Expanded(
                      child: Text(
                        'Terms & Agreements',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 48), // Balance the back button
                  ],
                ),
              ),

              // Content
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Scroll indicator
                      if (!_hasScrolledToBottom)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.arrow_downward, 
                                size: 16, 
                                color: Colors.orange[900],
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Please scroll to read all terms',
                                style: TextStyle(
                                  color: Colors.orange[900],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(height: 16),

                      // Scrollable content
                      Expanded(
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildWelcomeSection(),
                              const SizedBox(height: 24),
                              _buildTermsOfServiceSection(),
                              const SizedBox(height: 24),
                              _buildPrivacyPolicySection(),
                              const SizedBox(height: 24),
                              _buildDataCollectionSection(),
                              const SizedBox(height: 24),
                              _buildEmergencyServicesSection(),
                              const SizedBox(height: 24),
                              _buildLiabilitySection(),
                              const SizedBox(height: 24),
                              _buildContactSection(),
                              const SizedBox(height: 32),
                              
                              // Reached bottom indicator
                              if (_hasScrolledToBottom)
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.green[100],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.check_circle, 
                                        color: Colors.green[700],
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          'You\'ve read all the terms. Please accept below to continue.',
                                          style: TextStyle(
                                            color: Colors.green[900],
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      
                      const Divider(height: 32),
                      
                      // Checkboxes
                      _buildCheckbox(
                        value: _acceptTerms,
                        onChanged: (value) => setState(() => _acceptTerms = value!),
                        text: 'I accept the ',
                        linkText: 'Terms of Service',
                        onLinkTap: () => _showFullTerms(context),
                      ),
                      const SizedBox(height: 12),
                      _buildCheckbox(
                        value: _acceptPrivacy,
                        onChanged: (value) => setState(() => _acceptPrivacy = value!),
                        text: 'I accept the ',
                        linkText: 'Privacy Policy',
                        onLinkTap: () => _showPrivacyPolicy(context),
                      ),
                      const SizedBox(height: 12),
                      _buildCheckbox(
                        value: _acceptDataCollection,
                        onChanged: (value) => setState(() => _acceptDataCollection = value!),
                        text: 'I agree to ',
                        linkText: 'Data Collection & Emergency Sharing',
                        onLinkTap: () => _showDataPolicy(context),
                      ),
                    ],
                  ),
                ),
              ),

              // Continue Button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _canContinue ? _handleContinue : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: primaryGradientStart,
                      disabledBackgroundColor: Colors.white.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                    ),
                    child: const Text(
                      'I Agree - Continue',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
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

  Widget _buildWelcomeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.shield, color: Colors.blue[700], size: 32),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'Welcome to Raksha Sutra',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A237E),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Before you begin, please read and accept our terms and policies. Your safety and privacy are our top priorities.',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildTermsOfServiceSection() {
    return _buildSection(
      icon: Icons.description,
      title: 'Terms of Service',
      content: '''
By using Raksha Sutra, you agree to:

• Use the app for personal safety purposes only
• Provide accurate information during registration
• Not misuse emergency features or create false alarms
• Keep your account credentials secure
• Report any security vulnerabilities to us
• Accept that the service is provided "as is"
• Follow local laws and regulations when using location services

You acknowledge that:
• The app is a safety tool and not a replacement for emergency services
• You are responsible for calling emergency services (police, ambulance) when needed
• Location sharing requires your explicit consent
• You can revoke permissions at any time through settings
      ''',
    );
  }

  Widget _buildPrivacyPolicySection() {
    return _buildSection(
      icon: Icons.privacy_tip,
      title: 'Privacy Policy',
      content: '''
We respect your privacy and are committed to protecting your personal data.

Information We Collect:
• Personal details (name, email, phone number)
• Location data (only when you enable tracking)
• Emergency contact information
• Device information for app functionality
• Usage data to improve our services

How We Use Your Data:
• To provide safety and emergency features
• To send alerts to your emergency contacts
• To improve app functionality and user experience
• To comply with legal obligations
• Never sold to third parties

Your Rights:
• Access your personal data
• Request data deletion
• Opt-out of non-essential data collection
• Export your data
• Update your information anytime
      ''',
    );
  }

  Widget _buildDataCollectionSection() {
    return _buildSection(
      icon: Icons.location_on,
      title: 'Location & Data Sharing',
      iconColor: Colors.orange,
      content: '''
Location Services:
• Real-time location tracking requires explicit permission
• Location data is only collected when you enable the feature
• You can disable location tracking at any time
• Location data is encrypted during transmission

Emergency Data Sharing:
• When you activate SOS, your location is shared with:
  - Your designated emergency contacts
  - Emergency services (if configured)
• Emergency sharing overrides normal privacy settings
• All emergency activations are logged for your safety

Wear OS Integration:
• Watch data is synced only when connected
• Smartwatch location is used for emergency alerts
• No health data is collected unless explicitly enabled
      ''',
    );
  }

  Widget _buildEmergencyServicesSection() {
    return _buildSection(
      icon: Icons.emergency,
      title: 'Emergency Services Disclaimer',
      iconColor: Colors.red,
      content: '''
IMPORTANT - Please Read Carefully:

• Raksha Sutra is NOT a substitute for emergency services
• Always call your local emergency number (100, 102, 108 in India)
• SOS alerts are sent to your contacts, NOT to police/ambulance
• There may be delays in message delivery
• Network connectivity is required for all features
• The app cannot guarantee emergency response

In a Real Emergency:
1. Call emergency services immediately (100/108)
2. Then use the app to alert your contacts
3. Keep your phone charged and with you
4. Ensure location services are enabled

We Are Not Liable For:
• Network failures or service interruptions
• Delayed or failed emergency notifications
• Actions taken by emergency contacts
• Consequences of inaccurate location data
      ''',
    );
  }

  Widget _buildLiabilitySection() {
    return _buildSection(
      icon: Icons.gavel,
      title: 'Limitation of Liability',
      content: '''
By using Raksha Sutra, you understand and agree that:

• The app is provided "AS IS" without warranties
• We are not responsible for device malfunctions
• We cannot guarantee 100% uptime or availability
• Location accuracy depends on your device and GPS
• Emergency features require network connectivity
• We are not liable for damages arising from app use
• You use the app at your own risk

The developers and service providers shall not be liable for:
• Personal injury or loss of life
• Property damage
• Data loss or corruption
• Missed emergency notifications
• Third-party actions or inactions
• Force majeure events (natural disasters, etc.)

Maximum liability is limited to the amount paid for the service.
      ''',
    );
  }

  Widget _buildContactSection() {
    return _buildSection(
      icon: Icons.contact_support,
      title: 'Contact Us',
      iconColor: Colors.green,
      content: '''
For questions about these terms or the service:

Email: support@rakshasutra.com
Phone: +91-XXXX-XXXXXX
Address: [Your Company Address]

Last Updated: November 7, 2025
Version: 1.0.0

By clicking "I Agree - Continue", you acknowledge that you have read, understood, and agree to be bound by these Terms of Service and Privacy Policy.
      ''',
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required String content,
    Color? iconColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: iconColor ?? Colors.blue[700], size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A237E),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Text(
            content.trim(),
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[800],
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckbox({
    required bool value,
    required Function(bool?) onChanged,
    required String text,
    required String linkText,
    required VoidCallback onLinkTap,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF1A237E),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => onChanged(!value),
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                  children: [
                    TextSpan(text: text),
                    TextSpan(
                      text: linkText,
                      style: const TextStyle(
                        color: Color(0xFF1A237E),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = onLinkTap,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showFullTerms(BuildContext context) {
    _showDialog(context, 'Full Terms of Service', 
      'Complete terms of service document would be displayed here...');
  }

  void _showPrivacyPolicy(BuildContext context) {
    _showDialog(context, 'Full Privacy Policy', 
      'Complete privacy policy document would be displayed here...');
  }

  void _showDataPolicy(BuildContext context) {
    _showDialog(context, 'Data Collection Policy', 
      'Complete data collection and emergency sharing policy would be displayed here...');
  }

  void _showDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: Text(content),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
