import React, {useState} from 'react';
import {
  View,
  Text,
  StyleSheet,
  Switch,
  TouchableOpacity,
  ScrollView,
} from 'react-native';

const SettingsScreen = () => {
  const [gpsEnabled, setGpsEnabled] = useState(true);
  const [bluetoothEnabled, setBluetoothEnabled] = useState(false);
  const [autoSOS, setAutoSOS] = useState(false);

  return (
    <ScrollView style={styles.container}>
      <View style={styles.header}>
        <Text style={styles.title}>⚙️ Settings</Text>
      </View>

      <View style={styles.section}>
        <Text style={styles.sectionTitle}>Safety Features</Text>

        <View style={styles.settingItem}>
          <View style={styles.settingInfo}>
            <Text style={styles.settingLabel}>GPS Tracking</Text>
            <Text style={styles.settingDescription}>
              Real-time location monitoring
            </Text>
          </View>
          <Switch
            value={gpsEnabled}
            onValueChange={setGpsEnabled}
            trackColor={{false: '#ccc', true: '#dc2626'}}
            thumbColor={gpsEnabled ? '#fff' : '#f4f3f4'}
          />
        </View>

        <View style={styles.settingItem}>
          <View style={styles.settingInfo}>
            <Text style={styles.settingLabel}>Bluetooth Sync</Text>
            <Text style={styles.settingDescription}>
              Connect to smartwatch
            </Text>
          </View>
          <Switch
            value={bluetoothEnabled}
            onValueChange={setBluetoothEnabled}
            trackColor={{false: '#ccc', true: '#dc2626'}}
            thumbColor={bluetoothEnabled ? '#fff' : '#f4f3f4'}
          />
        </View>

        <View style={styles.settingItem}>
          <View style={styles.settingInfo}>
            <Text style={styles.settingLabel}>Auto SOS</Text>
            <Text style={styles.settingDescription}>
              Automatic emergency detection
            </Text>
          </View>
          <Switch
            value={autoSOS}
            onValueChange={setAutoSOS}
            trackColor={{false: '#ccc', true: '#dc2626'}}
            thumbColor={autoSOS ? '#fff' : '#f4f3f4'}
          />
        </View>
      </View>

      <View style={styles.section}>
        <Text style={styles.sectionTitle}>Emergency Contacts</Text>
        <TouchableOpacity style={styles.button}>
          <Text style={styles.buttonText}>Manage Contacts</Text>
        </TouchableOpacity>
      </View>

      <View style={styles.section}>
        <Text style={styles.sectionTitle}>About</Text>
        <Text style={styles.aboutText}>
          Raksha Sutra - Digital Protection Thread
        </Text>
        <Text style={styles.versionText}>Version 1.0.0</Text>
      </View>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
  header: {
    padding: 20,
    paddingTop: 40,
    backgroundColor: '#fff',
    borderBottomWidth: 1,
    borderBottomColor: '#eee',
  },
  title: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#333',
  },
  section: {
    backgroundColor: '#fff',
    marginTop: 20,
    padding: 20,
  },
  sectionTitle: {
    fontSize: 18,
    fontWeight: '600',
    color: '#333',
    marginBottom: 15,
  },
  settingItem: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingVertical: 15,
    borderBottomWidth: 1,
    borderBottomColor: '#f0f0f0',
  },
  settingInfo: {
    flex: 1,
  },
  settingLabel: {
    fontSize: 16,
    fontWeight: '500',
    color: '#333',
    marginBottom: 4,
  },
  settingDescription: {
    fontSize: 14,
    color: '#666',
  },
  button: {
    backgroundColor: '#dc2626',
    borderRadius: 10,
    padding: 15,
    alignItems: 'center',
    marginTop: 10,
  },
  buttonText: {
    color: '#fff',
    fontSize: 16,
    fontWeight: '600',
  },
  aboutText: {
    fontSize: 16,
    color: '#666',
    marginBottom: 8,
  },
  versionText: {
    fontSize: 14,
    color: '#999',
  },
});

export default SettingsScreen;
