// donations model
import 'package:intl/intl.dart';

class Donor {
  int id;
  String donatedOn;
  String donorName;
  String resource;
  String estimatedValue;

  Donor(this.id, this.donatedOn, this.donorName, this.resource,
      this.estimatedValue);

  static String formatDate(String date) {
    // date >>> 2020-03-12
    DateTime dt = DateTime.parse(date);
    String newDt = DateFormat.yMMMEd().format(dt);
    //print('Date is >> $newDt');

    return newDt;
  }
}
