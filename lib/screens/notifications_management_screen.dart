import 'package:flutter/material.dart';

class NotificationsManagementScreen extends StatefulWidget {
  const NotificationsManagementScreen({super.key});

  @override
  State<NotificationsManagementScreen> createState() =>
      _NotificationsManagementScreenState();
}

class _NotificationsManagementScreenState
    extends State<NotificationsManagementScreen> {
  final List<Map<String, dynamic>> notifications = [
    {
      "title": "Emergency Delivery Alert",
      "message": "New emergency medicine order received.",
      "active": true,
    },
    {
      "title": "Order Delivered",
      "message": "Customer order delivered successfully.",
      "active": true,
    },
    {
      "title": "New Rider Joined",
      "message": "A new rider account was created.",
      "active": false,
    },
    {
      "title": "Medicine Stock Low",
      "message": "Paracetamol stock is running low.",
      "active": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFF8),

      appBar: AppBar(
        title: const Text("Notifications Management"),
        backgroundColor: const Color(0xFF00A651),
        foregroundColor: Colors.white,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF00A651),
        child: const Icon(Icons.add),
        onPressed: () {
          _showAddNotificationDialog();
        },
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor:
                item["active"] ? Colors.green : Colors.grey,
                child: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
              title: Text(
                item["title"],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(item["message"]),
              trailing: Switch(
                value: item["active"],
                activeColor: const Color(0xFF00A651),
                onChanged: (value) {
                  setState(() {
                    item["active"] = value;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _showAddNotificationDialog() {
    final titleController = TextEditingController();
    final messageController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Create Notification"),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: messageController,
                decoration: const InputDecoration(
                  labelText: "Message",
                ),
                maxLines: 3,
              ),
            ],
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00A651),
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    messageController.text.isNotEmpty) {
                  setState(() {
                    notifications.insert(0, {
                      "title": titleController.text,
                      "message": messageController.text,
                      "active": true,
                    });
                  });
                }

                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content:
                    Text("Notification Created Successfully"),
                  ),
                );
              },
              child: const Text("Create"),
            ),
          ],
        );
      },
    );
  }
}