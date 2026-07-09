import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFF8),

      appBar: AppBar(
        title: const Text("Inbox"),
        centerTitle: true,
        backgroundColor: const Color(0xFF00A651),
        foregroundColor: Colors.white,
      ),

      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          _messageCard(
            icon: Icons.local_shipping,
            color: Colors.blue,
            title: "Order On The Way",
            message:
            "Your emergency medicine order is on the way and will arrive within 45 minutes.",
            time: "5 min ago",
          ),

          _messageCard(
            icon: Icons.check_circle,
            color: Colors.green,
            title: "Order Delivered",
            message:
            "Your order #LS2026001 has been successfully delivered.",
            time: "1 hour ago",
          ),

          _messageCard(
            icon: Icons.discount,
            color: Colors.orange,
            title: "Special Offer",
            message:
            "Get free delivery on ordinary orders above ৳1000.",
            time: "Today",
          ),

          _messageCard(
            icon: Icons.medical_services,
            color: Colors.red,
            title: "Prescription Approved",
            message:
            "Your uploaded prescription has been reviewed successfully.",
            time: "Yesterday",
          ),

          _messageCard(
            icon: Icons.notifications,
            color: Colors.purple,
            title: "Life Savior Update",
            message:
            "New medicines and healthcare products have been added.",
            time: "2 days ago",
          ),
        ],
      ),
    );
  }

  Widget _messageCard({
    required IconData icon,
    required Color color,
    required String title,
    required String message,
    required String time,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: color.withOpacity(0.15),
              child: Icon(
                icon,
                color: color,
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    message,
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}