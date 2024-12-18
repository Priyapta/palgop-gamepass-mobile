import 'package:e_commerce/screens/form.dart';
import 'package:e_commerce/screens/list_product.dart';
import 'package:e_commerce/widgets/left_drawer.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${message}'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Palgop GamePass",
          style: TextStyle(
              color: Colors.deepPurple[500], fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const LeftDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 150),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => productEntry()));

                    _showSnack("Kamu telah menekan tombol Tambah Produk");
                  },
                  child: Row(
                    children: [
                      Icon(Icons.list_alt_rounded),
                      Text("Lihat Daftar Produk"),
                    ],
                  )),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 150),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ItemEntryFormPage()));

                    _showSnack("Kamu telah menekan tombol Tambah Produk");
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      Text("Tambah Produk"),
                    ],
                  )),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 150),
              child: ElevatedButton(
                  onPressed: () {
                    _showSnack("Kamu telah menekan tombol Logout");
                  },
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app),
                      Text("Logout"),
                    ],
                  )),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
