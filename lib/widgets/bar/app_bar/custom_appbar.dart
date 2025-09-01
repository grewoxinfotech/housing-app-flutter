import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:housing_flutter_app/modules/profile/views/profile_screen.dart';

import '../../../app/constants/color_res.dart';
import '../../../app/constants/font_res.dart';
import '../../../app/constants/ic_res.dart';
import '../../../app/constants/size_manager.dart';
import '../../display/ic.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? title;
  final Widget? leading;
  final List<Widget>? action;

  const CustomAppBar({super.key, this.title, this.leading, this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.surface,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(AppRadius.extraLarge),
          bottomRight: Radius.circular(AppRadius.extraLarge),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorRes.primary.withAlpha(40),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.medium),
      child: Column(
        children: [
          SizedBox(height: 12),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_on_rounded,color: ColorRes.primary,),

                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        "Surat ", // Replace with your dynamic string
                        style: TextStyle(
                          fontSize: 18,
                          color: ColorRes.textPrimary,
                          fontWeight: FontWeight.normal,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 4), // Small gap between text and icon
                    Icon(Icons.keyboard_arrow_down_rounded),
                  ],
                ),
              ),

              // leading ?? const NesticoPeAppLogo(),
              if (title != null) ...[
                const SizedBox(width: 16),
                Expanded(child: title!),
              ] else
                const Spacer(),
              ...?action ??
                  [
                    NesticoPeIc(
                      iconPath: ICRes.search,
                      color: Get.theme.colorScheme.onPrimary,
                    ),
                    AppSpacing.horizontalMedium,
                    NesticoPeIc(
                      iconPath: ICRes.notifications,
                      color: Get.theme.colorScheme.onPrimary,
                    ),
                    AppSpacing.horizontalMedium,
                    GestureDetector(
                      onTap: () => Get.to(() => const ProfileScreen()),
                      child: const CircleAvatar(
                        radius: 15,
                        child: Text(
                          "G",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
            ],
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
