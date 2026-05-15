import 'package:flutter/material.dart';
import 'pages/detail_page.dart';
import 'models/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Katalog',
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int sepetSayisi = 0;
  String arama = "";

  final List<Product> urunler = [
    Product.fromJson({
      "isim": "Laptop",
      "fiyat": "25.000 TL",
      "resim": "assets/laptop.jpg",
    }),

    Product.fromJson({
      "isim": "Telefon",
      "fiyat": "15.000 TL",
      "resim": "assets/telefon.jpg",
    }),

    Product.fromJson({
      "isim": "Kulaklık",
      "fiyat": "2.500 TL",
      "resim": "assets/kulaklik.jpg",
    }),

    Product.fromJson({
      "isim": "Kamera",
      "fiyat": "18.000 TL",
      "resim": "assets/kamera.jpg",
    }),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mini Katalog - Sepet: $sepetSayisi"),
        backgroundColor: Colors.purple,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),

            child: TextField(
              onChanged: (value) {
                setState(() {
                  arama = value;
                });
              },

              decoration: const InputDecoration(
                hintText: "Ürün Ara...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),

              itemCount: urunler.where((urun) {
                return urun.isim.toLowerCase().contains(arama.toLowerCase());
              }).length,

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),

              itemBuilder: (context, index) {
                final filtreliUrunler = urunler.where((urun) {
                  return urun.isim.toLowerCase().contains(arama.toLowerCase());
                }).toList();

                final urun = filtreliUrunler[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(isim: urun.isim, fiyat: urun.fiyat),
                      ),
                    );
                  },

                  child: Card(
                    elevation: 5,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Image.asset(urun.resim, height: 80),

                        const SizedBox(height: 10),

                        Text(
                          urun.isim,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          urun.fiyat,
                          style: const TextStyle(color: Colors.grey),
                        ),

                        const SizedBox(height: 10),

                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              sepetSayisi++;
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("${urun.isim} sepete eklendi"),
                              ),
                            );
                          },

                          child: const Text("Sepete Ekle"),
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
