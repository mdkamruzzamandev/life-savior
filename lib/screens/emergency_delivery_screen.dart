import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyDeliveryScreen extends StatelessWidget {
  const EmergencyDeliveryScreen({super.key});

  Future<void> _makeCall() async {
    final Uri uri = Uri.parse('tel:+8801853630320');

    await launchUrl(uri);
  }

  Future<void> _openWhatsApp() async {
    final Uri uri =
    Uri.parse('https://wa.me/8801853630320');

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFF8),

      appBar: AppBar(
        title: const Text("Emergency Delivery"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.emergency,
                    color: Colors.white,
                    size: 80,
                  ),

                  SizedBox(height: 15),

                  Text(
                    "EMERGENCY MEDICINE DELIVERY",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "All You Need After Midnight",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),

                  SizedBox(height: 15),

                  Text(
                    "Delivery Within 45 Minutes",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "Emergency Fee: ৳200",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: _makeCall,
                icon: const Icon(Icons.call),
                label: const Text(
                  "Call Emergency Hotline",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: _openWhatsApp,
                icon: const Icon(Icons.chat),
                label: const Text(
                  "Order via WhatsApp",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.timer,
                        color: Colors.red,
                      ),
                      title: Text("45 Minutes Delivery"),
                    ),

                    Divider(),

                    ListTile(
                      leading: Icon(
                        Icons.local_shipping,
                        color: Colors.red,
                      ),
                      title: Text("Emergency Rider Priority"),
                    ),

                    Divider(),

                    ListTile(
                      leading: Icon(
                        Icons.medication,
                        color: Colors.red,
                      ),
                      title: Text("Emergency Medicines Available"),
                    ),

                    Divider(),

                    ListTile(
                      leading: Icon(
                        Icons.support_agent,
                        color: Colors.red,
                      ),
                      title: Text("24/7 Customer Support"),
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
}