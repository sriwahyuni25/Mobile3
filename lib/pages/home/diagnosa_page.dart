import 'package:flutter/material.dart';
import 'package:sakitgi/pages/home/profil_page.dart';

import '../../theme.dart';
import 'home_page.dart';

class DiagnosaPage extends StatelessWidget {
  const DiagnosaPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor3,
        centerTitle: true,
        title: Text(
          'Diagnosa',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: backgroundColor2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon_diagnosis.png',
                width: 80,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Oops diagnosa tidak ada?',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Anda belum pernah melakukan diagnosa',
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 44,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/diagnosa'); //menuju fitur diagnosa
                  }, 
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Diagnosa',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      color: backgroundColor2,
      child: Column(
        children: [
          header(),
          content(),
        ],
     ),
   );
}

}