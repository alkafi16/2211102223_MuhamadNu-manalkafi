import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';
import '../models/item.dart';
import 'cart_screen.dart';
import 'package:intl/intl.dart';


String formatRupiah(double amount) {
  final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
  return formatter.format(amount);
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
 
  final List<Item> availableItems = [
Item(id: 1, name: "Beras - Cap Kepala Sawit 5kg", price: 65000),
Item(id: 2, name: "Minyak Goreng - Bimoli 2L", price: 35000),
Item(id: 3, name: "Gula Pasir - Gulaku 1kg", price: 15000),
Item(id: 4, name: "Telur Ayam - 1kg", price: 28000),
Item(id: 5, name: "Mie Instan - Indomie Goreng 1 dus", price: 120000),
Item(id: 6, name: "Susu Kental Manis - Frisian Flag", price: 12000),
Item(id: 7, name: "Kopi - Kapal Api 250gr", price: 18000),
Item(id: 8, name: "Teh Celup - Sariwangi 1 kotak", price: 10000),
Item(id: 9, name: "Sabun Mandi - Lifebuoy 100gr", price: 5000),
Item(id: 10, name: "Pasta Gigi - Pepsodent 190gr", price: 12000)
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sociolla"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: availableItems.length,
        itemBuilder: (context, index) {
          final item = availableItems[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(formatRupiah(item.price.toDouble())),
            trailing: ElevatedButton(
              onPressed: () {
                Provider.of<CartModel>(context, listen: false).add(item);
              },
              child: const Text("Tambah"),
            ),
          );
        },
      ),
    );
  }
}
 