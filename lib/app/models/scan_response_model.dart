class ScanInfoResponseModel {
    bool? isValid;
    String? message;

    ScanInfoResponseModel({this.isValid, this.message});

    factory ScanInfoResponseModel.fromJson(Map<String, dynamic> json) {
        return ScanInfoResponseModel(
            isValid: json['isValid'],
            message: json['message'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['isValid'] = isValid;
        data['message'] = message;
        return data;
    }
}