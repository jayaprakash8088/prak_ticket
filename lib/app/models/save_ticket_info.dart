class SaveTicketInfo {
    String? empid;
    String? mobileNumber;
    String? paymentStatus;
    String? paymentType;
    List<TicketType>? ticketTypes;
    int? totalAmount;
    int? totalQuantity;
    String? venueId;

    SaveTicketInfo({this.empid, this.mobileNumber, this.paymentStatus, this.paymentType, this.ticketTypes, this.totalAmount, this.totalQuantity, this.venueId});

    factory SaveTicketInfo.fromJson(Map<String, dynamic> json) {
        return SaveTicketInfo(
            empid: json['empid'],
            mobileNumber: json['mobileNumber'],
            paymentStatus: json['paymentStatus'],
            paymentType: json['paymentType'],
            ticketTypes: json['ticketTypes'] != null ? (json['ticketTypes'] as List).map((i) => TicketType.fromJson(i)).toList() : null,
            totalAmount: json['totalAmount'],
            totalQuantity: json['totalQuantity'],
            venueId: json['venueId'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['empid'] = empid;
        data['mobileNumber'] = mobileNumber;
        data['paymentStatus'] = paymentStatus;
        data['paymentType'] = paymentType;
        data['totalAmount'] = totalAmount;
        data['totalQuantity'] = totalQuantity;
        data['venueId'] = venueId;
        if (ticketTypes != null) {
            data['ticketTypes'] = ticketTypes!.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class TicketType {
    int? amount;
    String? name;
    int? quantity;

    TicketType({this.amount, this.name, this.quantity});

    factory TicketType.fromJson(Map<String, dynamic> json) {
        return TicketType(
            amount: json['amount'], 
            name: json['name'],
            quantity: json['quantity'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['amount'] = amount;
        data['name'] = name;
        data['quantity'] = quantity;
        return data;
    }
}