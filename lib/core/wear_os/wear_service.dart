import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

/// Service for communicating with Wear OS devices
class WearService {
  static const MethodChannel _channel = MethodChannel('com.rakshasutra/wear_os');
  static const EventChannel _eventChannel = EventChannel('com.rakshasutra/wear_os_events');
  
  final Logger _logger = Logger();

  /// Check if Wear OS is available
  Future<bool> isWearOSAvailable() async {
    try {
      final bool result = await _channel.invokeMethod('isWearOSAvailable');
      return result;
    } on PlatformException catch (e) {
      _logger.e('Error checking Wear OS availability: $e');
      return false;
    }
  }

  /// Connect to a Wear OS device
  Future<bool> connectToWatch() async {
    try {
      final bool result = await _channel.invokeMethod('connectToWatch');
      return result;
    } on PlatformException catch (e) {
      _logger.e('Error connecting to watch: $e');
      return false;
    }
  }

  /// Disconnect from Wear OS device
  Future<void> disconnectFromWatch() async {
    try {
      await _channel.invokeMethod('disconnectFromWatch');
    } on PlatformException catch (e) {
      _logger.e('Error disconnecting from watch: $e');
    }
  }

  /// Send data to Wear OS device
  Future<bool> sendDataToWatch(Map<String, dynamic> data) async {
    try {
      final bool result = await _channel.invokeMethod(
        'sendDataToWatch',
        data,
      );
      return result;
    } on PlatformException catch (e) {
      _logger.e('Error sending data to watch: $e');
      return false;
    }
  }

  /// Send SOS alert to watch
  Future<bool> sendSOSAlert() async {
    try {
      final bool result = await _channel.invokeMethod('sendSOSAlert');
      return result;
    } on PlatformException catch (e) {
      _logger.e('Error sending SOS alert: $e');
      return false;
    }
  }

  /// Stream of data received from Wear OS device
  Stream<Map<String, dynamic>>? get watchDataStream {
    try {
      return _eventChannel.receiveBroadcastStream().map(
        (dynamic event) => Map<String, dynamic>.from(event as Map),
      );
    } catch (e) {
      _logger.e('Error creating watch data stream: $e');
      return null;
    }
  }

  /// Get watch battery level
  Future<int?> getWatchBatteryLevel() async {
    try {
      final int? result = await _channel.invokeMethod('getWatchBatteryLevel');
      return result;
    } on PlatformException catch (e) {
      _logger.e('Error getting watch battery level: $e');
      return null;
    }
  }

  /// Get watch health data (heart rate, steps, etc.)
  Future<Map<String, dynamic>?> getWatchHealthData() async {
    try {
      final Map<dynamic, dynamic>? result = 
          await _channel.invokeMethod('getWatchHealthData');
      return result?.cast<String, dynamic>();
    } on PlatformException catch (e) {
      _logger.e('Error getting watch health data: $e');
      return null;
    }
  }
}

