

class CustomFormat
{



  //
  String formatTime(DateTime? dateTime) {
    if(dateTime!=null){
      return '${(dateTime.hour%12).toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')} ${dateTime.hour >= 12 ? 'PM' : 'AM'}';
    }
    else{
      return '';
    }
  }



  String getDayTime()
  {
    var d = DateTime.now();
    if(d.hour<4)
      {
        return 'Good Night';
      }
    else if(d.hour<12)
      {
        return "Good Morning";
      }
    else if(d.hour<16)
      {
        return 'Good Afternoon';
      }
    else if(d.hour<19)
    {
      return 'Good Evening';
    }
    else
    {
      return 'Good Night';
    }
  }



  //
  String formatDate(DateTime? dateTime) {
    List<String> months = [
      'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',
      'September', 'October', 'November', 'December'
    ];
    if(dateTime!=null)
    {
      return '${months[dateTime.month - 1]} ${dateTime.day}, ${dateTime.year}';

    }
    else
    {
      return '';
    }
  }

  String getFormateDuration(DateTime date) {
    var duration = DateTime.now().difference(date);

    //
    if(duration.inMinutes<60)
      {
        return '${duration.inMinutes} min';
      }

    if(duration.inHours<24)
      {
        return '${duration.inHours} hour';
      }
    if(duration.inDays<30)
      {
        return '${duration.inDays} days';
      }

    //

    return 'Str';
  }

   Duration getTimeAgo(DateTime dateTime){
   return DateTime.now().difference(dateTime);
  }

}

