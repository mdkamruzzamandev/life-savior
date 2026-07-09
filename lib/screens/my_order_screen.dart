import 'package:flutter/material.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFF8),

      appBar: AppBar(
        title: const Text("My Orders"),
        backgroundColor: const Color(0xFF00A651),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _orderCard(
            orderId: "#LS2026001",
            medicine: "Napa Extra",
            status: "Pending",
            statusColor: Colors.orange,
            price: "৳350",
            time: "5 mins ago",
          ),

          _orderCard(
            orderId: "#LS2026002",
            medicine: "Ace + Napa",
            status: "Processing",
            statusColor: Colors.blue,
            price: "৳480",
            time: "20 mins ago",
          ),

          _orderCard(
            orderId: "#LS2025998",
            medicine: "Paracetamol",
            status: "Delivered",
            statusColor: Colors.green,
            price: "৳220",
            time: "Yesterday",
          ),

          _orderCard(
            orderId: "#LS2025995",
            medicine: "Antibiotic Package",
            status: "Cancelled",
            statusColor: Colors.red,
            price: "৳650",
            time: "2 days ago",
          ),
        ],
      ),
    );
  }

  Widget _orderCard({
    required String orderId,
    required String medicine,
    required String status,
    required Color statusColor,
    required String price,
    required String time,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00A651)
                        .withOpacity(0.1),
                    borderRadius:
                    BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.medication,
                    color: Color(0xFF00A651),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        orderId,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        medicine,
                        style: const TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color:
                    statusColor.withOpacity(0.15),
                    borderRadius:
                    BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00A651),
                  ),
                ),
                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.info),
                    label: const Text(
                      "Details",
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.location_on,
                    ),
                    label: const Text(
                      "Track",
                    ),
                    style:
                    ElevatedButton.styleFrom(
                      backgroundColor:
                      const Color(0xFF00A651),
                      foregroundColor:
                      Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}