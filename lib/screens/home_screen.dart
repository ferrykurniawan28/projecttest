import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projecttest/screens/login.dart';
import 'package:projecttest/screens/watchlist_screen.dart';

import 'option_screen.dart';
import '../widgets/keranjang_bahan.dart';

class HomeScreen extends StatelessWidget {
  final int index;

  const HomeScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              icon: const Icon(Icons.logout))
        ],
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wallpaper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildShoppingCartButton(context),
            _buildLogoAndOptions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildShoppingCartButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(cartItems: const []),
                ),
              );

              if (result != null) {
                // Handle the result if needed
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLogoAndOptions(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logobisamasak.png'),
          const SizedBox(height: 20.0),
          _buildOptionButton(context, 'Mulai Memasak', OptionScreen()),
          const SizedBox(height: 10),
          _buildOptionButton(
              context, 'Watchlist Resep', WatchListScreen(index: index)),
        ],
      ),
    );
  }

  Widget _buildOptionButton(
      BuildContext context, String label, Widget destination) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Container(
        height: 70.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.arrow_forward, color: Colors.black),
            Text(
              label,
              style: GoogleFonts.kdamThmorPro(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 24.0),
          ],
        ),
      ),
    );
  }
}
