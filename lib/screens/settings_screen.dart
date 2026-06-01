import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkMode = false;
  bool notifications = true;
  bool orderUpdates = true;
  bool offers = true;

  String selectedLanguage = "English";

  final Color primaryColor = const Color(0xffFF3D5A);

  /// SHOW MESSAGE
  void showMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  /// NAVIGATION PLACEHOLDER
  void goTo(String page) {
    showMsg("$page screen coming soon 🚀");
  }

  /// LOGOUT DIALOG
  void logout() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();

              if (context.mounted) {
                Navigator.pushReplacementNamed(context, "/login");
              }
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ACCOUNT
              const Text(
                "Account",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person_outline),
                      title: const Text("Edit Profile"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                      onTap: () => goTo("Edit Profile"),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.lock_outline),
                      title: const Text("Change Password"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                      onTap: () => goTo("Change Password"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// APP SETTINGS
              const Text(
                "App Settings",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              Card(
                child: Column(
                  children: [
                    SwitchListTile(
                      value: darkMode,
                      activeColor: primaryColor,
                      title: const Text("Dark Mode"),
                      secondary: const Icon(Icons.dark_mode_outlined),
                      onChanged: (value) {
                        setState(() => darkMode = value);
                        showMsg("Dark Mode: $value");
                      },
                    ),
                    const Divider(height: 1),
                    SwitchListTile(
                      value: notifications,
                      activeColor: primaryColor,
                      title: const Text("Notifications"),
                      secondary: const Icon(Icons.notifications_none),
                      onChanged: (value) {
                        setState(() => notifications = value);
                        showMsg("Notifications: $value");
                      },
                    ),
                    const Divider(height: 1),
                    SwitchListTile(
                      value: orderUpdates,
                      activeColor: primaryColor,
                      title: const Text("Order Updates"),
                      secondary: const Icon(Icons.local_shipping_outlined),
                      onChanged: (value) {
                        setState(() => orderUpdates = value);
                        showMsg("Order Updates: $value");
                      },
                    ),
                    const Divider(height: 1),
                    SwitchListTile(
                      value: offers,
                      activeColor: primaryColor,
                      title: const Text("Offers & Discounts"),
                      secondary: const Icon(Icons.local_offer_outlined),
                      onChanged: (value) {
                        setState(() => offers = value);
                        showMsg("Offers: $value");
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// LANGUAGE
              const Text(
                "Language",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: DropdownButtonFormField(
                    value: selectedLanguage,
                    decoration: const InputDecoration(border: InputBorder.none),
                    items: const [
                      DropdownMenuItem(
                          value: "English", child: Text("English")),
                      DropdownMenuItem(value: "Tamil", child: Text("Tamil")),
                      DropdownMenuItem(
                          value: "Sinhala", child: Text("Sinhala")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value!;
                      });
                      showMsg("Language: $value");
                    },
                  ),
                ),
              ),

              const SizedBox(height: 25),

              /// SUPPORT
              const Text(
                "Support",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.help_outline),
                      title: const Text("Help Center"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                      onTap: () => goTo("Help Center"),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.privacy_tip_outlined),
                      title: const Text("Privacy Policy"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                      onTap: () => goTo("Privacy Policy"),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.info_outline),
                      title: const Text("About App"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                      onTap: () => goTo("About App"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// LOGOUT
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: logout,
                  child: const Text(
                    "Logout",
                    style: TextStyle(fontSize: 18, color: Colors.white),
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
