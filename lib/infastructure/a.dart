// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

String duTimeLineFormat(DateTime dt) {
  var now = DateTime.now();
  var difference = now.difference(dt);
  if (difference.inMinutes < 60) {
    return "${difference.inMinutes} m ago";
  }

  if (difference.inHours < 24) {
    return "${difference.inHours} h ago";
  } else if (difference.inDays < 30) {
    return "${difference.inDays} d ago";
  } else if (difference.inDays < 365) {
    final DateFormat dtFormate = DateFormat('MM-dd');
    return dtFormate.format(dt);
  } else {
    final DateFormat dtFormate = DateFormat('yyyy-MM-dd');
    var str = dtFormate.format(dt);
    return str;
  }
}
