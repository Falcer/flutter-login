// PODO = Plain Old Dart Object
enum NetworkStatus {Loading, Success, Failed}

class Network {
  NetworkStatus status;
  bool success = false;
  String message = "";
  dynamic data;

  Network({this.success, this.message, this.data});

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      success: json["success"],
      message: json["message"],
      data: json["data"],
    );
  }
}