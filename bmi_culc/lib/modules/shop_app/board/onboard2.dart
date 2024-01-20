import 'package:bmi_culc/networks/local/cache_helper.dart';
import 'package:bmi_culc/shared/components/componants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import 'package:js/js.dart';

import '../Login/shop_login.dart';

class BoardingModel {
  final String images;
  final String title;
  final String body;

  BoardingModel({
    required this.images,
    required this.title,
    required this.body,
  });
}

class onboard2 extends StatefulWidget {
  const onboard2({super.key});

  @override
  State<onboard2> createState() => _onboard2State();
}

class _onboard2State extends State<onboard2> {
  var pageController = PageController();
  List<BoardingModel> boarding = [
    BoardingModel(
        images: 'assets/images/onboard.png',
        title: "WearNsta shop ",
        body: "The world's first clothing store "),
    BoardingModel(
        images: 'assets/images/onboard1.png',
        title: "Labor market ",
        body:
            "Enter with us within the work team to help buyers select the best goods "),
    BoardingModel(
        images: 'assets/images/onboard2.png',
        title: " Online Shopping",
        body: "Our store provides the best products at the cheapest prices ")
  ];
  bool inlast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index) {
                  {
                    if (index == boarding.length - 1) {
                      setState(() {
                        inlast = true;
                      });
                    } else {
                      setState(() {
                        inlast = false;
                      });
                    }
                  }
                },
                controller: pageController,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    WidgetBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5,
                      activeDotColor: Colors.blueGrey),
                ),
                Spacer(),
                FloatingActionButton(
                    onPressed: () {
                      if (inlast) {
                        submit();
                      } else {
                        pageController.nextPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: Icon(
                      color: Colors.grey,
                      Icons.skip_next,
                    ))
              ],
            )
          ],
        ),
      ),
    );
    ;
  }

  void submit() {
    CacheHelper.savedata(key: 'onboard2', value: true).then((value) {
      if (value) {
        if (inlast) {
          navigateandfinish(context, shoplogin2());
        }
      }
    });
  }

  WidgetBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image(image: AssetImage('${model.images}'))),
          SizedBox(
            height: 20,
          ),
          Text(
            '${model.title}',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              fontSize: 14,
            ),
          )
        ],
      );
}
