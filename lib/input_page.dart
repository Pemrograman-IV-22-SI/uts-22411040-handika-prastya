import 'package:flutter/material.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _itemCodeController = TextEditingController();
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  
  double _total = 0;
  double _discount = 0;
  double _grandTotal = 0;

  void _calculate() {
    double price = double.tryParse(_priceController.text) ?? 0;
    int quantity = int.tryParse(_quantityController.text) ?? 0;

    setState(() {
      _total = price * quantity;
      _discount = _total * 10 / 100;
      _grandTotal = _total - _discount;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          name: _nameController.text,
          itemCode: _itemCodeController.text,
          itemName: _itemNameController.text,
          stock: _stockController.text, // Send the stock value as a string
          total: _total,
          discount: _discount,
          grandTotal: _grandTotal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                ),
              ),
              TextField(
                controller: _itemCodeController,
                decoration: InputDecoration(
                  labelText: 'Kode Barang',
                ),
              ),
              TextField(
                controller: _itemNameController,
                decoration: InputDecoration(
                  labelText: 'Nama Barang',
                ),
              ),
              TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Harga',
                ),
              ),
              TextField(
                controller: _stockController,
                decoration: InputDecoration(
                  labelText: 'Stok Barang',
                ),
              ),
              TextField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Jumlah Beli',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculate,
                child: Text('Hitung'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}