import 'package:flutter/material.dart';
import 'package:shoesly/core/presentation/resources/custom_text_style.dart';
import 'package:shoesly/core/presentation/resources/theme_helpers.dart';
import 'package:shoesly/core/presentation/widgets/custom_image_view.dart';
import 'package:shoesly/core/presentation/widgets/custom_outline_button.dart';
import 'package:shoesly/core/presentation/widgets/custom_rating_bar.dart';
import 'package:shoesly/core/utils/size_utils.dart';
import 'package:shoesly/features/productReview/data/models/review_model.dart';

class ReviewWidget extends StatelessWidget {
  final List<ReviewModel> reviewitems;
  ReviewWidget({super.key, required this.reviewitems});

  @override
  Widget build(BuildContext context) {
    return _buildReviewList(reviewitems);
  }

  Widget _buildReviewList(List<ReviewModel> reviewListinfo) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: ListView.builder(
                itemCount: reviewListinfo.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = reviewListinfo[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: item.imagePath,
                            height: 40.adaptSize,
                            width: 40.adaptSize,
                            radius: BorderRadius.circular(20.h),
                            margin: EdgeInsets.only(bottom: 57.v),
                          ),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.only(left: 15.h, top: 3.v),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildReviewInfo(
                                    todayText: item.time!,
                                    userName: item.userName!),
                                SizedBox(
                                  height: 12.v,
                                ),
                                CustomRatingBar(
                                  initialRating: item.rating,
                                  color: Color(0xFFFCD240),
                                ),
                                Container(
                                  width: 247.h,
                                  margin: EdgeInsets.only(right: 11.h),
                                  child: Text(
                                    item.message!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodySmall!
                                        .copyWith(height: 1.83),
                                  ),
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 27.v,
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewInfo(
      {required String userName, required String todayText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          userName,
          style: CustomTextStyles.titleSmallBlack90001.copyWith(
            color: appTheme.black90001,
          ),
        ),
        Text(
          todayText,
          style: CustomTextStyles.bodySmallGray400.copyWith(
            color: appTheme.gray400,
          ),
        ),
      ],
    );
  }
}
