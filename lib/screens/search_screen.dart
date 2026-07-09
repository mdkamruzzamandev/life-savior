import 'package:flutter/material.dart';
import 'medicine_details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController =
  TextEditingController();

  final List<Map<String, String>> medicines = [
    {
      "name": "Napa Extra",
      "company": "Beximco Pharma",
      "price": "৳30"
    },
    {
      "name": "Ace",
      "company": "Square Pharma",
      "price": "৳25"
    },
    {
      "name": "Seclo",
      "company": "Square Pharma",
      "price": "৳80"
    },
    {
      "name": "Maxpro",
      "company": "Renata",
      "price": "৳90"
    },
    {
      "name": "Monas",
      "company": "ACI Pharma",
      "price": "৳120"
    },
    {
      "name": "Xinc B",
      "company": "Beximco Pharma",
      "price": "৳50"
    },
    {
      "name": "Napa",
      "company": "Beximco Pharma",
      "price": "৳15"
    },
  ];

  String query = "";

  @override
  Widget build(BuildContext context) {
    final filteredMedicines = medicines.where((medicine) {
      return medicine["name"]!
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF4FFF8),

      appBar: AppBar(
        title: const Text("Search Medicines"),
        backgroundColor: const Color(0xFF00A651),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search medicine...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Expanded(
            child: filteredMedicines.isEmpty
                ? const Center(
              child: Text(
                "No medicine found",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            )
                : ListView.builder(
              itemCount:
              filteredMedicines.length,
              itemBuilder: (context, index) {
                final medicine =
                filteredMedicines[index];

                return Card(
                  margin:
                  const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 6,
                  ),
                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(
                        16),
                  ),
                  child: ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration:
                      BoxDecoration(
                        color:
                        const Color(
                            0xFF00A651)
                            .withOpacity(
                            0.1),
                        borderRadius:
                        BorderRadius
                            .circular(
                            12),
                      ),
                      child: const Icon(
                        Icons.medication,
                        color:
                        Color(0xFF00A651),
                      ),
                    ),

                    title: Text(
                      medicine["name"]!,
                      style:
                      const TextStyle(
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(
                      medicine["company"]!,
                    ),

                    trailing: Text(
                      medicine["price"]!,
                      style:
                      const TextStyle(
                        color:
                        Color(0xFF00A651),
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              MedicineDetailsScreen(
                                medicineName:
                                medicine[
                                "name"]!,
                                company:
                                medicine[
                                "company"]!,
                                price:
                                medicine[
                                "price"]!,
                              ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}