
import 'package:flutter/material.dart';
import 'medicine_details_screen.dart';

class CategoryScreen extends StatelessWidget {
final String categoryName;

const CategoryScreen({
super.key,
required this.categoryName,
});

List<Map<String, String>> getMedicines() {
switch (categoryName) {
case "Pain Relief":
return [
{
"name": "Napa",
"company": "Beximco",
"price": "৳10"
},
{
"name": "Ace",
"company": "Square",
"price": "৳12"
},
];

case "Fever":
return [
{
"name": "Napa Extra",
"company": "Beximco",
"price": "৳15"
},
{
"name": "Reset",
"company": "Incepta",
"price": "৳18"
},
];

case "Cold & Flu":
return [
{
"name": "Histacin",
"company": "Square",
"price": "৳25"
},
{
"name": "Fexo",
"company": "Renata",
"price": "৳35"
},
];

case "Antibiotics":
return [
{
"name": "Cef-3",
"company": "Square",
"price": "৳60"
},
{
"name": "Azithro",
"company": "Beximco",
"price": "৳80"
},
];

case "Diabetes":
return [
{
"name": "Insulet",
"company": "Popular",
"price": "৳120"
},
{
"name": "Glucophage",
"company": "Healthcare",
"price": "৳50"
},
];

case "Heart Care":
return [
{
"name": "Ecosprin",
"company": "ACI",
"price": "৳20"
},
{
"name": "Bisocard",
"company": "Square",
"price": "৳35"
},
];

case "Asthma":
return [
{
"name": "Salbutamol",
"company": "Square",
"price": "৳90"
},
{
"name": "Seretide",
"company": "GSK",
"price": "৳450"
},
];

case "Baby Care":
return [
{
"name": "Baby Lotion",
"company": "Johnson",
"price": "৳180"
},
{
"name": "Baby Syrup",
"company": "Square",
"price": "৳95"
},
];

case "First Aid":
return [
{
"name": "Bandage",
"company": "ACI",
"price": "৳30"
},
{
"name": "Savlon",
"company": "ACI",
"price": "৳120"
},
];

default:
return [
{
"name": "Napa",
"company": "Beximco",
"price": "৳10"
},
{
"name": "Ace",
"company": "Square",
"price": "৳12"
},
{
"name": "Seclo",
"company": "Square",
"price": "৳15"
},
{
"name": "Maxpro",
"company": "Renata",
"price": "৳18"
},
];
}
}

@override
Widget build(BuildContext context) {
final medicines = getMedicines();

return Scaffold(
backgroundColor: const Color(0xFFF4FFF8),

appBar: AppBar(
title: Text(categoryName),
backgroundColor: const Color(0xFF00A651),
foregroundColor: Colors.white,
),

body: Column(
children: [
Padding(
padding: const EdgeInsets.all(16),
child: TextField(
decoration: InputDecoration(
hintText: "Search medicines...",
prefixIcon: const Icon(Icons.search),
filled: true,
fillColor: Colors.white,
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(15),
borderSide: BorderSide.none,
),
),
),
),

Expanded(
child: ListView.builder(
itemCount: medicines.length,
itemBuilder: (context, index) {
final medicine = medicines[index];

return Card(
margin: const EdgeInsets.symmetric(
horizontal: 16,
vertical: 8,
),
elevation: 3,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(18),
),
child: ListTile(
contentPadding:
const EdgeInsets.all(12),

leading: Container(
width: 60,
height: 60,
decoration: BoxDecoration(
color: Colors.green.shade50,
borderRadius:
BorderRadius.circular(15),
),
child: const Icon(
Icons.medication,
color: Color(0xFF00A651),
size: 35,
),
),

title: Text(
medicine["name"]!,
style: const TextStyle(
fontWeight: FontWeight.bold,
),
),

subtitle: Text(
medicine["company"]!,
),

trailing: Column(
mainAxisAlignment:
MainAxisAlignment.center,
children: [
Text(
medicine["price"]!,
style: const TextStyle(
color: Color(0xFF00A651),
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 5),

const Icon(
Icons.arrow_forward_ios,
size: 14,
),
],
),

onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (_) =>
MedicineDetailsScreen(
medicineName:
medicine["name"]!,
company:
medicine["company"]!,
price:
medicine["price"]!,
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