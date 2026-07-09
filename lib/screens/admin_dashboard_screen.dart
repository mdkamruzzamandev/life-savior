import 'package:flutter/material.dart';
import 'notifications_management_screen.dart';
import 'rider_management_screen.dart';
import 'admin_management_screen.dart';
import 'reports_screen.dart';
import 'manage_orders_screen.dart';
import 'emergency_orders_screen.dart';
import 'prescription_orders_screen.dart';
import 'manage_medicines_screen.dart';
import 'manage_categories_screen.dart';
import 'customers_screen.dart';
import 'delivery_settings_screen.dart';
import 'manage_emergency_contacts_screen.dart';

class AdminDashboardScreen extends StatelessWidget {
const AdminDashboardScreen({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xFFF4FFF8),

appBar: AppBar(
title: const Text("Life Savior Admin"),
backgroundColor: const Color(0xFF00A651),
foregroundColor: Colors.white,
centerTitle: true,
),

body: SingleChildScrollView(
padding: const EdgeInsets.all(16),

child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
/// SUPER ADMIN CARD

Container(
width: double.infinity,
padding: const EdgeInsets.all(20),

decoration: BoxDecoration(
color: const Color(0xFF00A651),
borderRadius: BorderRadius.circular(20),
),

child: const Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
"Super Admin Panel",
style: TextStyle(
color: Colors.white,
fontSize: 24,
fontWeight: FontWeight.bold,
),
),

SizedBox(height: 6),

Text(
"Full Business Control",
style: TextStyle(
color: Colors.white70,
),
),
],
),
),

const SizedBox(height: 20),

/// STATS

Row(
children: [
Expanded(
child: _statCard(
"Pending",
"12",
Colors.orange,
),
),

const SizedBox(width: 10),

Expanded(
child: _statCard(
"Processing",
"8",
Colors.blue,
),
),
],
),

const SizedBox(height: 10),

Row(
children: [
Expanded(
child: _statCard(
"Delivered",
"105",
Colors.green,
),
),

const SizedBox(width: 10),

Expanded(
child: _statCard(
"Emergency",
"6",
Colors.red,
),
),
],
),

const SizedBox(height: 20),

Container(
width: double.infinity,
padding: const EdgeInsets.all(20),

decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(20),
),

child: const Column(
children: [
Text(
"Today's Revenue",
style: TextStyle(
color: Colors.grey,
),
),

SizedBox(height: 8),

Text(
"৳ 25,430",
style: TextStyle(
fontSize: 28,
fontWeight: FontWeight.bold,
color: Color(0xFF00A651),
),
),
],
),
),

const SizedBox(height: 25),

const Text(
"Management",
style: TextStyle(
fontSize: 22,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 15),

GridView.count(
shrinkWrap: true,
physics: const NeverScrollableScrollPhysics(),
crossAxisCount: 2,
crossAxisSpacing: 12,
mainAxisSpacing: 12,
childAspectRatio: 1.1,

children: [
_dashboardCard(
context,
"Manage Orders",
Icons.shopping_bag,
const ManageOrdersScreen(),
),

_dashboardCard(
context,
"Emergency Orders",
Icons.emergency,
const EmergencyOrdersScreen(),
),
  _dashboardCard(
    context,
    "Emergency Contacts",
    Icons.contact_phone,
    const ManageEmergencyContactsScreen(),
  ),
_dashboardCard(
context,
"Prescriptions",
Icons.receipt_long,
const PrescriptionOrdersScreen(),
),

_dashboardCard(
context,
"Medicines",
Icons.medication,
const ManageMedicinesScreen(),
),

_dashboardCard(
context,
"Categories",
Icons.category,
const ManageCategoriesScreen(),
),

_dashboardCard(
context,
"Customers",
Icons.people,
const CustomersScreen(),
),

_dashboardCard(
context,
"Delivery Settings",
Icons.local_shipping,
const DeliverySettingsScreen(),
),

_dashboardCard(
context,
"Notifications",
Icons.notifications,
const NotificationsManagementScreen(),
),

_dashboardCard(
context,
"Riders",
Icons.delivery_dining,
const RiderManagementScreen(),
),

_dashboardCard(
context,
"Admins",
Icons.admin_panel_settings,
const AdminManagementScreen(),
),

_dashboardCard(
context,
"Reports",
Icons.bar_chart,
const ReportsScreen(),
),
],
),

const SizedBox(height: 30),
],
),
),
);
}

static Widget _dashboardCard(
BuildContext context,
String title,
IconData icon,
Widget page,
) {
return InkWell(
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (_) => page,
),
);
},

child: Container(
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(20),

boxShadow: [
BoxShadow(
color: Colors.grey.withOpacity(0.1),
blurRadius: 10,
),
],
),

child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(
icon,
size: 45,
color: const Color(0xFF00A651),
),

const SizedBox(height: 12),

Text(
title,
textAlign: TextAlign.center,
style: const TextStyle(
fontWeight: FontWeight.bold,
),
),
],
),
),
);
}

static Widget _statCard(
String title,
String value,
Color color,
) {
return Container(
padding: const EdgeInsets.all(18),

decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(18),
),

child: Column(
children: [
Text(
value,
style: TextStyle(
color: color,
fontSize: 28,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 5),

Text(title),
],
),
);
}
}