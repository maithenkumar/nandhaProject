import "./constants.dart";
import 'package:flutter/material.dart';

import 'api_services.dart';
import 'details.dart';

class HomePage extends StatefulWidget {
  final int val;
  const HomePage({super.key, required this.val});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _data = [];
  String satae = '';
  String city = '';
  List<String> _widgetList = [
    "app_max_temp",
    "app_min_temp",
    "clouds",
    "clouds_hi",
    "clouds_low",
    "clouds_mid",
    "datetime",
    "dewpt",
    "high_temp",
    "low_temp",
    "max_dhi",
    "max_temp",
    "min_temp",
    "moon_phase",
    "moon_phase_lunation",
    "moonrise_ts",
    "moonset_ts",
    "ozone",
    "pop",
    "precip",
    "pres",
    "rh",
    "slp",
    "snow",
    "snow_depth",
    "sunrise_ts",
    "sunset_ts",
    "temp",
    "ts",
    "uv",
    "valid_date",
    "vis",
    "wind_cdir",
    "wind_cdir_full",
    "wind_dir",
    "wind_gust_spd",
    "wind_spd"
  ];

  @override
  void initState() {
    super.initState();
    ApiServices().titlefetchnews();
    ApiServices().fetchnews().then((value) {
      city = value;
    });
    ApiServices().fetchnews().then((value) => {satae = value});
    ApiServices().fetchnews().then((data) {
      setState(() {
        _data = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.blue,
        body: FutureBuilder(
            future: ApiServices().fetchnews(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) =>
                snapshot.hasData
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 750,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue,
                                        blurRadius: 20,
                                        spreadRadius: 1,
                                        offset: Offset(1, 1))
                                  ],
                                  gradient: LinearGradient(
                                      colors: [
                                        Color.fromRGBO(23, 187, 248, 25),
                                        Color.fromRGBO(23, 187, 248, 15),
                                        Colors.blueAccent,
                                        Colors.blue,
                                        Color.fromRGBO(23, 187, 248, 15),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                    bottomLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 70,
                                              ),
                                              const Icon(
                                                Icons.location_on_outlined,
                                                color: Colors.white,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  ApiServices.stateName,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 23,
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                            ],
                                          ),
                                        ),
                                        Image.asset("assets/1.png",
                                            height: 230),
                                        // Icon(_data[0]["weather"]["icon"]),
                                        Text(
                                          "${_data[widget.val]["temp"]}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 100,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          ApiServices.cityName,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: Text(
                                            "${_data[widget.val]["valid_date"]}",
                                            style: const TextStyle(
                                                color: Colors.white60),
                                          ),
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[0],
                                          val: _widgetList[0],
                                        ),

                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[0],
                                          val: _widgetList[0],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[1],
                                          val: _widgetList[1],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[2],
                                          val: _widgetList[2],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[3],
                                          val: _widgetList[3],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[4],
                                          val: _widgetList[4],
                                        ),

                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[5],
                                          val: _widgetList[5],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[6],
                                          val: _widgetList[6],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[7],
                                          val: _widgetList[7],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[8],
                                          val: _widgetList[8],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[9],
                                          val: _widgetList[9],
                                        ),

                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[10],
                                          val: _widgetList[10],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[11],
                                          val: _widgetList[11],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[12],
                                          val: _widgetList[12],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[13],
                                          val: _widgetList[13],
                                        ),

                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[14],
                                          val: _widgetList[14],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[15],
                                          val: _widgetList[15],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[16],
                                          val: _widgetList[16],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[17],
                                          val: _widgetList[17],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[18],
                                          val: _widgetList[18],
                                        ),

                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[19],
                                          val: _widgetList[19],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[20],
                                          val: _widgetList[20],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[21],
                                          val: _widgetList[21],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[22],
                                          val: _widgetList[22],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[23],
                                          val: _widgetList[23],
                                        ),

                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[24],
                                          val: _widgetList[24],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[25],
                                          val: _widgetList[25],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[26],
                                          val: _widgetList[26],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[27],
                                          val: _widgetList[27],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[28],
                                          val: _widgetList[28],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[29],
                                          val: _widgetList[29],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[30],
                                          val: _widgetList[30],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[31],
                                          val: _widgetList[31],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[32],
                                          val: _widgetList[32],
                                        ),

                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[33],
                                          val: _widgetList[33],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[34],
                                          val: _widgetList[34],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[35],
                                          val: _widgetList[35],
                                        ),
                                        MoreDetails(
                                          ind: widget.val,
                                          keyd: _widgetList[36],
                                          val: _widgetList[36],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ])
                    : const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )));
  }
}
