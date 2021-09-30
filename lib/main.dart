import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: MyApp(),
));
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


//floatingActionButton
  String _a = '';
   void _onClicked() => setState(() => _a = DateTime.now().toString());
//footerButtons
    String _b ='';

   void _onTap(String b ) => setState(() => _b = b);
//bottomNavigationBar
    late List<BottomNavigationBarItem> _items;
   String _d = '';
   int _index=0;

   @override
   void initState() {
    // TODO: implement initState
    super.initState();
    _items = [];
    _items.add(BottomNavigationBarItem(icon: Icon(Icons.people),title: Text('People')));
    _items.add(BottomNavigationBarItem(icon: Icon(Icons.weekend),title: Text('Weekend')));
    _items.add(BottomNavigationBarItem(icon: Icon(Icons.message),title: Text('Message')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hello World'
        ),
        backgroundColor: Colors.red,


      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClicked,
        backgroundColor: Colors.red,
        child: const Icon(Icons.timer),
      ),
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              const Text(
                'Hello'
              ),
              ElevatedButton(onPressed:() => Navigator.pop(context), child: const Text('Close')),
              const SizedBox(height: 60.0),
              Column(
                children: [
                  Container(
                    child : Column(
                    children: const <Widget>[
                      Text('Hello World'),
                      SizedBox(height: 60.0,),
                      Text('Hii'),
                    ],
              ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: <Widget>[
        IconButton(onPressed: () => _onTap('Button 1'), icon: Icon(Icons.search)),
        IconButton(onPressed: () => _onTap('Button 2'), icon: Icon(Icons.add)),
        IconButton(onPressed: () => _onTap('Button 3'), icon: Icon(Icons.people)),
      ],
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_a),
              SizedBox(height:30.0 ),
              Text(_b),
              SizedBox(height:30.0 ),
              Text(_d),
            ],
        ),
      ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: _items,
        fixedColor: Colors.blue,
        currentIndex: _index,
        onTap: (int item) {
        setState(() {
          _index = item;
          _d ="Current value is :${_index.toString()}";
        });
        }
      ),
    );
  }
}
