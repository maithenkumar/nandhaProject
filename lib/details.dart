import 'package:flutter/material.dart';

import 'api_services.dart';

class MoreDetails extends StatefulWidget {
  const MoreDetails(
      {super.key, required this.keyd, required this.ind, required this.val});
  final String keyd;
  final String val;

  final int ind;
  @override
  State<MoreDetails> createState() => _MoreDetailsState();
}

class _MoreDetailsState extends State<MoreDetails> {
  List<dynamic> _data = [];
  var wetherData;

  var api;
  @override
  void initState() {
    super.initState();
    ApiServices().fetchnews().then((data) {
      setState(() {
        _data = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiServices().fetchnews(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) =>
            snapshot.hasData
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.keyd,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          const Text(
                            " :  ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                            ),
                          ),
                          // SizedBox(
                          //   width: 40,
                          // ),
                          Text(
                            "${_data[widget.ind][widget.val]}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : const Center(child: CircularProgressIndicator()));
  }
}
