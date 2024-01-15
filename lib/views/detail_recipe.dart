import 'package:flutter/material.dart';
import 'package:food_recipe/views/widgets/recipe_card.dart';

class DetailResep extends StatelessWidget {
  final String? name;
  final String? image;
  final String? rating;
  final String? totalTime;
  final String? description;

  DetailResep({
    required this.name,
    required this.image,
    required this.rating,
    required this.totalTime,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text('Resep Makanan'),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            RecipeCard(
              title: name,
              cookTime: totalTime,
              rating: rating,
              thumbnailUrl: image,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Resep atau Deskripsi',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      description ?? 
                        'Berikut adalah resep sederhana untuk baked chicken breasts:\n' 
                        'Bahan:\n' 
                        '4 potong dada ayam tanpa kulit dan tulang\n'
                        '2 sendok makan minyak zaitun 1 sendok teh bubuk bawang putih\n' 
                        '1 sendok teh bubuk paprika\n' 
                        '1 sendok teh bubuk merica\n' 
                        '1 sendok teh garam\n' 
                        '1/2 sendok teh bubuk oregano\n' 
                        '1/2 sendok teh bubuk thyme\n'
                        '1/2 sendok teh merica cayenne (opsional untuk rasa pedas) Sejumput peterseli segar, cincang halus untuk taburan (opsional)\n\n'
                        'Langkah-langkah:\n' 
                        '-Panaskan oven hingga suhu 200 derajat Celsius.\n' 
                        '-Siapkan dada ayam dan keringkan dengan tisu dapur.\n' 
                        '-Campurkan minyak zaitun, bubuk bawang putih, bubuk paprika, bubuk merica, garam, oregano, thyme, dan merica cayenne (jika digunakan) dalam mangkuk kecil.\n' 
                        '-Aduk rata hingga terbentuk pasta.\n' 
                        '-Gosokkan campuran bumbu ke seluruh permukaan dada ayam, pastikan setiap bagian terbalut dengan rata.\n' 
                        '-Letakkan dada ayam dalam loyang panggangan yang sudah diolesi minyak atau dilapisi kertas panggangan.\n' 
                        '-Panggang dalam oven yang sudah dipanaskan selama sekitar 20-25 menit atau hingga dada ayam matang sempurna.\n' 
                        '-Pastikan suhu internal daging mencapai 75 derajat Celsius.\n' 
                        '-Setelah matang, keluarkan dari oven dan biarkan sejenak sebelum dihidangkan.\n' 
                        '-Taburkan peterseli segar cincang halus di atasnya untuk memberikan sentuhan segar (opsional).\n' 
                        '-Sajikan dada ayam panggang ini dengan pilihan sampingan seperti nasi, kentang panggang, atau sayuran hijau sesuai selera Anda\n\n' 
                        'Selamat mencoba!' ,
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
