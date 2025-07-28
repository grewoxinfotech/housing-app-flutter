import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkStatusService extends GetxService {
  final _connectionStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _initConnectivity();
    _setupConnectivityListener();
  }

  Future<void> _initConnectivity() async {
    try {
      final status = await Connectivity().checkConnectivity();
      _connectionStatus.value = status;
    } catch (e) {
      Get.snackbar('Error', 'Failed to get network status');
    }
  }

  void _setupConnectivityListener() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _connectionStatus.value = result;
      _handleConnectivityChange(result);
    });
  }

  void _handleConnectivityChange(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      Get.snackbar(
        'No Internet',
        'Please check your internet connection',
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
      );
    }
  }

  bool get isConnected => _connectionStatus.value != ConnectivityResult.none;
}