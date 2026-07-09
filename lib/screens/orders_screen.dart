
import 'package:flutter/material.dart';
import 'order_details_screen.dart';
import 'track_order_screen.dart';

class OrdersScreen extends StatelessWidget {
const OrdersScreen({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xFFF4FFF8),

appBar: AppBar(
title: const Text("My Orders"),
backgroundColor: const Color(0xFF00A651),
foregroundColor: Colors.white,
),

body: ListView(
padding: const EdgeInsets.all(16),
children: [

_orderCard(
context,
orderId: "#LS2026001",
medicine: "Napa Extra",
amount: "৳350",
status: "Pending",
time: "5 mins ago",
),

const SizedBox(height: 16),

_orderCard(
context,
orderId: "#LS2026002",
medicine: "Ace + Napa",
amount: "৳480",
status: "Processing",
time: "20 mins ago",
),

const SizedBox(height: 16),

_orderCard(
context,
orderId: "#LS2025998",
medicine: "Paracetamol",
amount: "৳220",
status: "Delivered",
time: "Yesterday",
),
],
),
);
}

Widget _orderCard(
BuildContext context, {
required String orderId,
required String medicine,
required String amount,
required String status,
required String time,
}) {
Color statusColor = Colors.orange;

if (status == "Processing") {
statusColor = Colors.blue;
}

if (status == "Delivered") {
statusColor = Colors.green;
}

return Card(
elevation: 2,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(20),
),
child: Padding(
padding: const EdgeInsets.all(16),
child: Column(
children: [

Row(
children: [

Container(
padding: const EdgeInsets.all(12),
decoration: BoxDecoration(
color: Colors.green.shade50,
borderRadius: BorderRadius.circular(12),
),
child: const Icon(
Icons.medical_services,
color: Color(0xFF00A651),
),
),

const SizedBox(width: 12),

Expanded(
child: Column(
crossAxisAlignment:
CrossAxisAlignment.start,
children: [

Text(
orderId,
style: const TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 4),

Text(
medicine,
style: const TextStyle(
color: Colors.grey,
),
),
],
),
),

Container(
padding: const EdgeInsets.symmetric(
horizontal: 12,
vertical: 6,
),
decoration: BoxDecoration(
color: statusColor.withValues(alpha: 0.15),
borderRadius:
BorderRadius.circular(20),
),
child: Text(
status,
style: TextStyle(
color: statusColor,
fontWeight: FontWeight.bold,
),
),
),
],
),

const SizedBox(height: 20),

Row(
mainAxisAlignment:
MainAxisAlignment.spaceBetween,
children: [

Text(
amount,
style: const TextStyle(
color: Color(0xFF00A651),
fontSize: 22,
fontWeight: FontWeight.bold,
),
),

Text(
time,
style: const TextStyle(
color: Colors.grey,
),
),
],
),

const SizedBox(height: 20),

Row(
children: [

Expanded(
child: OutlinedButton.icon(
icon: const Icon(Icons.info),
label: const Text("Details"),
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (_) =>
OrderDetailsScreen(
orderId: orderId,
medicineName: medicine,
price: amount,
),
),
);
},
),
),

const SizedBox(width: 12),

Expanded(
child: ElevatedButton.icon(
style: ElevatedButton.styleFrom(
backgroundColor:
const Color(0xFF00A651),
foregroundColor: Colors.white,
),
icon: const Icon(
Icons.location_on,
),
label: const Text("Track"),
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (_) =>
TrackOrderScreen(
orderId: orderId,
),
),
);
},
),
),
],
),
],
),
),
);
}
}