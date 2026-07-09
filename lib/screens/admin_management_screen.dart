import 'package:flutter/material.dart';

class AdminManagementScreen extends StatefulWidget {
  const AdminManagementScreen({super.key});

  @override
  State<AdminManagementScreen> createState() =>
      _AdminManagementScreenState();
}

class _AdminManagementScreenState
    extends State<AdminManagementScreen> {
  final List<Map<String, dynamic>> admins = [
    {
      "name": "Kamrul Hasan",
      "phone": "+8801712345678",
      "role": "Super Admin",
      "active": true,
    },
    {
      "name": "Rahim Uddin",
      "phone": "+8801812345678",
      "role": "Admin",
      "active": true,
    },
    {
      "name": "Karim Ahmed",
      "phone": "+8801912345678",
      "role": "Admin",
      "active": false,
    },
  ];

  void addAdmin() {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Add Admin"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Admin Name",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                const Color(0xFF00A651),
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    phoneController.text.isNotEmpty) {
                  setState(() {
                    admins.add({
                      "name": nameController.text,
                      "phone": phoneController.text,
                      "role": "Admin",
                      "active": true,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      const Color(0xFFF4FFF8),

      appBar: AppBar(
        title: const Text("Admin Management"),
        backgroundColor:
        const Color(0xFF00A651),
        foregroundColor: Colors.white,
      ),

      floatingActionButton:
      FloatingActionButton(
        backgroundColor:
        const Color(0xFF00A651),
        onPressed: addAdmin,
        child: const Icon(
          Icons.person_add,
          color: Colors.white,
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: admins.length,
        itemBuilder: (context, index) {
          final admin = admins[index];

          return Card(
            margin:
            const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(16),
            ),
            child: Padding(
              padding:
              const EdgeInsets.all(16),
              child: Column(
                children: [

                  Row(
                    children: [

                      CircleAvatar(
                        radius: 28,
                        backgroundColor:
                        const Color(
                            0xFF00A651),
                        child: Text(
                          admin["name"][0],
                          style:
                          const TextStyle(
                            color: Colors.white,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                          children: [
                            Text(
                              admin["name"],
                              style:
                              const TextStyle(
                                fontSize: 18,
                                fontWeight:
                                FontWeight
                                    .bold,
                              ),
                            ),
                            Text(
                              admin["phone"],
                            ),
                          ],
                        ),
                      ),

                      Switch(
                        value:
                        admin["active"],
                        activeColor:
                        const Color(
                            0xFF00A651),
                        onChanged:
                            (value) {
                          setState(() {
                            admin["active"] =
                                value;
                          });
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,
                    children: [

                      Chip(
                        backgroundColor:
                        admin["role"] ==
                            "Super Admin"
                            ? Colors.orange
                            .shade100
                            : Colors.blue
                            .shade100,
                        label: Text(
                          admin["role"],
                        ),
                      ),

                      Text(
                        admin["active"]
                            ? "Active"
                            : "Inactive",
                        style: TextStyle(
                          color:
                          admin["active"]
                              ? Colors
                              .green
                              : Colors.red,
                          fontWeight:
                          FontWeight
                              .bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [

                      Expanded(
                        child:
                        ElevatedButton
                            .icon(
                          icon: const Icon(
                              Icons.edit),
                          label: const Text(
                              "Edit"),
                          style:
                          ElevatedButton
                              .styleFrom(
                            backgroundColor:
                            Colors.blue,
                            foregroundColor:
                            Colors.white,
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(
                                context)
                                .showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Edit Admin Feature",
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child:
                        ElevatedButton
                            .icon(
                          icon: const Icon(
                              Icons.delete),
                          label: const Text(
                              "Remove"),
                          style:
                          ElevatedButton
                              .styleFrom(
                            backgroundColor:
                            Colors.red,
                            foregroundColor:
                            Colors.white,
                          ),
                          onPressed: () {
                            if (admin[
                            "role"] ==
                                "Super Admin") {
                              ScaffoldMessenger
                                  .of(
                                  context)
                                  .showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Super Admin cannot be removed",
                                  ),
                                ),
                              );
                              return;
                            }

                            setState(() {
                              admins.removeAt(
                                  index);
                            });
                          },
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
}