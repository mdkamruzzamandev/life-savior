import 'package:flutter/material.dart';

class EmergencyOrdersScreen extends StatefulWidget {
  const EmergencyOrdersScreen({super.key});

  @override
  State<EmergencyOrdersScreen> createState() =>
      _EmergencyOrdersScreenState();
}

class _EmergencyOrdersScreenState
    extends State<EmergencyOrdersScreen> {
  final List<Map<String, dynamic>> emergencyOrders = [
    {
      "id": "EMG001",
      "customer": "Kamrul Hasan",
      "phone": "+8801712345678",
      "address": "Kaliganj, Gazipur",
      "medicine": "Napa Extra",
      "time": "8 min ago",
      "status": "Pending",
    },
    {
      "id": "EMG002",
      "customer": "Rahim Uddin",
      "phone": "+8801811111111",
      "address": "Dhaka",
      "medicine": "Ace + Napa",
      "time": "15 min ago",
      "status": "Assigned",
    },
  ];

  void updateStatus(int index, String status) {
    setState(() {
      emergencyOrders[index]["status"] = status;
    });
  }

  Color statusColor(String status) {
    switch (status) {
      case "Pending":
        return Colors.orange;
      case "Assigned":
        return Colors.blue;
      case "Delivered":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFF8),

      appBar: AppBar(
        title: const Text("Emergency Orders"),
        backgroundColor: const Color(0xFF00A651),
        foregroundColor: Colors.white,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: emergencyOrders.length,
        itemBuilder: (context, index) {
          final order = emergencyOrders[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.emergency,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              order["id"],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(order["customer"]),
                          ],
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor(
                            order["status"],
                          ).withOpacity(.15),
                          borderRadius:
                          BorderRadius.circular(20),
                        ),
                        child: Text(
                          order["status"],
                          style: TextStyle(
                            color: statusColor(
                              order["status"],
                            ),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Divider(height: 30),

                  infoRow(
                    Icons.phone,
                    order["phone"],
                  ),

                  infoRow(
                    Icons.location_on,
                    order["address"],
                  ),

                  infoRow(
                    Icons.medication,
                    order["medicine"],
                  ),

                  infoRow(
                    Icons.access_time,
                    order["time"],
                  ),

                  const SizedBox(height: 20),

                  if (order["status"] == "Pending")
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          updateStatus(
                            index,
                            "Assigned",
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          const Color(0xFF00A651),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          "Assign Rider",
                        ),
                      ),
                    ),

                  if (order["status"] == "Assigned")
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          updateStatus(
                            index,
                            "Delivered",
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          "Mark Delivered",
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget infoRow(
      IconData icon,
      String text,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: const Color(0xFF00A651),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text),
          ),
        ],
      ),
    );
  }
}