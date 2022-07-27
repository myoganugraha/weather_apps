import 'package:intl/intl.dart';

double temperatureToCelcius(kelvinValue) => kelvinValue - 273.15;

String formattingDate(int unix, String dateFormat) =>
    DateFormat(dateFormat).format(
      DateTime.fromMillisecondsSinceEpoch(unix * 1000).toLocal(),
    );
