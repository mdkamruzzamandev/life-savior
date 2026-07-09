import 'package:flutter/material.dart';

class DeliverySettingsScreen extends StatefulWidget {
  const DeliverySettingsScreen({super.key});

  @override
  State<DeliverySettingsScreen> createState() =>
      _DeliverySettingsScreenState();
}

class _DeliverySettingsScreenState
    extends State<DeliverySettingsScreen> {
  final TextEditingController emergencyFeeController =
  TextEditingController(text: "200");

  final TextEditingController normalFeeController =
  TextEditingController(text: "65");

  final TextEditingController emergencyTimeController =
  TextEditingController(text: "45");

  final TextEditingController radiusController =
  TextEditingController(text: "15");

  bool serviceOpen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFF8),

      appBar: AppBar(
        title: const Text("Delivery Settings"),
        backgroundColor: const Color(0xFF00A651),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            _buildField(
              "Emergency Delivery Fee (৳)",
              emergencyFeeController,
              Icons.flash_on,
            ),

            const SizedBox(height: 15),

            _buildField(
              "Normal Delivery Fee (৳)",
              normalFeeController,
              Icons.local_shipping,
            ),

            const SizedBox(height: 15),

            _buildField(
              "Emergency Delivery Time (Minutes)",
              emergencyTimeController,
              Icons.timer,
            ),

            const SizedBox(height: 15),

            _buildField(
              "Delivery Radius (KM)",
              radiusController,
              Icons.location_on,
            ),

            const SizedBox(height: 25),

            Card(
              child: SwitchListTile(
                title: const Text(
                  "Delivery Service Status",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  serviceOpen
                      ? "Service Open"
                      : "Service Closed",
                ),
                activeColor: const Color(0xFF00A651),
                value: serviceOpen,
                onChanged: (value) {
                  setState(() {
                    serviceOpen = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text(
                  "Save Settings",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  const Color(0xFF00A651),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    const SnackBar(
                      content:
                      Text("Settings Saved"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(
      String label,
      TextEditingController controller,
      IconData icon,
      ) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(15),
        ),
      ),
    );
  }
}