import 'package:flutter/material.dart';
import 'cart_screen.dart';
import 'checkout_screen.dart';

class MedicineDetailsScreen extends StatefulWidget {
  final String medicineName;
  final String company;
  final String price;

  const MedicineDetailsScreen({
    super.key,
    required this.medicineName,
    required this.company,
    required this.price,
  });

  @override
  State<MedicineDetailsScreen> createState() =>
      _MedicineDetailsScreenState();
}

class _MedicineDetailsScreenState extends State<MedicineDetailsScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final double medicinePrice =
        double.tryParse(widget.price.replaceAll('৳', '')) ?? 0;

    return Scaffold(
      backgroundColor: const Color(0xFFF4FFF8),
      appBar: AppBar(
        title: const Text("Medicine Details"),
        backgroundColor: const Color(0xFF00A651),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Icon(
                  Icons.medication,
                  size: 120,
                  color: Color(0xFF00A651),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              widget.medicineName,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              widget.company,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              widget.price,
              style: const TextStyle(
                color: Color(0xFF00A651),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Description",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                "This medicine is available for delivery through Life Savior. Always use medicines according to doctor's instructions.",
                style: TextStyle(height: 1.5),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Quantity",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                  ),
                  Text(
                    quantity.toString(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add_circle,
                      color: Color(0xFF00A651),
                    ),
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.shopping_cart),
                label: const Text(
                  "Add To Cart",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A651),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CartScreen(
                        medicineName: widget.medicineName,
                        company: widget.company,
                        price: widget.price,
                        quantity: quantity,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.flash_on),
                label: const Text(
                  "Buy Now",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CheckoutScreen(
                        medicineTotal: medicinePrice * quantity,
                        medicineName: widget.medicineName,
                        quantity: quantity,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.local_shipping,
                    color: Colors.orange,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Ordinary Delivery: ৳65\nEmergency Delivery: ৳200",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}