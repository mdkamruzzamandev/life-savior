import 'package:flutter/material.dart';

class PrescriptionOrdersScreen extends StatefulWidget {
  const PrescriptionOrdersScreen({super.key});

  @override
  State<PrescriptionOrdersScreen> createState() =>
      _PrescriptionOrdersScreenState();
}

class _PrescriptionOrdersScreenState
    extends State<PrescriptionOrdersScreen> {
  final List<Map<String, dynamic>> prescriptions = [
    {
      "id": "RX001",
      "customer": "Kamrul Hasan",
      "phone": "+8801712345678",
      "address": "Kaliganj, Gazipur",
      "time": "5 mins ago",
      "status": "Pending",
    },
    {
      "id": "RX002",
      "customer": "Rahim Ahmed",
      "phone": "+8801812345678",
      "address": "Dhaka",
      "time": "20 mins ago",
      "status": "Approved",
    },
  ];

  Color statusColor(String status) {
    switch (status) {
      case "Pending":
        return Colors.orange;
      case "Approved":
        return Colors.green;
      case "Rejected":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  void updateStatus(int index, String status) {
    setState(() {
      prescriptions[index]["status"] = status;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Prescription $status",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFF8),

      appBar: AppBar(
        title: const Text("Prescription Orders"),
        backgroundColor: const Color(0xFF00A651),
        foregroundColor: Colors.white,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: prescriptions.length,
        itemBuilder: (context, index) {
          final prescription = prescriptions[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [

                  Row(
                    children: [
                      Container(
                        padding:
                        const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius:
                          BorderRadius.circular(
                              12),
                        ),
                        child: const Icon(
                          Icons.receipt_long,
                          color:
                          Color(0xFF00A651),
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
                              prescription["id"],
                              style:
                              const TextStyle(
                                fontSize: 18,
                                fontWeight:
                                FontWeight
                                    .bold,
                              ),
                            ),
                            Text(
                              prescription[
                              "customer"],
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding:
                        const EdgeInsets
                            .symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration:
                        BoxDecoration(
                          color: statusColor(
                              prescription[
                              "status"])
                              .withOpacity(
                              0.15),
                          borderRadius:
                          BorderRadius
                              .circular(20),
                        ),
                        child: Text(
                          prescription["status"],
                          style: TextStyle(
                            color: statusColor(
                                prescription[
                                "status"]),
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius:
                      BorderRadius.circular(
                          15),
                    ),
                    child: const Column(
                      mainAxisAlignment:
                      MainAxisAlignment
                          .center,
                      children: [
                        Icon(
                          Icons.image,
                          size: 70,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Prescription Image",
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  ListTile(
                    dense: true,
                    leading:
                    const Icon(Icons.phone),
                    title: Text(
                        prescription["phone"]),
                  ),

                  ListTile(
                    dense: true,
                    leading: const Icon(
                        Icons.location_on),
                    title: Text(
                        prescription[
                        "address"]),
                  ),

                  ListTile(
                    dense: true,
                    leading: const Icon(
                        Icons.access_time),
                    title: Text(
                        prescription["time"]),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Icon(
                              Icons.visibility),
                          label: const Text(
                              "View"),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) =>
                                  AlertDialog(
                                    title: const Text(
                                      "Prescription",
                                    ),
                                    content:
                                    const Text(
                                      "Image Viewer will connect later.",
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed:
                                            () {
                                          Navigator.pop(
                                              context);
                                        },
                                        child:
                                        const Text(
                                          "Close",
                                        ),
                                      ),
                                    ],
                                  ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: ElevatedButton.icon(
                          style:
                          ElevatedButton
                              .styleFrom(
                            backgroundColor:
                            const Color(
                                0xFF00A651),
                            foregroundColor:
                            Colors.white,
                          ),
                          icon: const Icon(
                              Icons.medication),
                          label: const Text(
                              "Convert"),
                          onPressed: () {
                            ScaffoldMessenger.of(
                                context)
                                .showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Convert to medicine order later",
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  if (prescription["status"] ==
                      "Pending")
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style:
                            ElevatedButton
                                .styleFrom(
                              backgroundColor:
                              Colors.green,
                              foregroundColor:
                              Colors.white,
                            ),
                            onPressed: () {
                              updateStatus(
                                index,
                                "Approved",
                              );
                            },
                            child: const Text(
                              "Approve",
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: ElevatedButton(
                            style:
                            ElevatedButton
                                .styleFrom(
                              backgroundColor:
                              Colors.red,
                              foregroundColor:
                              Colors.white,
                            ),
                            onPressed: () {
                              updateStatus(
                                index,
                                "Rejected",
                              );
                            },
                            child: const Text(
                              "Reject",
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
}