import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get hasConnection;
}

class NetworkInfoImpl implements NetworkInfo {
   NetworkInfoImpl({required this.dataConnectionChecker});

  final Connectivity dataConnectionChecker;
  @override
  Future<bool> get hasConnection async {
    final connextion = await dataConnectionChecker.checkConnectivity();
    return connextion == ConnectivityResult.mobile ||
        connextion == ConnectivityResult.wifi;
  }
}
