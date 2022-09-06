import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_pro_mina/app/resources/styles_manger.dart';
import 'package:todo_app_pro_mina/app/cubit/app_cubit.dart';
import 'package:todo_app_pro_mina/app/cubit/app_states.dart';
import 'package:todo_app_pro_mina/presentation/components/my_text.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(builder: (context, state) {
      AppCubit appCubit = AppCubit.get(context);
      return SizedBox(
        height: 45.h,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: appCubit.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 2, color: Colors.blue),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  backgroundColor: appCubit.categories[index] ==
                          appCubit.freezedAddATask.category
                      ? Colors.blue
                      : null),
              onPressed: () {
                appCubit.changeDescription(appCubit.categories[index]);
              },
              child: MyText(
                title: appCubit.categories[index],
                style: appCubit.categories[index] ==
                        appCubit.freezedAddATask.category
                    ? getMediumStyle(
                        color: appCubit.categories[index] ==
                                appCubit.freezedAddATask.category
                            ? Colors.white
                            : Colors.blue.shade300)
                    : getRegularStyle(
                        color: appCubit.categories[index] ==
                                appCubit.freezedAddATask.category
                            ? Colors.white
                            : Colors.blue.shade300),
              )),
          separatorBuilder: (context, index) => const SizedBox(width: 15),
        ),
      );
    });
  }
}
