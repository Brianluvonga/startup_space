import 'package:flutter/material.dart';

class Engagements extends StatefulWidget {
  const Engagements({Key? key}) : super(key: key);

  @override
  _EngagementsState createState() => _EngagementsState();
}

class _EngagementsState extends State<Engagements> {
  Widget activeEngagementsBox() {
    return Card(
      child: Container(
          height: 80,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    // leading: Icon(Icons.camera_alt_outlined),
                    title: const Text("3",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22)),
                    subtitle: const Text(
                      'Active',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xff2a0404), fontSize: 12),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) =>

                      //   ),
                      // )
                    },
                  )
                ],
              ),
            ),
          )),
      elevation: 8.0,
      shadowColor: Colors.black,
    );
  }

  Widget engagementInputs() {
    return Card(
      child: Container(
          height: 80,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    // leading: Icon(Icons.camera_alt_outlined),
                    title: const Text(
                      "30",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22),
                    ),
                    subtitle: const Text(
                      'Inputs',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xff2a0404), fontSize: 12),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) =>

                      //   ),
                      // )
                    },
                  )
                ],
              ),
            ),
          )),
      elevation: 8.0,
      shadowColor: Colors.black,
    );
  }

  Widget engagementDislikes() {
    return Card(
      child: Container(
          height: 80,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    // leading: Icon(Icons.camera_alt_outlined),
                    title: const Text("6",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22)),
                    subtitle: const Text(
                      'Dislikes',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xff2a0404), fontSize: 12),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) =>

                      //   ),
                      // )
                    },
                  )
                ],
              ),
            ),
          )),
      elevation: 8.0,
      shadowColor: Colors.black,
    );
  }

  Widget engagementlikes() {
    return Card(
      child: Container(
          height: 80,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    // leading: Icon(Icons.camera_alt_outlined),
                    title: const Text("1",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22)),
                    subtitle: const Text(
                      'likes',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xff2a0404), fontSize: 12),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) =>

                      //   ),
                      // )
                    },
                  )
                ],
              ),
            ),
          )),
      elevation: 8.0,
      shadowColor: Colors.black,
    );
  }

  Widget discussionTopicElement() {
    return Card(
      child: Container(
          height: 250,
          width: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    // leading: Icon(Icons.camera_alt_outlined),
                    title: const Text(
                      "",
                      textAlign: TextAlign.center,
                    ),
                    subtitle: const Text(
                      'Discussions and Topics, mainly launched products and what impact they will bring,nall these to get views from individuals and target consumers of the said product',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xff2a0404), fontSize: 20),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) =>

                      //   ),
                      // )
                    },
                  )
                ],
              ),
            ),
          )),
      elevation: 8.0,
      shadowColor: Colors.black,
    );
  }

  Widget chatBox() {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        child: const Center(
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide: BorderSide(width: 1, color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide: BorderSide(width: 1, color: Colors.black),
              ),
              fillColor: Colors.white,
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              filled: true,
              hintText: 'Chat',
              labelStyle: TextStyle(color: Colors.black),
              suffixIcon: Icon(
                Icons.send_sharp,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget stats() {
    return Center(
      child: Row(
        children: <Widget>[
          const SizedBox(height: 10),
          activeEngagementsBox(),
          const SizedBox(height: 10),
          engagementInputs(),
          const SizedBox(height: 10),
          engagementDislikes(),
          const SizedBox(height: 10),
          engagementlikes()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Engagements & Discussions'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(32, 96, 32, 0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              stats(),
              const SizedBox(height: 50),
              discussionTopicElement(),
              const SizedBox(height: 100),
              chatBox()
            ],
          ),
        ),
      ),
    );
  }
}
