import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String name;
  final String itemCode;
  final String itemName;
  final String stock;
  final double total;
  final double discount;
  final double grandTotal;

  ResultPage({
    required this.name,
    required this.itemCode,
    required this.itemName,
    required this.total,
    required this.stock,
    required this.discount,
    required this.grandTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Perhitungan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nama: $name'),
            Text('Kode Barang: $itemCode'),
            Text('Nama Barang: $itemName'),
            Text('stock: $stock'),
            SizedBox(height: 20),
            Text('Total: Rp ${total.toStringAsFixed(2)}'),
            Text('Diskon: Rp ${discount.toStringAsFixed(2)}'),
            Text('Grand Total: Rp ${grandTotal.toStringAsFixed(2)}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}