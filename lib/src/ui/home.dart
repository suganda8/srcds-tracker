/*
MIT License

Copyright (c) 2023 Tegar Bangun Suganda (OVERMIND)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import 'package:flutter/material.dart';
import 'package:srcds_tracker/src/utils/colors_utility.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.scrollController}) : super(key: key);

  final ScrollController? scrollController;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: ListView.builder(
          controller: widget.scrollController,
          itemBuilder: (context, index) {
            // return ListTile(
            //   isThreeLine: true,
            //   splashColor: Colors.amber,
            //   leading: CircleAvatar(
            //     backgroundColor: Colors.deepPurple,
            //     child: Text("A", style: TextStyle(color: Colors.white)),
            //   ),
            //   title: Text("MEP Playground"),
            //   subtitle: Text("Left 4 Dead 2"),
            //   trailing: Icon(
            //     Icons.arrow_forward_ios,
            //     size: 16.0,
            //   ),
            //   onTap: () {},
            // );

            return Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 10.0),
              child: Container(
                  height: 180,
                  // color: Colors.blue,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        height: 140,
                        child: Stack(
                          children: [
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              // color: Colors.transparent,
                              elevation: 2.0,
                              shadowColor: Colors.white24,
                              shape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                              child: Container(),
                            )
                            // Container(
                            //   color: Theme.of(context).cardColor,
                            // ),
                            // Container(
                            //   color: ColorsUtility.mainDark.withOpacity(0.25),
                            // ),
                            // Image.asset(
                            //   'assets/images/figma/card_1.png',
                            //   fit: BoxFit.cover,
                            //   gaplessPlayback: true,
                            // ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 12.0, 16.0),
                        child: Container(
                          width: 120,
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                            color: Colors.green,
                            child: Container(),
                            // child: Container(
                            //   color: Colors.green,
                            // ),
                          ),
                        ),
                      ),
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
}
