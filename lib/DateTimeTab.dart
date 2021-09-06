import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeTab extends StatelessWidget {
  final double boxDate;
  final Color blueColor;
  final DateTime checkInTime;
  final DateTime checkOutTime;
  final double widthDate;
  final String roomType;
  final Function() onTapCheckIn;
  final Function() onTapCheckOut;
  final Function() onTapRoomType;

  const DateTimeTab(
      {Key? key,
      required this.boxDate,
      required this.blueColor,
      required this.checkInTime,
      required this.checkOutTime,
      required this.widthDate,
      required this.roomType,
      required this.onTapCheckIn,
      required this.onTapCheckOut,
      required this.onTapRoomType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd-MMM-yyyy');
    final med10Style = TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        color: Colors.white);
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 13, right: 13),
      child: Container(
        height: boxDate,
        width: widthDate,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: onTapCheckIn,
                  child: Container(
                    height: boxDate,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x16000000),
                          blurRadius: 6,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Check In',
                          style: med10Style,
                        ),
                        Text(
                          dateFormat.format(checkInTime),
                          style: med10Style,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 1,
                color: Colors.white24,
              ),
              Expanded(
                child: InkWell(
                  onTap: onTapCheckOut,
                  child: Container(
                    height: boxDate,
                    decoration: BoxDecoration(
                      color: blueColor,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x16000000),
                          blurRadius: 6,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Check Out',
                          style: med10Style,
                        ),
                        Text(
                          dateFormat.format(checkOutTime),
                          style: med10Style,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 1,
                color: Colors.white24,
              ),
              Expanded(
                child: InkWell(
                  onTap: onTapRoomType,
                  child: Container(
                    height: boxDate,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x16000000),
                          blurRadius: 6,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Room Type',
                          style: med10Style,
                        ),
                        Text(
                          roomType,
                          style: med10Style,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
