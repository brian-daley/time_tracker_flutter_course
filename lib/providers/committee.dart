class Committee implements Comparable<Committee> {
  String id;
  int year;
  String name;
  String chairId;
  List<String> memberIds;

  Committee({this.id, this.year, this.name, this.chairId, this.memberIds});

  @override
  int compareTo(Committee other) {
    if (other == null || other.name == null) {
      return -1;
    }
    if (this.name == null) {
      return 1;
    }
    return this.name.compareTo(other.name);
  }
}
