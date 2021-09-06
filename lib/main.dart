import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'detail.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_){
    runApp(MyApp());
  }
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final listHotel = [
    {"name": "The Bentley", "image": "assets/images/the_bentley.png"},
    {"name": "Royal Lancaster", "image": "assets/images/royal_lancaster.png"},
    {"name": "The Bentley", "image": "assets/images/the_bentley.png"},
    {"name": "Royal Lancaster", "image": "assets/images/royal_lancaster.png"}
  ];

  final titleStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
      color: Colors.black);
  final subTitleStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
      color: Colors.black);
  final nameStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
      color: Colors.black);
  final bottomStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
      color: Color(0xff5399FF));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.all(16),
          child: SvgPicture.asset('assets/icons/menu.svg'),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(16),
            child: SvgPicture.asset('assets/icons/people.svg'),
          )
        ],
        title: Text(
          'HOME',
          style: titleStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/ritz-london-casino.png'),
              Padding(
                padding: EdgeInsets.only(left: 29, top: 27, bottom: 21),
                child: Text(
                  'Popular Hotel in London',
                  style: subTitleStyle,
                ),
              ),
              Container(
                height: 180,
                padding: EdgeInsets.only(left: 22),
                child: ListView.builder(
                    itemCount: listHotel.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      print('${listHotel[index]['image']}');
                      return InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailPage(data:listHotel[index])),
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.topCenter,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                padding:
                                    EdgeInsets.only(left: 10, right: 6, top: 10),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x16000000),
                                          blurRadius: 6,
                                          offset: Offset(
                                              0, 0), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Image.asset(
                                      '${listHotel[index]['image']}',
                                      fit: BoxFit.cover,
                                      height: 142,
                                      width: 174,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  width: 137,
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x16000000),
                                        blurRadius: 6,
                                        offset: Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  // alignment: Alignment.bottomCenter,
                                  child: Text(
                                    '${listHotel[index]['name']}',
                                    textAlign: TextAlign.center,
                                    style: nameStyle,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(left: 29, top: 24, bottom: 21),
                child: Text(
                  'Recommended Hotel in London',
                  style: subTitleStyle,
                ),
              ),
              Container(
                height: 180,
                padding: EdgeInsets.only(left: 22),
                child: ListView.builder(
                    itemCount: listHotel.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      print('${listHotel[index]['image']}');
                      return InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailPage(data:listHotel[index])),
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.topCenter,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                padding:
                                EdgeInsets.only(left: 10, right: 6, top: 10),
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x16000000),
                                          blurRadius: 6,
                                          offset: Offset(
                                              0, 0), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Image.asset(
                                      '${listHotel[index]['image']}',
                                      fit: BoxFit.cover,
                                      height: 142,
                                      width: 174,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  width: 137,
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x16000000),
                                        blurRadius: 6,
                                        offset: Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                  ),
                                  // alignment: Alignment.bottomCenter,
                                  child: Text(
                                    '${listHotel[index]['name']}',
                                    textAlign: TextAlign.center,
                                    style: nameStyle,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x16000000),
              blurRadius: 8,
              offset: Offset(0, -4), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12,horizontal: 32),
              child: Column(
                children: [
                  SvgPicture.asset('assets/icons/website.svg'),
                  Text('Website',style: bottomStyle,)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12,horizontal: 32),
              child: Column(
                children: [
                  SvgPicture.asset('assets/icons/call.svg'),
                  Text('Call',style: bottomStyle,)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12,horizontal: 32),
              child: Column(
                children: [
                  SvgPicture.asset('assets/icons/location.svg'),
                  Text('Location',style: bottomStyle,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
