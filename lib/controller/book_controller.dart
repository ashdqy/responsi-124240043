import 'package:get/get.dart';
import '../model/book.dart';
import '../service/api_service.dart';

class BookController extends GetxController {
  final ApiService _apiService = ApiService();

  final RxList<Book> _books = <Book>[].obs;
  final RxBool _isLoading = false.obs;

  List<Book> get books => _books;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    _retrieveData();
    super.onInit();
  }

  Future<void> _retrieveData() async {
    try {
      _isLoading.value = true;
      final data = await _apiService.fetchbooks();
      _books.assignAll(data);
    } catch (e) {
      Get.log(e.toString());
    } finally {
      _isLoading.value = false;
    }
  }
}