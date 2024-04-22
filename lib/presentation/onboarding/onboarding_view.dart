import 'package:clean_arc_project/presentation/resources/assets_manger.dart';
import 'package:clean_arc_project/presentation/resources/color_manger.dart';
import 'package:clean_arc_project/presentation/resources/constants_manger.dart';
import 'package:clean_arc_project/presentation/resources/strings_manger.dart';
import 'package:clean_arc_project/presentation/resources/values_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/routes_manger.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _list = _getSliderData();
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  List<SliderObject> _getSliderData() => [
        SliderObject(
          AppStrings.onBoardingTitle1,
          AppStrings.onBoardingSubTitle1,
          ImageAssets.onboardingLogo1,
        ),
        SliderObject(
          AppStrings.onBoardingTitle2,
          AppStrings.onBoardingSubTitle2,
          ImageAssets.onboardingLogo2,
        ),
        SliderObject(
          AppStrings.onBoardingTitle3,
          AppStrings.onBoardingSubTitle3,
          ImageAssets.onboardingLogo3,
        ),
        SliderObject(
          AppStrings.onBoardingTitle4,
          AppStrings.onBoardingSubTitle4,
          ImageAssets.onboardingLogo4,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.white,
      appBar: AppBar(
        backgroundColor: ColorManger.white,
        elevation: AppSize.size0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManger.white,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        itemBuilder: (context, index) => OnBoardingPage(
          sliderObject: _list[index],
        ),
      ),
      bottomSheet: Container(
        color: ColorManger.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    Routes.loginRoute,
                  );
                },
                child: Text(
                  AppStrings.skip,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            _getBottomSheet(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheet() {
    return Container(
      color: ColorManger.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                _getPreviousIndex(),
                duration: const Duration(
                  milliseconds: AppConstants.sliderAnimationTime,
                ),
                curve: Curves.bounceInOut,
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(
                AppPadding.padding14,
              ),
              child: SizedBox(
                width: AppSize.size20,
                height: AppSize.size20,
                child: SvgPicture.asset(
                  ImageAssets.leftArrowIcon,
                ),
              ),
            ),
          ),
          Row(
            children: [
              for (int i = 0; i < _list.length; i++)
                Padding(
                  padding: const EdgeInsets.all(
                    AppPadding.padding8,
                  ),
                  child: _getProperCircle(
                    index: i,
                  ),
                ),
            ],
          ),
          GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                _getNextIndex(),
                duration: const Duration(
                  milliseconds: AppConstants.sliderAnimationTime,
                ),
                curve: Curves.bounceInOut,
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(
                AppPadding.padding14,
              ),
              child: SizedBox(
                width: AppSize.size20,
                height: AppSize.size20,
                child: SvgPicture.asset(
                  ImageAssets.rightArrowIcon,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getProperCircle({
    required int index,
  }) {
    if (index == _currentPageIndex) {
      return SvgPicture.asset(
        ImageAssets.hollowCircleIcon,
      );
    } else {
      return SvgPicture.asset(
        ImageAssets.solidCircleIcon,
      );
    }
  }

  int _getPreviousIndex() {
    int previousIndex = --_currentPageIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  int _getNextIndex() {
    int nextIndex = ++_currentPageIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.sliderObject,
  });

  final SliderObject sliderObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.size40,
        ),
        Padding(
          padding: const EdgeInsets.all(
            AppPadding.padding8,
          ),
          child: Text(
            sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(
            AppPadding.padding8,
          ),
          child: Text(
            sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          height: AppSize.size60,
        ),
        SvgPicture.asset(
          sliderObject.image,
        ),
      ],
    );
  }
}

class SliderObject {
  SliderObject(
    this.title,
    this.subTitle,
    this.image,
  );
  String title;
  String subTitle;
  String image;
}
