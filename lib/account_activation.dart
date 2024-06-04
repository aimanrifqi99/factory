import 'package:flutter/material.dart';
import 'factory1dashboard.dart';

class MobileNumberPage extends StatefulWidget {
  const MobileNumberPage({super.key});

  @override
  State<MobileNumberPage> createState() => _MobileNumberPageState();
}

class _MobileNumberPageState extends State<MobileNumberPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView( // Add SingleChildScrollView for better responsiveness
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset('images/LogoUPM.jpg', height: 100),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Welcome!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.pink[50],
                    borderRadius: BorderRadius.circular(10), // Add border radius for better aesthetics
                  ),
                  child: Column(
                    children: [
                      Text('Enter your mobile number to activate your account.'),
                      SizedBox(height: screenHeight * 0.05), // Responsive spacing
                      Row(
                        children: [
                          Image.asset('images/Malaysiaflag.jpg', width: 30),
                          SizedBox(width: 10),
                          Text('+60'),
                          SizedBox(width: 10),
                          const Expanded(
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                          ),
                          const Expanded( // Use Expanded to prevent overflow
                            child: Text('I agree to the terms & conditions'),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OtpPage()),
                          );
                        },
                        child: Text('Get Activation Code'),
                      ),
                      SizedBox(height: screenHeight * 0.05), // Responsive spacing
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.1), // Responsive spacing
                Text('Disclaimer | Privacy Statement', style: TextStyle(color: Colors.blue)),
                SizedBox(height: 10),
                Text('Copyright UPM & Kejuruteraan Minyak Sawit CCS Sdn. Bhd.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OtpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView( // Add SingleChildScrollView for better responsiveness
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset('images/LogoUPM.jpg', height: 100),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Welcome!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text('Enter the activation code you received via SMS.'),
                      SizedBox(height: screenHeight * 0.05), // Responsive spacing
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'OTP',
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Didn\'t receive? Tap here', style: TextStyle(color: Colors.blue)),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Factory1dashboard()),
                          );
                        },
                        child: Text('Activate'),
                      ),
                      SizedBox(height: screenHeight * 0.05), // Responsive spacing
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.1), // Responsive spacing
                Text('Disclaimer | Privacy Statement', style: TextStyle(color: Colors.blue)),
                SizedBox(height: 10),
                Text('Copyright UPM & Kejuruteraan Minyak Sawit CCS Sdn. Bhd.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
