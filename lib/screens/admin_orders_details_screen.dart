import 'package:flutter/material.dart';

class AdminOrdersDetailsScreen extends StatelessWidget {
  const AdminOrdersDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
        backgroundColor: Color(0xFF00A651),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          "Admin Order Details Screen",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}