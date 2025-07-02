import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wazifati/data/cubits/slider_cubit.dart';
import 'package:wazifati/utils/ui_utils.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget>
    with AutomaticKeepAliveClientMixin {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _bannerIndex = ValueNotifier(0);
  Timer? _timer;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    context.read<SliderCubit>().fetchSlider(context, forceRefresh: true);
    _startAutoSlider();
  }

  void _startAutoSlider() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!_pageController.hasClients) return;
      final nextPage = _bannerIndex.value + 1;
      final state = context.read<SliderCubit>().state;

      if (state is SliderFetchSuccess && state.sliderlist.isNotEmpty) {
        final totalPages = state.sliderlist.length;

        _bannerIndex.value = nextPage < totalPages ? nextPage : 0;
        _pageController.animateToPage(
          _bannerIndex.value,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _bannerIndex.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<SliderCubit, SliderState>(
      builder: (context, state) {
        if (state is SliderFetchSuccess && state.sliderlist.isNotEmpty) {
          return SizedBox(
            height: 170,
            child: PageView.builder(
              controller: _pageController,
              itemCount: state.sliderlist.length,
              onPageChanged: (index) => _bannerIndex.value = index,
              itemBuilder: (context, index) {
                final slider = state.sliderlist[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade200,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: UiUtils.getImage(
                      slider.image ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is SliderFetchFailure) {
          return Text("Failed: ${state.errorMessage}");
        } else if (state is SliderFetchInProgress) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
