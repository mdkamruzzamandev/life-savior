import 'package:flutter/material.dart';

class AddressManagementScreen extends StatefulWidget {
  const AddressManagementScreen({super.key});

  @override
  State<AddressManagementScreen> createState() =>
      _AddressManagementScreenState();
}

class _AddressManagementScreenState
    extends State<AddressManagementScreen> {
  final List<Map<String, String>> addresses = [
    {
      "title": "Home",
      "address":
      "House 12, Road 5, Kaliganj, Gazipur",
    },
    {
      "title": "Office",
      "address":
      "Business Center, Dhaka",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFF8),

      appBar: AppBar(
        title: const Text("My Addresses"),
        centerTitle: true,
        backgroundColor: const Color(0xFF00A651),
        foregroundColor: Colors.white,
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF00A651),
        onPressed: () {
          _showAddAddressDialog(context);
        },
        icon: const Icon(Icons.add),
        label: const Text("Add Address"),
      ),

      body: addresses.isEmpty
          ? const Center(
        child: Text(
          "No Address Added Yet",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          return Card(
            margin:
            const EdgeInsets.only(bottom: 15),
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(18),
            ),
            child: Padding(
              padding:
              const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding:
                        const EdgeInsets.all(
                            10),
                        decoration:
                        BoxDecoration(
                          color:
                          const Color(
                              0xFF00A651)
                              .withOpacity(
                              0.1),
                          borderRadius:
                          BorderRadius
                              .circular(12),
                        ),
                        child: const Icon(
                          Icons.location_on,
                          color:
                          Color(0xFF00A651),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Text(
                          addresses[index]
                          ["title"]!,
                          style:
                          const TextStyle(
                            fontSize: 18,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Text(
                    addresses[index]["address"]!,
                    style: const TextStyle(
                      color: Colors.black54,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                          ),
                          label:
                          const Text("Edit"),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              addresses.removeAt(
                                  index);
                            });
                          },
                          style:
                          ElevatedButton
                              .styleFrom(
                            backgroundColor:
                            Colors.red,
                            foregroundColor:
                            Colors.white,
                          ),
                          icon: const Icon(
                            Icons.delete,
                          ),
                          label: const Text(
                            "Delete",
                          ),
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

  void _showAddAddressDialog(
      BuildContext context) {
    final titleController =
    TextEditingController();
    final addressController =
    TextEditingController();

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Add Address"),

          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration:
                  const InputDecoration(
                    labelText:
                    "Address Title (Home, Office)",
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: addressController,
                  maxLines: 3,
                  decoration:
                  const InputDecoration(
                    labelText:
                    "Full Address",
                  ),
                ),
              ],
            ),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),

            ElevatedButton(
              onPressed: () {
                if (titleController
                    .text.isNotEmpty &&
                    addressController
                        .text.isNotEmpty) {
                  setState(() {
                    addresses.add({
                      "title":
                      titleController.text,
                      "address":
                      addressController.text,
                    });
                  });

                  Navigator.pop(context);
                }
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }
}