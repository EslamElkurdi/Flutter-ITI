import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iti/day_1/ui/messenger_widget.dart';
import 'package:flutter_iti/day_1/ui/search.dart';
// import 'package:flutter_iti/day_1/data.dart';

class FacebookMessengerScreen extends StatefulWidget {
  const FacebookMessengerScreen({Key? key}) : super(key: key);

  @override
  _FacebookMessengerScreenState createState() => _FacebookMessengerScreenState();
}

class _FacebookMessengerScreenState extends State<FacebookMessengerScreen> {

  final data = DioHelper();

  final screens = [ Messenger(), SearchScreen()];

  final List<dynamic> productList = [];



  List<String> conversations = [
    "John Doe",
    "Jane Smith",
    "Alice Johnson",
    "Bob Brown",
    "John Doe",
    "Jane Smith",
    "Alice Johnson",
    "Bob Brown",
    "John Doe",
    "Jane Smith",
    "Alice Johnson",
    "Bob Brown",
    "John Doe",
    "Jane Smith",
    "Alice Johnson",
    "Bob Brown",
    "Jane Smith",
    "Alice Johnson",
    "Bob Brown",
    "John Doe",
    "Jane Smith",
    "Alice Johnson",
    "Bob Brown",
    "John Doe",
    "Jane Smith",
    "Alice Johnson",
    "Bob Brown",
    "John Doe",
    "Jane Smith",
    "Alice Johnson",
    "Bob Brown",
    // Add more conversations as needed
  ];

  @override
  void initState()  {
    // TODO: implement initState

     getData();
    super.initState();

  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messenger",
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
        ),
        leading: Padding(
          padding: const EdgeInsetsDirectional.only(start: 10),
          child: CircleAvatar(
            radius: 20.0,
            backgroundColor: Colors.white, // Set the background color
            child: ClipOval( // Clip the image in an oval shape
              child: Image(
                image: NetworkImage(
                    "https://e1.pxfuel.com/desktop-wallpaper/167/638/desktop-wallpaper-beautiful-garden-flowers-path-arch-flower-beautiful-rose-garden.jpg"
                ),
              ),
            ),
          ),
        ),
        actions: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.blue, // Set the background color
              child: Icon(
                Icons.edit, // Replace with your desired icon
                size: 20.0, // Adjust the size of the icon as needed
                color: Colors.white, // Adjust the color of the icon as needed
              ),
            ),
          ),
        ],

      ),
      body: screens[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.blue,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),

    );
  }

  void _onItemTapped(int index)  {



    _selectedIndex = index;
    setState(() {




    });
  }



  Future<void> getData() async {
    final dio = Dio();
    final response = await dio.get('https://fakestoreapi.com/products/');



    final data = response.data as List; // Cast the data to a list

    for (int i = 0; i < data.length; i++) {
      // Access each product using data[i]
      final product = data[i];
      final title = product['title'] as String;

      productList.add(title);
      // Do something with the product data (e.g., print, store, etc.)
      print(product); // Example: Print the product information
    }


  }



}

class ConversationTile extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const ConversationTile({Key? key, required this.name, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(name),
      trailing: Text("02:00 PM"),
      onTap: onTap,
    );
  }
}





class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = TextEditingController();
  final _messages = <String>[];
  final _messageStreamController = StreamController<String>.broadcast();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(_messages[index]),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Type a message',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16.0),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      final message = _controller.text;
                      if (message.isNotEmpty) {
                        _messages.add(message);
                        _messageStreamController.sink.add(message);
                        _controller.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}





class DioHelper {

  // DioHelper({number});



}