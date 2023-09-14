import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  List images = ["assets/img1.jpg", "assets/img2.jpg", "assets/img3.jpg"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30, right: 20, left: 20),
              alignment: Alignment.center,
              child: Text(
                "Gallery",
                style: TextStyle(
                  fontSize: 25,
                  letterSpacing: .8,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Container(
              height: 690,
              width: 500,
              margin: EdgeInsets.only(right: 20, left: 20, bottom: 20),
              child: GridView.builder(
                itemCount: images.length * 7,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10,childAspectRatio: .85),
                itemBuilder: (context, index) {
                  int imageIndex = index % images.length;
                  return Container(
                    margin: EdgeInsets.all(3),
                    //padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blueAccent,
                      image: DecorationImage(
                        image: AssetImage(images[imageIndex]),
                        fit: BoxFit.cover,
                        repeat: ImageRepeat.repeat,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}