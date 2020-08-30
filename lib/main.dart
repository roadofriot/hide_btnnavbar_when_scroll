
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}


class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _scrollController;


  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }


  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hide Bottom Navigation Bar'),
      ),
      body: Container(
        width: double.infinity,
        child: ListView.builder(
          controller: _scrollController,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Hello Samay  $index'),
              onTap: () {},
            );
          },
        ),
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: _scrollController,
        builder: (context, child) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: _scrollController.position.userScrollDirection == ScrollDirection.reverse ? 0: 50,
            child: child,
          );
        },
        child: SingleChildScrollView(
          child: BottomNavigationBar(iconSize: 20,
            backgroundColor: Colors.amber[200],
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.child_friendly),
                title: Text('Child'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//When you run the app in release mode, you will get a better performance.
