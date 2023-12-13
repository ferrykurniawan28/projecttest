import 'package:flutter/material.dart';
import 'package:projecttest/dummy_data.dart';
import 'keranjang_screen.dart';

class ResepMasakanScreen extends StatefulWidget {
  final Data datas;

  const ResepMasakanScreen({Key? key, required this.datas}) : super(key: key);

  @override
  _ResepMasakanScreenState createState() => _ResepMasakanScreenState();
}

class _ResepMasakanScreenState extends State<ResepMasakanScreen> {
  List<String> selectedItems = []; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Resep Masakan'),
            Spacer(),
            Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(cartItems: selectedItems),
                      ),
                    );

                    if (result != null) {
                    }
                  },
                ),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      selectedItems.length.toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ), 
        backgroundColor: Color.fromARGB(255, 8, 32, 73),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.datas.resep.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(widget.datas.resep[index]),
                      trailing: Icon(Icons.add),
                      onTap: () {
                        setState(() {
                          if (!selectedItems.contains(widget.datas.resep[index])) {
                            selectedItems.add(widget.datas.resep[index]);
                          }
                        });
                      },
                    ),
                    Divider(
                      color: Colors.grey, 
                      height: 1.0,
                    ),
                  ],
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(cartItems: selectedItems),
                ),
              );
              if (result != null) {
                // Handle the result if needed
              }
            },
            child: Text('Lanjut'),
          ),
        ],
      ),
    );
  }
}
