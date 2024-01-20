import 'package:bmi_culc/layouts/shop_app/cubit/cubit.dart';
import 'package:bmi_culc/layouts/shop_app/cubit/states.dart';
import 'package:bmi_culc/models/shop_app/Categoreis/Categoreis_Model.dart';
import 'package:bmi_culc/models/shop_app/home/home_model.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ShopProducts extends StatelessWidget {
  const ShopProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: ShopCubit.get(context).homeModel != null &&
                ShopCubit.get(context).categoriesModel != null,
            builder: (context) => HomeBuilder(ShopCubit.get(context).homeModel,
                ShopCubit.get(context).categoriesModel, context),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        });
  }

  Widget HomeBuilder(HomeModel? hommodel, CategoriesModel? catmodel, context) =>
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CarouselSlider(
                items: hommodel!.data!.banners
                    ?.map((e) => Image(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcFuJ2j2v_GHRLNmABAP2hUZUdBZQ3YxdZGA&usqp=CAU'),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 250.0,
                  initialPage: 0,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                )),
            SizedBox(
              height: 15.0,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "CATEGORIES",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 100,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                bulidcategories(catmodel.data!.data![index]),
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 10,
                                ),
                            itemCount: catmodel!.data!.data!.length),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "New PRODUCTS",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ])),
            SizedBox(
              height: 10.0,
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1 / 1.57,
                children: List.generate(
                    hommodel.data!.products!.length,
                    (index) =>
                        bulidproduct(hommodel.data!.products![index], context)),
              ),
            )
          ],
        ),
      );
  Widget bulidcategories(DataModel dataModel) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image(
            image: NetworkImage(dataModel.image),
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            width: 100,
            child: Text(
              dataModel.name,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          )
        ],
      );
  Widget bulidproduct(Products productsmodel, context) => Container(
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(alignment: Alignment.bottomLeft, children: [
          Image(
            image: NetworkImage(productsmodel.image),
            width: double.infinity,
            height: 180,
          ),
          if (productsmodel.discount != 0)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              color: Colors.red,
              child: Text('sale'),
            )
        ]),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              productsmodel.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(height: 1.2),
            ),
            Row(
              children: [
                Text(
                  ' ${productsmodel.price}',
                  style: TextStyle(color: Colors.orange),
                ),
                SizedBox(
                  width: 20,
                ),
                if (productsmodel.discount != 0)
                  Text(
                    ' ${productsmodel.oldPrice}',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough),
                  ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      print(productsmodel.id);
                      ShopCubit.get(context).changefavorites(productsmodel.id);
                    },
                    icon: CircleAvatar(
                      backgroundColor:
                          ShopCubit.get(context).favorites[productsmodel.id]
                              ? Colors.blue
                              : Colors.grey,
                      radius: 15.0,
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 14.0,
                      ),
                    ))
              ],
            ),
          ]),
        )
      ]));
}
