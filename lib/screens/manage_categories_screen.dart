import 'package:flutter/material.dart';

class ManageCategoriesScreen extends StatefulWidget {
  const ManageCategoriesScreen({super.key});

  @override
  State<ManageCategoriesScreen> createState() =>
      _ManageCategoriesScreenState();
}

class _ManageCategoriesScreenState
    extends State<ManageCategoriesScreen> {
  final List<Map<String, dynamic>> categories = [
    {
      "name": "Pain Relief",
      "icon": Icons.healing,
    },
    {
      "name": "Fever",
      "icon": Icons.thermostat,
    },
    {
      "name": "Cold & Flu",
      "icon": Icons.sick,
    },
    {
      "name": "Diabetes",
      "icon": Icons.monitor_heart,
    },
    {
      "name": "Heart Care",
      "icon": Icons.favorite,
    },
  ];

  void addCategory() {
    final TextEditingController nameController =
    TextEditingController();

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Add Category"),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: "Category Name",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  setState(() {
                    categories.add({
                      "name": nameController.text,
                      "icon": Icons.medication,
                    });
                  });
                }
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void editCategory(int index) {
    final TextEditingController nameController =
    TextEditingController(
      text: categories[index]["name"],
    );

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Edit Category"),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: "Category Name",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  categories[index]["name"] =
                      nameController.text;
                });

                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void deleteCategory(int index) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Delete Category"),
          content: const Text(
            "Are you sure you want to delete this category?",
          ),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pop(context),
              child: const Text("No"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  categories.removeAt(index);
                });

                Navigator.pop(context);
              },
              child: const Text(
                "Delete",
                style:
                TextStyle(color: Colors.white),
              ),
            ),
          ],
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
          "Manage Categories",
        ),
        backgroundColor:
        const Color(0xFF00A651),
        foregroundColor: Colors.white,
      ),

      floatingActionButton:
      FloatingActionButton(
        backgroundColor:
        const Color(0xFF00A651),
        onPressed: addCategory,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];

          return Card(
            margin:
            const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor:
                Colors.green.shade100,
                child: Icon(
                  category["icon"],
                  color:
                  const Color(0xFF00A651),
                ),
              ),

              title: Text(
                category["name"],
                style: const TextStyle(
                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              subtitle: const Text(
                "Medicine Category",
              ),

              trailing: Row(
                mainAxisSize:
                MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                    onPressed: () =>
                        editCategory(index),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () =>
                        deleteCategory(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}