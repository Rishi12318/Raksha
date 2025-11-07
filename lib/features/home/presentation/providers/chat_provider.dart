import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/chat_message.dart';
import '../../../../services/lara_service.dart';

class ChatNotifier extends StateNotifier<List<ChatMessage>> {
  final LaraService _laraService = LaraService();
  
  ChatNotifier() : super([]) {
    _initializeChat();
  }

  void _initializeChat() {
    // Add welcome messages
    state = [
      ChatMessage(
        id: '1',
        message: "Hello! 👋 I'm Miss Lara, your personal safety companion. I'm here to help you 24/7!",
        isLara: true,
        timestamp: DateTime.now(),
      ),
      ChatMessage(
        id: '2',
        message: "I can help you with:\n• Safety tips and advice\n• Emergency guidance\n• Mental wellness support\n• Quick responses to your concerns\n\nFeel free to ask me anything!",
        isLara: true,
        timestamp: DateTime.now(),
      ),
    ];
  }

  Future<void> sendMessage(String message) async {
    if (message.trim().isEmpty) return;

    // Add user message
    final userMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      message: message,
      isLara: false,
      timestamp: DateTime.now(),
    );
    state = [...state, userMessage];

    // Add loading indicator
    final loadingMessage = ChatMessage.loading();
    state = [...state, loadingMessage];

    try {
      // Call API
      final response = await _laraService.sendMessage(message);
      
      // Remove loading indicator
      state = state.where((msg) => !msg.isLoading).toList();

      // Add AI response
      final aiMessage = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        message: response['reply'] ?? _getFallbackResponse(message),
        isLara: true,
        timestamp: DateTime.now(),
      );
      state = [...state, aiMessage];
    } catch (e) {
      // Remove loading indicator
      state = state.where((msg) => !msg.isLoading).toList();

      // Add fallback response
      final errorMessage = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        message: _getFallbackResponse(message),
        isLara: true,
        timestamp: DateTime.now(),
      );
      state = [...state, errorMessage];
    }
  }

  String _getFallbackResponse(String userMessage) {
    final lowerMessage = userMessage.toLowerCase();
    
    if (lowerMessage.contains('safety') || lowerMessage.contains('tip')) {
      return "Here are some essential safety tips:\n\n🛡️ Always share your location with trusted contacts\n📱 Keep emergency numbers readily available\n👀 Stay aware of your surroundings\n💪 Trust your instincts\n🚨 Use the SOS button if you feel unsafe";
    } else if (lowerMessage.contains('help') || lowerMessage.contains('emergency')) {
      return "If you're in an emergency:\n\n1. Use the SOS button on the home screen (press twice for police)\n2. Your location will be shared with emergency contacts\n3. Stay calm and try to get to a safe place\n4. Call 112 for immediate police assistance\n\nRemember, your safety is the priority! 💜";
    } else if (lowerMessage.contains('stress') || lowerMessage.contains('anxiety') || lowerMessage.contains('worried')) {
      return "I understand you're feeling stressed. Here are some quick tips:\n\n🧘‍♀️ Take deep breaths - inhale for 4, hold for 4, exhale for 4\n🌸 Try the Positive Vibes feature for uplifting quotes\n🚶‍♀️ Take a short walk if possible\n💭 Talk to someone you trust\n\nYou're stronger than you think! 💪";
    } else if (lowerMessage.contains('period') || lowerMessage.contains('cycle')) {
      return "I can help you track your menstrual cycle! Use the Period Tracker feature to:\n\n📅 Log your cycle dates\n🔔 Get reminders for upcoming periods\n📊 Track symptoms and patterns\n💊 Set medication reminders\n\nStaying informed helps you stay prepared! 🌸";
    } else if (lowerMessage.contains('thank')) {
      return "You're very welcome! Remember, your safety and wellbeing are my priority. I'm here anytime you need me! 💜";
    } else {
      return "I'm here to help you with safety advice, emergency guidance, and wellness support. Feel free to ask me about:\n\n• Safety tips\n• Emergency procedures\n• Stress management\n• Period tracking\n• Any concerns you have\n\nWhat would you like to know? 💜";
    }
  }

  Future<void> getSafetyTip() async {
    try {
      final response = await _laraService.getSafetyTip();
      final tip = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        message: response['tip'] ?? "Always stay aware of your surroundings and trust your instincts. Your safety matters! 💜",
        isLara: true,
        timestamp: DateTime.now(),
      );
      state = [...state, tip];
    } catch (e) {
      final fallbackTip = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        message: "💡 Safety Tip: Always share your live location with trusted contacts when traveling alone. Use the tracking feature in this app!",
        isLara: true,
        timestamp: DateTime.now(),
      );
      state = [...state, fallbackTip];
    }
  }

  void clearChat() {
    _initializeChat();
  }
}

final chatProvider = StateNotifierProvider<ChatNotifier, List<ChatMessage>>((ref) {
  return ChatNotifier();
});
