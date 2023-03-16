class TicketInfoResponseModel {
  int? rateTypeAmount;
  String? rateTypeName;

  TicketInfoResponseModel({this.rateTypeAmount, this.rateTypeName});

  factory TicketInfoResponseModel.fromJson(Map<String, dynamic> json) {
    return TicketInfoResponseModel(
      rateTypeAmount: json['rateTypeAmount'],
      rateTypeName: json['rateTypeName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rateTypeAmount'] = rateTypeAmount;
    data['rateTypeName'] = rateTypeName;
    return data;
  }
}
