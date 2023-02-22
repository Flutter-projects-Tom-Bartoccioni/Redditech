import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'navbar.dart';

class Profil extends StatelessWidget {
  const Profil({Key? key, this.name = "Name", this.imagePath = "https://w0.peakpx.com/wallpaper/445/507/HD-wallpaper-arthur-art-beginning-after-the-end-bloodlust-thumbnail.jpg",
    this.description = "Tu n'as pas de description", this.bannerPath = "https://i.pinimg.com/originals/7e/d4/d0/7ed4d0b378346611526137c846663c5b.jpg"}) : super(key: key);
  final String name;
  final String imagePath;
  final String description;
  final String bannerPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(<String, dynamic>{"name": name, "imagePath": imagePath, "description": description, "bannerPath": bannerPath}),
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
                padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 180.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                          radius: 80.0,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(imagePath)
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 60.0, bottom: 85.0),
                        child: Text(name,
                          style: GoogleFonts.raleway(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 40.0
                            ),
                          ),
                        ),
                      ),
                      Text(
                        description,
                        style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                              color: Colors.white
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