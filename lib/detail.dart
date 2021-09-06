import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:test_degito/Successfully.dart';
import 'DateTimeTab.dart';

class DetailPage extends StatefulWidget {
  final dynamic data;

  const DetailPage({Key? key, this.data}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final blueColor = Color(0xff5399FF);
  final disableColor = Color(0xffCBCBCB);
  final titleStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
      color: Colors.black);
  final semi16Style = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
      color: Colors.white);
  final semi12Style = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
      color: Colors.black);
  final med12Style = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
      color: Colors.black);
  final med15WStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
      color: Colors.white);
  final med15BStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
      color: Colors.black);
  final med16BStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
      color: Colors.black);
  final med12DisableStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
      color: Color(0xffCBCBCB));
  final med10Style = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
      color: Colors.white);
  bool _selectDetail = true;
  int indexSelect = 0;
  DateTime firstDay =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime lastDay = DateTime.now().add(Duration(days: 365));

  final roomType = [
    {"name": "Single Room", "price": "5,500"},
    {"name": "Double Room", "price": "7,500"},
    {"name": "Group Room", "price": "10,500"},
    {"name": "Family Room", "price": "9,500"},
  ];

  DateTime checkInTime = DateTime.now();
  DateTime selectCheckInTime = DateTime.now();

  DateTime checkOutTime = DateTime.now().add(Duration(days: 4));
  DateTime selectCheckOutTime = DateTime.now().add(Duration(days: 4));

  void changeCheckIn() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setstate) {
          return Dialog(
            insetPadding: EdgeInsets.all(20),
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Container(
              height: (MediaQuery.of(context).size.height < 500)
                  ? MediaQuery.of(context).size.height * 0.8
                  : 500,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: Stack(
                children: [
                  Container(
                    height: (MediaQuery.of(context).size.height < 500)
                        ? MediaQuery.of(context).size.height * 0.8 - 20
                        : 480,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20, top: 16),
                          child: Text(
                            'Check In',
                            style: semi16Style.copyWith(color: Colors.black),
                          ),
                        ),
                        Divider(
                          color: Color(0xffCBCBCB),
                        ),
                        TableCalendar(
                          daysOfWeekHeight: 30,
                          rowHeight: 52,
                          firstDay: firstDay,
                          lastDay: lastDay,
                          focusedDay: selectCheckInTime,
                          calendarStyle: CalendarStyle(
                              todayDecoration: BoxDecoration(
                                color: disableColor,
                                shape: BoxShape.circle,
                              ),
                              selectedDecoration: BoxDecoration(
                                color: blueColor,
                                shape: BoxShape.circle,
                              ),
                              defaultTextStyle: med16BStyle,
                              weekendTextStyle: med16BStyle,
                              selectedTextStyle:
                                  med16BStyle.copyWith(color: Colors.white),
                              outsideTextStyle: med16BStyle.copyWith(
                                  color: Color(0xffCBCBCB))),
                          headerStyle: HeaderStyle(
                              rightChevronIcon: Icon(Icons.chevron_right),
                              formatButtonVisible: false,
                              titleCentered: true,
                              titleTextStyle:
                                  semi16Style.copyWith(color: Colors.black)),
                          daysOfWeekVisible: true,
                          daysOfWeekStyle: DaysOfWeekStyle(
                              weekdayStyle:
                                  semi16Style.copyWith(color: Colors.black),
                              weekendStyle:
                                  semi16Style.copyWith(color: Colors.black),
                              dowTextFormatter: (date, locale) =>
                                  DateFormat.E(locale).format(date)[0]),
                          selectedDayPredicate: (day) {
                            return isSameDay(selectCheckInTime, day);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            setstate(() {
                              selectCheckInTime = selectedDay;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          checkInTime = selectCheckInTime;
                          if (checkOutTime.difference(checkInTime).isNegative) {
                            checkOutTime = checkInTime.add(Duration(days: 4));
                            selectCheckOutTime = checkOutTime;
                          }
                        });
                        Navigator.pop(context, false);
                      },
                      child: Container(
                        height: 50,
                        width: 250,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Text(
                          'Apply',
                          style: semi16Style,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }

  void changeCheckOut() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setstate) {
          return Dialog(
            insetPadding: EdgeInsets.all(20),
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Container(
              height: 520,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: Stack(
                children: [
                  Container(
                    height: 500,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20, top: 16),
                          child: Text(
                            'Check Out',
                            style: semi16Style.copyWith(color: Colors.black),
                          ),
                        ),
                        Divider(
                          color: Color(0xffCBCBCB),
                        ),
                        TableCalendar(
                          daysOfWeekHeight: 30,
                          rowHeight: 52,
                          firstDay: checkInTime.add(Duration(days: 1)),
                          lastDay: lastDay,
                          focusedDay: selectCheckOutTime,
                          calendarStyle: CalendarStyle(
                              todayDecoration: BoxDecoration(
                                color: disableColor,
                                shape: BoxShape.circle,
                              ),
                              selectedDecoration: BoxDecoration(
                                color: blueColor,
                                shape: BoxShape.circle,
                              ),
                              defaultTextStyle: med16BStyle,
                              weekendTextStyle: med16BStyle,
                              selectedTextStyle:
                                  med16BStyle.copyWith(color: Colors.white),
                              outsideTextStyle: med16BStyle.copyWith(
                                  color: Color(0xffCBCBCB))),
                          headerStyle: HeaderStyle(
                              rightChevronIcon: Icon(Icons.chevron_right),
                              formatButtonVisible: false,
                              titleCentered: true,
                              titleTextStyle:
                                  semi16Style.copyWith(color: Colors.black)),
                          daysOfWeekVisible: true,
                          daysOfWeekStyle: DaysOfWeekStyle(
                              weekdayStyle:
                                  semi16Style.copyWith(color: Colors.black),
                              weekendStyle:
                                  semi16Style.copyWith(color: Colors.black),
                              dowTextFormatter: (date, locale) =>
                                  DateFormat.E(locale).format(date)[0]),
                          selectedDayPredicate: (day) {
                            return isSameDay(selectCheckOutTime, day);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            setstate(() {
                              selectCheckOutTime = selectedDay;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          checkOutTime = selectCheckOutTime;
                        });
                        Navigator.pop(context, false);
                      },
                      child: Container(
                        height: 50,
                        width: 250,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Text(
                          'Apply',
                          style: semi16Style,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }

  void changeRoomType() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setstate) {
          return Dialog(
            insetPadding: EdgeInsets.all(20),
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 16),
                    child: Text(
                      'Room Type',
                      style: semi16Style.copyWith(color: Colors.black),
                    ),
                  ),
                  Divider(
                    color: Color(0xffCBCBCB),
                  ),
                  ListView.builder(
                      itemCount: roomType.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            '${roomType[index]['name']}',
                            style: (indexSelect == index)
                                ? med15BStyle
                                : med15BStyle.copyWith(
                                    color: Color(0xff919191)),
                          ),
                          trailing: SvgPicture.asset(
                            'assets/icons/selected.svg',
                            color: (indexSelect == index)
                                ? blueColor
                                : Colors.white,
                          ),
                          onTap: () {
                            setstate(() {
                              indexSelect = index;
                            });
                            setState(() {
                              indexSelect = index;
                            });
                          },
                        );
                      })
                ],
              ),
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SvgPicture.asset('assets/icons/back.svg'),
          ),
        ),
        title: Text(
          widget.data['name'],
          style: titleStyle,
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final pageHeight = constraints.maxHeight;
          final pageWidth = constraints.maxWidth;
          final photoHeight = pageHeight * 0.4;
          final containerHeight = photoHeight - 50;
          final detailHeight = pageHeight * 0.5;
          final boxDate = detailHeight * 0.15;
          final iconHeight = detailHeight * 0.08;
          final padding = detailHeight * 0.035;
          final select = containerHeight - 25;
          final button = photoHeight + detailHeight - 70;
          final widthSelect = (pageWidth / 2) - 82;
          final widthDate = pageWidth - 26;
          return Container(
            height: pageHeight,
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                    height: photoHeight,
                    width: double.maxFinite,
                    child: Image.asset(
                      'assets/images/detailpage.png',
                      fit: BoxFit.cover,
                    )),
                if (_selectDetail)
                  Positioned(
                    top: containerHeight,
                    left: 22,
                    right: 22,
                    child: Container(
                      height: detailHeight,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x16000000),
                            blurRadius: 6,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DateTimeTab(
                            boxDate: boxDate,
                            blueColor: blueColor,
                            checkInTime: checkInTime,
                            checkOutTime: checkOutTime,
                            widthDate: widthDate,
                            roomType: roomType[indexSelect]['name'] ?? '',
                            onTapCheckIn: () => changeCheckIn(),
                            onTapRoomType: () => changeRoomType(),
                            onTapCheckOut: () => changeCheckOut(),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 16),
                            child: Text(
                              'Provide facility',
                              style: semi12Style,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: padding),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('assets/icons/wifi.svg',
                                        height: iconHeight),
                                    Text(
                                      'Free Wifi',
                                      style: med12Style,
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/spa.svg',
                                      height: iconHeight,
                                      color: blueColor,
                                    ),
                                    Text(
                                      'Spa',
                                      style: med12Style,
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('assets/icons/beach.svg',
                                        height: iconHeight),
                                    Text(
                                      'Beach',
                                      style: med12DisableStyle,
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('assets/icons/pool.svg',
                                        height: iconHeight),
                                    Text(
                                      'Pool',
                                      style: med12DisableStyle,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: padding),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/breakfast.svg',
                                      height: iconHeight,
                                      color: blueColor,
                                    ),
                                    Text(
                                      'Breakfast',
                                      style: med12Style,
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/bar.svg',
                                      height: iconHeight,
                                    ),
                                    Text(
                                      'Bar',
                                      style: med12DisableStyle,
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('assets/icons/gym.svg',
                                        height: iconHeight),
                                    Text(
                                      'Gym',
                                      style: med12DisableStyle,
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/parking.svg',
                                      height: iconHeight,
                                      color: blueColor,
                                    ),
                                    Text(
                                      'Parking',
                                      style: med12Style,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                if (!_selectDetail)
                  Positioned(
                    top: containerHeight,
                    left: 22,
                    right: 22,
                    child: Container(
                      height: detailHeight,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x16000000),
                            blurRadius: 6,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DateTimeTab(
                              boxDate: boxDate,
                              blueColor: blueColor,
                              checkInTime: checkInTime,
                              checkOutTime: checkOutTime,
                              widthDate: widthDate,
                              roomType: roomType[indexSelect]['name'] ?? '',
                              onTapCheckIn: () => changeCheckIn(),
                              onTapRoomType: () => changeRoomType(),
                              onTapCheckOut: () => changeCheckOut()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                            child: ListView.builder(
                                itemCount: roomType.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${roomType[index]["name"]}',
                                          style: med15BStyle.copyWith(
                                              color: Color(0xff919191)),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text:
                                                '\$${roomType[index]["price"]} ',
                                            style: med15BStyle,
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: '24 hrs',
                                                  style: med10Style.copyWith(
                                                      color: Colors.black)),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                Positioned(
                  top: select,
                  left: 82,
                  right: 82,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectDetail = true;
                          });
                        },
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          width: widthSelect,
                          decoration: BoxDecoration(
                            color: (_selectDetail) ? blueColor : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x16000000),
                                blurRadius: 6,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50)),
                          ),
                          child: Text('Detail',
                              style:
                                  (_selectDetail) ? med15WStyle : med15BStyle),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectDetail = false;
                          });
                        },
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          width: widthSelect,
                          decoration: BoxDecoration(
                            color: (_selectDetail == false)
                                ? blueColor
                                : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x16000000),
                                blurRadius: 6,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50)),
                          ),
                          child: Text('Price Detail',
                              style: (_selectDetail == false)
                                  ? med15WStyle
                                  : med15BStyle),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: button,
                  left: 40,
                  right: 40,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Successfully(
                                  checkInTime: checkInTime,
                                  checkOutTime: checkOutTime,
                                  roomType: roomType[indexSelect],
                                )),
                      );
                      print('Book');
                      print('check in : $checkInTime');
                      print('check out : $checkOutTime');
                      print('night : ${checkOutTime.day - checkInTime.day}');
                      print('Room Type : ${roomType[indexSelect]['name']}');
                      print('Room Type : ${roomType[indexSelect]['price']}');
                      print(
                          'price : ${double.parse(roomType[indexSelect]['price']!.replaceAll(',', ''))} ');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: pageHeight * 0.07,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Text(
                        'Book Now',
                        style: semi16Style,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
