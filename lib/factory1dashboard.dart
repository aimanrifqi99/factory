import 'package:flutter/material.dart';
import 'factory2dashboard.dart';
import 'package:lab05/factory1engineer.dart';
import 'package:lab05/factory1setting.dart';

class Factory1dashboard extends StatelessWidget {
  const Factory1dashboard({Key? key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth * 0.4; // Adjust this multiplier as needed

    return Scaffold(
      appBar: AppBar(
        title: const Text('Factory 1'),
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
                  color: Colors.white54, // Set the background color of the inner container
                  child: Column(
                    children: [
                      const Text('⚠️ABD1234 IS UNREACHABLE !', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildStatCard(cardWidth, 'Steam Pressure', 'images/lab5-5.jpg', '0.0bar'),
                          _buildStatCard(cardWidth, 'Steam Flow', 'images/lab5-5.jpg', '0.0T/H'),
                        ],
                      ),
                      const SizedBox(height: 10), // Narrowed space between rows
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildStatCard(cardWidth, 'Water Level', 'images/lab5-5.jpg', '0.0%'),
                          _buildStatCard(cardWidth, 'Power Frequency', 'images/lab5-5.jpg', '0.0Hz'),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text('2024-04-26 13:45:25'),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildFactoryButton('Factory 1', context, size: 108.0),
                    const SizedBox(width: 20),
                    _buildFactoryButton('Factory 2', context, size: 108.0),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Initial navigation index
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

  Widget _buildStatCard(double cardWidth, String title, String imagePath, String value) {
    return Card(
      child: Container(
        color: Colors.white, // Set background color to white
        width: cardWidth, // Adjust the width based on screen width
        padding: const EdgeInsets.all(10.0), // Reduce padding for a tighter layout
        child: Column(
          children: [
            Text(title, textAlign: TextAlign.center), // Center align the text
            const SizedBox(height: 10),
            Image.asset(imagePath, height: 100, width: 100), // Add image here
            const SizedBox(height: 10),
            Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
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
              MaterialPageRoute(builder: (context) => Factory2dashboard()), // Replace AnotherPage() with the desired page widget
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
