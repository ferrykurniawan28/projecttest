import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'keranjang_screen.dart';

class TataCaraMasakScreen extends StatelessWidget {
  final int index;

  TataCaraMasakScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tata Cara Memasak'),
        backgroundColor: Color.fromARGB(255, 8, 32, 73),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(cartItems: []),
                    ),
                  );

                  if (result != null) {
                    // Handle the result if needed
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.push_pin),
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Langkah-langkah memasak ${dataMasak[index].nama}:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: dataMasak[index].cara.length,
                itemBuilder: (context, i) => ListTile(
                  leading: CircleAvatar(child: Text((i + 1).toString())),
                  title: Text(dataMasak[index].cara[i]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
