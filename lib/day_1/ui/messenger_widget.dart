import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iti/day_1/ui/messenger.dart';
import 'package:flutter_iti/day_1/ui/search.dart';

class Messenger extends StatefulWidget {
   Messenger({super.key});

  @override
  State<Messenger> createState() => _MessengerState();
}

class _MessengerState extends State<Messenger> {
  final data = DioHelper();

  final List<dynamic> productList = [];


  @override
  void initState()  {
    

    getData();
    super.initState();

  }

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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // search
          GestureDetector(
            child: Container(


              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(20))

              ),

              child: TextField(
                decoration: InputDecoration(

                  hintText: 'Search',

                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              height: 50,

            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()));
              print("HI");
            },
          ),

          // scroll H
          Container(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true, // Ensure it occupies only required space
              scrollDirection: Axis.horizontal,

              itemCount: conversations.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [


                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage("https://e1.pxfuel.com/desktop-wallpaper/167/638/desktop-wallpaper-beautiful-garden-flowers-path-arch-flower-beautiful-rose-garden.jpg"),
                      ),

                      SizedBox(height: 4), // Add some spacing between the avatar and text
                      Text(
                        conversations[index], // Replace with the user's name
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),


          // scroll V
          Expanded(
            child: ListView.builder(

              shrinkWrap: true, // Ensure it occupies only required space

              itemCount: productList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ConversationTile(
                      name: productList[index],
                      onTap: ()  {
                        // Open chat screen for the selected conversation


                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 8), // Add some spacing between conversation tiles
                  ],
                );
              },
            ),
          ),

        ],
      ),
    );
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


