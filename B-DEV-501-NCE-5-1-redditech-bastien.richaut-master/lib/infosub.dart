import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'navbar.dart';

class InfoSub extends StatelessWidget {
  const InfoSub({Key? key, this.name = "Name", this.title = "Title", this.imagePath = "https://w0.peakpx.com/wallpaper/445/507/HD-wallpaper-arthur-art-beginning-after-the-end-bloodlust-thumbnail.jpg",
    this.description = "Tu n'as pas de description", this.bannerPath = "https://i.pinimg.com/originals/7e/d4/d0/7ed4d0b378346611526137c846663c5b.jpg",
    this.subscribers = "0"}) : super(key: key);
  final String name;
  final String title;
  final String imagePath;
  final String description;
  final String bannerPath;
  final String subscribers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Material(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://i.imgur.com/ytx06GRh.jpg"),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 150.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                          radius: 80.0,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(imagePath)
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 60.0, bottom: 25.0),
                        child: Text(title,
                          style: GoogleFonts.raleway(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 26.0
                            ),
                          ),
                        ),
                      ),
                      Text("$name\n",
                        style: GoogleFonts.raleway(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 21.0
                          ),
                        ),
                      ),
                      Text("$description\n\n\n",
                        style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15
                          ),
                        ),
                      ),
                      Text("Nombre d'Abonnés':\n\n$subscribers",
                        style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 18.0
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}