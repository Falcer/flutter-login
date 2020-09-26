// PODO = Plain Old Dart Object
class Network {
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