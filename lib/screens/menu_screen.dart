import 'package:flutter/material.dart';
import '/widgets/watchlist.dart';
import '/dummy_data.dart';
import '/widgets/resep_masak.dart';
import 'tatacara_screen.dart';
import '/widgets/video_masak.dart';


class MenuScreen extends StatefulWidget {
  final int index;

  const MenuScreen({super.key, required this.index});

  @override

  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool isPinned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          dataMasak[widget.index].nama,
          style: const TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 8, 32, 73),
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                isPinned = !isPinned;
                WatchList.toggleWatch(widget.index);
              });
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(isPinned ? 'Item Pinned!' : 'Item Unpinned!'),
                duration: const Duration(seconds: 1),
              ));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(
                isPinned ? Icons.check_box : Icons.check_box_outline_blank,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 16, 54, 86),
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
                  dataMasak[widget.index].imageUrl,
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
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    dataMasak[widget.index].nama,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                  SizedBox(
                    height: 150.0,
                    child: Center(
                      child: Text(
                        dataMasak[widget.index].keterangan,
                        style: const TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ResepMasakanScreen(datas: dataMasak[widget.index]),
                            ),
                          );
                        },
                        child: Container(
                          height: 50.0,
                          width: 180.0,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 22, 107, 128),
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(13.0),
                          child: const Center(
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
                      const SizedBox(width: 2.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TataCaraMasakScreen(index: widget.index),
                            ),
                          );
                        },
                        child: Container(
                          height: 50.0,
                          width: 180.0,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 22, 107, 128),
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: const Center(
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
                        color: const Color.fromARGB(255, 22, 107, 128),
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Center(
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
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
