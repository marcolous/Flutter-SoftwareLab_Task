
class RegisterRequestModel {
  String? fullName;
  String? email;
  String? phone;
  String? password;
  String? role;
  String? businessName;
  String? informalName;
  String? address;
  String? city;
  String? state;
  int? zipCode;
  String? registrationProof;
  Map<String, List<String>>? businessHours;
  String? deviceToken;
  String? type;
  String? socialId;

  RegisterRequestModel({
    this.fullName,
    this.email,
    this.phone,
    this.password,
    this.role,
    this.businessName,
    this.informalName,
    this.address,
    this.city,
    this.state,
    this.zipCode,
    this.registrationProof,
    this.businessHours,
    this.deviceToken,
    this.type,
    this.socialId,
  });

  Future<Map<String, dynamic>> toMap() async {
    return {
      'full_name': null, //fullName,
      'email': null, //email,
      'phone': phone,
      'password': password,
      'role': role ?? 'farmer',
      'business_name': businessName,
      'informal_name': informalName,
      'address': address,
      'city': city,
      'state': state,
      'zip_code': zipCode,
      'registration_proof': registrationProof ?? '',
      'business_hours': businessHours ??
          {
            "mon": ["8:00am - 10:00am", "10:00am - 1:00pm"],
            "tue": ["8:00am - 10:00am", "10:00am - 1:00pm"],
            "wed": ["8:00am - 10:00am", "10:00am - 1:00pm", "1:00pm - 4:00pm"],
            "thu": ["8:00am - 10:00am", "10:00am - 1:00pm", "1:00pm - 4:00pm"],
            "fri": ["8:00am - 10:00am", "10:00am - 1:00pm"],
            "sat": ["8:00am - 10:00am", "10:00am - 1:00pm"],
            "sun": ["8:00am -10:00am"]
          },
      'device_token': deviceToken ?? '',
      'type': type ?? 'email',
      'social_id': ''
    };
  }

  @override
  String toString() {
    return '''
    RegisterRequestModel(
      fullName: $fullName, 
      email: $email, 
      phone: $phone, 
      password: $password, 
      role: $role, 
      businessName: $businessName, 
      informalName: $informalName, 
      address: $address, 
      city: $city, 
      state: $state, 
      zipCode: $zipCode, 
      registrationProof: $registrationProof, 
      businessHours: $businessHours, 
      deviceToken: $deviceToken, 
      type: $type, 
      socialId: $socialId
    )
    ''';
  }
}
