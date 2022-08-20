import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    var drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('Md Wahidullah Remon'),
      accountEmail: Text(user.email!),
      currentAccountPicture: const CircleAvatar(
        backgroundColor: Colors.white,
        child: FlutterLogo(size: 42.0),
      ),

    );
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          title: const Text('To page 1'),
          onTap: () => Navigator.of(context).push(_NewPage(1)),
        ),
        ListTile(
          title: const Text('To page 2'),
          onTap: () => Navigator.of(context).push(_NewPage(2)),
        ),
        ListTile(
          title: const Text('other drawer item'),
          onTap: () {},
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Flash Merchant'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Signed in as: ' + user.email!),
              MaterialButton(
                onPressed:(){
                  FirebaseAuth.instance.signOut();
                },
                color: Colors.deepPurple,
                child: Text('Sign Out',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),),
              )
            ],
          )
      ),
      drawer: Drawer(
        child: drawerItems,
      ),
    );
  }
}

class _NewPage extends MaterialPageRoute<void> {
  _NewPage(int id)
      : super(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Page $id'),
          elevation: 1.0,
        ),
        body: Center(
          child: Text('Page $id'),
        ),
      );
    },
  );
}
