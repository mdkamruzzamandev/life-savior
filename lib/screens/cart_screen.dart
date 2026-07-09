import 'package:flutter/material.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  final String medicineName;
  final String company;
  final String price;
  final int quantity;

  const CartScreen({
    super.key,
    required this.medicineName,
    required this.company,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final double medicinePrice =
        double.tryParse(price.replaceAll("৳", "").trim()) ?? 0;

    final double subtotal = medicinePrice * quantity;
    final double deliveryFee = 65;
    final double total = subtotal + deliveryFee;

    return Scaffold(
    backgroundColor: const Color(0xFFF4FFF8),
    appBar: AppBar(
    title: const Text("My Cart"),
    backgroundColor: const Color(0xFF00A651),
    foregroundColor: Colors.white,
    elevation: 0,
    ),
    body: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
    children: [
    Card(
    elevation: 2,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
    ),
    child: ListTile(
    leading: Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
    color: const Color(0xFF00A651).withValues(alpha: 0.1),
    borderRadius: BorderRadius.circular(12),
    ),
    child: const Icon(
    Icons.medication,
    color: Color(0xFF00A651),
    size: 35,
    ),
    ),
    title: Text(
    medicineName,
    style: const TextStyle(
    fontWeight: FontWeight.bold,
    ),
    ),
    subtitle: Text(company),
    trailing: Text(
    "$quantity × ৳${medicinePrice.toStringAsFixed(0)}",
    style: const TextStyle(
    fontWeight: FontWeight.bold,
    color: Color(0xFF00A651),
    ),
    ),
    ),
    ),

    const SizedBox(height: 20),

    Card(
    elevation: 2,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
    ),
    child: Padding(
    padding: const EdgeInsets.all(15),
    child: Column(
    children: [
    Row(
    mainAxisAlignment:
    MainAxisAlignment.spaceBetween,
    children: [
    const Text("Medicine Total"),
    Text(
    "৳${subtotal.toStringAsFixed(0)}",
    ),
    ],
    ),

    const SizedBox(height: 10),

    Row(
    mainAxisAlignment:
    MainAxisAlignment.spaceBetween,
    children: [
    const Text("Delivery Fee"),
    Text(
    "৳${deliveryFee.toStringAsFixed(0)}",
    ),
    ],
    ),

    const Divider(height: 25),

    Row(
    mainAxisAlignment:
    MainAxisAlignment.spaceBetween,
    children: [
    const Text(
    "Grand Total",
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    ),
    ),
    Text(
    "৳${total.toStringAsFixed(0)}",
    style: const TextStyle(
    color: Color(0xFF00A651),
    fontWeight: FontWeight.bold,
    fontSize: 18,
    ),
    ),
    ],
    ),
    ],
    ),
    ),
    ),

    const Spacer(),

    SizedBox(
    width: double.infinity,
    height: 55,
    child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF00A651),
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
    ),
    ),
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (_) => CheckoutScreen(
      medicineTotal: subtotal,
      medicineName: medicineName,
      quantity: quantity,
    ),
    ),
    );
    },
    child: const Text(
    "Proceed To Checkout",
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
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
