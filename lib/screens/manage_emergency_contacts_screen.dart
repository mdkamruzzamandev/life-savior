import 'package:flutter/material.dart';

class ManageEmergencyContactsScreen extends StatefulWidget {
  const ManageEmergencyContactsScreen({super.key});

  @override
  State<ManageEmergencyContactsScreen> createState() =>
      _ManageEmergencyContactsScreenState();
}

class _ManageEmergencyContactsScreenState
    extends State<ManageEmergencyContactsScreen> {

  final List<Map<String, String>> contacts = [];

  final TextEditingController areaController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();

  void addContact() {
    if (areaController.text.isEmpty ||
        phoneController.text.isEmpty ||
        whatsappController.text.isEmpty) {
      return;
    }

    setState(() {
      contacts.add({
        "area": areaController.text,
        "phone": phoneController.text,
        "whatsapp": whatsappController.text,
      });
    });

    areaController.clear();
    phoneController.clear();
    whatsappController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Emergency Contacts"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Add Contact"),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: areaController,
                        decoration: const InputDecoration(
                          labelText: "Delivery Area",
                        ),
                      ),
                      TextField(
                        controller: phoneController,
                        decoration: const InputDecoration(
                          labelText: "Emergency Call Number",
                        ),
                      ),
                      TextField(
                        controller: whatsappController,
                        decoration: const InputDecoration(
                          labelText: "WhatsApp Number",
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      addContact();
                      Navigator.pop(context);
                    },
                    child: const Text("Save"),
                  )
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(contacts[index]["area"]!),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Call: ${contacts[index]["phone"]}"),
                  Text("WhatsApp: ${contacts[index]["whatsapp"]}"),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    contacts.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}