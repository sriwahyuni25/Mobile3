import 'package:flutter/material.dart';
import 'package:sakitgi/pages/home/home_page.dart';
import 'package:sakitgi/pages/home/profil_page.dart';
import 'package:sakitgi/theme.dart';

import 'diagnosa_page.dart';
import 'konsultasi_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        /*child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAlias,*/
        child: BottomNavigationBar(
          backgroundColor: backgroundColor3,
          currentIndex: currentIndex,
          onTap: (value) {
            debugPrint(value.toString());
            setState(() {
              currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 5,
                ),
                child: Image.asset(
                  'assets/icon_homepage.png',
                  width: 21,
                  color: currentIndex == 0
                      ? primaryColor
                      : const Color(0xffFFFFFF),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 5,
                ),
                child: Image.asset(
                  'assets/icon_konsultasi.png',
                  width: 20,
                  color: currentIndex == 1
                      ? primaryColor
                      : const Color(0xffFFFFFF),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 5,
                ),
                child: Image.asset(
                  'assets/icon_diagnosis.png',
                  width: 20,
                  color: currentIndex == 2
                      ? primaryColor
                      : const Color(0xffFFFFFF),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 5,
                ),
                child: Image.asset(
                  'assets/icon_propage.png',
                  width: 20,
                  color: currentIndex == 3
                      ? primaryColor
                      : const Color(0xffFFFFFF),
                ),
              ),
              label: '',
            ),
          ],
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const KonsultasiPage();
        case 2:
          return const DiagnosaPage();
        case 3:
          return const ProfilPage();

        default:
          return const HomePage();
      }
    }

    return Scaffold(
        backgroundColor: backgroundColor1,
        bottomNavigationBar: customBottomNav(),
        body: body());
  }
}
