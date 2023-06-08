import 'package:flutter/material.dart';
import 'package:sakitgi/theme.dart';

class UbahProfilPribadi extends StatefulWidget {
  const UbahProfilPribadi({super.key});

  @override
  State<UbahProfilPribadi> createState() => _UbahProfilPribadiState();
}

class _UbahProfilPribadiState extends State<UbahProfilPribadi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor2,
        title: Text('Ubah Info Pribadi'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Nama', style: TextStyle(color: secondaryText)),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: secondaryText)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text('Alamat', style: TextStyle(color: secondaryText)),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: secondaryText)),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text('No Hp', style: TextStyle(color: secondaryText)),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: secondaryText)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {},
              child: Text('Ubah'))
        ],
      ),
    );
  }
}
