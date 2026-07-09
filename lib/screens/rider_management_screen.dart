import 'package:flutter/material.dart';

class RiderManagementScreen extends StatefulWidget {
  const RiderManagementScreen({super.key});

  @override
  State<RiderManagementScreen> createState() =>
      _RiderManagementScreenState();
}

class _RiderManagementScreenState
    extends State<RiderManagementScreen> {
  final List<Map<String, dynamic>> riders = [
    {
      "name": "Kamrul Admin",
      "phone": "+8801711111111",
      "area": "Gazipur",
      "status": true,
      "role": "Admin",
    },
    {
      "name": "Karim Rider",
      "phone": "+8801811111111",
      "area": "Dhaka",
      "status": false,
      "role": "Rider",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFF8),

      appBar: AppBar(
        title: const Text("Rider Management"),
        backgroundColor: const Color(0xFF00A651),
        foregroundColor: Colors.white,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF00A651),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Add Rider Feature Coming Soon"),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: riders.length,
        itemBuilder: (context, index) {
          final rider = riders[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor:
                        const Color(0xFF00A651),
                        child: Text(
                          rider["name"][0],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              rider["name"],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                            Text(rider["phone"]),
                            Text(rider["area"]),
                          ],
                        ),
                      ),

                      Switch(
                        value: rider["status"],
                        activeColor:
                        const Color(0xFF00A651),
                        onChanged: (value) {
                          setState(() {
                            rider["status"] = value;
                          });
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(
                        label: Text(rider["role"]),
                        backgroundColor:
                        rider["role"] == "Admin"
                            ? Colors.orange.shade100
                            : Colors.blue.shade100,
                      ),

                      Text(
                        rider["status"]
                            ? "Active"
                            : "Inactive",
                        style: TextStyle(
                          color: rider["status"]
                              ? Colors.green
                              : Colors.red,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}