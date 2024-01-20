import 'package:bmi_culc/layouts/shop_app/cubit/cubit.dart';
import 'package:bmi_culc/layouts/shop_app/cubit/states.dart';
import 'package:bmi_culc/models/shop_app/Categoreis/Categoreis_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopCate extends StatelessWidget {
  const ShopCate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
            itemBuilder: (context, index) => buildcatitem(
                ShopCubit.get(context).categoriesModel!.data!.data![index]),
            separatorBuilder: (context, index) => Divider(
                  thickness: 10,
                ),
            itemCount:
                ShopCubit.get(context).categoriesModel!.data!.data!.length);
      },
    );
  }

  Widget buildcatitem(DataModel dataModel) => Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Image(
              image: NetworkImage(dataModel.image),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              dataModel.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.forward_outlined))
          ],
        ),
      );
}
