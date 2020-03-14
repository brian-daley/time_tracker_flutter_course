import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart';
import 'package:time_tracker_flutter_course/providers/phone.dart';

import 'enums.dart';

// TODO: How to handle committees?  enum or string?
// TODO: how to handle saved and add hoc groups? favorite is not the answer.
// TODO: Let's try groups map with strings for now.
class Member with ChangeNotifier implements Comparable<Member> {
  String id;
  String first;
  String middle;
  String last;
  String suffix;
  String address;
  String city;
  String state;
  String zipCode;
  int numOfPhones;
  List<Phone> phones;
  DateTime birthday;
  String emailHost;
  String emailName;
  String imageUrl;
  DateTime joinedClub;
  DateTime deceasedDate;
  Officer officer;
  Set<String> groups;
  bool charterMember;
  bool deceased;
  bool fullMember;
  bool probationaryMember;
  bool over72Member;
  bool associateMember;
  bool mailedNewsLetter;
  bool favorite;
  PlusOneType plusOneType;
  String plusOneName;
  String plusOneImageUrl;

  Member(
      {this.id,
      this.first,
      this.middle,
      this.last,
      this.suffix,
      this.address,
      this.city,
      this.state,
      this.zipCode,
      this.numOfPhones,
      this.phones,
      this.birthday,
      this.emailHost,
      this.emailName,
      this.imageUrl,
      this.joinedClub,
      this.deceasedDate,
      this.officer,
      this.groups,
      this.charterMember,
      this.deceased,
      this.fullMember,
      this.probationaryMember,
      this.over72Member,
      this.associateMember,
      this.mailedNewsLetter,
      this.favorite,
      this.plusOneType,
      this.plusOneName,
      this.plusOneImageUrl});

  factory Member.fromMap(Map<dynamic, dynamic> value, String id) {
    return Member(
      id: trimToNull(id),
      first: trimToEmpty(value['first']),
      middle: trimToEmpty(value['middle']),
      last: trimToEmpty(value['last']),
      suffix: trimToEmpty(value['suffix']),
      address: trimToEmpty(value['address']),
      city: trimToEmpty(value['city']),
      state: trimToEmpty(value['state']),
      zipCode: trimToEmpty(value['zipCode']),
      numOfPhones: value['numOfPhones'],
      phones: parsePhoneData(value),
      birthday: stringToDateTime(value['birthday']),
      emailHost: trimToEmpty(value['emailHost']),
      emailName: trimToEmpty(value['emailName']),
      imageUrl: trimToEmpty(value['imageUrl']),
      joinedClub: stringToDateTime(value['joinedClub']),
      deceasedDate: stringToDateTime(value['deceasedDate']),
      officer: officerStringToEnum(value['officer']),
      groups: parseGroupData(value),
      charterMember: value['charterMember'],
      deceased: value['deceased'],
      fullMember: value['fullMember'],
      probationaryMember: value['probationaryMember'],
      over72Member: value['over72Member'],
      associateMember: value['associateMember'],
      mailedNewsLetter: value['mailedNewsLetter'],
      favorite: value['favorite'],
      plusOneType: plusOneStringToEnum(value['plusOneType']),
      plusOneName: trimToEmpty(value['plusOneName']),
      plusOneImageUrl: trimToEmpty(value['plusOneImageUrl']),
    );
  }

//  Map<String, dynamic> toMap() {
//    return <String, dynamic>{
//      'jobId': jobId,
//      'start': start.millisecondsSinceEpoch,
//      'end': end.millisecondsSinceEpoch,
//      'comment': comment,
//    };
//  }

  static String trimToEmpty(String val) {
    return (val == null ? '' : val.trim());
  }

  static String trimToNull(String val) {
    return (val == null ? null : val.trim());
  }

  static DateTime stringToDateTime(String dt) {
    if (dt == null) {
      return null;
    }
    return DateTime.tryParse(dt);
  }

  static Set<String> parseGroupData(Map<dynamic, dynamic> value) {
    return null;
  }

  static List<Phone> parsePhoneData(Map<dynamic, dynamic> value) {
    final numOfPhones = value['numOfPhones'];
    final Map<dynamic, dynamic> phoneMap = value['phones'];
    final phones = List<Phone>();

    for (var i = 1; i <= numOfPhones; i++) {
      phones.add(Phone(
        name: phoneMap['name$i'],
        number: phoneMap['number$i'],
        mobile: phoneMap['mobile$i'],
      ));
    }
    return phones;
  }

  static Officer officerStringToEnum(String val) {
    return EnumToString.fromString(Officer.values, val);
  }

  static PlusOneType plusOneStringToEnum(String val) {
    return EnumToString.fromString(PlusOneType.values, val);
  }

  void toggleFavoriteStatus() {
    favorite = !favorite;
    notifyListeners();
  }

  String getFormattedBirthday() {
    if (birthday != null) {
      return '${birthday.month}/${birthday.day}/${birthday.year}';
    }
    return 'unknown';
  }

  //  Returns a value like a [Comparator] when comparing this to [other].
  //  That is, it returns a negative integer if this is ordered before [other],
  //  a positive integer if this is ordered after [other],
  //  and zero if this and [other] are ordered together.
  @override
  int compareTo(Member other) {
    if (other == null) {
      return -1;
    }
    if (this.id == null) {
      return 1;
    }
    return this.id.compareTo(other.id);
  }
}
