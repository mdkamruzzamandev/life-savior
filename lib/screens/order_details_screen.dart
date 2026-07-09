import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String orderId;
  final String medicineName;
  final String price;

  const OrderDetailsScreen({
    super.key,
    required this.orderId,
    required this.medicineName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFF8),
      appBar: AppBar(
        title: const Text("Order Details"),
        backgroundColor: const Color(0xFF00A651),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Icon(
                  Icons.receipt_long,
                  size: 70,
                  color: Color(0xFF00A651),
                ),

                const SizedBox(height: 20),

                Text(
                  "Order ID: $orderId",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  "Medicine: $medicineName",
                  style: const TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 10),

                Text(
                  "Amount: $price",
                  style: const TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Delivery Fee: ৳65",
                  style: TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Payment Method: Cash On Delivery",
                  style: TextStyle(fontSize: 16),
                ),

                const Divider(height: 40),

                const Text(
                  "Delivery Address",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Customer Address Here",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}