import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'menu_screen.dart';
import 'option_screen.dart';
import 'keranjang_screen.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class FirstScreen extends StatelessWidget {
  final int index; // Declare the index variable

  // Constructor with a named 'key' parameter
  const FirstScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wallpaper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
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
                ),
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logobisamasak.png'),
                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondScreen()),
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
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          'Mulai Memasak',
                          style: GoogleFonts.kdamThmorPro(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () async {
                      //SharedPreferences prefs = await SharedPreferences.getInstance();
                      //int savedIndex = prefs.getInt('savedIndex') ?? 0;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ThirdScreen(index: index)),
                      );
                    },
                    child: Container(
                      height: 70.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          'Lanjut Memasak',
                          style: GoogleFonts.kdamThmorPro(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
