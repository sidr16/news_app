import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  DateFormat get format => DateFormat();

  String get yMMMEd => format.add_yMMMEd().format(this);
}
