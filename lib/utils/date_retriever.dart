class DateHelper {
  var now = DateTime.now();
  // ignore: missing_return
  getDay() {
    var day = now.weekday == 7 ? _days[0].day : _days[now.weekday].day;
    return day;
  }

  getDate() {
    return now.day;
  }

  getMonth() {
    return _months[now.month - 1].month;
  }

  getYear() {
    var year = "${now.year}";
    var shortYear = year.substring(2);
    return shortYear;
  }
}

class Day {
  String day;
  Day(this.day);
}

class Month {
  String month;
  Month(this.month);
}

List<Month> _months = [
  Month("Jan"),
  Month("Feb"),
  Month("Mar"),
  Month("Apr"),
  Month("May"),
  Month("Jun"),
  Month("Jul"),
  Month("Aug"),
  Month("Sep"),
  Month("Oct"),
  Month("Nov"),
  Month("Dec")
];
List<Day> _days = [
  Day("Sun"),
  Day("Mon"),
  Day("Tue"),
  Day("Wed"),
  Day("Thur"),
  Day("Fri"),
  Day("Sat")
];
