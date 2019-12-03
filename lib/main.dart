import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "PON XX PAPUA 2020",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> daftarPeserta = new List();

  var daftar = [
    {"nama": "1. ACEH", "gambar": "1_aceh.png"},
    {"nama": "2. BALI", "gambar": "2_bali.png"},
    {"nama": "3. BANTEN", "gambar": "3_banten.png"},
    {"nama": "4. BENGKULU", "gambar": "4_bengkulu.png"},
    {"nama": "5. GORONTALO", "gambar": "5_gorontalo.png"},
    {"nama": "6. JAKARTA", "gambar": "6_jakarta.png"},
    {"nama": "7. JAMBI", "gambar": "7_jambi.png"},
    {"nama": "8. JABAR", "gambar": "8_jawa_barat.png"},
    {"nama": "9. JATENG", "gambar": "9_jawa_tengah.png"},
    {"nama": "10. JATIM", "gambar": "10_jawa_timur.png"}
/*   {"nama":"11. KALBAR","gambar":"11_kalimantan_barat.png"},
  {"nama":"12. KALSEL","gambar":"12_kalimantan_selatan.png"},
  {"nama":"13. KALTENG","gambar":"13_kalimantan_tengah.png"},
  {"nama":"14. KALTIM","gambar":"14_kalimantan_timur.png"},
  {"nama":"15. KALUT","gambar":"15_kalimantan_utara.png"},
  {"nama":"16. KEPBANGBEL","gambar":"16_kep_bangka_belitung.png"},
  {"nama":"17. KEPRI","gambar":"17_kep_riau.png"},
  {"nama":"18. LAMPUNG","gambar":"18_lampung.png"},
  {"nama":"19. MALUKU","gambar":"19_maluku.png"},
  {"nama":"20. MALUT","gambar":"20_maluku_utara.png"},
  {"nama":"21. NTB","gambar":"21_ntb.png"},
  {"nama":"22. NTT","gambar":"22_ntt.png"},
  {"nama":"23. PAPUA","gambar":"23_papua.png"},
  {"nama":"24. PAPUA BRT","gambar":"24_papua_barat.png"},
  {"nama":"25. RIAU","gambar":"25_riau.png"},
  {"nama":"26. SULBAR","gambar":"26_sulawesi_barat.png"},
  {"nama":"27. SULSEL","gambar":"27_sulawesi_selatan.png"},
  {"nama":"28. SULTENG","gambar":"28_sulawesi_tengah.png"},
  {"nama":"29. SULTENGG","gambar":"29_sulawesi_tenggara.png"},
  {"nama":"30. SULUT","gambar":"30_sulawesi_utara.png"},
  {"nama":"31. SUMBAR","gambar":"31_sumatra_barat.png"},
  {"nama":"32. SUMSEL","gambar":"32_sumatra_selatan.png"},
  {"nama":"33. SUMUT","gambar":"33_sumatra_utara.png"},
  {"nama":"34. DIY","gambar":"34_diy.png"} */
  ];

  _buatlist() async {
    for (var i = 0; i < daftar.length; i++) {
      final daftarnya = daftar[i];
      final String img = daftarnya["gambar"];

      daftarPeserta.add(new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Card(
            child: new Column(
              children: <Widget>[
                new Hero(
                  tag: daftarnya['nama'],
                  child: new Material(
                    child: new InkWell(
                      onTap: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Detail(
                          nama: daftarnya['nama'],
                          gambar: daftarnya['gambar'],
                        ),
                      )),
                      child: new Image.asset(
                        "images/grid/$img",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(10.0),
                ),
                new Text(
                  daftarnya["nama"],
                  style: TextStyle(fontSize: 14.0),
                ),
              ],
            ),
          )));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "PON XX",
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: daftarPeserta,
      ),
    );
  }
}

class Detail extends StatelessWidget {
  Detail({this.nama, this.gambar});
  final String nama;
  final String gambar;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
              height: 240.0,
              child: new Hero(
                tag: nama,
                child: new Material(
                  child: new InkWell(
                    child: new Image.asset(
                      "images/grid/$gambar",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
          new BagianNama(
            nama: nama,
          ),
          new BagianIcon(),
          new Keterangan(),
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({this.nama});
  final String nama;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nama,
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
                new Text(
                  "$nama+",
                  style: new TextStyle(fontSize: 17.0, color: Colors.grey),
                )
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.red,
              ),
              new Text(
                "12",
                style: TextStyle(fontSize: 18.0),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new IconTeks(
            icon: Icons.call,
            teks: "Call",
          ),
          new IconTeks(
            icon: Icons.message,
            teks: "Message",
          ),
          new IconTeks(
            icon: Icons.photo,
            teks: "Photo",
          ),
        ],
      ),
    );
  }
}

class IconTeks extends StatelessWidget {
  IconTeks({this.icon, this.teks});
  final IconData icon;
  final String teks;

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          new Text(
            teks,
            style: new TextStyle(color: Colors.blue, fontSize: 18.0),
          )
        ],
      ),
    );
  }
}

class Keterangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            style: new TextStyle(fontSize: 18.0,),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
