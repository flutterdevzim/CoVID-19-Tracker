class DateHelper{
  var now = DateTime.now();
  // ignore: missing_return
  String getDay(){
    switch(now.weekday){
      case 1:
        return "${_days[1].day}";
        break;
      case 2:
        return "${_days[2].day}";
        break;
      case 3:
        return "${_days[3].day}";
        break;
      case 4:
        return "${_days[4].day}";
        break;
      case 5:
        return "${_days[5].day}";
        break;
      case 6:
        return "${_days[6].day}";
        break;
      case 7:
        return "${_days[0].day}";
        break;
      default:
        break;
    }
  }

   getDate(){
    return now.day;
  }

  getMonth(){
    return _months[now.month - 1].month;
  }

  getYear(){
    var year = "${now.year}";
    var shortYear = year.substring(2);
    return shortYear;
  }
}

class Day{
  String day;
  Day(this.day);
}

class Month{
  String month;
  Month(this.month);
}

List<Month> _months = [Month("Jan"), Month("Feb"), Month("Mar"), Month("Apr"), Month("May"), Month("Jun"), Month("Jul"), Month("Aug"), Month("Sep"), Month("Oct"), Month("Nov"), Month("Dec")];
List<Day> _days = [Day("Sun"), Day("Mon"), Day("Tue"), Day("Wed"), Day("Thur"), Day("Fri"), Day("Sat")];