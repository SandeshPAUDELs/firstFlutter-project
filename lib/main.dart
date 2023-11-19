import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter List View'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> items = [];
  final TextEditingController textController = TextEditingController();
  int itemCount = 0;

  void _addItem(String text) {
    setState(() {
      items.add(text);
      textController.clear(); // text input clear garne
      itemCount = items.length; // count
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text('Add an item to the list:'),
            Text(
            'Add an item to the list:',
            style: TextStyle(
              fontFamily: 'Raleway', // Replace 'Raleway' with the font name you want to use
            ),
          ),

            Padding(
              padding: const EdgeInsets.all(45.0),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: 'Enter Any Items',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final text = textController.text;
                if (text.isNotEmpty) {
                  _addItem(text);
                }
              },
              
              child: Text('Add Item'),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                'Total Items: $itemCount',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                ),
              ), // Display the item count
            ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Set your desired background color
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ListTile(
                        title: Text(items[index]),
                      ),
                    );
                  },
                ),
        ),
            // ),
          ],
        ),
      ),
    );
  }
}
