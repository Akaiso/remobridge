import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utility/buttons.dart';
import '../utility/text_styles.dart';

class LearnMorePage extends StatefulWidget {
  const LearnMorePage({super.key});

  @override
  LearnMorePageState createState() => LearnMorePageState();
}

class LearnMorePageState extends State<LearnMorePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _promoController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // For now just print the values
      debugPrint("Name: ${_nameController.text}");
      debugPrint("Phone: ${_phoneController.text}");
      debugPrint("Email: ${_emailController.text}");
      debugPrint("Promo Code: ${_promoController.text}");

      // You can add your logic here to send data to your backend or API
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form Submitted!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaQuery.of(context).size.width < 600
          ? AppBar(
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )),
              title: const WhiteBodyText(text: 'Registration'),
              backgroundColor: Colors.blue,
            )
          : AppBar(
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )),
              title: const HeadlineText(text: 'Registration'),
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
      body: MediaQuery.of(context).size.width < 600
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Padding(
                  padding: MediaQuery.of(context).size.width < 600
                      ? const EdgeInsets.symmetric(horizontal: 30)
                      : const EdgeInsets.symmetric(horizontal: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MediaQuery.of(context).size.width < 600
                          ? const SizedBox(
                              height: 50,
                            )
                          : const SizedBox(
                              height: 100,
                            ),
                      const Text(
                        'Follow these steps:',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text('1. Read the instructions.'),
                      const Text('2. Fill out the form below.'),
                      const Text('3. Submit the form to redeem your promo.'),
                      const Text('4. Wait for confirmation.'),
                      const SizedBox(height: 30),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _nameController,
                              decoration:
                                   InputDecoration(labelText: 'Full Name', filled: true,fillColor: Colors.blue[50]),
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter your name'
                                  : null,
                            ),
                            TextFormField(
                              controller: _phoneController,
                              decoration: InputDecoration(filled: true,fillColor: Colors.blue[50],
                                  labelText: 'Phone Number'),
                              keyboardType: TextInputType.phone,
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter your phone number'
                                  : null,
                            ),
                            TextFormField(
                              controller: _emailController,
                              decoration:  InputDecoration(filled: true,fillColor: Colors.blue[50],
                                  labelText: 'Email Address'),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter your email'
                                  : null,
                            ),
                            TextFormField(
                              controller: _promoController,
                              decoration:  InputDecoration(filled: true,fillColor: Colors.blue[50],
                                  labelText: 'Promo Code'),
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter a promo code'
                                  : null,
                            ),
                            const SizedBox(height: 50),
                            MainButton(
                              function: _submitForm,
                              title: "Submit",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 50, top: 0, right: 30, bottom: 50),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MediaQuery.of(context).size.width < 600
                              ? const SizedBox(
                                  height: 50,
                                )
                              : const SizedBox(
                                  height: 100,
                                ),
                          const Text(
                            'Follow these steps:',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          const SizedBox(height: 8),
                          const Text('1. Read the instructions.'),
                          const Text('2. Fill out the form below.'),
                          const Text(
                              '3. Submit the form to redeem your promo.'),
                          const Text('4. Wait for confirmation.'),
                          const SizedBox(height: 30),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _nameController,
                                  decoration: const InputDecoration(
                                      labelText: 'Full Name'),
                                  validator: (value) => value!.isEmpty
                                      ? 'Please enter your name'
                                      : null,
                                ),
                                TextFormField(
                                  controller: _phoneController,
                                  decoration: const InputDecoration(
                                      labelText: 'Phone Number'),
                                  keyboardType: TextInputType.phone,
                                  validator: (value) => value!.isEmpty
                                      ? 'Please enter your phone number'
                                      : null,
                                ),
                                TextFormField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                      labelText: 'Email Address'),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) => value!.isEmpty
                                      ? 'Please enter your email'
                                      : null,
                                ),
                                TextFormField(
                                  controller: _promoController,
                                  decoration: const InputDecoration(
                                      labelText: 'Promo Code'),
                                  validator: (value) => value!.isEmpty
                                      ? 'Please enter a promo code'
                                      : null,
                                ),
                                const SizedBox(height: 50),
                                MainButton(
                                  function: _submitForm,
                                  title: "Submit",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 50, left: 50),
                      child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [

                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7), // Shadow color
                                  spreadRadius: 3, // How much the shadow spreads
                                  blurRadius: 9, // How soft the shadow is
                                  offset: Offset(0, 3), // X and Y offset
                                ),

                            ],
                              borderRadius:
                                  MediaQuery.of(context).size.width < 1000
                                      ? BorderRadius.circular(100)
                                      : BorderRadius.circular(20)),
                          clipBehavior: Clip.hardEdge,
                          child:
                              Image.asset("assets/images/remote_worker.jpg")),
                    ))
              ],
            ),
    );
  }
}
