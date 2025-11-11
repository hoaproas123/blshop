
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class Utils  {
  static String formatCurrency(String rawNumber) {
    // Loại bỏ dấu chấm cũ nếu có (trường hợp chuỗi đầu vào đã có định dạng)
    String cleaned = rawNumber.replaceAll('.', '');

    // Chuyển thành số
    int number = int.tryParse(cleaned) ?? 0;

    // Định dạng số theo kiểu tiền tệ Việt Nam (có dấu chấm ngăn cách hàng nghìn)
    final formatter = NumberFormat('#,###', 'vi_VN');
    return formatter.format(number);
  }

  static String formattedDate(DateTime  datetime) {
    return DateFormat('dd/MM/yyyy HH:mm').format(datetime!);
  }

   static String hideMiddleDigits(bool isHide,String phoneNumber) {
    if (isHide==false) {
      return phoneNumber;
    }

    final start = phoneNumber.substring(0, 3);         // 2 số đầu
    final end = phoneNumber.substring(phoneNumber.length - 3); // 3 số cuối

    return '$start****$end';
  }

  static bool isValidPhoneNumber(String phone) {
    final RegExp regex = RegExp(r'^(0[3|5|7|8|9])[0-9]{8}$');
    return regex.hasMatch(phone);
  }

  static LatLng parseLatLng(String input) {
    List<String> parts = input.split(',');
    if (parts.length != 2) {
      throw FormatException('Invalid input format');
    }

    double lat = double.parse(parts[0].trim());
    double lng = double.parse(parts[1].trim());
    return LatLng(lat, lng);
  }
}
