import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        //drawerScrimColor: Colors.black12,
        primary: false,
        //drawerDragStartBehavior: DragStartBehavior.down,
      /* appBar: AppBar(
          //backgroundColor: Colors.amber,
          elevation: 0.0,
          //title: Text('Material App Bar'),
        ),*/
        body: Scaffold(body: MySliverPage()),
      ),
    );
  }
}
class MySliverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          snap: true,
          
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Row(
              children: <Widget>[
                const Icon(Icons.menu, color: Colors.white),
                const SizedBox(width: 10),
                const Text('Expando Bar'),
              ],
            ),
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.green, Colors.red]),
              ),
            ),
          ),
          expandedHeight: 150,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.mode_comment),
              onPressed: () => Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('I have been pressed'))),
            )
          ],
        ),
       /* SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context,index)=>Container(
              color: getRandomColor(),
            ),
            childCount: 99
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 50,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
          ),
        ),*/
        SliverToBoxAdapter(
          child: Container(
              height: 50, child: Center(child: Text('I\'m a regular widget'))),
        ),
        SliverAppBar(
          title: Text('I\'m a sticky app bar'),
          pinned: true,
          primary: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index)=>
              Container(color: getRandomColor(), height: 150.0),
          )
        )
      ],
    );
  }

}

final random = Random();

/// Returns a random color, with minumim brightness level
Color getRandomColor({int minBrightness = 50}){
  assert(minBrightness >= 0 && minBrightness <= 255);
  return Color.fromARGB(
    0xFF,
    minBrightness + random.nextInt(255 - minBrightness),
    minBrightness + random.nextInt(255 - minBrightness),
    minBrightness + random.nextInt(255 - minBrightness),
  );
}
