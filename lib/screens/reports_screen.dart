import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFF8),

      appBar: AppBar(
        title: const Text("Reports & Analytics"),
        backgroundColor: const Color(0xFF00A651),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Row(
              children: [
                Expanded(
                  child: _reportCard(
                    "Today's Orders",
                    "127",
                    Icons.shopping_bag,
                    Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _reportCard(
                    "Delivered",
                    "105",
                    Icons.check_circle,
                    Colors.green,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _reportCard(
                    "Pending",
                    "18",
                    Icons.pending,
                    Colors.orange,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _reportCard(
                    "Cancelled",
                    "4",
                    Icons.cancel,
                    Colors.red,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            _revenueCard(),

            const SizedBox(height: 25),

            _sectionTitle("Top Selling Medicines"),

            const SizedBox(height: 10),

            _medicineTile("Napa Extra", "350 Orders"),
            _medicineTile("Ace", "280 Orders"),
            _medicineTile("Seclo", "210 Orders"),
            _medicineTile("Paracetamol", "180 Orders"),

            const SizedBox(height: 25),

            _sectionTitle("Performance Summary"),

            const SizedBox(height: 10),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.timer),
                      title: Text("Average Delivery Time"),
                      trailing: Text("38 Min"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.star),
                      title: Text("Customer Rating"),
                      trailing: Text("4.9/5"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.people),
                      title: Text("Active Customers"),
                      trailing: Text("2,547"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _reportCard(
      String title,
      String value,
      IconData icon,
      Color color,
      ) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
              size: 35,
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }

  Widget _revenueCard() {
    return Card(
      color: const Color(0xFF00A651),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Text(
              "Total Revenue",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "৳1,28,450",
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _medicineTile(String name, String orders) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Color(0xFF00A651),
          child: Icon(
            Icons.medication,
            color: Colors.white,
          ),
        ),
        title: Text(name),
        trailing: Text(
          orders,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}