import 'package:clean_arc_project/presentation/onboarding/view_model/onboarding_view_model.dart';
import 'package:clean_arc_project/presentation/resources/assets_manger.dart';
import 'package:clean_arc_project/presentation/resources/color_manger.dart';
import 'package:clean_arc_project/presentation/resources/constants_manger.dart';
import 'package:clean_arc_project/presentation/resources/strings_manger.dart';
import 'package:clean_arc_project/presentation/resources/values_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../domain/models.dart';
import '../../resources/routes_manger.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();

  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  @override
  void initState() {
    _viewModel.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapshot) => _getContentWidget(
        sliderViewObject: snapshot.data,
      ),
    );
  }

  Widget _getContentWidget({
    required SliderViewObject? sliderViewObject,
  }) {
    if (sliderViewObject == null) {
      return Container();
    } else {
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
          itemCount: sliderViewObject.numberOfSlides,
          onPageChanged: (index) {
            _viewModel.onPageChanged(
              index: index,
            );
          },
          itemBuilder: (context, index) => OnBoardingPage(
            sliderObject: sliderViewObject.sliderObject,
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
              _getBottomSheet(
                sliderViewObject: sliderViewObject,
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheet({
    required SliderViewObject sliderViewObject,
  }) {
    return Container(
      color: ColorManger.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                _viewModel.goPrevious(),
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
              for (int i = 0; i < sliderViewObject.numberOfSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(
                    AppPadding.padding8,
                  ),
                  child: _getProperCircle(
                    index: i,
                    currentIndex: sliderViewObject.currentIndex,
                  ),
                ),
            ],
          ),
          GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                _viewModel.goNext(),
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
    required int currentIndex,
  }) {
    if (index == currentIndex) {
      return SvgPicture.asset(
        ImageAssets.hollowCircleIcon,
      );
    } else {
      return SvgPicture.asset(
        ImageAssets.solidCircleIcon,
      );
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
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