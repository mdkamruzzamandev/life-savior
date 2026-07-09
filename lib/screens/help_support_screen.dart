import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFF8),

      appBar: AppBar(
        backgroundColor: const Color(0xFF00A651),
        foregroundColor: Colors.white,
        title: const Text("Help & Support"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF00A651),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.support_agent,
                    color: Colors.white,
                    size: 60,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "How can we help you?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            _supportTile(
              icon: Icons.call,
              title: "Call Support",
              subtitle: "+880 1700-000000",
            ),

            _supportTile(
              icon: Icons.chat,
              title: "Live Chat",
              subtitle: "Chat with our support team",
            ),

            _supportTile(
              icon: Icons.email,
              title: "Email Support",
              subtitle: "support@lifesavior.com",
            ),

            _supportTile(
              icon: Icons.chat,
              title: "WhatsApp Support",
              subtitle: "+880 1700-000000",
            ),

            const SizedBox(height: 25),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Frequently Asked Questions",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            ExpansionTile(
              title: const Text("How fast is emergency delivery?"),
              children: const [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Emergency orders are delivered within 45 minutes.",
                  ),
                ),
              ],
            ),

            ExpansionTile(
              title: const Text("How much is emergency delivery fee?"),
              children: const [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Emergency delivery fee is ৳200.",
                  ),
                ),
              ],
            ),

            ExpansionTile(
              title: const Text("Can I upload a prescription?"),
              children: const [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Yes, you can upload a prescription from the Upload Prescription section.",
                  ),
                ),
              ],
            ),

            ExpansionTile(
              title: const Text("How can I track my order?"),
              children: const [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Go to My Orders and open your order to track delivery status.",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.feedback),
                label: const Text(
                  "Send Feedback",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A651),
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _supportTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF00A651),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      ),
    );
  }
}