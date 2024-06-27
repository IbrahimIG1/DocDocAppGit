import 'package:doc_doc_app/core/theming/colors.dart';
import 'package:doc_doc_app/features/home/data/models/specializations_response_model.dart';
import 'package:doc_doc_app/features/home/logic/home_cubit.dart';
import 'package:doc_doc_app/features/home/ui/widgets/specialization/speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityListView extends StatefulWidget {
  final List<SpecializationsData?> specializationDatalist;
  const SpecialityListView({super.key, required this.specializationDatalist});

  @override
  State<SpecialityListView> createState() => _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> animation;
  late Color color = ColorsManager.greyDark;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    animation =
        ColorTween(begin: ColorsManager.greyDark, end: ColorsManager.mainBlue)
            .animate(controller);
    animation.addListener(() {
      setState(() {
        color = animation.value!;
      });
    });
    if (controller.isCompleted) {
      controller.dispose();
    }
    controller.forward();
  }

  int selectedSpecializationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationDatalist.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (index != selectedSpecializationIndex) {
                  controller.reset();
                  controller.forward();

                  if (controller.isCompleted) {
                    controller.dispose();
                  }
                }

                selectedSpecializationIndex = index;
              });
              context.read<HomeCubit>().getDoctorsList(
                  specializationId: widget.specializationDatalist[index]?.id);
            },
            child: SpecializationItem(
              color: color,
              selectedItem: selectedSpecializationIndex,
              index: index,
              specializationDatalist: widget.specializationDatalist[index],
            ),
          );
        },
      ),
    );
  }
}
