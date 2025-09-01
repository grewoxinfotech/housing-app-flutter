// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:housing_flutter_app/app/constants/color_res.dart';
// import 'package:housing_flutter_app/app/constants/img_res.dart';
// import 'package:housing_flutter_app/app/constants/size_manager.dart';
// import 'package:housing_flutter_app/data/network/property/models/property_model.dart';
// import 'package:housing_flutter_app/modules/property/controllers/property_controller.dart';
// import 'package:housing_flutter_app/modules/property/views/property_detail_screen.dart';
// import 'package:housing_flutter_app/modules/property/views/widgets/property_list_screen_card.dart';
// import 'package:housing_flutter_app/widgets/button/crm_button.dart';
// import 'package:housing_flutter_app/widgets/display/crm_card.dart';
//
// import '../../../app/widgets/search_bar/custom_search_bar.dart';
//
// class PropertyListScreen extends StatelessWidget {
//
//   PropertyListScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Get.lazyPut(() => PropertyController());
//     final controller = Get.find<PropertyController>();
//     return Scaffold(
//       appBar: const PreferredSize(
//         preferredSize: Size.fromHeight(120),
//         child: CustomSearchAppBar(),
//       ),
//       body: FutureBuilder(
//         future: controller.loadInitial(),
//         builder: (context, asyncSnapshot) {
//           print('asyncSnapshot: ${asyncSnapshot.connectionState}');
//
//           if (asyncSnapshot.connectionState == ConnectionState.waiting) {
//             // Show loader while waiting
//             return Center(child: CircularProgressIndicator());
//           } else if (asyncSnapshot.hasError) {
//             // Show error message if future fails
//             return Center(
//               child: Text(
//                 'Error: ${asyncSnapshot.error}',
//                 style: TextStyle(color: Colors.red),
//               ),
//             );
//           }  else if (asyncSnapshot.connectionState == ConnectionState.done) {
//             return Obx(() {
//               if (!controller.isLoading.value && controller.items.isEmpty) {
//                 return const Center(child: Text("No Property found."));
//               }
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                 child: NotificationListener<ScrollNotification>(
//                   onNotification: (scrollEnd) {
//                     final metrics = scrollEnd.metrics;
//                     if (metrics.atEdge && metrics.pixels != 0) {
//                       controller.loadMore();
//                     }
//                     return false;
//                   },
//                   child: RefreshIndicator(
//                     onRefresh: controller.refreshList,
//                     child: ListView.builder(
//                       itemCount: controller.items.length,
//                       itemBuilder: (context, index) {
//                         final data = controller.items.value[index];
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 8.0),
//                           child: PropertyListScreenCard(items: data,),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               );
//             });
//           }else{
//             return Center(child: Text('No Property Available'));
//           }
//         },
//
//       ),
//
//     );
//
//   }
// }
//
//
//
//

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/app/constants/img_res.dart';
import 'package:housing_flutter_app/app/constants/size_manager.dart';
import 'package:housing_flutter_app/data/network/property/models/property_model.dart';
import 'package:housing_flutter_app/modules/property/controllers/property_controller.dart';
import 'package:housing_flutter_app/modules/property/views/property_detail_screen.dart';
import 'package:housing_flutter_app/modules/property/views/widgets/property_list_screen_card.dart';
import 'package:housing_flutter_app/widgets/button/button.dart';
import 'package:housing_flutter_app/widgets/display/card.dart';

import '../../../app/widgets/search_bar/custom_search_bar.dart';

class PropertyListScreen extends StatelessWidget {
  PropertyListScreen({super.key});

  final PropertyController controller = Get.put(PropertyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: CustomSearchAppBar(),
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.items.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!controller.isLoading.value && controller.items.isEmpty) {
          return const Center(child: Text("No Property found."));
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: NotificationListener<ScrollNotification>(
            onNotification: (scrollEnd) {
              final metrics = scrollEnd.metrics;
              if (metrics.atEdge && metrics.pixels != 0) {
                controller.loadMore();
              }
              return false;
            },
            child: RefreshIndicator(
              onRefresh: controller.refreshList,
              child: ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  final data = controller.items[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: PropertyListScreenCard(items: data),
                  );
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
