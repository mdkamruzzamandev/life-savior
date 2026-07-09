import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFF8),
      appBar: AppBar(
        title: const Text("Privacy Policy"),
        backgroundColor: const Color(0xFF00A651),
        foregroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Text(
          '''
Life Savior Privacy Policy

1. We collect customer information only to process medicine orders and deliveries.

2. Prescription images are securely stored and only used for medicine verification.

3. We do not sell customer information to third parties.

4. Customer location is used only for delivery purposes.

5. Payment information is protected and handled securely.

6. Customers can request account data removal at any time.

7. By using Life Savior, you agree to this privacy policy.

Thank you for trusting Life Savior.
''',
          style: TextStyle(
            fontSize: 16,
            height: 1.6,
          ),
        ),
      ),
    );
  }
}