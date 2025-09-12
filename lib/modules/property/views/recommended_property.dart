import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/app/widgets/texts/headline_text.dart';
import 'package:housing_flutter_app/modules/property/controllers/property_controller.dart';
import 'package:housing_flutter_app/modules/property/views/widgets/property_card.dart';
import 'package:housing_flutter_app/modules/property/views/widgets/recommended_card.dart';

class RecommendedProperty extends StatelessWidget {
  const RecommendedProperty({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PropertyController());
    final PropertyController controller = Get.find();

    return Column(
      children: [
        Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.items.isEmpty) {
            return const Center(child: Text("No Property found."));
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              height: 260,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.items.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final data = controller.items[index];
                  return RecommendedCard(property: data);
                },
              ),
            ),
          );
        }),
      ],
    );
  }
}
