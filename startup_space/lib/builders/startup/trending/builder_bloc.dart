import 'package:flutter/material.dart';

class TrendingStartUps extends StatefulWidget {
  const TrendingStartUps({Key? key}) : super(key: key);

  @override
  _TrendingStartUpsState createState() => _TrendingStartUpsState();
}

class _TrendingStartUpsState extends State<TrendingStartUps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trending"),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
        // actions: <Widget>[
        //   const IconButton(
        //     icon: Icon(Icons.search),
        //     onPressed: () {
        //       Navigator.push(context, MaterialPageRoute(builder: ))
        //     },
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      trendingStartupNameCard(),
                      trendingStartupTypeCard()
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget trendingStartupNameCard() {
    return const Card(
      elevation: 8.0,
      shadowColor: Colors.blue,
      child: SizedBox(
        width: 200,
        height: 50,
        child: Center(
          child: Text('#StartUpName'),
        ),
      ),
    );
  }

  Widget trendingStartupTypeCard() {
    return const Card(
      elevation: 8.0,
      shadowColor: Colors.blue,
      child: SizedBox(
        width: 80,
        height: 50,
        child: Center(
          child: Text('Type'),
        ),
      ),
    );
  }
}
