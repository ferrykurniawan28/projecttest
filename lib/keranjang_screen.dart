import 'package:flutter/material.dart';


class CartScreen extends StatefulWidget {
  final List<String> cartItems;

  CartScreen({required this.cartItems});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Keranjang'),
            Spacer(),
            Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    // Return the result to the previous screen
                    Navigator.pop(context, widget.cartItems);
                  },
                ),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      widget.cartItems.length.toString(),
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
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.cartItems[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  widget.cartItems.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Clear all items from the cartItems list
          setState(() {
            widget.cartItems.clear();
          });

          // Return the result to the previous screen
          Navigator.pop(context, widget.cartItems);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
