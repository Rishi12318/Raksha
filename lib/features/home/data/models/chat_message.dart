class ChatMessage {
  final String id;
  final String message;
  final bool isLara;
  final DateTime timestamp;
  final bool isLoading;

  ChatMessage({
    required this.id,
    required this.message,
    required this.isLara,
    required this.timestamp,
    this.isLoading = false,
  });

  ChatMessage copyWith({
    String? id,
    String? message,
    bool? isLara,
    DateTime? timestamp,
    bool? isLoading,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      message: message ?? this.message,
      isLara: isLara ?? this.isLara,
      timestamp: timestamp ?? this.timestamp,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  factory ChatMessage.loading() {
    return ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      message: '',
      isLara: true,
      timestamp: DateTime.now(),
      isLoading: true,
    );
  }
}
