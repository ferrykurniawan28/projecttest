import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'dummy_data.dart';
import 'resep_screen.dart';
import 'tatacara_screen.dart';
import 'video_screen.dart';

class ThirdScreen extends StatelessWidget {
  final int index;

  ThirdScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          dataMasak[index].nama,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 8, 32, 73),
        actions: [
          IconButton(
            icon: Icon(Icons.push_pin),
            onPressed: () async {
              //SharedPreferences prefs = await SharedPreferences.getInstance();
              //prefs.setInt('savedIndex', index);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Screen saved!'),
                duration: Duration(seconds: 1),
              ));
            },
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 16, 54, 86),
      body: Stack(
        children: [
          Positioned(
            left: 65,
            top: 20,
            child: Container(
              width: 261,
              height: 262,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  dataMasak[index].imageUrl,
                  fit: BoxFit.fill,
                  width: 261,
                  height: 262,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 300,
            child: Container(
              width: 395,
              height: 435,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    dataMasak[index].nama,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                  SizedBox(
                    height: 150.0,
                    child: Center(
                      child: Text(
                        dataMasak[index].keterangan,
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResepMasakanScreen(datas: dataMasak[index]),
                            ),
                          );
                        },
                        child: Container(
                          height: 50.0,
                          width: 180.0,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 22, 107, 128),
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(13.0),
                          child: Center(
                            child: Text(
                              'Resep Masakan',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 2.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TataCaraMasakScreen(index: index),
                            ),
                          );
                        },
                        child: Container(
                          height: 50.0,
                          width: 180.0,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 22, 107, 128),
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              'Tata Cara Memasak',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoMemasakScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 50.0,
                      width: 370.0,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 22, 107, 128),
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          'Video Memasak',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0), // Add space between "Video Memasak" and the bottom
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
