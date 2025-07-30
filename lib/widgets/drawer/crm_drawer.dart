//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../app/constants/ic_res.dart';
// import '../../app/constants/size_manager.dart';
// import '../../modules/auth/controllers/auth_controller.dart';
// import '../display/crm_card.dart';
// import '../display/crm_ic.dart';
//
// class CrmDrawer extends StatelessWidget {
//   const CrmDrawer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     Get.lazyPut<DrawerController>(() => DrawerController());
//     DrawerController drawerController = Get.find();
//
//     final DrawerController drawerController = Get.put(DrawerController());
//
//     List<DrawerModel> items = [
//       DrawerModel(title: "DashBoard", iconPath: ICRes.customer),
//       DrawerModel(title: "Project", iconPath: ICRes.project),
//       DrawerModel(title: "Calendar", iconPath: ICRes.calendar),
//       DrawerModel(title: "Vacations", iconPath: ICRes.project),
//       DrawerModel(title: "Employees", iconPath: ICRes.employees),
//       DrawerModel(title: "Messenger", iconPath: ICRes.notifications),
//       DrawerModel(title: "Info Portal", iconPath: ICRes.file),
//
//     ];
//
//     Widget divider = Divider(
//       height: 0,
//       color: Get.theme.dividerColor,
//       endIndent: 10,
//       indent: 10,
//     );
//
//     return SafeArea(
//       child: CrmCard(
//         width: Get.width * 0.6,
//         margin: const EdgeInsets.only(
//           left: AppPadding.small,
//           bottom: AppPadding.small,
//         ),
//         borderRadius: BorderRadius.circular(AppRadius.large),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ListView.separated(
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: items.length,
//               padding: EdgeInsets.all(AppPadding.small),
//               shrinkWrap: true,
//               itemBuilder: (context, i) {
//                 return Obx(
//                       () => GestureDetector(
//                     onTap: () => drawerController.onchange(i),
//                     child: CrmCard(
//                       padding: const EdgeInsets.all(AppPadding.small),
//                       boxShadow: [],
//                       borderRadius: BorderRadius.circular(
//                         AppRadius.large - AppPadding.small,
//                       ),
//                       color:
//                       (drawerController.selextedIndex == i)
//                           ? Get.theme.colorScheme.primary.withAlpha(20)
//                           : null,
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           CrmIc(
//                             iconPath: items[i].iconPath.toString(),
//                             width: 24,
//                             color:
//                             (drawerController.selextedIndex == i)
//                                 ? Get.theme.colorScheme.primary
//                                 : Get.theme.colorScheme.onSecondary,
//                           ),
//                           AppSpacing.horizontalSmall,
//                           Text(
//                             items[i].title.toString(),
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight:
//                               (drawerController.selextedIndex == i)
//                                   ? FontWeight.w700
//                                   : FontWeight.w600,
//                               color:
//                               (drawerController.selextedIndex == i)
//                                   ? Get.theme.colorScheme.primary
//                                   : Get.theme.colorScheme.onSecondary,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//               separatorBuilder: (context, i) => AppSpacing.verticalSmall,
//             ),
//             AppSpacing.verticalSmall,
//             Align(
//               alignment: Alignment.center,
//               child: FloatingActionButton.extended(
//                 label: Text(
//                   "Support",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.white,
//                   ),
//                 ),
//                 icon: CrmIc(iconPath: ICRes.notifications, color: Colors.white),
//                 onPressed: () {},
//               ),
//             ),
//             Spacer(),
//             Padding(
//               padding: EdgeInsets.all(AppPadding.medium),
//               child: GestureDetector(
//                 onTap: () => Get.put(AuthController()).logout(),
//                 child: Row(
//                   children: [
//                     CrmIc(
//                       iconPath: ICRes.logout,
//                       color: Get.theme.colorScheme.onSecondary,
//                     ),
//                     AppSpacing.horizontalSmall,
//                     Text(
//                       "Logout",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w700,
//                         color: Get.theme.colorScheme.onSecondary,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class DrawerController extends GetxController {
//   RxInt selextedIndex = 0.obs;
//
//   onchange(int index) => selextedIndex(index);
// }
//
// class DrawerModel {
//   String? title;
//   String? iconPath;
//   Widget? widget;
//
//   DrawerModel({this.title, this.iconPath, this.widget});
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/constants/ic_res.dart';
import '../../app/constants/size_manager.dart';
import '../../modules/auth/controllers/auth_controller.dart';
import '../display/crm_card.dart';
import '../display/crm_ic.dart';

class CrmDrawer extends StatelessWidget {
  CrmDrawer({Key? key}) : super(key: key);

  // Initialize DrawerController once here, outside build
  final DrawerController drawerController = Get.put(DrawerController());

  final List<DrawerModel> items = [
    DrawerModel(title: "DashBoard", iconPath: ICRes.customer),
    DrawerModel(title: "Project", iconPath: ICRes.project),
    DrawerModel(title: "Calendar", iconPath: ICRes.calendar),
    DrawerModel(title: "Vacations", iconPath: ICRes.project),
    DrawerModel(title: "Employees", iconPath: ICRes.employees),
    DrawerModel(title: "Messenger", iconPath: ICRes.notifications),
    DrawerModel(title: "Info Portal", iconPath: ICRes.file),
  ];

  @override
  Widget build(BuildContext context) {
    Widget divider = Divider(
      height: 0,
      color: Get.theme.dividerColor,
      endIndent: 10,
      indent: 10,
    );

    return SafeArea(
      child: CrmCard(
        width: Get.width * 0.6,
        margin: const EdgeInsets.only(
          left: AppPadding.small,
          bottom: AppPadding.small,
        ),
        borderRadius: BorderRadius.circular(AppRadius.large),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              padding: const EdgeInsets.all(AppPadding.small),
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Obx(() {
                  final isSelected = drawerController.selectedIndex.value == i;
                  return GestureDetector(
                    onTap: () => drawerController.onChange(i),
                    child: CrmCard(
                      padding: const EdgeInsets.all(AppPadding.small),
                      boxShadow: const [],
                      borderRadius: BorderRadius.circular(
                        AppRadius.large - AppPadding.small,
                      ),
                      color: isSelected
                          ? Get.theme.colorScheme.primary.withAlpha(20)
                          : null,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CrmIc(
                            iconPath: items[i].iconPath!,
                            width: 24,
                            color: isSelected
                                ? Get.theme.colorScheme.primary
                                : Get.theme.colorScheme.onSecondary,
                          ),
                          AppSpacing.horizontalSmall,
                          Text(
                            items[i].title!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight:
                              isSelected ? FontWeight.w700 : FontWeight.w600,
                              color: isSelected
                                  ? Get.theme.colorScheme.primary
                                  : Get.theme.colorScheme.onSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              },
              separatorBuilder: (context, i) => AppSpacing.verticalSmall,
            ),
            AppSpacing.verticalSmall,
            Align(
              alignment: Alignment.center,
              child: FloatingActionButton.extended(
                label: const Text(
                  "Support",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                icon: const CrmIc(iconPath: ICRes.notifications, color: Colors.white),
                onPressed: () {
                  // TODO: Support action
                },
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(AppPadding.medium),
              child: GestureDetector(
                onTap: () => Get.put(AuthController()).logout(),
                child: Row(
                  children: [
                    CrmIc(
                      iconPath: ICRes.logout,
                      color: Get.theme.colorScheme.onSecondary,
                    ),
                    AppSpacing.horizontalSmall,
                    Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Get.theme.colorScheme.onSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void onChange(int index) => selectedIndex.value = index;
}

class DrawerModel {
  final String title;
  final String iconPath;
  final Widget? widget;

  DrawerModel({
    required this.title,
    required this.iconPath,
    this.widget,
  });
}

