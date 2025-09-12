import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/modules/property/controllers/property_controller.dart';
import 'package:housing_flutter_app/modules/property/views/widgets/recommeded_property_card.dart';

class RecommendedPropertyList extends StatelessWidget {
  final PropertyController controller;
  RecommendedPropertyList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.items.isEmpty) {
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
          child: SizedBox(
            height: 260,
            child: Obx(() {
              final items = controller.items;
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  print("List  ${controller.items.length}");
                  if (index >= items.length) {
                    return const SizedBox.shrink();
                  }
                  final data = items[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),

                    child: MediaQuery(
                      data: MediaQuery.of(
                        context,
                      ).copyWith(textScaler: const TextScaler.linear(1.0)),
                      child: RecommededPropertyCard(property: data),
                    ),
                  );
                },
              );
            }),
          ),
        ),
      );
    });
  }
}
