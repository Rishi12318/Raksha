import React, {useState, useEffect} from 'react';
import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
  Alert,
  Linking,
  Vibration,
} from 'react-native';
import Geolocation from '@react-native-community/geolocation';
import {check, request, PERMISSIONS, RESULTS} from 'react-native-permissions';

const HomeScreen = () => {
  const [location, setLocation] = useState(null);
  const [isTracking, setIsTracking] = useState(false);
  const [sosActive, setSosActive] = useState(false);

  useEffect(() => {
    requestLocationPermission();
  }, []);

  const requestLocationPermission = async () => {
    try {
      const result = await request(PERMISSIONS.ANDROID.ACCESS_FINE_LOCATION);
      if (result === RESULTS.GRANTED) {
        startLocationTracking();
      }
    } catch (error) {
      console.error('Permission error:', error);
    }
  };

  const startLocationTracking = () => {
    setIsTracking(true);
    Geolocation.watchPosition(
      position => {
        setLocation({
          latitude: position.coords.latitude,
          longitude: position.coords.longitude,
        });
      },
      error => console.error(error),
      {
        enableHighAccuracy: true,
        distanceFilter: 10,
        interval: 5000,
        fastestInterval: 2000,
      },
    );
  };

  const handleSOSPress = () => {
    setSosActive(true);
    Vibration.vibrate([0, 500, 200, 500]);

    Alert.alert(
      '🚨 SOS ACTIVATED',
      'Emergency alert will be sent to your contacts with your location!',
      [
        {
          text: 'Cancel',
          style: 'cancel',
          onPress: () => setSosActive(false),
        },
        {
          text: 'Call Emergency',
          onPress: () => {
            Linking.openURL('tel:112');
            setSosActive(false);
          },
        },
      ],
    );
  };

  return (
    <View style={styles.container}>
      <View style={styles.header}>
        <Text style={styles.title}>🛡️ Raksha Sutra</Text>
        <Text style={styles.subtitle}>Digital Protection Thread</Text>
      </View>

      <View style={styles.locationCard}>
        <Text style={styles.cardTitle}>📍 Current Location</Text>
        {location ? (
          <>
            <Text style={styles.locationText}>
              Lat: {location.latitude.toFixed(6)}
            </Text>
            <Text style={styles.locationText}>
              Long: {location.longitude.toFixed(6)}
            </Text>
            <View style={styles.trackingBadge}>
              <Text style={styles.trackingText}>
                {isTracking ? '🟢 Tracking Active' : '🔴 Tracking Inactive'}
              </Text>
            </View>
          </>
        ) : (
          <Text style={styles.loadingText}>Getting location...</Text>
        )}
      </View>

      <TouchableOpacity
        style={[styles.sosButton, sosActive && styles.sosButtonActive]}
        onPress={handleSOSPress}
        activeOpacity={0.7}>
        <Text style={styles.sosText}>SOS</Text>
        <Text style={styles.sosSubtext}>Press for Emergency</Text>
      </TouchableOpacity>

      <View style={styles.featuresContainer}>
        <View style={styles.featureCard}>
          <Text style={styles.featureIcon}>📡</Text>
          <Text style={styles.featureText}>GPS Tracking</Text>
        </View>
        <View style={styles.featureCard}>
          <Text style={styles.featureIcon}>📱</Text>
          <Text style={styles.featureText}>Smart Alert</Text>
        </View>
        <View style={styles.featureCard}>
          <Text style={styles.featureIcon}>🔗</Text>
          <Text style={styles.featureText}>Bluetooth</Text>
        </View>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
    padding: 20,
  },
  header: {
    alignItems: 'center',
    marginTop: 20,
    marginBottom: 30,
  },
  title: {
    fontSize: 32,
    fontWeight: 'bold',
    color: '#dc2626',
    marginBottom: 5,
  },
  subtitle: {
    fontSize: 16,
    color: '#666',
  },
  locationCard: {
    backgroundColor: '#fff',
    borderRadius: 15,
    padding: 20,
    marginBottom: 30,
    shadowColor: '#000',
    shadowOffset: {width: 0, height: 2},
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  cardTitle: {
    fontSize: 18,
    fontWeight: '600',
    marginBottom: 15,
    color: '#333',
  },
  locationText: {
    fontSize: 16,
    color: '#555',
    marginBottom: 8,
    fontFamily: 'monospace',
  },
  loadingText: {
    fontSize: 16,
    color: '#999',
    fontStyle: 'italic',
  },
  trackingBadge: {
    marginTop: 10,
    paddingVertical: 8,
    paddingHorizontal: 12,
    backgroundColor: '#f0fdf4',
    borderRadius: 8,
    alignSelf: 'flex-start',
  },
  trackingText: {
    fontSize: 14,
    fontWeight: '600',
  },
  sosButton: {
    backgroundColor: '#dc2626',
    borderRadius: 100,
    width: 180,
    height: 180,
    justifyContent: 'center',
    alignItems: 'center',
    alignSelf: 'center',
    marginBottom: 40,
    shadowColor: '#dc2626',
    shadowOffset: {width: 0, height: 4},
    shadowOpacity: 0.3,
    shadowRadius: 8,
    elevation: 8,
  },
  sosButtonActive: {
    backgroundColor: '#991b1b',
  },
  sosText: {
    fontSize: 48,
    fontWeight: 'bold',
    color: '#fff',
    marginBottom: 5,
  },
  sosSubtext: {
    fontSize: 14,
    color: '#fff',
    opacity: 0.9,
  },
  featuresContainer: {
    flexDirection: 'row',
    justifyContent: 'space-around',
  },
  featureCard: {
    backgroundColor: '#fff',
    borderRadius: 12,
    padding: 15,
    alignItems: 'center',
    width: '30%',
    shadowColor: '#000',
    shadowOffset: {width: 0, height: 1},
    shadowOpacity: 0.1,
    shadowRadius: 2,
    elevation: 2,
  },
  featureIcon: {
    fontSize: 32,
    marginBottom: 8,
  },
  featureText: {
    fontSize: 12,
    color: '#666',
    textAlign: 'center',
  },
});

export default HomeScreen;
