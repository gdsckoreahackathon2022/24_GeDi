import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final _daytime = ['오전', '오후'];
  var _selectedDaytime = '오전';

  final _hour = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  var _selectedHour = 8;

  final _notification = ['On', 'Off'];
  var _notificationOnOff = 'On';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xffA3A4CD),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
//              height: 200,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff6E6FAF), width: 2),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      '알림 설정',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Divider(color: Color(0xffA3A4CD), thickness: 1),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "매일 알림 시각",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      DropdownButton(
                        itemHeight: 50,
                          value: _selectedDaytime,
                          items: _daytime.map((value) {
                            return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                            },
                          ).toList(),
                          onChanged: (value){
                            setState(() {
                              _selectedDaytime = value as String;
                            });
                          },
                      ),
                      DropdownButton(
                        itemHeight: 50,
                        value: _selectedHour,
                        items: _hour.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value.toString()),
                          );
                        },
                        ).toList(),
                        onChanged: (value){
                          setState(() {
                            _selectedHour = value as int;
                          });
                        },
                      ),
                      Text(
                        '시',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "전체 알림",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      DropdownButton(
                        itemHeight: 50,
                        value: _notificationOnOff,
                        items: _notification.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value.toString()),
                          );
                        },
                        ).toList(),
                        onChanged: (value){
                          setState(() {
                            _notificationOnOff = value as String;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
//              height: 200,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff6E6FAF), width: 2),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      '라이센스',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Divider(color: Color(0xffA3A4CD), thickness: 1),
                  Container(
                    child: const Text(
                        "Copyright © 2013 The Android Open Source Project",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    margin: EdgeInsets.only(left: 10, right: 10),
                  ),
                  SizedBox(height: 3,),
                  Container(
                    child: Text(
                        "Copyright © 2013 The Android Open Source Project",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    margin: EdgeInsets.only(left: 10, right: 10),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
//              height: 200,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff6E6FAF), width: 2),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'Contect Us',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Divider(color: Color(0xffA3A4CD), thickness: 1),
                  Container(
                    child: Text(
                      "e-mail : melli0505@hufs.ac.kr",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 10, right: 10),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Text(
                      "Developers",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 10, right: 10),
                  ),
                  Divider(color: Color(0xffA3A4CD), thickness: 0.7),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image.asset('assets/icons/profile.png', width: 30,),
                          SizedBox(height: 5),
                          Text(
                            '김예은',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Container(
                            width: 80,
                            child: Text(
                              'ykoou3040@gmail.com',
                              style: TextStyle(
                                fontSize: 9,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ]
                      ),
                      Column(
                          children: [
                            Image.asset('assets/icons/profile.png', width: 30,),
                            SizedBox(height: 5),
                            Text(
                              '강다인',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Container(
                              width: 80,
                              child: Text(
                                'dmelli0505@gmail.com',
                                style: TextStyle(
                                  fontSize: 9,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ]
                      ),
                      Column(
                          children: [
                            Image.asset('assets/icons/profile.png', width: 30,),
                            SizedBox(height: 5),
                            Text(
                              '신형철',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Container(
                              width: 80,
                              child: Text(
                                'hcshin00717@gmail.com',
                                style: TextStyle(
                                  fontSize: 9,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ]
                      ),
                      Column(
                          children: [
                            Image.asset('assets/icons/profile.png', width: 30,),
                            SizedBox(height: 5),
                            Text(
                              '최원혁',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Container(
                              width: 80,
                              child: Text(
                                'whchoi000@gmail.com',
                                style: TextStyle(
                                  fontSize: 9,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ]
                      ),
                    ],
                  ), // profiles

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xff6768B4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  _googleSignIn.disconnect();
                },
                child: Text(
                  '탈퇴하기',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
