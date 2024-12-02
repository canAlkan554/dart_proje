import 'package:flutter/material.dart';

String cinsiyet = "";
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: anasayfa2(),
      ),
    ),
  ));
}



class anasayfa2 extends StatefulWidget {
  const anasayfa2({super.key});

  @override
  State<anasayfa2> createState() => _anasayfa2State();
}

class _anasayfa2State extends State<anasayfa2> {
  TextEditingController ad = TextEditingController();
  TextEditingController soyad = TextEditingController();
  List<String> isimler = [];
  List<Color> renkler = [];
  int gruopdeger = 2;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration( borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.black,width: 3)),
      width: 570,
      height: 900,
      child: Container(child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Text(
                "Ad :",
                style: TextStyle(fontSize: 20),
              ),
              margin: EdgeInsets.fromLTRB(80, 20, 0, 0),
            ),
            Container(
              child: TextField(
                controller: ad,
              ),
              width: 300,
              margin: EdgeInsets.only(right: 78),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Text(
                "Soyad :",
                style: TextStyle(fontSize: 20),
              ),
              margin: EdgeInsets.fromLTRB(90, 20, 0, 0),
            ),
            Container(
              child: TextField(
                controller: soyad,
              ),
              width: 300,
              margin: EdgeInsets.only(right: 90),
            )
          ],
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Cinsiyet :",
                style: TextStyle(fontSize: 20),
              ),
              Container(
                child: r(),
                margin: EdgeInsets.only(right: 20),
              ),
            ],
          ),
          margin: EdgeInsets.fromLTRB(10, 20, 0, 80),
        ),
        Container(
          width: 200,
          height: 50,
          margin: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration( borderRadius: BorderRadius.circular(8),color: Colors.black,),
          child: TextButton(
            child: Text("Kaydet",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            onPressed: () {
              setState(() {
                isimler.add(ad.text);
                if (cinsiyet == "Erkek") {
                  renkler.add(Colors.blue);
                } else if (cinsiyet == "Kız") {
                  renkler.add(Colors.pinkAccent);
                }
                else{}
              });
            },
          ),
        ),
        Container(
          width: 300,
          height: 600,
          child: ListView.builder(
            itemCount: isimler.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration( borderRadius: BorderRadius.circular(8),color: renkler[index],),
                  child: ListTile(
                    title: Text(
                      "İsim  :" + isimler[index],
                    ),
                    trailing: IconButton(icon: Icon(Icons.remove),onPressed: () {
                      setState(() {
                        isimler.removeAt(index);
                        renkler.removeAt(index);
                      });
                    },),
                  ));
            },
          ),
        )
      ]),padding: EdgeInsets.only(top: 7),),
    );
  }
}


class r extends StatefulWidget {
  const r({super.key});

  @override
  State<r> createState() => _rState();
}

class _rState extends State<r> {
  @override
  int rdcontrller1 = 0;

  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Text("Erkek", style: TextStyle(fontSize: 20)),
            Container(
              child: Radio(
                value: 2,
                groupValue: rdcontrller1,
                onChanged: (value) {
                  setState(() {
                    rdcontrller1 = value!;
                    cinsiyet = "Erkek";
                  });
                },
              ),
              margin: EdgeInsets.only(right: 20),
            )
          ],
        ),
        Row(
          children: [
            Text("Kız", style: TextStyle(fontSize: 20)),
            Container(
                child: Radio(
                  value: 1,
                  groupValue: rdcontrller1,
                  onChanged: (value) {
                    setState(() {
                      rdcontrller1 = value!;
                      cinsiyet = "Kız";
                    });
                  },
                ),
                margin: EdgeInsets.only(right: 70))
          ],
        )
      ],
    );
  }
}
