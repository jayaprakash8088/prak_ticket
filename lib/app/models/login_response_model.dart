class LoginResponseModel {
    String? emailId;
    String? expiredTime;
    String? guidId;
    String? id;
    String? refreshToken;
    String? role;
    String? token;
    String? userName;
    String? validity;
    String? venue;

    LoginResponseModel({this.emailId, this.expiredTime, this.guidId, this.id, this.refreshToken, this.role, this.token, this.userName, this.validity, this.venue});

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
        return LoginResponseModel(
            emailId: json['emailId'],
            expiredTime: json['expiredTime'],
            guidId: json['guidId'],
            id: json['id'],
            refreshToken: json['refreshToken'],
            role: json['role'],
            token: json['token'],
            userName: json['userName'],
            validity: json['validity'],
            venue: json['venue'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['emailId'] = emailId;
        data['expiredTime'] = expiredTime;
        data['guidId'] = guidId;
        data['id'] = id;
        data['refreshToken'] = refreshToken;
        data['role'] = role;
        data['token'] = token;
        data['userName'] = userName;
        data['validity'] = validity;
        data['venue'] = venue;
        return data;
    }
}