class SaveTicketInfoResponseModel {
    List<QrResponse>? qrResponses;
    String? ticketId;

    SaveTicketInfoResponseModel({this.qrResponses, this.ticketId});

    factory SaveTicketInfoResponseModel.fromJson(Map<String, dynamic> json) {
        return SaveTicketInfoResponseModel(
            qrResponses: json['qrResponses'] != null ? (json['qrResponses'] as List).map((i) => QrResponse.fromJson(i)).toList() : null,
            ticketId: json['ticketId'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['ticketId'] = ticketId;
        if (qrResponses != null) {
            data['qrResponses'] = qrResponses!.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class QrResponse {
    String? qr;
    String? ticketName;

    QrResponse({this.qr, this.ticketName});

    factory QrResponse.fromJson(Map<String, dynamic> json) {
        return QrResponse(
            qr: json['qr'],
            ticketName: json['ticketName'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['qr'] = qr;
        data['ticketName'] = ticketName;
        return data;
    }
}