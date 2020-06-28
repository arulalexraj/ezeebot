class AuthModel {
  String authToken;
  String url;
  String userCode;
  String deviceMedium;
  String name;
  String namespaceCode;
  String namespaceName;
  String product;
  String logo;

  AuthModel.fromJson(Map<String, dynamic> json) {
    authToken = json['authToken'];
    url = json['url'];
    userCode = json['userCode'];
    deviceMedium = json['deviceMedium'];
    name = json['name'];
    namespaceCode = json['namespaceCode'];
    namespaceName = json['namespaceName'];
    product = json['product'];
    logo = json['logo'];
  }
}
