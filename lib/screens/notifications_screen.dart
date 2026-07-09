import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFF8),

      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
        backgroundColor: const Color(0xFF00A651),
        foregroundColor: Colors.white,
      ),

      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [

          _notificationCard(
            icon: Icons.local_shipping,
            iconColor: Colors.green,
            title: "Order On The Way",
            message:
            "Your order #LS20260001 is out for delivery.",
            time: "5 mins ago",
            unread: true,
          ),

          _notificationCard(
            icon: Icons.check_circle,
            iconColor: Colors.green,
            title: "Order Delivered",
            message:
            "Your medicine order has been delivered successfully.",
            time: "1 hour ago",
          ),

          _notificationCard(
            icon: Icons.upload_file,
            iconColor: Colors.orange,
            title: "Prescription Approved",
            message:
            "Your uploaded prescription has been approved.",
            time: "3 hours ago",
          ),

          _notificationCard(
            icon: Icons.local_offer,
            iconColor: Colors.red,
            title: "Special Offer",
            message:
            "Get free delivery on orders above ৳1000.",
            time: "Yesterday",
          ),

          _notificationCard(
            icon: Icons.medication,
            iconColor: Colors.blue,
            title: "Medicine Reminder",
            message:
            "Don't forget to reorder your regular medicines.",
            time: "2 days ago",
          ),

          _notificationCard(
            icon: Icons.support_agent,
            iconColor: Colors.purple,
            title: "Customer Support",
            message:
            "Our support team replied to your message.",
            time: "3 days ago",
          ),
        ],
      ),
    );
  }

  Widget _notificationCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String message,
    required String time,
    bool unread = false,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      elevation: unread ? 4 : 1,
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),

        leading: CircleAvatar(
          radius: 25,
          backgroundColor:
          iconColor.withOpacity(0.12),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),

        title: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: unread
                      ? FontWeight.bold
                      : FontWeight.w600,
                ),
              ),
            ),

            if (unread)
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(message),

              const SizedBox(height: 6),

              Text(
                time,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}