import 'package:flutter/material.dart';
import 'package:lab05/factory1dashboard.dart';
import 'package:lab05/factory1setting.dart';
import 'package:lab05/factory2engineer.dart';
import 'package:lab05/formpage.dart';

class Factory1engineer extends StatefulWidget {
  const Factory1engineer({super.key});

  @override
  _Factory1engineerState createState() => _Factory1engineerState();
}

class _Factory1engineerState extends State<Factory1engineer> {
  List<Map<String, String>> contacts = [
    {'name': 'Ben', 'phone': '+60109219938'},
    {'name': 'Testing 1', 'phone': '+601234567891'},
    {'name': 'Hello', 'phone': '+60123456789'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factory 1'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.grey, // Set the background color of the body
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  color: Colors.white54, // Set the background color of the inner container
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container( // Wrap the ListTile with a Container
                                color: Colors.white, // Set the background color to white
                                width: double.infinity, // Make the card fill the screen width
                                child: ListTile(
                                  title: Text(
                                    contacts[index]['name']!,
                                    style: const TextStyle(fontWeight: FontWeight.normal),
                                  ),
                                  subtitle: Text(contacts[index]['phone']!),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0, bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const FormPage()),
                                );
                                if (result != null) {
                                  setState(() {
                                    contacts.add(result);
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('New contact added: ${result['name']}')),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 5.0,
                                backgroundColor: Colors.purple[50],
                                foregroundColor: Colors.black,

                              ),
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildFactoryButton('Factory 1', context, size: 108.0),
                  const SizedBox(width: 10),
                  _buildFactoryButton('Factory 2', context, size: 108.0),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
        onTap: (int index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Factory1dashboard()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Factory1setting()),
            );
          }
        },
      ),
    );
  }

  Widget _buildFactoryButton(String factory, BuildContext context, {required double size}) {
    return SizedBox(
      width: size * 1.5,
      height: size,
      child: ElevatedButton(
        onPressed: () {
          if (factory == 'Factory 2') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Factory2engineer()), // Replace AnotherPage() with the desired page widget
            );
          }
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: factory == 'Factory 2' ? Colors.black : Colors.black,
          backgroundColor: factory == 'Factory 2' ? Colors.white : Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
          children: [
            Icon(
              Icons.factory, // Replace with your desired factory icon
              color: factory == 'Factory 2' ? Colors.black : Colors.black, // Adjust color based on button state
            ),
            SizedBox(height: size * 0.1), // Add some vertical spacing
            Text(factory),
          ],
        ),
      ),
    );
  }
}
