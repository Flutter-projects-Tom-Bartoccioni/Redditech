import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'navbar.dart';
import 'main.dart' as mn;
import 'setting.dart';

class Settings extends StatelessWidget {
  Settings(this.profil, {Key? key}) : super(key: key);
  Map<String, dynamic> profil;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(profil),
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Material(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://i.imgur.com/ytx06GRh.jpg"),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 100.0),
                child: Center(
                  child: ListView(
                    children: <Widget>[
                      CircleAvatar(
                          radius: 80.0,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(profil['imagePath'])
                      ),
                      Setting("Is Beta Tester", mn.settings['beta']),
                      Setting("Is Over 18", mn.settings['over_18']),
                      Setting("Profanity Filter", mn.settings['no_profanity']),
                      Setting("Video Autoplay", mn.settings['video_autoplay']),
                      Setting("Email Chat Request", mn.settings['email_chat_request']),
                      Setting("Enable Followers", mn.settings['enable_followers']),
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