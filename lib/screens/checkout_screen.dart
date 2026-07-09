
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'order_success_screen.dart';

class CheckoutScreen extends StatefulWidget {
  final double medicineTotal;
  final String medicineName;
  final int quantity;

  const CheckoutScreen({
    super.key,
    required this.medicineTotal,
    required this.medicineName,
    required this.quantity,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
final TextEditingController nameController =
TextEditingController();

final TextEditingController phoneController =
TextEditingController();

final TextEditingController addressController =
TextEditingController();

String paymentMethod = "Cash On Delivery";
String deliveryType = "Standard Delivery";

double deliveryFee = 65;

@override
void dispose() {
nameController.dispose();
phoneController.dispose();
addressController.dispose();
super.dispose();
}

Future<void> placeOrder() async {
if (nameController.text.trim().isEmpty ||
phoneController.text.trim().isEmpty ||
addressController.text.trim().isEmpty) {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text("Please fill all fields"),
),
);
return;
}

final grandTotal =
widget.medicineTotal + deliveryFee;

try {
  await FirebaseFirestore.instance
      .collection("orders")
      .add({
    "customer_name": nameController.text,
    "phone": phoneController.text,
    "address": addressController.text,

    "medicine_name": widget.medicineName,
    "quantity":  widget.quantity,

    "payment_method": paymentMethod,
    "delivery_type": deliveryType,
    "delivery_fee": deliveryFee,

    "medicine_total": widget.medicineTotal,
    "grand_total": grandTotal,

    "status": "pending",
    "created_at": FieldValue.serverTimestamp(),
  });

if (!mounted) return;

Navigator.pushReplacement(
context,
MaterialPageRoute(
builder: (_) =>
const OrderSuccessScreen(),
),
);
} catch (e) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text(
"Order failed: $e",
),
),
);
}
}

@override
Widget build(BuildContext context) {
final grandTotal =
widget.medicineTotal + deliveryFee;

return Scaffold(
backgroundColor:
const Color(0xFFF4FFF8),

appBar: AppBar(
title: const Text("Checkout"),
backgroundColor:
const Color(0xFF00A651),
foregroundColor: Colors.white,
),

body: SingleChildScrollView(
padding: const EdgeInsets.all(16),

child: Column(
children: [
TextField(
controller: nameController,
decoration:
const InputDecoration(
labelText: "Full Name",
border:
OutlineInputBorder(),
),
),

const SizedBox(height: 15),

TextField(
controller: phoneController,
keyboardType:
TextInputType.phone,
decoration:
const InputDecoration(
labelText:
"Phone Number",
border:
OutlineInputBorder(),
),
),

const SizedBox(height: 15),

TextField(
controller:
addressController,
maxLines: 3,
decoration:
const InputDecoration(
labelText:
"Delivery Address",
border:
OutlineInputBorder(),
),
),

const SizedBox(height: 20),

Container(
padding:
const EdgeInsets.all(15),
decoration: BoxDecoration(
color: Colors.white,
borderRadius:
BorderRadius.circular(
15),
),
child: Column(
crossAxisAlignment:
CrossAxisAlignment
    .start,
children: [
const Text(
"Delivery Type",
style: TextStyle(
fontWeight:
FontWeight.bold,
fontSize: 18,
),
),

RadioListTile<String>(
value:
"Standard Delivery",
groupValue:
deliveryType,
title: const Text(
"Standard Delivery"),
subtitle: const Text(
"Delivery Fee ৳65"),
onChanged: (value) {
setState(() {
deliveryType =
value!;
deliveryFee = 65;
});
},
),

RadioListTile<String>(
value:
"Emergency Delivery",
groupValue:
deliveryType,
title: const Text(
"Emergency Delivery"),
subtitle: const Text(
"Within 45 Minutes • Fee ৳200"),
onChanged: (value) {
setState(() {
deliveryType =
value!;
deliveryFee = 200;
});
},
),
],
),
),

const SizedBox(height: 20),

Container(
padding:
const EdgeInsets.all(15),
decoration: BoxDecoration(
color: Colors.white,
borderRadius:
BorderRadius.circular(
15),
),
child: Column(
crossAxisAlignment:
CrossAxisAlignment
    .start,
children: [
const Text(
"Payment Method",
style: TextStyle(
fontWeight:
FontWeight.bold,
fontSize: 18,
),
),

RadioListTile<String>(
value:
"Cash On Delivery",
groupValue:
paymentMethod,
title: const Text(
"Cash On Delivery"),
onChanged: (value) {
setState(() {
paymentMethod =
value!;
});
},
),

RadioListTile<String>(
value: "bKash",
groupValue:
paymentMethod,
title:
const Text("bKash"),
onChanged: (value) {
setState(() {
paymentMethod =
value!;
});
},
),

RadioListTile<String>(
value: "Nagad",
groupValue:
paymentMethod,
title:
const Text("Nagad"),
onChanged: (value) {
setState(() {
paymentMethod =
value!;
});
},
),
],
),
),

const SizedBox(height: 20),

Container(
padding:
const EdgeInsets.all(15),
decoration: BoxDecoration(
color: Colors.white,
borderRadius:
BorderRadius.circular(
15),
),
child: Column(
children: [
Row(
mainAxisAlignment:
MainAxisAlignment
    .spaceBetween,
children: [
const Text(
"Medicine Total"),
Text(
"৳${widget.medicineTotal.toStringAsFixed(0)}"),
],
),

const SizedBox(
height: 10),

Row(
mainAxisAlignment:
MainAxisAlignment
    .spaceBetween,
children: [
Text(deliveryType),
Text(
"৳${deliveryFee.toStringAsFixed(0)}"),
],
),

const Divider(),

Row(
mainAxisAlignment:
MainAxisAlignment
    .spaceBetween,
children: [
const Text(
"Grand Total",
style: TextStyle(
fontWeight:
FontWeight.bold,
),
),
Text(
"৳${grandTotal.toStringAsFixed(0)}",
style:
const TextStyle(
color: Color(
0xFF00A651),
fontWeight:
FontWeight.bold,
fontSize: 18,
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
style:
ElevatedButton.styleFrom(
backgroundColor:
const Color(
0xFF00A651),
foregroundColor:
Colors.white,
),
onPressed: placeOrder,
child: const Text(
"Place Order",
style: TextStyle(
fontWeight:
FontWeight.bold,
fontSize: 18,
),
),
),
),
],
),
),
);
}
}