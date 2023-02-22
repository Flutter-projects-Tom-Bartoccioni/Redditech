import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:draw/draw.dart';
import 'dart:io';
import 'navbar.dart';
import 'posts.dart';
import 'dart:developer';
import 'dart:async';

bool isok = false;
var code;
var url;
var reddit;
var redditor;
var after;
Map<String, dynamic> profil = {"name": "Name", "imagePath": "https://w0.peakpx.com/wallpaper/445/507/HD-wallpaper-arthur-art-beginning-after-the-end-bloodlust-thumbnail.jpg", "description": "Aucune Description entrée", "bannerPath": "https://i.pinimg.com/originals/7e/d4/d0/7ed4d0b378346611526137c846663c5b.jpg"};
Map<String, dynamic> posts = {"sn0": "SubName", "si0": "https://w0.peakpx.com/wallpaper/445/507/HD-wallpaper-arthur-art-beginning-after-the-end-bloodlust-thumbnail.jpg", "pn0": "PostName", "pt0": "PostText", "pi0": "", "pi0.2": "", "wn0": "Writer",
  "sn1": "SubName", "si1": "https://w0.peakpx.com/wallpaper/445/507/HD-wallpaper-arthur-art-beginning-after-the-end-bloodlust-thumbnail.jpg", "pn1": "PostName", "pt1": "PostText", "pi1": "", "pi1.2": "", "wn1": "Writer",
  "sn2": "SubName", "si2": "https://w0.peakpx.com/wallpaper/445/507/HD-wallpaper-arthur-art-beginning-after-the-end-bloodlust-thumbnail.jpg", "pn2": "PostName", "pt2": "PostText", "pi2": "", "pi2.2": "", "wn2": "Writer",
  "sn3": "SubName", "si3": "https://w0.peakpx.com/wallpaper/445/507/HD-wallpaper-arthur-art-beginning-after-the-end-bloodlust-thumbnail.jpg", "pn3": "PostName", "pt3": "PostText", "pi3": "", "pi3.2": "", "wn3": "Writer",
  "sn4": "SubName", "si4": "https://w0.peakpx.com/wallpaper/445/507/HD-wallpaper-arthur-art-beginning-after-the-end-bloodlust-thumbnail.jpg", "pn4": "PostName", "pt4": "PostText", "pi4": "", "pi4.2": "", "wn4": "Writer",
  "sn5": "SubName", "si5": "https://w0.peakpx.com/wallpaper/445/507/HD-wallpaper-arthur-art-beginning-after-the-end-bloodlust-thumbnail.jpg", "pn5": "PostName", "pt5": "PostText", "pi5": "", "pi5.2": "", "wn5": "Writer",
  "sn6": "SubName", "si6": "https://w0.peakpx.com/wallpaper/445/507/HD-wallpaper-arthur-art-beginning-after-the-end-bloodlust-thumbnail.jpg", "pn6": "PostName", "pt6": "PostText", "pi6": "", "pi6.2": "", "wn6": "Writer",
  "sn7": "SubName", "si7": "https://w0.peakpx.com/wallpaper/445/507/HD-wallpaper-arthur-art-beginning-after-the-end-bloodlust-thumbnail.jpg", "pn7": "PostName", "pt7": "PostText", "pi7": "", "pi7.2": "", "wn7": "Writer",
  "sn8": "SubName", "si8": "https://w0.peakpx.com/wallpaper/445/507/HD-wallpaper-arthur-art-beginning-after-the-end-bloodlust-thumbnail.jpg", "pn8": "PostName", "pt8": "PostText", "pi8": "", "pi8.2": "", "wn8": "Writer",
  "sn9": "SubName", "si9": "https://w0.peakpx.com/wallpaper/445/507/HD-wallpaper-arthur-art-beginning-after-the-end-bloodlust-thumbnail.jpg", "pn9": "PostName", "pt9": "PostText", "pi9": "", "pi9.2": "", "wn9": "Writer"};
Map<String, dynamic> settings = {"beta": false, "over_18": false, "no_profanity": false, "video_autoplay": false, "email_chat_request": false, "enable_followers": false};
Map<String, dynamic> mine = {};


void main() {
  runApp(const MyApp());
}

void auth() async {
  reddit = Reddit.createWebFlowInstance(clientId: 'oW_xFkKVbROPrtM3bKd1bQ', clientSecret: 'uHFKfb85Z4vHNLt31HXU-1mZFyFQyQ', userAgent: 'redWeb', redirectUri: Uri.http('localhost:8080', ''), configUri: Uri.file('auth.ini'), siteName: 'default');
  url = reddit.auth.url(['*'], 'test', compactLogin: true);
  print (url);
  await reddit.auth.authorize(code);
  redditor = await reddit.user.me();
  final Map<String, dynamic> json = jsonDecode(redditor.toString());

  profil['name'] = json['name'];

  if (json['subreddit']['icon_img'] != "")
    profil['imagePath'] = (json['subreddit']['icon_img']).replaceAll("amp;", "");

  if (json['subreddit']['public_description'] != "")
    profil['description'] = json['subreddit']['public_description'];

  if (json['subreddit']['banner_img'] != "")
    profil['bannerPath'] = (json['subreddit']['banner_img']).replaceAll("amp;", "");

  //log(profil.toString());

  final te = await reddit.auth.get(Uri.parse("https://oauth.reddit.com/api/v1/me/prefs.json?raw_json=1")); // Settings
  settings['beta'] = te['beta'];
  settings['over_18'] = te['over_18'];
  settings['no_profanity'] = te['no_profanity'];
  settings['video_autoplay'] = te['video_autoplay'];
  settings['email_chat_request'] = te['email_chat_request'];
  settings['enable_followers'] = te['enable_followers'];
  //log(settings.toString());

  final tt = await reddit.auth.get(Uri.parse("https://oauth.reddit.com/subreddits/mine/subscriber.json?raw_json=1"));
  for(int i = 0; i < (tt['data']['children']).length; i++) {
    mine[((tt['data']['children'])[i])['data']['display_name']] = i;
    mine['dn$i'] = ((tt['data']['children'])[i])['data']['display_name'];
    mine['ti$i'] = ((tt['data']['children'])[i])['data']['title'];
    mine['ii$i'] = ((tt['data']['children'])[i])['data']['community_icon'];
    mine['pd$i'] = ((tt['data']['children'])[i])['data']['public_description'];
    mine['bi$i'] = ((tt['data']['children'])[i])['data']['banner_background_image'];
    mine['sub$i'] = ((tt['data']['children'])[i])['data']['subscribers'].toString();
    mine['len'] = i + 1;
  } // Subs auquels t'es sub
  //log(tt.toString());
  log(mine.toString());


  //final ts = await reddit.auth.get(Uri.parse("https://oauth.reddit.com/r/france/.json?raw_json=1"));
  final ts = await reddit.auth.get(Uri.parse("https://oauth.reddit.com/new.json?limit=10"));
  for(int i = 0; i < (ts['data']['children']).length; i++) {
    posts['sn$i'] = (((ts['data']['children'])[i])['data']['subreddit']).replaceAll('amp;', '');
    posts['pn$i'] = (((ts['data']['children'])[i])['data']['title']).replaceAll('amp;', '');
    posts['wn$i'] = (((ts['data']['children'])[i])['data']['author']).replaceAll('amp;', '');
    posts['pt$i'] = (((ts['data']['children'])[i])['data']?['selftext']).replaceAll('amp;', '');
    if ((((((ts['data']['children'])[i])['data']?['preview']?['images'])?[0])?['source']?['url']) != null) {
      posts['pi$i'] = (((((ts['data']['children'])[i])['data']?['preview']?['images'])?[0])?['source']?['url']).replaceAll('preview', 'i').replaceAll('amp;', '');
      posts['pi$i.2'] = (((((ts['data']['children'])[i])['data']?['preview']?['images'])?[0])?['source']?['url']).replaceAll('amp;', '');
    } else {
      posts['pi$i'] = "";
      posts['pi$i.2'] = "";
    }
  }
  after = ts['data']['after'];

  for (int i = 0; i < 10; i++) {
    posts['si$i'] = "";
    for (int j = 0; j < mine['len']; j++) {
      if (posts['sn$i'] == mine['dn$j']) {
        posts['si$i'] = mine['ii$j'];
      }
    }
  }

  //log ("\n\n\n\n\n\n\n\n\n"+ ts.toString() + "\n\n\n\n\n\n\n");
  log(posts.toString());

  /*final ts = await reddit.auth.get(Uri.parse("https://oauth.reddit.com/r/AyakaMains/new.json?limit=10fter=t3_qs24g1"));
  for(int i = 0; i < (ts['data']['children']).length; i++) {
    log(((ts['data']['children'])[i])['data']['subreddit']);
    log(((ts['data']['children'])[i])['data']['title']);
    log(((ts['data']['children'])[i])['data']['author']);
    log((((((ts['data']['children'])[i])['data']?['preview']?['images'])?[0])?['source']?['url']).replaceAll('preview', 'i'));
  }
  log(ts.toString());*/


  /*# OUAIS CA C'EST COOL'
  var response = await http.get(Uri.parse("https://www.reddit.com/subreddits/search/.json?q=kamisato%20ayaka"));
  print ("\n\n\n\n\nsflgjshgilsdfgfgljibsfighsfhqg\n\n\n\n\n");
  print (response.body);
  //print (jsonDecode(response.body));*/

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
    _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(profil),
      appBar: AppBar(
        title: const Text('Redditech'),
        backgroundColor: Colors.black,
      ),
      body: Center(
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
              padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 100.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    const CircleAvatar(
                        radius: 80.0,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("images/logo_reddit.png")
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 60.0, bottom: 45.0),
                      child: ElevatedButton(
                        child: Text("Login"),
                        onPressed: () async {
                          if (isok == false) {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WebAuth()),
                            );
                            isok = true;
                            await Future.delayed(const Duration(seconds: 3), (){});
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Posts(profil)),
                            );
                          } else
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Posts(profil)),
                            );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class WebAuth extends StatefulWidget {
  @override
  WebAuthState createState() => WebAuthState();
}

class WebAuthState extends State<WebAuth> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        initialUrl: 'https://www.reddit.com/api/v1/authorize?client_id=oW_xFkKVbROPrtM3bKd1bQ&response_type=code&state=test&redirect_uri=http://localhost:8080&duration=permanent&scope=*',
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (action) async {
          if (action.url.contains("localhost:8080") == true &&
              action.url.contains("code=") == true) {
            var c = action.url.split("code=");
            c = c[1].split("#_");
            code = c[0];
            print(action.url);
            print(code);
            auth();
            Navigator.pop(context);
          }
          print(action.url.toString());
          return NavigationDecision.prevent;
        },
      ),
    );
  }
}