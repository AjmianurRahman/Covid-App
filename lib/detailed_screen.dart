import 'dart:js_interop';

import 'package:covid_app/world_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailedScreen extends StatefulWidget {
  String name, image;
  int totalCases,
      totalDeaths,
      totalRecovered,
      critical,
      todayRecovered;

  DetailedScreen(
      {super.key,
      required this.name,
      required this.image,
      required this.totalCases,
      required this.totalDeaths,
      required this.totalRecovered,
      required this.critical,
      required this.todayRecovered});

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [



            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.067),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(children: [
                            ReusableRow(title: "Cases", value: widget.totalCases.toString()),
                            ReusableRow(title: "Recovered", value: widget.totalRecovered.toString()),
                            ReusableRow(title: "Death", value: widget.totalDeaths.toString()),
                            ReusableRow(title: "Critical", value: widget.critical.toString()),
                            ReusableRow(title: "Todays Recovered", value: widget.todayRecovered.toString()),

                          ],),
                        )
                        ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.image),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
