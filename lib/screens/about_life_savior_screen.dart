import 'package:flutter/material.dart';

class AboutLifeSaviorScreen extends StatelessWidget {
  const AboutLifeSaviorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFF8),
      appBar: AppBar(
        title: const Text("About Life Savior"),
        backgroundColor: const Color(0xFF00A651),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.local_pharmacy,
                size: 50,
                color: Color(0xFF00A651),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Life Savior",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Version 1.0.0",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 25),

            const Text(
              "Life Savior is a medicine delivery platform designed to provide fast, reliable, and emergency medicine delivery services. Customers can order medicines, upload prescriptions, track orders, and receive emergency deliveries within 45 minutes.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            Card(
              child: ListTile(
                leading: const Icon(Icons.phone),
                title: const Text("Customer Support"),
                subtitle: const Text("+8801XXXXXXXXX"),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.email),
                title: const Text("Email"),
                subtitle: const Text("support@lifesavior.com"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}