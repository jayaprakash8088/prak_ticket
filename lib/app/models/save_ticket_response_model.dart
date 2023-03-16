class SaveTicketInfoResponseModel {
    String? qr;
    String? ticketId;

    SaveTicketInfoResponseModel({this.qr, this.ticketId});

    factory SaveTicketInfoResponseModel.fromJson(Map<String, dynamic> json) {
        return SaveTicketInfoResponseModel(
            qr: json['qr'],
            ticketId: json['ticketId'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['qr'] = qr;
        data['ticketId'] = ticketId;
        return data;
    }
}