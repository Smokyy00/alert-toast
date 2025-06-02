import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Pertemuan 4 - Alert & Toast')),
        body: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Input Pesan
                TextField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                    hintText: 'Pesan toast masukan kesini bang',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                // Tombol 1: Tampilkan AlertDialog
                ElevatedButton(
                  child: const Text('Tampilkan AlertDialog'),
                  onPressed: () => _showConfirmationDialog(context),
                ),

                const SizedBox(height: 10),

                // Tombol 2: Tampilkan SnackBar Langsung
                ElevatedButton(
                  child: const Text('Tampilkan Toast'),
                  onPressed: () => _showSnackBar(context),
                ),

                const Spacer(),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.grey[200],
                  child: const Text(
                    'by Yusuf',
                    'nim 221011403173'
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan AlertDialog
  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Apakah Anda ingin menampilkan pesan?, INI CONTOH ALERT YAAKK BANGG'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tidak'),
          ),
          TextButton(
            onPressed: () {
              _showSnackBar(context); // Tampilkan SnackBar
              Navigator.pop(context);
            },
            child: const Text('Ya'),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk menampilkan SnackBar
  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_messageController.text),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}