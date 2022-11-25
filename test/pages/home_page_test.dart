import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_living/core/consts/consts.dart';
import 'package:smart_living/core/services/http_service.dart';
import 'package:smart_living/features/weather/data/models/weather_model.dart';

import 'home_page_test.mocks.dart';
import 'weather_response.dart';

@GenerateMocks([NetworkService])
Future<void> main() async {
  final networkCallMock = MockNetworkService();

  group(
    'Home Page tests',
    () {
      test(
        'given chosen weather,'
        'when user enter home page,'
        'then show user weather result',
        () async {
          // arrange
          when(
            networkCallMock.getData(ServerPaths.countris),
          ).thenAnswer((realInvocation) async {
            return Response(jsonEncode(weatherSuccessResponse), 200);
          });
          // act
          final resp = await networkCallMock.getData(ServerPaths.countris);

          // assert
          final actualResponse = WeatherModel.fromJson(jsonDecode(resp.body));
          final expectedResponse =
              WeatherModel.fromJson(weatherSuccessResponse);

          expect(
            actualResponse,
            expectedResponse,
          );
        },
      );
    },
  );
}
