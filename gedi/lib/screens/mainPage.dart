import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gedi/screens/QuizPage.dart';
//import 'package:gedi/calendarEvent.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:table_calendar/table_calendar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../main.dart';
//import 'scrapePage.dart';
//import 'testResult.dart';

List<Widget> widgetList = [Today(), Question(), ScrapeBtn(), Weekly()];

class MainPage extends StatefulWidget {
  static const String id = 'main_page';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime _selectedDate = DateTime.now();
  Color _selectedColor = Color(0xffB2B3D5);

  // user info
  String level = 1.toString();
  String point = 65.toString();
  String userName = user_Name;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SlidingUpPanel(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 30,
              child: Text(
                userName,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              margin: const EdgeInsets.only(top: 20, bottom: 20, left: 40),
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: const Color(0x00ffffff), width: 1),
                        gradient: const LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Color(0xff9694DE), Color(0xff6667AB)])),
                    child: Text(
                      'Level $level',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    margin: EdgeInsets.only(left: 40, right: 10),
                    alignment: Alignment.center,
                  ),
                  Text(
                    '$point%',
                    style: TextStyle(
                      color: Color(0xff898989),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    ' to Next Level',
                    style: TextStyle(
                      color: Color(0xff898989),
                      fontSize: 15,
                    ),
                  )
                ]), // Level ~ point
            Calendar(),
            Today(),
            SizedBox(height: 2),
            Question(),
            ScrapeBtn(),
          ],
        ),
        panel: Center(child: Weekly()),
        minHeight: MediaQuery.of(context).size.height - 600,
        borderRadius: BorderRadius.circular(10),
        margin: EdgeInsets.only(left: 20, right: 20),
//        padding: EdgeInsets.all(10),
        color: Colors.orange,
      ),
    );
  }
}

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
//  late Map<DateTime, List<CalendarEvent>> selectedEvents;

  @override
  void initState() {
//    selectedEvents = {};
    super.initState();
  }

//  List<CalendarEvent> _getEventFromDay(DateTime date) {
//    return selectedEvents[date] ?? [];
//  }
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        width: double.infinity,
        height: 145,
        margin: EdgeInsets.only(left: 30, right: 16),
        child: TableCalendar(
          firstDay: DateTime.utc(2021, 10, 1),
          focusedDay: DateTime.now(),
          lastDay: DateTime.utc(2023, 12, 31),
          startingDayOfWeek: StartingDayOfWeek.sunday,
          calendarFormat: CalendarFormat.week,
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
          ),
//          eventLoader: _getEventFromDay,
        )); // Calendar;
  }
}

class Today extends StatelessWidget {
  const Today({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
//            height: 30,
            margin: EdgeInsets.only(left: 40, right: 5),
            child: const Text(
              '????????? ??????',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image.asset("assets/icons/thought.png", width: 25)
        ],
      ),
    ); // ????????? ?????? + icon;
  }
}

class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  // ????????? ??????
  String todayProblem = "??????/????????? ????????? ????????? ????????????????";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      margin: EdgeInsets.only(left: 40, top: 5, right: 40),
      decoration: BoxDecoration(
        color: Color(0xff7C7DC9),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xffCFCFCF),
            spreadRadius: 4,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Quiz()));
        },
        child: Text(
          todayProblem,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        )
      ),
    ); // ?????? ?????? -> test page;
  }
}

class ScrapeBtn extends StatefulWidget {
  const ScrapeBtn({Key? key}) : super(key: key);

  @override
  _ScrapeBtnState createState() => _ScrapeBtnState();
}

class _ScrapeBtnState extends State<ScrapeBtn> {
  // scrape counter
  String scrapeCount = 4.toString();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0xffCFCFCF),
              spreadRadius: 4,
              blurRadius: 4,
              offset: Offset(0, 2),
            )
          ]),
      child: TextButton(
          onPressed: () {
            // go to scrape page
//              Navigator.push(context, MaterialPageRoute(builder: (context) => ScrapePage()),
//              );
          },
          child: Row(
            children: [
              Image.asset("assets/icons/scrape.png", width: 30),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  "Scrape",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                scrapeCount,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 10),
            ],
          )),
    ); // scrape button;
  }
}

class Weekly extends StatelessWidget {
  // weekly knowledge data
  String weeklyWrongWord = "??????????????????";
  String weeklyRightWord = "????????? ????????????";
  String weeklyWordCommentary =
      """??????????????????, ?????????, ?????????...'  ?????? ????????? ????????? ????????? ????????? ?????? ???????????? ??? ????????????.
  ???????????? ???????????? ???????????? ????????? ???????????? ?????? ?????? ?????? ????????? ?????? ????????? ???????????? ???????????? ?????? ??? ?????? ????????? ??????????????? ?????? ?????? ?????? ??????????????????.
  ???????????? ????????? ?????? ???????????? ???????????? ??????????????????????????? ???????????? ??????????????? ?????? ????????? ??? ????????? ???????????? ??????????????? ?????????.""";

  Weekly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
//          width: 50,
      margin: EdgeInsets.only(right: 55),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Weekly Knowledge',
            style: TextStyle(
              color: Colors.black,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
          Divider(color: Color(0xffA3A4CD), thickness: 1),
          Container(
            margin: EdgeInsets.only(top: 10, right: 10),
            width: double.infinity,
            child: Text(
              weeklyWrongWord,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(
            height: 3,
            width: 1,
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset("assets/icons/arrow2.png", width: 25),
                SizedBox(width: 10),
                Text(
                  weeklyRightWord,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          SizedBox(height: 3),
          Container(
//                margin: EdgeInsets.only(right: 40),
              padding: EdgeInsets.all(10),
              child: Text(
                weeklyWordCommentary,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ))
        ],
      ),
      alignment: Alignment.centerLeft,
    ); // Weekly Knowledge;
  }
}
