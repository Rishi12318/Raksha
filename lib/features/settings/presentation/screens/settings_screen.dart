import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          // Profile Section
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text('Profile'),
            subtitle: const Text('Manage your profile'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to profile screen
            },
          ),
          const Divider(),
          
          // Watch Connection
          ListTile(
            leading: const Icon(Icons.watch),
            title: const Text('Wear OS Watch'),
            subtitle: const Text('Connect and manage your smartwatch'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to watch settings
            },
          ),
          const Divider(),
          
          // Emergency Contacts
          ListTile(
            leading: const Icon(Icons.contacts),
            title: const Text('Emergency Contacts'),
            subtitle: const Text('Manage emergency contacts'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to emergency contacts
            },
          ),
          const Divider(),
          
          // Location Settings
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Location Settings'),
            subtitle: const Text('Configure location tracking'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to location settings
            },
          ),
          const Divider(),
          
          // Notifications
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            subtitle: const Text('Manage notification preferences'),
            trailing: Switch(
              value: true, // TODO: Get from state
              onChanged: (value) {
                // TODO: Update notification settings
              },
            ),
          ),
          const Divider(),
          
          // About
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            subtitle: const Text('App version and information'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Show about dialog
            },
          ),
          const Divider(),
          
          // Privacy Policy
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Policy'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Show privacy policy
            },
          ),
          const Divider(),
          
          // Logout
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              // TODO: Implement logout
            },
          ),
        ],
      ),
    );
  }
}

