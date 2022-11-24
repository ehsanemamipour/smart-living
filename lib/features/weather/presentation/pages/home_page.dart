import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_living/core/consts/consts.dart';
import 'package:smart_living/core/theme/theme.dart';
import 'package:smart_living/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:smart_living/features/weather/presentation/bloc/weather_event.dart';
import 'package:smart_living/features/weather/presentation/bloc/weather_state.dart';
import 'package:smart_living/features/weather/presentation/widgets/custom_card.dart';
import 'package:smart_living/features/weather/presentation/widgets/custom_icon_box.dart';
import 'package:smart_living/features/weather/presentation/widgets/custom_search_bar.dart';
import 'package:smart_living/features/weather/presentation/widgets/custom_tab_item.dart';
import 'package:smart_living/injection_container.dart';

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
  final tabNameList = ['Smartboard', 'Recipes', 'Integrations'];

  String temperature = '0';

  StreamController<bool> switchStreamController =
      StreamController<bool>.broadcast();
  StreamController<String> tabStreamController =
      StreamController<String>.broadcast();
  StreamController<String> selectedIconStreamController =
      StreamController<String>.broadcast();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) =>
          serviceLocator<WeatherBloc>()..add(GetWeatherInfoEvent()),
      child: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is GetWeatherInfoState) temperature = state.temperature;
        },
        builder: (context, state) {
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
                SingleChildScrollView(
                  child: Column(
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
                                            borderRadius:
                                                BorderRadius.circular(60),
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
                                                      .copyWith(
                                                          color: theme.white),
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
                              children: [
                                ...tabNameList.map((e) {
                                  return StreamBuilder<String>(
                                      stream: tabStreamController.stream,
                                      builder: (context, snapshot) {
                                        var data = snapshot.data ?? '';
                                        return InkWell(
                                          onTap: () =>
                                              tabStreamController.add(e),
                                          child: CustomTabItem(
                                            isSelected: e == data,
                                            title: e,
                                          ),
                                        );
                                      });
                                })
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 95,
                        child: ListView.builder(
                          itemCount: iconBoxesMap.keys.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  right: 43, left: index == 0 ? 43 : 0),
                              child: StreamBuilder<String>(
                                  stream: selectedIconStreamController.stream,
                                  builder: (context, snapshot) {
                                    var title = iconBoxesMap.keys
                                        .toList()[index]
                                        .keys
                                        .toList()
                                        .first;
                                    var data = snapshot.data ?? '';
                                    return InkWell(
                                      onTap: () => selectedIconStreamController
                                          .add(title),
                                      child: CustomIconBox(
                                          isSelected: data == title,
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
                                          title: title),
                                    );
                                  }),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CustomCard(
                                  title: '4',
                                  subtitle: 'active recipes',
                                  icon: SvgPicture.asset(
                                    SvgAssets.flow,
                                    height: 20.7,
                                    width: 25.67,
                                  ),
                                  bottomWidget:
                                      Image.asset(ImageAssets.activeRecipes),
                                ),
                                const SizedBox(width: 15),
                                CustomCard(
                                  title: '2',
                                  subtitle: 'active lists',
                                  icon: SvgPicture.asset(
                                    SvgAssets.list,
                                    height: 22,
                                    width: 22,
                                  ),
                                  bottomWidget:
                                      Image.asset(ImageAssets.activeList),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Container(
                              height: 144,
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: theme.purple,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                      color: theme.textBlack.withOpacity(0.08),
                                      blurRadius: 16,
                                      offset: const Offset(0, 4))
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                '$temperature°C',
                                                style: theme.primaryHeading
                                                    .copyWith(
                                                        color: theme.white),
                                              ),
                                              const SizedBox(width: 2),
                                              Text(
                                                '18°C',
                                                style: theme.smallStandardBody
                                                    .copyWith(
                                                  color: theme.white
                                                      .withOpacity(0.5),
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'İzmir, Urla',
                                            style: theme.tertiaryHeading
                                                .copyWith(color: theme.white),
                                          )
                                        ],
                                      ),
                                      Image.asset(
                                        ImageAssets.cloudly,
                                        width: 72,
                                        height: 72,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Great morning for a walk.',
                                    style: theme.smallStandardBody
                                        .copyWith(color: theme.white),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                CustomCard(
                                  title: '24',
                                  subtitle: 'messages',
                                  icon: SvgPicture.asset(
                                    SvgAssets.message,
                                    height: 23.5,
                                    width: 24,
                                  ),
                                  bottomWidget:
                                      Image.asset(ImageAssets.messagesAvatar),
                                ),
                                const SizedBox(width: 15),
                                CustomCard(
                                  title: '13:00',
                                  subtitle: 'La Pena, Urla',
                                  icon: SvgPicture.asset(
                                    SvgAssets.dining,
                                    height: 26,
                                    width: 16,
                                  ),
                                  bottomWidget: Text(
                                    'Booking for 2 \nFree Parking',
                                    style: theme.smallStandardBody,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Container(
                              height: 160,
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: theme.white.withOpacity(0.72),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                      color: theme.textBlack.withOpacity(0.08),
                                      blurRadius: 16,
                                      offset: const Offset(0, 4))
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '4',
                                        style: theme.primaryHeading,
                                      ),
                                      SvgPicture.asset(
                                        SvgAssets.subtract,
                                        width: 24,
                                        height: 24,
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'sources connected',
                                    style: theme.emphasisBody,
                                  ),
                                  const Spacer(),
                                  Image.asset(
                                    ImageAssets.sourcesList,
                                    width: 124,
                                    height: 40,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              height: 154,
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: theme.white.withOpacity(0.72),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                      color: theme.textBlack.withOpacity(0.08),
                                      blurRadius: 16,
                                      offset: const Offset(0, 4))
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Suggested Recipe',
                                        style: theme.tertiaryHeading,
                                      ),
                                      SvgPicture.asset(
                                        SvgAssets.refresh,
                                        width: 29,
                                        height: 26,
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Morning',
                                    style: theme.emphasisBody,
                                  ),
                                  Text(
                                    'Suggest cafes at 10:00 AM, weekdays',
                                    style: theme.smallStandardBody,
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      StreamBuilder<bool>(
                                          stream: switchStreamController.stream,
                                          builder: (context, snapshot) {
                                            var data = snapshot.data ?? false;
                                            return CupertinoSwitch(
                                              activeColor: theme.orange,
                                              trackColor: theme.textBlack
                                                  .withOpacity(0.28),
                                              value: data,
                                              onChanged: (v) =>
                                                  switchStreamController.add(v),
                                            );
                                          }),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
          );
        },
      ),
    );
  }
}
