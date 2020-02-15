import 'package:time_tracker_flutter_course/app/home/models/entry.dart';
import 'package:time_tracker_flutter_course/app/home/models/job.dart';

class EntryJob {
  EntryJob(this.entry, this.job);

  @override
  String toString() {
    return 'EntryJob{entry: $entry, job: $job}';
  }

  final Entry entry;
  final Job job;
}
