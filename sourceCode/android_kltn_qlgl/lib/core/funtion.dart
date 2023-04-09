import 'dart:math' as math;
int RandomColor() {
    return (math.Random().nextDouble() * 0xFFFFFF).toInt();
  }

  String numberCustom10(int number) {
    if (number < 10) {
      return "0$number";
    } else {
      return "$number";
    }
  }

  String weekday() {
    switch (DateTime.now().weekday) {
      case 0:
        return "Thứ hai";
      case 1:
        return "Thứ ba";
      case 2:
        return "Thứ tư";
      case 3:
        return "Thứ năm";
      case 5:
        return "Thứ sáu";
      case 6:
        return "Thứ bảy";
      default:
        return "Chủ nhật";
    }
  }

  
