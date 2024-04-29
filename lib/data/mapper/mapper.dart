import 'package:clean_arc_project/app/constants.dart';
import 'package:clean_arc_project/app/extensions.dart';
import 'package:clean_arc_project/domain/models/models.dart';

import '../response/responses.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      this?.id.orEmpty() ?? Constants.empty,
      this?.name.orEmpty() ?? Constants.empty,
      this?.numOfNotifications.orZero() ?? Constants.zero,
    );
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
      this?.phone.orEmpty() ?? Constants.empty,
      this?.email.orEmpty() ?? Constants.empty,
      this?.link.orEmpty() ?? Constants.empty,
    );
  }
}

extension AuthResponseMapper on AuthResponse? {
  AuthObject toDomain() {
    return AuthObject(
      this?.customer.toDomain(),
      this?.contacts.toDomain(),
    );
  }
}