class ErrorApi {
  int? code;
  String? data;
  String? message;

  ErrorApi({this.code, this.data, this.message});

  ErrorApi.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['data'] = this.data;
    data['message'] = this.message;
    return data;
  }
}