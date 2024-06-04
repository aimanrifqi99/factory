import 'package:flutter/material.dart';
import 'package:lab05/factory1dashboard.dart';
import 'package:lab05/factory1engineer.dart';
import 'package:lab05/factory1setting.dart';

class Factory2setting extends StatelessWidget {
  const Factory2setting({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factory 2'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey, // Set the darker background color here
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Colors.grey[200], // Set the background color of the inner container
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text('Minimum Threshold ⓘ', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              //elevation: 0.0,
                              backgroundColor: Colors.purple[50],
                              foregroundColor: Colors.black,

                            ),
                            child: Icon(Icons.edit),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildStatCard('Steam Pressure', 'images/lab5-6.jpg',),
                          _buildStatCard('Steam Flow', 'images/lab5-7.jpg',),
                        ],
                      ),
                      const SizedBox(height: 10), // Narrowed space between rows
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildStatCard('Water Level', 'images/lab5-8.jpg',),
                          _buildStatCard('Power Frequency', 'images/lab5-9.jpg',),
                        ],
                      ),
                      const SizedBox(height: 180),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildFactoryButton('Factory 1', context, size: 108.0), // Adjust size as needed
                    const SizedBox(width: 20),
                    _buildFactoryButton('Factory 2', context, size: 108.0), // Adjust size as needed
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Initial navigation index
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Factory1engineer()),
            );
          }
          else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Factory1dashboard()),
            );
          }
        },
      ),
    );
  }

  Widget _buildStatCard(String value, String imagePath) {
    return Container(
      color: Colors.grey[200],
      width: 150, // Adjust the width to make it narrower
      padding: const EdgeInsets.all(10.0), // Padding around the container
      child: Column(
        mainAxisSize: MainAxisSize.min, // Allow the column to occupy minimum vertical space
        children: [
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), // Center align the text
          // Reduced height between text and image
          Image.asset(imagePath, height: 70, width: 180), // Add image here
        ],
      ),
    );
  }

  Widget _buildFactoryButton(String factory, BuildContext context, {required double size}  ) {
    return SizedBox(
      width: size*1.5,
      height: size,
      child: ElevatedButton(
        onPressed: () {
          if (factory == 'Factory 1') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Factory1setting()), // Replace AnotherPage() with the desired page widget
            );
          }
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: factory == 'Factory 1' ? Colors.black : Colors.black,
          backgroundColor: factory == 'Factory 1' ? Colors.white : Colors.white,
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
