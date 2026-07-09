
import 'package:flutter/material.dart';
import 'my_order_screen.dart';

class OrderSuccessScreen extends StatelessWidget {
const OrderSuccessScreen({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xFFF4FFF8),

body: Center(
child: Padding(
padding: const EdgeInsets.all(24),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [

Container(
height: 120,
width: 120,
decoration: const BoxDecoration(
color: Color(0xFF00A651),
shape: BoxShape.circle,
),
child: const Icon(
Icons.check,
color: Colors.white,
size: 70,
),
),

const SizedBox(height: 25),

const Text(
"Order Placed Successfully!",
textAlign: TextAlign.center,
style: TextStyle(
fontSize: 28,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 10),

const Text(
"Thank you for choosing Life Savior.",
textAlign: TextAlign.center,
style: TextStyle(
color: Colors.grey,
fontSize: 16,
),
),

const SizedBox(height: 25),

Container(
width: double.infinity,
padding: const EdgeInsets.all(18),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(18),
),
child: const Column(
children: [

Row(
mainAxisAlignment:
MainAxisAlignment.spaceBetween,
children: [
Text("Order ID"),
Text(
"#LS1001",
style: TextStyle(
fontWeight: FontWeight.bold,
),
),
],
),

SizedBox(height: 12),

Row(
mainAxisAlignment:
MainAxisAlignment.spaceBetween,
children: [
Text("Status"),
Text(
"Processing",
style: TextStyle(
color: Colors.orange,
fontWeight: FontWeight.bold,
),
),
],
),

SizedBox(height: 12),

Row(
mainAxisAlignment:
MainAxisAlignment.spaceBetween,
children: [
Text("Estimated Delivery"),
Text(
"45-60 Minutes",
style: TextStyle(
fontWeight: FontWeight.bold,
),
),
],
),
],
),
),

const SizedBox(height: 30),

SizedBox(
width: double.infinity,
height: 55,
child: ElevatedButton(
style: ElevatedButton.styleFrom(
backgroundColor:
const Color(0xFF00A651),
foregroundColor: Colors.white,
),
onPressed: () {
Navigator.pushReplacement(
context,
MaterialPageRoute(
builder: (_) =>
const MyOrdersScreen(),
),
);
},
child: const Text(
"View My Orders",
style: TextStyle(
fontSize: 17,
fontWeight: FontWeight.bold,
),
),
),
),

const SizedBox(height: 12),

SizedBox(
width: double.infinity,
height: 55,
child: OutlinedButton(
onPressed: () {
Navigator.popUntil(
context,
(route) => route.isFirst,
);
},
child: const Text(
"Back To Home",
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