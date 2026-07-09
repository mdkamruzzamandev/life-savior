
import 'package:flutter/material.dart';

import 'category_screen.dart';
import 'orders_screen.dart';
import 'inbox_screen.dart';
import 'my_account_screen.dart';
import 'search_screen.dart';
import 'notifications_screen.dart';
import 'emergency_delivery_screen.dart';
import 'upload_prescription_screen.dart';
import 'address_management_screen.dart';

class HomeScreen extends StatefulWidget {
const HomeScreen({super.key});

@override
State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int selectedIndex = 0;

final List<Map<String, dynamic>> categories = [
{"name": "All Products", "icon": Icons.medical_services},
{"name": "Pain Relief", "icon": Icons.healing},
{"name": "Fever", "icon": Icons.thermostat},
{"name": "Cold & Flu", "icon": Icons.sick},
{"name": "Antibiotics", "icon": Icons.medication},
{"name": "Diabetes", "icon": Icons.monitor_heart},
{"name": "Heart Care", "icon": Icons.favorite},
{"name": "Asthma", "icon": Icons.air},
{"name": "Baby Care", "icon": Icons.child_care},
{"name": "First Aid", "icon": Icons.medical_information},
];

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xFFF4FFF8),

bottomNavigationBar: BottomNavigationBar(
currentIndex: selectedIndex,
type: BottomNavigationBarType.fixed,
selectedItemColor: const Color(0xFF00A651),
unselectedItemColor: Colors.grey,
onTap: (index) {
setState(() {
selectedIndex = index;
});

switch (index) {
case 1:
Navigator.push(
context,
MaterialPageRoute(
builder: (_) => const OrdersScreen(),
),
);
break;

case 2:
Navigator.push(
context,
MaterialPageRoute(
builder: (_) => const CategoryScreen(
categoryName: "All Products",
),
),
);
break;

case 3:
Navigator.push(
context,
MaterialPageRoute(
builder: (_) => const InboxScreen(),
),
);
break;

case 4:
Navigator.push(
context,
MaterialPageRoute(
builder: (_) => const MyAccountScreen(),
),
);
break;
}
},
items: const [
BottomNavigationBarItem(
icon: Icon(Icons.home),
label: "Home",
),
BottomNavigationBarItem(
icon: Icon(Icons.shopping_bag),
label: "Orders",
),
BottomNavigationBarItem(
icon: Icon(Icons.category),
label: "Categories",
),
BottomNavigationBarItem(
icon: Icon(Icons.chat),
label: "Inbox",
),
BottomNavigationBarItem(
icon: Icon(Icons.person),
label: "Account",
),
],
),

body: SafeArea(
child: SingleChildScrollView(
padding: const EdgeInsets.all(16),
child: Column(
children: [

/// TOP BAR

Row(
children: [
Container(
height: 60,
width: 60,
decoration: BoxDecoration(
color: Colors.green.shade100,
borderRadius: BorderRadius.circular(18),
),
child: const Icon(
Icons.local_pharmacy,
color: Color(0xFF00A651),
size: 34,
),
),

const SizedBox(width: 12),

const Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
"Life Savior",
style: TextStyle(
fontSize: 22,
fontWeight: FontWeight.bold,
),
),
Text(
"Medicine At Your Door",
style: TextStyle(
color: Colors.grey,
),
),
],
),
),

IconButton(
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (_) => const SearchScreen(),
),
);
},
icon: const Icon(Icons.search),
),

IconButton(
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (_) => const NotificationsScreen(),
),
);
},
icon: const Icon(Icons.notifications),
),
],
),

const SizedBox(height: 20),

/// EMERGENCY DELIVERY

GestureDetector(
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (_) => const EmergencyDeliveryScreen(),
),
);
},
child: Container(
width: double.infinity,
padding: const EdgeInsets.all(22),
decoration: BoxDecoration(
color: Colors.red,
borderRadius: BorderRadius.circular(24),
),
child: Column(
children: [
const Icon(
Icons.emergency,
color: Colors.white,
size: 60,
),

const SizedBox(height: 10),

const Text(
"EMERGENCY DELIVERY",
style: TextStyle(
color: Colors.white,
fontSize: 24,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 8),

const Text(
"All You Need After Midnight",
textAlign: TextAlign.center,
style: TextStyle(
color: Colors.white,
fontSize: 15,
),
),

const SizedBox(height: 10),

const Text(
"45 Minutes • ৳200",
style: TextStyle(
color: Colors.white,
fontWeight: FontWeight.bold,
fontSize: 18,
),
),

const SizedBox(height: 18),

  Row(
    children: [
      Expanded(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const EmergencyDeliveryScreen(),
              ),
            );
          },
          icon: const Icon(Icons.call),
          label: const Text("Call Now"),
        ),
      ),

      const SizedBox(width: 10),

      Expanded(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const EmergencyDeliveryScreen(),
              ),
            );
          },
          icon: const Icon(Icons.message),
          label: const Text("WhatsApp"),
        ),
      ),
    ],
  ),
],
),
),
),

const SizedBox(height: 20),

/// QUICK ACTIONS

Row(
children: [
Expanded(
child: InkWell(
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (_) =>
const UploadPrescriptionScreen(),
),
);
},
child: quickCard(
Icons.upload_file,
"Upload\nPrescription",
),
),
),

const SizedBox(width: 10),

Expanded(
child: InkWell(
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (_) => const OrdersScreen(),
),
);
},
child: quickCard(
Icons.shopping_bag,
"Orders",
),
),
),

const SizedBox(width: 10),

Expanded(
child: InkWell(
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (_) =>
const AddressManagementScreen(),
),
);
},
child: quickCard(
Icons.location_on,
"Address",
),
),
),
],
),

const SizedBox(height: 25),

const Align(
alignment: Alignment.centerLeft,
child: Text(
"Medicine Categories",
style: TextStyle(
fontSize: 22,
fontWeight: FontWeight.bold,
),
),
),

const SizedBox(height: 15),

GridView.builder(
itemCount: categories.length,
shrinkWrap: true,
physics: const NeverScrollableScrollPhysics(),
gridDelegate:
const SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2,
crossAxisSpacing: 12,
mainAxisSpacing: 12,
childAspectRatio: 1.25,
),
itemBuilder: (context, index) {
return Card(
elevation: 3,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(18),
),
child: InkWell(
borderRadius: BorderRadius.circular(18),
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (_) => CategoryScreen(
categoryName:
categories[index]["name"],
),
),
);
},
child: Column(
mainAxisAlignment:
MainAxisAlignment.center,
children: [
Icon(
categories[index]["icon"],
size: 40,
color: const Color(0xFF00A651),
),
const SizedBox(height: 10),
Text(
categories[index]["name"],
textAlign: TextAlign.center,
style: const TextStyle(
fontWeight: FontWeight.w600,
),
),
],
),
),
);
},
),

const SizedBox(height: 20),
],
),
),
),
);
}

Widget quickCard(
IconData icon,
String title,
) {
return Container(
height: 120,
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(18),
boxShadow: [
BoxShadow(
color: Colors.grey.withOpacity(0.10),
blurRadius: 10,
offset: const Offset(0, 4),
),
],
),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(
icon,
size: 34,
color: const Color(0xFF00A651),
),
const SizedBox(height: 10),
Text(
title,
textAlign: TextAlign.center,
style: const TextStyle(
fontWeight: FontWeight.w600,
),
),
],
),
);
}
}
