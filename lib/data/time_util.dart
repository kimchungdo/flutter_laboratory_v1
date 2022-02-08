class TimeUtils{
  static int getFormatTime(DateTime date){       //입력된 DateTime을 20151221과 같은 형식으로 변경
    return int.parse("${date.year}${makeTwoDigit(date.month)}${makeTwoDigit(date.day)}");
  }

  static String getFormatTimePlus(DateTime date, String chr){     //chr 에 '-'가 들어오면 2015-12-21과 같이 자유로운 변경가능 ./-_ 뭐든 될거임
    return ("${date.year}$chr${makeTwoDigit(date.month)}$chr${makeTwoDigit(date.day)}");
  }

  static DateTime numToDateTime(int date){    //20151221형식의 데이터를 DateTime으로 변경
    String _d = date.toString();
    int year = int.parse(_d.substring(0,4));
    int month = int.parse(_d.substring(4,6));
    int day = int.parse(_d.substring(6,8));

    return DateTime(year, month, day);
  }

  static String makeTwoDigit(int num){       //한자리 숫자의 경우 두자리로 변경하게 해줌. 두자리여도 두자리유지
    return num.toString().padLeft(2, "0");
  }
}