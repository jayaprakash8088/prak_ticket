class VenueResponseModel {
    int? venueId;
    String? venueName;

    VenueResponseModel({this.venueId, this.venueName});

    factory VenueResponseModel.fromJson(Map<String, dynamic> json) {
        return VenueResponseModel(
            venueId: json['venueId'],
            venueName: json['venueName'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['venueId'] = venueId;
        data['venueName'] = venueName;
        return data;
    }
}