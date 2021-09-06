import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Successfully extends StatelessWidget {
  final DateTime checkInTime;
  final DateTime checkOutTime;
  final dynamic roomType;

  const Successfully(
      {Key? key,
      required this.checkInTime,
      required this.checkOutTime,
      required this.roomType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var night = checkOutTime.difference(checkInTime).inDays;
    double totalPrice = (night * double.parse(roomType['price']!.replaceAll(',', '')));
    RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    Function mathFunc = (Match match) => '${match[1]},';
    final dateFormat = DateFormat('dd-MMM-yyyy');
    final semi25Style = TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
        color: Colors.black);
    final semi16Style = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
        color: Colors.white);
    final med16Style = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        color: Colors.black);
    final med15Style = TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        color: Colors.black);
    final med15GStyle = TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        color: Color(0xff919191));

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popUntil((route) => route.isFirst);
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/successfully.svg'),
              Text(
                'Booking Successfully',
                style: semi25Style,
              ),
              Container(
                margin: EdgeInsets.all(21),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x16000000),
                      blurRadius: 6,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 16),
                        child: Text(
                          'Booking Detail',
                          style: med16Style,
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Check In',
                              style: med15GStyle,
                            ),
                            Text(
                              dateFormat.format(checkInTime),
                              style: med15Style,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Check Out',
                              style: med15GStyle,
                            ),
                            Text(
                              dateFormat.format(checkOutTime),
                              style: med15Style,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Room Type',
                              style: med15GStyle,
                            ),
                            Text(
                              '${roomType['name']}',
                              style: med15Style,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Room Price',
                              style: med15GStyle,
                            ),
                            RichText(
                              text: TextSpan(
                                text: '\$${roomType["price"]} ',
                                style: med15Style,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '24 hrs',
                                      style: med15Style.copyWith(fontSize: 10)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Night',
                              style: med15GStyle,
                            ),
                            Text(
                              '$night Nights',
                              style: med15Style,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Price',
                              style: med15GStyle,
                            ),
                            Text(
                              '\$${totalPrice.toStringAsFixed(0).replaceAllMapped(reg, (Match m) => "${m[1]},")}',
                              style: med15Style,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 39, vertical: 5),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Color(0xff5399FF),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Text(
                      'Back',
                      style: semi16Style,
                      textAlign: TextAlign.center,
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
