import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const CollaboratePage(),
//     );
//   }
// }

class CollaboratePage extends StatefulWidget {
  const CollaboratePage({super.key});

  @override
  State<CollaboratePage> createState() => _CollaboratePageState();
}

class _CollaboratePageState extends State<CollaboratePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  String? _selectedPurpose;
  bool get _isFormValid =>
      _nameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _selectedPurpose != null &&
          _messageController.text.isNotEmpty;

  // Future<void> _submitForm() async {
  //   if (!_isFormValid) return;
  //
  //   await FirebaseFirestore.instance.collection('collaborations').add({
  //     'name': _nameController.text.trim(),
  //     'email': _emailController.text.trim(),
  //     'company': _companyController.text.trim(),
  //     'purpose': _selectedPurpose,
  //     'message': _messageController.text.trim(),
  //     'timestamp': FieldValue.serverTimestamp(),
  //   });
  //
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(content: Text('Submitted successfully!')),
  //   );
  //
  //   _formKey.currentState?.reset();
  //   setState(() {
  //     _selectedPurpose = null;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1000;

    return

      Scaffold(
      body: Container(
        color: const Color(0xFFFF3333),
        padding: const EdgeInsets.all(24),
        child: Center(
          child: isMobile
              ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTextSection(),
              const SizedBox(height: 24),
              _buildFormSection(),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: _buildTextSection()),
              const SizedBox(width: 48),
              Expanded(child: _buildFormSection()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Collaborate With Us',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 12),
        Text(
          'Innovation starts with collaboration. Let’s work together to address your needs,\nconnect you with the right talent, and create a tangible impact.',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildFormSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF2CC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Form(
        key: _formKey,
        onChanged: () => setState(() {}),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(hintText: 'Full name'),
                    validator: (value) => value!.isEmpty ? 'Required' : null,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(hintText: 'Email'),
                    validator: (value) => value!.isEmpty ? 'Required' : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _companyController,
                    decoration: const InputDecoration(hintText: 'Company name'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedPurpose,
                    hint: const Text('Select Purpose'),
                    onChanged: (value) {
                      setState(() => _selectedPurpose = value);
                    },
                    items: const [
                      DropdownMenuItem(value: 'Partnership', child: Text('Partnership')),
                      DropdownMenuItem(value: 'Sponsorship', child: Text('Sponsorship')),
                      DropdownMenuItem(value: 'Other', child: Text('Other')),
                    ],
                    validator: (value) => value == null ? 'Required' : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _messageController,
              decoration: const InputDecoration(hintText: 'Type a message'),
              maxLines: 4,
              validator: (value) => value!.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed:     (){},  // _isFormValid ? _submitForm : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isFormValid ? const Color(0xFFFF3333) : Colors.grey,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
