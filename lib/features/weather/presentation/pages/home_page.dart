import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_living/core/consts/consts.dart';
import 'package:smart_living/core/theme/theme.dart';
import 'package:smart_living/features/weather/presentation/widgets/custom_search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageAssets.background),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 46),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Smart Living',
                          style: theme.primaryHeading,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 47,
                              width: 44,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  InkWell(
                                    borderRadius: BorderRadius.circular(60),
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                      SvgAssets.notif,
                                      width: 32,
                                      height: 32,
                                    ),
                                  ),
                                  Positioned(
                                    right: 0.0,
                                    top: 0.0,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        color: theme.whiteBackground,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 21,
                                        width: 21,
                                        decoration: BoxDecoration(
                                          color: theme.orange,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          '2',
                                          style: theme.smallStandardBody
                                              .copyWith(color: theme.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            InkWell(
                              borderRadius: BorderRadius.circular(60),
                              onTap: () {},
                              child: SvgPicture.asset(
                                SvgAssets.setting,
                                width: 28,
                                height: 28,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 23),
                    const CustomSearchBar(hintText: 'Take Smart Steps'),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
