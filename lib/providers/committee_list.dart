import 'package:flutter/foundation.dart';
import 'package:time_tracker_flutter_course/providers/committee.dart';

class CommitteeList with ChangeNotifier {
  List<Committee> _committeeList = [
    Committee(
      id: "specialevents",
      year: 2020,
      name: 'Special Events',
      chairId: 'antospete',
      memberIds: ['daleybrian'],
    )
  ];
}
