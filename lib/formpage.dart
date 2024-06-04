import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _phoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Invitation',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Invite users',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Owner's Name",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _nameController, // Link the controller to capture the name
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Type here',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  "Owner's phone number",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset('images/Malaysiaflag.jpg', width: 30),
                    const SizedBox(width: 10),
                    Text('+60'),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _phoneController,
                        decoration: const InputDecoration(
                          labelText: "Enter your phone number",
                          border: OutlineInputBorder(), // Add border
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        final newContact = {
                          'name': _nameController.text,
                          'phone': '+60${_phoneController.text}',
                        };
                        Navigator.pop(context, newContact);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.purple, // Set text color to white
                      backgroundColor: Colors.black12, // Set button background color to grey
                    ),
                    child: const Text('Submit'),
                  ),
                ),const SizedBox(height: 300),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
