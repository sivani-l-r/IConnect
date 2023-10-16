import 'package:flutter/material.dart';

void main() {
  runApp(SocialApp());
}

class SocialApp extends StatelessWidget {
  const SocialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IConnect',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: Colors.pink,
      ),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome To',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 24,
                fontWeight: FontWeight.w300,
                color: Colors.black,
                letterSpacing: 1.5,
              ),
            ),
            Text(
              'IConnect',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontStyle: FontStyle.italic,
                fontSize: 50,
                fontWeight: FontWeight.w300,
                color: Colors.green,
                letterSpacing: 1.5,
              ),
            ),
            Image.asset('images/mainpic2.png'),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              icon: Image.asset('images/arrow.gif'),
              color: Colors.pink,
              hoverColor: Colors.blue,
              iconSize: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int _selectedIndex = 0;
  Widget _pageContent = ProfilePage();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      _pageContent = ProfilePage();
    } else if (index == 1) {
      _pageContent = ConnectPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pageContent, // Display content based on the selected tab
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Connect',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.menu), // You can use any icon you prefer.
            onPressed: _openDrawer,
        ),
        ),
        drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink, // Customize the drawer header background color.
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Handle menu item 1 click.
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Handle menu item 2 click.
              },
            ),
          ],
        ),
      ),
      
      body: Column(
        children: [
          Text(
            'PROFILE',
            style: TextStyle(
              fontFamily: 'Open Sans',
              fontSize: 35,
              fontWeight: FontWeight.w300,
              color: Colors.green,
              letterSpacing: 2.5,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 250,
            width: 300,
            child: Image.asset('images/avatar.png'),
          ),
          Text(
            'Name',
            style: TextStyle(
              fontFamily: 'Open Sans',
              fontSize: 24,
              fontWeight: FontWeight.w300,
              color: Colors.black,
              letterSpacing: 1.5,
            ),
          ),
          Text(
            'Bio',
            style: TextStyle(
              fontFamily: 'Open Sans',
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(255, 29, 175, 34),
              letterSpacing: 1.5,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10.0),
              child: Text(
                'Interests',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                leading: Icon(Icons.favorite_outline, color: Colors.black),
                title: Text('Books', style: TextStyle(color: Colors.black),),
                tileColor: Color.fromARGB(255, 124, 237, 128),
                trailing: Icon(Icons.arrow_forward, color: Colors.black),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InterestPage()),
                  );
                },
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                leading: Icon(Icons.favorite_outline, color: Colors.black),
                title: Text('Movies', style: TextStyle(color: Colors.black),),
                tileColor: Color.fromARGB(255, 124, 237, 128),
                trailing: Icon(Icons.arrow_forward, color: Colors.black),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InterestPage()),
                  );
                },
              ),
            ),
          ),
          Column(
      children: [
      Stack(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Add new interest..',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
            onChanged: (text) {
              print('Text entered: $text');
            },
          ),
          Positioned(
            right: 8, // Adjust the position as needed
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
      ],
    )
    
          
        ],
      ),
    );
  }
}

class ConnectPage extends StatefulWidget {
  const ConnectPage({Key? key}) : super(key: key);

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.menu), // You can use any icon you prefer.
            onPressed: () {
              // Add the functionality for the menu button here.
            },
        ),
      ),
      body: Column(
        children: [
          Text(
            'CONNECT',
            style: TextStyle(
              fontFamily: 'Open Sans',
              fontSize: 35,
              fontWeight: FontWeight.w300,
              color: Colors.green,
              letterSpacing: 2.5,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
            onChanged: (text) {
              print('Text entered: $text');
            },
          ),
          Image.asset('images/connect.gif')
        ],
      ),
    );
  }
}

class InterestPage extends StatelessWidget {
  List<String> likedBooks = [
      'The Three-Body Problem',
      'Tomorrow, and Tomorrow, and Tomorrow',
    ];
  @override
  Widget build(BuildContext context) {
    

    Widget bookListView = ListView.builder(
      itemCount: likedBooks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(likedBooks[index]),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Books I Love',style: TextStyle(fontFamily: 'Open Sans'),),
        backgroundColor: Colors.green,
        
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 16, // Adjust the bottom value as needed
            left: 16,   // Adjust the left value as needed
            child: IconButton(
              onPressed: () {
                // Handle left button press (e.g., for editing)
              },
              icon: Icon(Icons.edit),
            ),
          ),
          Positioned(
            bottom: 16, // Adjust the bottom value as needed
            right: 16,  // Adjust the right value as needed
            child: IconButton(
              onPressed: () {
                // Handle right button press (e.g., for editing)
              },
              icon: Icon(Icons.save),
            ),
          ),
          bookListView,
        ],
      ),
    );
  }
}

