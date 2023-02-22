import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'navbar.dart';
import 'onepost.dart';
import 'main.dart' as mn;


class Posts extends StatelessWidget {
  Posts(this.profil, {Key? key}) : super(key: key);
  Map<String, dynamic> profil;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          drawer: NavBar(profil),
          body: ListView(
            children: [
              for (int i = 0; i < 10; i++)
                Post(sn: mn.posts['sn$i'], si: mn.posts['si$i'], pn: mn.posts['pn$i'], pt: mn.posts['pt$i'], pi: mn.posts['pi$i'], pi2: mn.posts['pi$i.2'], pw: mn.posts['wn$i']),
              /*Post(sn: mn.posts['sn0'], si: mn.posts['si0'], pn: mn.posts['pn0'], pt: mn.posts['pt0'], pi: mn.posts['pi0'], pi2: mn.posts['pi0.2'], pw: mn.posts['wn0']),
              Post(sn: mn.posts['sn1'], si: mn.posts['si1'], pn: mn.posts['pn1'], pt: mn.posts['pt1'], pi: mn.posts['pi1'], pi2: mn.posts['pi1.2'], pw: mn.posts['wn1']),
              Post(sn: mn.posts['sn2'], si: mn.posts['si2'], pn: mn.posts['pn2'], pt: mn.posts['pt2'], pi: mn.posts['pi2'], pi2: mn.posts['pi2.2'], pw: mn.posts['wn2']),
              Post(sn: mn.posts['sn3'], si: mn.posts['si3'], pn: mn.posts['pn3'], pt: mn.posts['pt3'], pi: mn.posts['pi3'], pi2: mn.posts['pi3.2'], pw: mn.posts['wn3']),
              Post(sn: mn.posts['sn4'], si: mn.posts['si4'], pn: mn.posts['pn4'], pt: mn.posts['pt4'], pi: mn.posts['pi4'], pi2: mn.posts['pi4.2'], pw: mn.posts['wn4']),
              Post(sn: mn.posts['sn5'], si: mn.posts['si5'], pn: mn.posts['pn5'], pt: mn.posts['pt5'], pi: mn.posts['pi5'], pi2: mn.posts['pi5.2'], pw: mn.posts['wn5']),
              Post(sn: mn.posts['sn6'], si: mn.posts['si6'], pn: mn.posts['pn6'], pt: mn.posts['pt6'], pi: mn.posts['pi6'], pi2: mn.posts['pi6.2'], pw: mn.posts['wn6']),
              Post(sn: mn.posts['sn7'], si: mn.posts['si7'], pn: mn.posts['pn7'], pt: mn.posts['pt7'], pi: mn.posts['pi7'], pi2: mn.posts['pi7.2'], pw: mn.posts['wn7']),
              Post(sn: mn.posts['sn8'], si: mn.posts['si8'], pn: mn.posts['pn8'], pt: mn.posts['pt8'], pi: mn.posts['pi8'], pi2: mn.posts['pi8.2'], pw: mn.posts['wn8']),
              Post(sn: mn.posts['sn9'], si: mn.posts['si9'], pn: mn.posts['pn9'], pt: mn.posts['pt9'], pi: mn.posts['pi9'], pi2: mn.posts['pi9.2'], pw: mn.posts['wn9']),*/
            ],
          )
        )
    );
  }


}