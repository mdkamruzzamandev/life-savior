
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'edit_profile_screen.dart';
import 'address_management_screen.dart';
import 'notifications_screen.dart';
import 'orders_screen.dart';
import 'help_support_screen.dart';
import 'about_life_savior_screen.dart';
import 'privacy_policy_screen.dart';

class MyAccountScreen extends StatelessWidget {
const MyAccountScreen({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xFFF4FFF8),

appBar: AppBar(
title: const Text("My Account"),
backgroundColor: const Color(0xFF00A651),
foregroundColor: Colors.white,
centerTitle: true,
),

body: SingleChildScrollView(
child: Column(
children: [
Container(
width: double.infinity,
padding: const EdgeInsets.symmetric(
vertical: 30,
),
decoration: const BoxDecoration(
color: Color(0xFF00A651),
borderRadius: BorderRadius.only(
bottomLeft: Radius.circular(30),
bottomRight: Radius.circular(30),
),
),
child: const Column(
children: [
CircleAvatar(
radius: 45,
backgroundColor: Colors.white,
child: Icon(
Icons.person,
size: 50,
color: Color(0xFF00A651),
),
),

SizedBox(height: 12),

Text(
"Kamrul Hasan",
style: TextStyle(
color: Colors.white,
fontSize: 22,
fontWeight: FontWeight.bold,
),
),

SizedBox(height: 5),

Text(
"+8801XXXXXXXXX",
style: TextStyle(
color: Colors.white70,
),
),
],
),
),

const SizedBox(height: 20),

_menuTile(
context,
icon: Icons.person_outline,
title: "Edit Profile",
page: const EditProfileScreen(),
),

_menuTile(
context,
icon: Icons.location_on_outlined,
title: "Saved Addresses",
page: const AddressManagementScreen(),
),

_menuTile(
context,
icon: Icons.notifications_outlined,
title: "Notifications",
page: const NotificationsScreen(),
),

_menuTile(
context,
icon: Icons.receipt_long_outlined,
title: "Order History",
page: const OrdersScreen(),
),

_menuTile(
context,
icon: Icons.support_agent,
title: "Help Center",
page: const HelpSupportScreen(),
),

_menuTile(
context,
icon: Icons.info_outline,
title: "About Life Savior",
page: const AboutLifeSaviorScreen(),
),

_menuTile(
context,
icon: Icons.privacy_tip_outlined,
title: "Privacy Policy",
page: const PrivacyPolicyScreen(),
),

const SizedBox(height: 20),

Padding(
padding: const EdgeInsets.symmetric(
horizontal: 20,
),
child: SizedBox(
width: double.infinity,
height: 55,
child: ElevatedButton.icon(
onPressed: () {
Navigator.pushAndRemoveUntil(
context,
MaterialPageRoute(
builder: (_) => const LoginScreen(),
),
(route) => false,
);
},
icon: const Icon(Icons.logout),
label: const Text(
"Logout",
style: TextStyle(
fontSize: 16,
fontWeight: FontWeight.bold,
),
),
style: ElevatedButton.styleFrom(
backgroundColor: Colors.red,
foregroundColor: Colors.white,
shape: RoundedRectangleBorder(
borderRadius:
BorderRadius.circular(15),
),
),
),
),
),

const SizedBox(height: 30),

const Text(
"Life Savior v1.0.0",
style: TextStyle(
color: Colors.grey,
),
),

const SizedBox(height: 20),
],
),
),
);
}

Widget _menuTile(
BuildContext context, {
required IconData icon,
required String title,
required Widget page,
}) {
return Padding(
padding: const EdgeInsets.symmetric(
horizontal: 15,
vertical: 5,
),
child: Card(
elevation: 1,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(15),
),
child: ListTile(
leading: Icon(
icon,
color: const Color(0xFF00A651),
),
title: Text(
title,
style: const TextStyle(
fontWeight: FontWeight.w600,
),
),
trailing: const Icon(
Icons.arrow_forward_ios,
size: 16,
),
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (_) => page,
),
);
},
),
),
);
}
}