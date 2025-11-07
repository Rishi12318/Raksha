import React, {useEffect} from 'react';
import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
  Image,
  StatusBar,
} from 'react-native';

const WelcomeScreen = ({navigation}) => {
  return (
    <>
      <StatusBar barStyle="light-content" backgroundColor="#dc2626" />
      <View style={styles.container}>
        <View style={styles.logoContainer}>
          <Text style={styles.logoIcon}>🛡️</Text>
          <Text style={styles.title}>Project Raksha Sutra</Text>
          <Text style={styles.subtitle}>Digital Protection Thread</Text>
          <View style={styles.tagline}>
            <Text style={styles.taglineText}>Your Safety, Our Priority</Text>
          </View>
        </View>

        <View style={styles.featuresContainer}>
          <View style={styles.feature}>
            <Text style={styles.featureIcon}>📍</Text>
            <Text style={styles.featureTitle}>GPS Tracking</Text>
            <Text style={styles.featureDesc}>Real-time location monitoring</Text>
          </View>

          <View style={styles.feature}>
            <Text style={styles.featureIcon}>🚨</Text>
            <Text style={styles.featureTitle}>SOS Alert</Text>
            <Text style={styles.featureDesc}>Emergency assistance</Text>
          </View>

          <View style={styles.feature}>
            <Text style={styles.featureIcon}>🔗</Text>
            <Text style={styles.featureTitle}>Smart Connect</Text>
            <Text style={styles.featureDesc}>Bluetooth integration</Text>
          </View>
        </View>

        <TouchableOpacity
          style={styles.button}
          onPress={() => navigation.navigate('Home')}
          activeOpacity={0.8}>
          <Text style={styles.buttonText}>Get Started</Text>
        </TouchableOpacity>

        <Text style={styles.footer}>Stay Safe, Stay Connected</Text>
      </View>
    </>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#dc2626',
    padding: 20,
    justifyContent: 'space-between',
  },
  logoContainer: {
    alignItems: 'center',
    marginTop: 60,
  },
  logoIcon: {
    fontSize: 80,
    marginBottom: 20,
  },
  title: {
    fontSize: 32,
    fontWeight: 'bold',
    color: '#fff',
    marginBottom: 8,
    textAlign: 'center',
  },
  subtitle: {
    fontSize: 18,
    color: '#fff',
    opacity: 0.9,
    marginBottom: 15,
  },
  tagline: {
    backgroundColor: 'rgba(255, 255, 255, 0.2)',
    paddingHorizontal: 20,
    paddingVertical: 8,
    borderRadius: 20,
    marginTop: 10,
  },
  taglineText: {
    color: '#fff',
    fontSize: 14,
    fontWeight: '600',
  },
  featuresContainer: {
    marginVertical: 20,
  },
  feature: {
    backgroundColor: 'rgba(255, 255, 255, 0.15)',
    borderRadius: 15,
    padding: 20,
    marginBottom: 15,
    alignItems: 'center',
  },
  featureIcon: {
    fontSize: 40,
    marginBottom: 10,
  },
  featureTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#fff',
    marginBottom: 5,
  },
  featureDesc: {
    fontSize: 14,
    color: '#fff',
    opacity: 0.9,
    textAlign: 'center',
  },
  button: {
    backgroundColor: '#fff',
    borderRadius: 30,
    paddingVertical: 18,
    paddingHorizontal: 40,
    alignItems: 'center',
    marginBottom: 20,
    shadowColor: '#000',
    shadowOffset: {width: 0, height: 4},
    shadowOpacity: 0.3,
    shadowRadius: 8,
    elevation: 8,
  },
  buttonText: {
    color: '#dc2626',
    fontSize: 18,
    fontWeight: 'bold',
  },
  footer: {
    textAlign: 'center',
    color: '#fff',
    fontSize: 14,
    opacity: 0.8,
    marginBottom: 20,
  },
});

export default WelcomeScreen;
