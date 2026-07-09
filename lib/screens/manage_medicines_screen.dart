import 'package:flutter/material.dart';

class ManageMedicinesScreen extends StatefulWidget {
  const ManageMedicinesScreen({super.key});

  @override
  State<ManageMedicinesScreen> createState() =>
      _ManageMedicinesScreenState();
}

class _ManageMedicinesScreenState
    extends State<ManageMedicinesScreen> {
  final TextEditingController searchController =
  TextEditingController();

  List<Map<String, dynamic>> medicines = [
    {
      "name": "Napa Extra",
      "company": "Beximco",
      "category": "Pain Relief",
      "price": "20",
      "stock": "150",
      "prescription": false,
    },
    {
      "name": "Ace",
      "company": "Square",
      "category": "Fever",
      "price": "15",
      "stock": "200",
      "prescription": false,
    },
  ];

  List<Map<String, dynamic>> filteredMedicines = [];

  @override
  void initState() {
    super.initState();
    filteredMedicines = medicines;
  }

  void searchMedicine(String value) {
    setState(() {
      filteredMedicines = medicines.where((medicine) {
        return medicine["name"]
            .toString()
            .toLowerCase()
            .contains(value.toLowerCase());
      }).toList();
    });
  }

  void deleteMedicine(int index) {
    setState(() {
      medicines.remove(filteredMedicines[index]);
      filteredMedicines = medicines;
    });
  }

  void showMedicineDialog({Map<String, dynamic>? medicine}) {
    final nameController =
    TextEditingController(text: medicine?["name"] ?? "");

    final companyController =
    TextEditingController(text: medicine?["company"] ?? "");

    final priceController =
    TextEditingController(text: medicine?["price"] ?? "");

    final stockController =
    TextEditingController(text: medicine?["stock"] ?? "");

    String category =
        medicine?["category"] ?? "Pain Relief";

    bool prescription =
        medicine?["prescription"] ?? false;

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text(
                medicine == null
                    ? "Add Medicine"
                    : "Edit Medicine",
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: [

                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius:
                        BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.image,
                        size: 50,
                      ),
                    ),

                    const SizedBox(height: 15),

                    TextField(
                      controller: nameController,
                      decoration:
                      const InputDecoration(
                        labelText: "Medicine Name",
                      ),
                    ),

                    TextField(
                      controller: companyController,
                      decoration:
                      const InputDecoration(
                        labelText: "Company",
                      ),
                    ),

                    TextField(
                      controller: priceController,
                      keyboardType:
                      TextInputType.number,
                      decoration:
                      const InputDecoration(
                        labelText: "Price",
                      ),
                    ),

                    TextField(
                      controller: stockController,
                      keyboardType:
                      TextInputType.number,
                      decoration:
                      const InputDecoration(
                        labelText: "Stock",
                      ),
                    ),

                    const SizedBox(height: 10),

                    DropdownButtonFormField<String>(
                      value: category,
                      items: const [
                        DropdownMenuItem(
                          value: "Pain Relief",
                          child:
                          Text("Pain Relief"),
                        ),
                        DropdownMenuItem(
                          value: "Fever",
                          child: Text("Fever"),
                        ),
                        DropdownMenuItem(
                          value: "Cold & Flu",
                          child:
                          Text("Cold & Flu"),
                        ),
                        DropdownMenuItem(
                          value: "Diabetes",
                          child:
                          Text("Diabetes"),
                        ),
                      ],
                      onChanged: (value) {
                        setDialogState(() {
                          category = value!;
                        });
                      },
                      decoration:
                      const InputDecoration(
                        labelText: "Category",
                      ),
                    ),

                    const SizedBox(height: 10),

                    SwitchListTile(
                      value: prescription,
                      title: const Text(
                        "Prescription Required",
                      ),
                      onChanged: (value) {
                        setDialogState(() {
                          prescription = value;
                        });
                      },
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
                    if (medicine == null) {
                      setState(() {
                        medicines.add({
                          "name":
                          nameController.text,
                          "company":
                          companyController
                              .text,
                          "category": category,
                          "price":
                          priceController.text,
                          "stock":
                          stockController.text,
                          "prescription":
                          prescription,
                        });

                        filteredMedicines =
                            medicines;
                      });
                    } else {
                      setState(() {
                        medicine["name"] =
                            nameController.text;

                        medicine["company"] =
                            companyController
                                .text;

                        medicine["category"] =
                            category;

                        medicine["price"] =
                            priceController.text;

                        medicine["stock"] =
                            stockController.text;

                        medicine["prescription"] =
                            prescription;
                      });
                    }

                    Navigator.pop(context);
                  },
                  child: const Text("Save"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      const Color(0xFFF4FFF8),

      appBar: AppBar(
        title: const Text(
          "Manage Medicines",
        ),
        backgroundColor:
        const Color(0xFF00A651),
        foregroundColor: Colors.white,
      ),

      floatingActionButton:
      FloatingActionButton(
        backgroundColor:
        const Color(0xFF00A651),
        onPressed: () {
          showMedicineDialog();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),

      body: Column(
        children: [

          Padding(
            padding:
            const EdgeInsets.all(15),
            child: TextField(
              controller: searchController,
              onChanged: searchMedicine,
              decoration: InputDecoration(
                hintText:
                "Search Medicine...",
                prefixIcon:
                const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border:
                OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(
                      15),
                  borderSide:
                  BorderSide.none,
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount:
              filteredMedicines.length,
              itemBuilder:
                  (context, index) {
                final medicine =
                filteredMedicines[index];

                return Card(
                  margin:
                  const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: Container(
                      height: 55,
                      width: 55,
                      decoration:
                      BoxDecoration(
                        color: Colors
                            .green.shade50,
                        borderRadius:
                        BorderRadius
                            .circular(12),
                      ),
                      child: const Icon(
                        Icons.medication,
                        color: Color(
                            0xFF00A651),
                      ),
                    ),

                    title: Text(
                      medicine["name"],
                    ),

                    subtitle: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                      children: [
                        Text(
                          medicine[
                          "company"],
                        ),
                        Text(
                          "৳${medicine["price"]}",
                        ),
                        Text(
                          "Stock: ${medicine["stock"]}",
                        ),
                      ],
                    ),

                    trailing: Column(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.edit,
                            color:
                            Colors.blue,
                          ),
                          onPressed: () {
                            showMedicineDialog(
                              medicine:
                              medicine,
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            deleteMedicine(
                                index);
                          },
                        ),
                      ],
                    ),
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