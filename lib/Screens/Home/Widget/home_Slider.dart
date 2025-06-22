
import 'package:app_project/Data/Controller/Home_controller.dart';
import 'package:app_project/Utils/device/helper_function.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../Data/Controller/banner_controller.dart';
import '../../../common/widget/Shimmer/sshimmer.dart';
import '../../../common/widget/custom_shapes/container/circular_container.dart';
import '../Home_Screen.dart';


class sHomeSlider extends StatelessWidget {
  const sHomeSlider({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final dark = sHelperFunction.isDarkMode(context);
    final controller = Get.put(BannerController());
            return Obx(
                (){
                  //  loader
                  if(controller.isLoading.value) return ShimmerEft(width: double.infinity, height: 190);

                  // no data Found
                  if (controller.banners.isEmpty) {
                    return Center(child: Text('No Data Found!'));
                  } else {
                    return Column(
                      children: [
                        CarouselSlider(
                            options: CarouselOptions(
                                viewportFraction: 1,
                                onPageChanged: (index, _) => controller.updatePageIndicator(index)
                            ),
                            items: controller.banners.map((banner) => sRoundedImage(
                              imageUrl: banner.imageUrl,
                              isNetworkImage: true,
                              onPressed: () => Get.toNamed(banner.targetScreen),
                            )).toList()
                        ),
                        const SizedBox(height: 32.0,),
                        Center(
                          child: Obx(
                                () => Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                for(int i = 0; i < controller.banners.length; i++)
                                  TCircularContainer(
                                    width: 20,
                                    height: 4,
                                    margin: EdgeInsets.only(right: 10),
                                    backgroundColor: controller.carousalCurrentIndex.value == i
                                        ? Colors.red : Colors.grey,
                                  ),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }
                }
            );
          }
  }

