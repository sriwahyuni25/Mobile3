import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sakitgi/pages/home/profil_page.dart';
import 'package:http/http.dart' as http;

import '../../theme.dart';
import 'home_page.dart';

class DiagnosaPage extends StatefulWidget {
  const DiagnosaPage({super.key});

  @override
  State<DiagnosaPage> createState() => _DiagnosaPageState();
}

class _DiagnosaPageState extends State<DiagnosaPage> {
  List<dynamic> listData = [];
  Future<void> getDiagnosa() async {
    final response =
        await http.get(Uri.parse('http://10.0.141.0:9000/api/resdiagnosa'));
    if (response.statusCode == 201) {
      setState(() {
        listData = jsonDecode(response.body)['data'];
      });
    }
  }

  @override
  void initState() {
    getDiagnosa();
    super.initState();
  }

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
          child: listData.isNotEmpty
              ? RefreshIndicator(
                  onRefresh: () => getDiagnosa(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 44,
                        child: TextButton(
                          onPressed: () async {
                            var data = await Navigator.pushNamed(
                                context, '/diagnosa'); //menuju fitur diagnosa
                            log(data.toString(), name: 'data');
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
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: listData.length,
                          itemBuilder: (context, index) => ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                  'Hasil: ' + listData[index]['deskripsi']),
                            ),
                            subtitle:
                                Text('Solusi: ' + listData[index]['solusi']),
                            //leading: Text(listData[index]['hasil'], style: TextStyle(fontSize: 30),),
                          ),
                          separatorBuilder: (context, index) => Divider(
                            thickness: 4,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Column(
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
                        onPressed: () async {
                          var data = await Navigator.pushNamed(
                              context, '/diagnosa'); //menuju fitur diagnosa
                          log(data.toString(), name: 'data');
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
