import 'package:flutter/material.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() =>
      _CustomersScreenState();
}

class _CustomersScreenState
    extends State<CustomersScreen> {
  final List<Map<String, dynamic>> customers = [
    {
      "name": "Kamrul Hasan",
      "phone": "+8801712345678",
      "orders": 25,
      "status": true,
    },
    {
      "name": "Rahim Ahmed",
      "phone": "+8801812345678",
      "orders": 12,
      "status": true,
    },
    {
      "name": "Karim Islam",
      "phone": "+8801912345678",
      "orders": 4,
      "status": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFF8),

      appBar: AppBar(
        title: const Text("Customers"),
        backgroundColor: const Color(0xFF00A651),
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [

          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xFF00A651),
              borderRadius:
              BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceAround,
              children: [
                _statItem(
                  customers.length.toString(),
                  "Customers",
                ),
                _statItem(
                  customers
                      .where((c) =>
                  c["status"] == true)
                      .length
                      .toString(),
                  "Active",
                ),
                _statItem(
                  customers
                      .where((c) =>
                  c["status"] == false)
                      .length
                      .toString(),
                  "Blocked",
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              itemCount: customers.length,
              itemBuilder: (context, index) {
                final customer =
                customers[index];

                return Card(
                  margin:
                  const EdgeInsets.only(
                    bottom: 15,
                  ),
                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(
                        16),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.all(
                        15),
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
                                customer["name"]
                                [0],
                                style:
                                const TextStyle(
                                  color:
                                  Colors
                                      .white,
                                  fontWeight:
                                  FontWeight
                                      .bold,
                                ),
                              ),
                            ),

                            const SizedBox(
                                width: 12),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                                children: [

                                  Text(
                                    customer[
                                    "name"],
                                    style:
                                    const TextStyle(
                                      fontSize:
                                      18,
                                      fontWeight:
                                      FontWeight
                                          .bold,
                                    ),
                                  ),

                                  Text(
                                    customer[
                                    "phone"],
                                  ),

                                  const SizedBox(
                                      height:
                                      4),

                                  Text(
                                    "Orders: ${customer["orders"]}",
                                    style:
                                    const TextStyle(
                                      color: Color(
                                          0xFF00A651),
                                      fontWeight:
                                      FontWeight
                                          .bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                            height: 15),

                        Row(
                          children: [

                            Expanded(
                              child:
                              ElevatedButton
                                  .icon(
                                icon:
                                const Icon(
                                  Icons
                                      .visibility,
                                ),
                                label:
                                const Text(
                                  "View",
                                ),
                                style:
                                ElevatedButton
                                    .styleFrom(
                                  backgroundColor:
                                  Colors
                                      .blue,
                                  foregroundColor:
                                  Colors
                                      .white,
                                ),
                                onPressed:
                                    () {
                                  showDialog(
                                    context:
                                    context,
                                    builder:
                                        (_) =>
                                        AlertDialog(
                                          title:
                                          Text(
                                            customer[
                                            "name"],
                                          ),
                                          content:
                                          Column(
                                            mainAxisSize:
                                            MainAxisSize.min,
                                            children: [
                                              Text(
                                                customer["phone"],
                                              ),
                                              const SizedBox(
                                                  height:
                                                  10),
                                              Text(
                                                "Total Orders: ${customer["orders"]}",
                                              ),
                                            ],
                                          ),
                                        ),
                                  );
                                },
                              ),
                            ),

                            const SizedBox(
                                width: 10),

                            Expanded(
                              child:
                              ElevatedButton
                                  .icon(
                                icon:
                                Icon(
                                  customer[
                                  "status"] ==
                                      true
                                      ? Icons
                                      .block
                                      : Icons
                                      .check_circle,
                                ),
                                label:
                                Text(
                                  customer[
                                  "status"] ==
                                      true
                                      ? "Block"
                                      : "Activate",
                                ),
                                style:
                                ElevatedButton
                                    .styleFrom(
                                  backgroundColor:
                                  customer["status"]
                                      ? Colors
                                      .red
                                      : Colors
                                      .green,
                                  foregroundColor:
                                  Colors
                                      .white,
                                ),
                                onPressed:
                                    () {
                                  setState(
                                          () {
                                        customer[
                                        "status"] =
                                        !customer[
                                        "status"];
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
          ),
        ],
      ),
    );
  }

  Widget _statItem(
      String value, String title) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}