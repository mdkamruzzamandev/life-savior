import 'package:flutter/material.dart';

class TrackOrderScreen extends StatelessWidget {
  final String orderId;

  const TrackOrderScreen({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFF8),
      appBar: AppBar(
        title: const Text("Track Order"),
        backgroundColor: const Color(0xFF00A651),
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const SizedBox(height: 20),

            const Icon(
              Icons.local_shipping,
              size: 90,
              color: Color(0xFF00A651),
            ),

            const SizedBox(height: 20),

            Text(
              "Tracking $orderId",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            _step(
              Icons.check_circle,
              "Order Placed",
              true,
            ),

            _step(
              Icons.inventory,
              "Medicine Packed",
              true,
            ),

            _step(
              Icons.delivery_dining,
              "Out For Delivery",
              true,
            ),

            _step(
              Icons.home,
              "Delivered",
              false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _step(
      IconData icon,
      String title,
      bool done,
      ) {
    return ListTile(
      leading: Icon(
        icon,
        color: done ? Colors.green : Colors.grey,
      ),
      title: Text(title),
      trailing: done
          ? const Icon(
        Icons.check,
        color: Colors.green,
      )
          : null,
    );
  }
}