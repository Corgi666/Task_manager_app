import 'package:get/get.dart';
import 'package:taskmanager/controller/service.dart';
import 'package:http/http.dart' as http;

class DataController extends GetxController {
  DataService service = DataService();
  final client = http.Client();

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;

  Future<void> getData() async {
    Response response = await service.getData();

    if (response.statusCode == 200) {
      _myData = response.body;
      print('We got data');
      _isLoaded = true;
      update();
    } else {
      print('response.statusCode');
    }
  }

  Future<void> postData(String task, String taskDetial) async {
    _isLoaded = true;
    Response response =
        await service.postData({"task_name": task, "task_Detial": taskDetial});

    if (response.statusCode == 200) {
      print('Post Data success');
      update();
    } else {
      print(response.statusCode.toString());
    }
  }
}
