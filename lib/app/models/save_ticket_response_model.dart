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
    int? amount;
    String? qrCodePath;
    String? qrString;
    String? ticketName;

    QrResponse({this.amount, this.qrCodePath, this.qrString, this.ticketName});

    factory QrResponse.fromJson(Map<String, dynamic> json) {
        return QrResponse(
            amount: json['amount'],
            qrCodePath: json['qrCodePath'],
            qrString: json['qrString'],
            ticketName: json['ticketName'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['amount'] = amount;
        data['qrCodePath'] = qrCodePath;
        data['qrString'] = qrString;
        data['ticketName'] = ticketName;
        return data;
    }
}