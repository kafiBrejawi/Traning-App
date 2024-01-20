import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            Container(
              width: double.infinity,
              child: Card(
                  elevation: 11.0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(children: [
                    Image(
                      fit: BoxFit.cover,
                      height: 230.0,
                      width: double.infinity,
                      image: (NetworkImage(
                          'https://img.freepik.com/premium-photo/pasta-penne-with-eggplant-pasta-alla-norma-traditional-italian-food_2829-20663.jpg?w=740')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 55, top: 120),
                      child: Text(
                        'HOMS ',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, top: 140),
                      child: Text(
                        'AlINSHAAT',
                        style:
                            TextStyle(color: Colors.orangeAccent, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 55, top: 180),
                      child: Text(
                        'Contact us at',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 200),
                      child: Text(
                        '0933199544-2131371',
                        style:
                            TextStyle(color: Colors.orangeAccent, fontSize: 15),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 29, top: 180),
                        child: Icon(
                          Icons.phone,
                          color: Colors.green,
                          size: 19,
                        )),
                    Padding(
                        padding: const EdgeInsets.only(left: 30, top: 120),
                        child: Icon(
                          Icons.place,
                          color: Colors.green,
                          size: 19,
                        )),
                  ])),
            ),
            ListView.separated(
              itemBuilder: (context, index) => buildpostitem(context),
              itemCount: 10,
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              physics: NeverScrollableScrollPhysics(),
            )
            // Card(
            //     clipBehavior: Clip.antiAliasWithSaveLayer,
            //     elevation: 10.0,
            //     child: Padding(
            //         padding: const EdgeInsets.all(10.0),
            //         child: Column(children: [
            //           Row(
            //             children: [
            //               CircleAvatar(
            //                 radius: 25.0,
            //                 backgroundImage: NetworkImage(
            //                     'https://img.freepik.com/free-photo/pretty-smiling-joyfully-female-with-fair-hair-dressed-casually-looking-with-satisfaction_176420-15187.jpg?w=740&t=st=1686255182~exp=1686255782~hmac=bf6c00984b2f0d7c10251f0c5050f6b5e4003191eb246ed541a2fccbcc8bd641'),
            //               ),
            //               SizedBox(
            //                 width: 15.0,
            //               ),
            //               Expanded(
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Row(
            //                       children: [
            //                         Text(
            //                           'maria',
            //                           style: TextStyle(
            //                               fontWeight: FontWeight.bold),
            //                         ),
            //                         SizedBox(
            //                           width: 5,
            //                         ),
            //                         Icon(
            //                           Icons.check_circle,
            //                           color: Colors.lightGreen,
            //                           size: 18,
            //                         )
            //                       ],
            //                     ),
            //                     SizedBox(
            //                       height: 5,
            //                     ),
            //                     Text(
            //                       'jun/2021/Mon   12:00pm',
            //                       style: TextStyle(
            //                           color: Colors.grey, fontSize: 15),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: 20,
            //               ),
            //               IconButton(
            //                   onPressed: () {}, icon: Icon(Icons.more_horiz))
            //             ],
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 15),
            //             child: Container(
            //               height: 1,
            //               color: Colors.grey[300],
            //               width: double.infinity,
            //             ),
            //           ),
            //           Text(
            //             'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Scelerisque viverra mauris in aliquam sem. Massa sapien faucibus et molestie ac feugiat sed. Arcu dictum varius duis at consectetur lorem donec.',
            //             style: TextStyle(
            //                 fontWeight: FontWeight.bold, color: Colors.black),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 10),
            //             child: Container(
            //               width: double.infinity,
            //               child: Wrap(
            //                 children: [
            //                   Container(
            //                     height: 25,
            //                     child: MaterialButton(
            //                       minWidth: 1.0,
            //                       padding: EdgeInsets.all(0),
            //                       onPressed: () {},
            //                       child: Text(
            //                         "#food",
            //                         style: TextStyle(color: Colors.blue),
            //                       ),
            //                     ),
            //                   ),
            //                   Container(
            //                     height: 25,
            //                     child: MaterialButton(
            //                       minWidth: 1.0,
            //                       padding: EdgeInsets.all(0),
            //                       onPressed: () {},
            //                       child: Text(
            //                         "#pizza",
            //                         style: TextStyle(color: Colors.blue),
            //                       ),
            //                     ),
            //                   ),
            //                   Container(
            //                     height: 25,
            //                     child: MaterialButton(
            //                       minWidth: 1.0,
            //                       padding: EdgeInsets.all(0),
            //                       onPressed: () {},
            //                       child: Text(
            //                         "#burger",
            //                         style: TextStyle(color: Colors.blue),
            //                       ),
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ),
            //           SizedBox(
            //             height: 5,
            //           ),
            //           Container(
            //             height: 140,
            //             width: double.infinity,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(5.0),
            //                 image: DecorationImage(
            //                     fit: BoxFit.cover,
            //                     image: NetworkImage(
            //                         'https://img.freepik.com/premium-photo/italian-pasta-with-mussels-tomatoes_113913-3.jpg?w=740'))),
            //           ),
            //           SizedBox(
            //             height: 7,
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.all(9),
            //             child: Row(children: [
            //               Expanded(
            //                   child: InkWell(
            //                       onTap: () {},
            //                       child: Row(children: [
            //                         Icon(
            //                           Icons.share,
            //                           size: 17,
            //                         ),
            //                         SizedBox(
            //                           width: 4,
            //                         ),
            //                         Text('120',
            //                             style: TextStyle(color: Colors.grey))
            //                       ]))),
            //               Expanded(
            //                   child: InkWell(
            //                       onTap: () {},
            //                       child: Row(children: [
            //                         Icon(
            //                           Icons.comment,
            //                           size: 17,
            //                         ),
            //                         SizedBox(
            //                           width: 4,
            //                         ),
            //                         Text(
            //                           '120',
            //                           style: TextStyle(color: Colors.grey),
            //                         )
            //                       ]))),
            //             ]),
            //           ),
            //           Row(children: [
            //             CircleAvatar(
            //               radius: 20.0,
            //               backgroundImage: NetworkImage(
            //                   'https://img.freepik.com/free-photo/pretty-smiling-joyfully-female-with-fair-hair-dressed-casually-looking-with-satisfaction_176420-15187.jpg?w=740&t=st=1686255182~exp=1686255782~hmac=bf6c00984b2f0d7c10251f0c5050f6b5e4003191eb246ed541a2fccbcc8bd641'),
            //             ),
            //             SizedBox(
            //               width: 7,
            //             ),
            //             Text('write your comment .....')
            //           ])
            //         ])))
          ]),
        ));
  }

  Widget buildpostitem(context) => Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10.0,
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/premium-photo/young-arabic-man-having-idea-inspiration-concept_1187-75113.jpg?w=740'),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Abd Alkafi Brejawi',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.check_circle,
                            color: Colors.lightGreen,
                            size: 18,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'jun/2021/Mon   10:00pm',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Container(
                height: 1,
                color: Colors.grey[300],
                width: double.infinity,
              ),
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Scelerisque viverra mauris in aliquam sem. Massa sapien faucibus et molestie ac feugiat sed. Arcu dictum varius duis at consectetur lorem donec.',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: double.infinity,
                child: Wrap(
                  children: [
                    Container(
                      height: 25,
                      child: MaterialButton(
                        minWidth: 1.0,
                        padding: EdgeInsets.all(0),
                        onPressed: () {},
                        child: Text(
                          "#food",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    Container(
                      height: 25,
                      child: MaterialButton(
                        minWidth: 1.0,
                        padding: EdgeInsets.all(0),
                        onPressed: () {},
                        child: Text(
                          "#pizza",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    Container(
                      height: 25,
                      child: MaterialButton(
                        minWidth: 1.0,
                        padding: EdgeInsets.all(0),
                        onPressed: () {},
                        child: Text(
                          "#burger",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://img.freepik.com/free-photo/penne-pasta-tomato-sauce-with-chicken-tomatoes-wooden-table_2829-19744.jpg?w=740&t=st=1686232989~exp=1686233589~hmac=851050e861068c3f92a7472d0c873cf9412f80d5ba56db0bbb77035904917fd5'))),
            ),
            SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.all(9),
              child: Row(children: [
                Expanded(
                    child: InkWell(
                        onTap: () {},
                        child: Row(children: [
                          Icon(
                            Icons.share,
                            size: 17,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text('120', style: TextStyle(color: Colors.grey))
                        ]))),
                Expanded(
                    child: InkWell(
                        onTap: () {},
                        child: Row(children: [
                          Icon(
                            Icons.comment,
                            size: 17,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            '120',
                            style: TextStyle(color: Colors.grey),
                          )
                        ]))),
              ]),
            ),
            Row(children: [
              CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(
                    'https://img.freepik.com/premium-photo/young-arabic-man-having-idea-inspiration-concept_1187-75113.jpg?w=740'),
              ),
              SizedBox(
                width: 7,
              ),
              Text('write your comment .....')
            ])
          ])));
}
