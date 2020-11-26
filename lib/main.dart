import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cipher Text',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Cipher Text'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String cipher = '';
  var text_akhir;
  final _controller = TextEditingController();


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void initState(){
    super.initState();
  }

  void array(nama) {
    setState(() {
      var list = List();
      var list_hasil = List();
      
      int kekurangan;
      String kopong = ' ';
      var awal = 0;
      var akhir = 6;
      var text = nama;
      int pjg = text.length;
      var hasil = pjg%(6);

      if(hasil != 6){
        kekurangan = 6 - hasil; 
      }
      
      for(int b = 0;b < kekurangan;b++){
        text = text + kopong;
      }

      var panjang = text.length;
      double hasil1 = panjang / 6;
      var byk = hasil1.ceil();
      for (int a = 0;a < byk;a++){
        var seperate = text.substring(awal,akhir);
        awal = akhir;
        akhir = awal + 6;
        list.add(seperate);
      }

      for (int c = 0; c < list.length;c++){
        var proses = list[c];
        var satu = proses[5];
        var dua = proses[1];
        var tiga = proses[3];
        var empat = proses[2];
        var lima = proses[4];
        var enam = proses[0];
        text_akhir = satu + dua + tiga + empat + lima + enam;
        list_hasil.add(text_akhir);
      }

      for (int c = 0; c < list_hasil.length;c++){
        cipher = cipher + list_hasil[c];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Plain Text',
            ),
            Container(
              margin: const EdgeInsets.only(left: 200.0, right: 200.0),
              child: (
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Masukkan plain text'
                  ),
                  controller: _controller,
                )
              ),
            ),
            Text(
              'Cipher Text',
            ),
            Text(
              '$cipher',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          array(_controller.text);
        },
        tooltip: 'Increment',
        child: Icon(Icons.save),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}