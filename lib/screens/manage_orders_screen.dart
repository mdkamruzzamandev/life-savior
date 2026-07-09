
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'admin_orders_details_screen.dart';

class ManageOrdersScreen extends StatefulWidget {
const ManageOrdersScreen({super.key});

@override
State<ManageOrdersScreen> createState() =>
_ManageOrdersScreenState();
}

class _ManageOrdersScreenState
extends State<ManageOrdersScreen>
with SingleTickerProviderStateMixin {

late TabController _tabController;

final List<Map<String, dynamic>> orders = [
{
"id": "#LS2026001",
"customer": "Kamrul Hasan",
"phone": "01700000001",
"address": "Kaliganj, Gazipur",
"amount": "৳480",
"status": "Pending",
"medicines": "Napa Extra, Ace"
},
{
"id": "#LS2026002",
"customer": "Rahim Uddin",
"phone": "01700000002",
"address": "Dhaka",
"amount": "৳350",
"status": "Processing",
"medicines": "Seclo, Napa"
},
{
"id": "#LS2026003",
"customer": "Karim",
"phone": "01700000003",
"address": "Gazipur",
"amount": "৳650",
"status": "Delivered",
"medicines": "Ace Plus"
},
];

@override
void initState() {
super.initState();

_tabController =
TabController(length: 3, vsync: this);
}

Future<void> _callCustomer(String phone) async {
final Uri uri = Uri(
scheme: 'tel',
path: phone,
);

await launchUrl(uri);
}

Future<void> _whatsappCustomer(
String phone) async {
final Uri uri = Uri.parse(
"https://wa.me/88$phone",
);

await launchUrl(
uri,
mode: LaunchMode.externalApplication,
);
}

List<Map<String, dynamic>> getOrders(
String status) {
return orders
    .where((order) =>
order["status"] == status)
    .toList();
}

void updateStatus(
String orderId,
String newStatus) {
setState(() {
final index = orders.indexWhere(
(o) => o["id"] == orderId);

if (index != -1) {
orders[index]["status"] = newStatus;
}
});

ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content:
Text("Order updated to $newStatus"),
),
);
}

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor:
const Color(0xFFF4FFF8),

appBar: AppBar(
title:
const Text("Manage Orders"),
backgroundColor:
const Color(0xFF00A651),
foregroundColor: Colors.white,
bottom: TabBar(
controller: _tabController,
tabs: const [
Tab(text: "Pending"),
Tab(text: "Processing"),
Tab(text: "Delivered"),
],
),
),

body: TabBarView(
controller: _tabController,
children: [
buildOrderList("Pending"),
buildOrderList("Processing"),
buildOrderList("Delivered"),
],
),
);
}

Widget buildOrderList(String status) {
final filtered =
getOrders(status);

if (filtered.isEmpty) {
return const Center(
child: Text(
"No Orders Found",
),
);
}

return ListView.builder(
padding: const EdgeInsets.all(16),
itemCount: filtered.length,
itemBuilder: (context, index) {
final order = filtered[index];

return buildOrderCard(order);
},
);
}

Widget buildOrderCard(
Map<String, dynamic> order) {
return Card(
margin:
const EdgeInsets.only(bottom: 16),
elevation: 2,
shape: RoundedRectangleBorder(
borderRadius:
BorderRadius.circular(20),
),
child: Padding(
padding:
const EdgeInsets.all(16),
child: Column(
crossAxisAlignment:
CrossAxisAlignment.start,
children: [

Text(
order["id"],
style: const TextStyle(
fontSize: 20,
fontWeight:
FontWeight.bold,
),
),

const SizedBox(height: 10),

Text(
"Customer: ${order["customer"]}",
),

Text(
"Phone: ${order["phone"]}",
),

Text(
"Address: ${order["address"]}",
),

const SizedBox(height: 8),

Text(
"Medicines: ${order["medicines"]}",
),

const SizedBox(height: 8),

Text(
order["amount"],
style: const TextStyle(
color:
Color(0xFF00A651),
fontSize: 22,
fontWeight:
FontWeight.bold,
),
),

const SizedBox(height: 15),

Row(
children: [
Expanded(
child:
OutlinedButton.icon(
icon:
const Icon(Icons.call),
label:
const Text("Call"),
onPressed: () {
_callCustomer(
order["phone"]);
},
),
),

const SizedBox(width: 10),

Expanded(
child:
OutlinedButton.icon(
icon:
const Icon(Icons.chat),
label: const Text(
"WhatsApp"),
onPressed: () {
_whatsappCustomer(
order["phone"]);
},
),
),
],
),

const SizedBox(height: 10),

SizedBox(
width: double.infinity,
child: ElevatedButton.icon(
icon:
const Icon(Icons.info),
label:
const Text("View Details"),
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (_) =>
const AdminOrdersDetailsScreen(),
),
);
},
),
),
const SizedBox(height: 12),

    if (order["status"] == "Pending")
Row(
  children: [
    Expanded(
      child: ElevatedButton(
        onPressed: () {
          updateStatus(
            order["id"],
            "Processing",
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
        ),
        child: const Text(
          "Confirm Order",
        ),
      ),
    ),
  ],
),

  if (order["status"] == "Processing")
  Row(
  children: [
  Expanded(
  child: ElevatedButton(
  onPressed: () {
  updateStatus(
  order["id"],
  "Delivered",
  );
  },
  style: ElevatedButton.styleFrom(
  backgroundColor: Colors.green,
  foregroundColor: Colors.white,
  ),
  child: const Text(
  "Mark Delivered",
  ),
  ),
  ),
  ],
  ),

  if (order["status"] == "Delivered")
  Container(
  width: double.infinity,
  padding: const EdgeInsets.all(12),
  decoration: BoxDecoration(
  color: Colors.green.shade100,
  borderRadius:
  BorderRadius.circular(12),
  ),
  child: const Center(
  child: Text(
  "Order Completed",
  style: TextStyle(
  color: Colors.green,
  fontWeight: FontWeight.bold,
  ),
  ),
  ),
  ),
  ],
  ),
  ),
  );
  }

@override
void dispose() {
  _tabController.dispose();
  super.dispose();
}
}