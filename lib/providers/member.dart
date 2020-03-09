import 'package:flutter/foundation.dart';

enum Officer { President, VicePresident, Treasurer, Secretary }
enum PlusOneType { Wife, Fiance, GirlFriend }

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
  Map phones;
  DateTime birthday;
  String emailHost;
  String emailName;
  String imageUrl;
  DateTime joinedClub;
  DateTime deceasedDate;
  Officer officer;
  Map groups;
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
    if (this.last == null) {
      return 1;
    }
    return this.last.compareTo(other.last);
  }
}
