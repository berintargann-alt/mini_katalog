import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String isim;
  final String fiyat;

  const DetailPage({
    super.key,
    required this.isim,
    required this.fiyat,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isim),
        backgroundColor: Colors.purple,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            
            Text(
              isim,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              fiyat,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Ürün sepete eklendi 🛒"),
    ),
  );
},

              child: const Text("Sepete Ekle"),
            ),
          ],
        ),
      ),
    );
  }
}