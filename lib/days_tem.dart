import 'package:flutter/material.dart';
import 'api_services.dart';
import 'constants.dart';
import 'day_list.dart';
import 'home_page.dart';
import "package:get/get.dart";

class Days_temp extends StatefulWidget {
  const Days_temp({super.key});

  @override
  State<Days_temp> createState() => _Days_tempState();
}

class _Days_tempState extends State<Days_temp> {
  List<dynamic> _data = [];
  int val = 0;
  final TextEditingController latControler = TextEditingController();

  TextEditingController langControler = TextEditingController();
  ApiServices lanlat = Get.put(ApiServices());

  @override
  void initState() {
    super.initState();
    ApiServices().fetchnews().then((data) {
      setState(() {
        _data = data;
        // print(_data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.blue,
      body: FutureBuilder(
        future: ApiServices().fetchnews(),
        builder: (context, snapshot) => snapshot.hasData
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 600,
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
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomePage(
                                            val: val,
                                          ),
                                        ));
                                  },
                                  child: const Text(
                                    "MORE",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 60,
                                ),
                                const Icon(
                                  Icons.calendar_month_rounded,
                                  color: Colors.white,
                                ),
                                const Text(
                                  "16 days",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.more_vert_rounded,
                                      color: Colors.white,
                                      size: 30,
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 45.0),
                            child: Text(
                              "${_data[val]["datetime"]}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          TextField(
                              clipBehavior: Clip.hardEdge,
                              controller: latControler),
                          TextField(controller: langControler),
                          TextButton(
                            onPressed: () {
                              lanlat.lat.value = latControler.text;

                              lanlat.long.value = langControler.text;

                              // Constants.lant = latControler.text;
                              // print(Constants.lant);
                              // Constants.long = langControler.text;
                                // print(Constants.long);
                            },
                            child: const Text("submit"),
                          ),
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset("assets/1.png", height: 150),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 10),
                                child: Text(
                                  "${_data[val]["temp"]}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 65,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Text(
                                "%",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white60,
                                    fontSize: 30),
                              )
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 40.0, bottom: 10),
                            child: Text(
                              "${(_data[val]["weather"]["description"])}",
                              style: const TextStyle(color: Colors.white60),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.swipe,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    Text(
                                      "${_data[val]["wind_gust_spd"]}km/h",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    const Text(
                                      "Wind Speed",
                                      style: TextStyle(color: Colors.white60),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.swipe,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    Text(
                                      "${_data[val]["high_temp"]}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    const Text(
                                      "High Temp",
                                      style: TextStyle(color: Colors.white60),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.swipe,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    Text(
                                      "${_data[val]["low_temp"]}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    const Text(
                                      "Lower Temp",
                                      style: TextStyle(color: Colors.white60),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // list_days(day: "${_data[0]}", weather: weather, temp: temp)
                  Expanded(
                    child: ListView.builder(
                        itemCount: _data.length,
                        itemBuilder: (context, index) {
                          return list_days(
                            day: "${_data[index]["datetime"]}",
                            weather:
                                "${(_data[index]["weather"]["description"])}",
                            temp: "${_data[index]["temp"]}",
                            callback: () {
                              setState(() {
                                val = index;
                              });
                            },
                            icondata: "${(_data[index]["weather"]["icon"])}",
                            // icondata: '',
                          );
                        }),
                  )
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
