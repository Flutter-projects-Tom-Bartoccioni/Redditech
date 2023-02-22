import 'package:flutter/material.dart';
import 'main.dart' as mn;
import 'infosub.dart';
import 'dart:developer';

double getHeigth(String sub, String name, String title, String text, String img) {
  double res = 120;
  res += (((sub.length/20) + 0.5).round() * 22);
  res += (((name.length/26) + 0.5).round() * 20);
  res += (((title.length/30) + 0.5).round() * 22);
  res += (((text.length/30) + 0.5).round() * 22);
  if (img != "") {
    log((res+200).toString());
    return (res + 200);
  }
  log(res.toString());
  return res;
}

class Post extends StatelessWidget {
  Post({Key? key, this.sn = "SubName", this.si = "", this.pn = "PostName", this.pt = "PostText", this.pi = "", this.pi2 = "", this.pw = "Writer"}) : super(key: key);
  final String sn;
  final String si;
  final String pn;
  final String pt;
  final String pi;
  final String pi2;
  final String pw;

  @override
  Widget build(BuildContext context) {
    return(
      InkWell(
        onTap: () {
          var t = mn.mine[sn].toString();
          Navigator.push(context, MaterialPageRoute(builder: (context) => InfoSub(name: mn.mine['dn$t'], title: mn.mine['ti$t'], imagePath: mn.mine['ii$t'], description: mn.mine['pd$t'], bannerPath: mn.mine['bi$t'], subscribers: mn.mine['sub$t'])));
        },
        child:
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("https://i.imgur.com/ytx06GRh.jpg"),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              height: getHeigth(sn, pw, pn, pt, pi),
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(7),
                  child: Stack(children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Stack(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      cryptoIcon(),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      cryptoNameSymbol(),
                                      const Spacer(),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      changeIcon(),
                                      const SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      cryptoAmount()
                                    ],
                                  )
                                ],
                              )
                          )
                        ],
                      ),
                    )
                  ]
                  ),
                ),
              ),
            )
        )
      )
    );
  }

  Widget cryptoIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: ClipOval(
        child: Image.network(si,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget cryptoNameSymbol() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 180),
          child: RichText(
            text: TextSpan(
              text: sn,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
              children: <TextSpan>[
                TextSpan(
                    text: "\n$pw",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget changeIcon() {
    return Align(
      alignment: Alignment.topRight,
      child: Column(
          children: const [
            Icon(
              Icons.arrow_drop_up,
              color: Colors.grey,
              size: 30,
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
              size: 30,
            )
          ]
      ),
    );
  }

  Widget cryptoAmount() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          children: <Widget>[
            ConstrainedBox(constraints: const BoxConstraints(maxWidth: 250),
              child:
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  text: "$pn\n",
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "$pt\n",
                      style: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (pi2 != '')
              SizedBox(
                  height: 200,
                  width: 200,
                  child:
                    FadeInImage(
                        placeholder: AssetImage("images/arthur_leywin.png"),
                        image: NetworkImage(pi2)
                    )
              )
          ],
        ),
      ),
    );
  }
}