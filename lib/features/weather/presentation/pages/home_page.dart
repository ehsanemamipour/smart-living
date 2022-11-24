import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_living/core/consts/consts.dart';
import 'package:smart_living/core/theme/theme.dart';
import 'package:smart_living/features/weather/presentation/widgets/custom_icon_box.dart';
import 'package:smart_living/features/weather/presentation/widgets/custom_search_bar.dart';
import 'package:smart_living/features/weather/presentation/widgets/custom_tab_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map iconBoxesMap = {
    {'All': SvgAssets.all}: {18.0: 18.0},
    {'Home': SvgAssets.home}: {23.52: 24.0},
    {'Exploration': SvgAssets.exploration}: {27.65: 20.0},
    {'Briefing': SvgAssets.brief}: {28.0: 20.0},
  };

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomTabItem(
                          isSelected: true,
                          title: 'Smartboard',
                        ),
                        CustomTabItem(
                          isSelected: false,
                          title: 'Recipes',
                        ),
                        CustomTabItem(
                          isSelected: false,
                          title: 'Integrations',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: iconBoxesMap.keys.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(right: 43, left: index == 0 ? 43 : 0),
                      child: CustomIconBox(
                        isSelected: index == 0,
                        height: iconBoxesMap.values
                            .toList()[index]
                            .keys
                            .toList()
                            .first,
                        width: iconBoxesMap.values
                            .toList()[index]
                            .values
                            .toList()
                            .first,
                        path: iconBoxesMap.keys
                            .toList()[index]
                            .values
                            .toList()
                            .first,
                        title: iconBoxesMap.keys
                            .toList()[index]
                            .keys
                            .toList()
                            .first,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
