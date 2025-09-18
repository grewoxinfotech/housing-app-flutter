import 'package:flutter/material.dart';

import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/modules/property_rating/view/widget/rating_star.dart';
import 'package:housing_flutter_app/modules/property_rating/view/widget/read_more_or_less.dart';
import 'package:housing_flutter_app/modules/search_property/view/search_screen.dart';

class FeedbackCard extends StatelessWidget {
  final String userName;
  final String feedback;
  final double rating;
  final String date;
  final String profileUrl;

  const FeedbackCard({
    super.key,
    required this.userName,
    required this.feedback,
    required this.rating,
    required this.date,
    required this.profileUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        // margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row -> Profile + User Info + Date
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Image
                CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(profileUrl),
                ),
                const SizedBox(width: 12),

                // Username + Date
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          buildCommonText(
                            userName,
                            14,
                            FontWeight.w600,
                            ColorRes.textPrimary,
                            1,
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.verified,
                            color: ColorRes.primary,
                            size: 15,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.more_vert_outlined,
                            color: ColorRes.textPrimary,
                            size: 20,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          RatingStars(
                            value: rating,
                            fillColor: ColorRes.primary,
                            size: 14,
                          ),

                          const SizedBox(width: 5),

                          buildCommonText(
                            date,
                            10,
                            FontWeight.w400,
                            Colors.grey,
                            1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Rating (Stars)
            const SizedBox(height: 8),

            ReadMoreClass(
              description: feedback,
              size: 11,
              trimLines: 3,
              colorClickableText: ColorRes.primary,
            ),
          ],
        ),
      ),
    );
  }
}
