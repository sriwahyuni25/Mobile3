

import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import '../../theme.dart';
import 'package:http/http.dart' as http;

// class Diagnosa extends StatelessWidget {
//   const Diagnosa({super.key});

//   State<Diagnosa> createState() => _DiagnosaState();

//   @override
//   Widget build(BuildContext context) {
//       return AppBar(
//         backgroundColor: backgroundColor3,
//         centerTitle: true,
//         title: Text(
//           'Diagnosa',
//           style: primaryTextStyle.copyWith(
//             fontSize: 18,
//             fontWeight: medium,
//           ),
//         ),
//         elevation: 0,
//         automaticallyImplyLeading: false,
//       );
//     }
// }

class Diagnosa extends StatefulWidget {
  const Diagnosa({super.key});

  @override
  State<Diagnosa> createState() => _DiagnosaState();
}

class HttpServices {

  Future<List<Map>> fetchSymptom() async {
    final response = await http.get(Uri.parse('http://10.0.141.0:9000/api/gejala'));

    if (response.statusCode == 201) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      // Jika request berhasil
      final jsonData = json.decode(response.body);

      // Mendapatkan data dari dalam JSON
      final List<dynamic> data = jsonData['data'];
      
      List<Map> list = [];
      for (var item in data) {
        list.add({"id": item['id'], "kodegejala" : item['kodegejala'], "namagejala" : item['namagejala'], "isChecked": false});
      }

      return list;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

class _DiagnosaState extends State<Diagnosa> {
  late List<Map> symptoms = [];

  getChannelsFromHttp()async{
    var httpService = HttpServices();
    var result = await httpService.fetchSymptom();
    setState((){
      symptoms = result;
    });
  }


  void kirimData() async{
    List<String> data = [];
    for (var item in symptoms) {
      if (item['isChecked']){
        data.add(item['kodegejala']);
      }
    }
    Map<String, dynamic> formData = {
      'gejala': data,
      'user_id' : 2,
    };
    log(jsonEncode(formData));
    final response = await http.post(Uri.parse('http://10.0.141.0:9000/api/diagnosa'), body:jsonEncode(formData),
    headers: {'Content-Type': 'application/json'},
    encoding: Encoding.getByName('utf-8')
    );
    if (response.statusCode == 201){
      log(response.body);
      Navigator.pop(context, jsonDecode(response.body));
    }
  }

  @override
  void initState() {
    super.initState();
    getChannelsFromHttp();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // drawer: (ResponsiveBuilder.isDesktop(context))
        //     ? null
        //     : Drawer(
        //         child: Padding(
        //           padding: const EdgeInsets.only(top: kSpacing),
        //           child: _Sidebar(data: controller.getSelectedProject()),
        //         ),
        //       ),
        appBar: AppBar(
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
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Pilih Gejala yang anda rasakan :",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Divider(
                  color: secondaryColor,
                ),
                SizedBox(height: 10),
                Column(
                    children: symptoms.map((item) {
                  return CheckboxListTile(
                      activeColor: secondaryColor,
                      checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      title: Text(item["namagejala"]),
                      value: item['isChecked'],
                      onChanged: (val) {
                        setState(() {
                          item['isChecked'] = val;
                        });
                        print(item);
                      });
                }).toList()),
                SizedBox(height: 10),
                Card(
                  color: primaryColor,
                  elevation: 5,
                  child: Container(
                    height: 30,
                    child: InkWell(
                      splashColor: backgroundColor2,
                      onTap: () {
                        kirimData();
                      //Navigator.pushNamed(context, '/diagnosaPage'); //menuju fitur diagnosa
                    }, 
                      child: Center(
                          child: Text("Simpan",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white))),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),  
      ),
    );
  }
}
