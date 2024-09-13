import 'package:flutter/material.dart';
import 'dart:math'; // Import untuk operasi matematika

// Kelas utama
void main() {
  runApp(MyApp());
}

// Kelas MyApp yang merupakan StatelessWidget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

// Kelas HomePage yang merupakan StatefulWidget
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Tipe data sederhana
  String result = "Hasil akan muncul di sini";

  // Fungsi untuk operasi matematika sederhana
  int tambah(int a, int b) {
    return a + b;
  }

  // Fungsi async menggunakan async dan await
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    return "Data berhasil diambil!";
  }

  // Fungsi untuk mengontrol operasi menggunakan struktur kontrol (if-else)
  void prosesData() async {
    try {
      int angka1 = 10;
      int angka2 = 5;

      // Operasi matematika menggunakan fungsi tambah
      int hasil = tambah(angka1, angka2);

      // Struktur kontrol
      if (hasil > 10) {
        result = "Hasil lebih besar dari 10";
      } else {
        result = "Hasil kurang dari atau sama dengan 10";
      }

      // Memperbarui UI dengan hasil operasi async
      String data = await fetchData();
      result += "\n$data";
    } catch (e) {
      // Penanganan eksepsi
      result = "Terjadi kesalahan: $e";
    } finally {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contoh Aplikasi Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(result),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: prosesData,
              child: Text('Proses Data'),
            ),
          ],
        ),
      ),
    );
  }
}
