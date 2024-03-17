class ApiConst {
  ApiConst._();

  ///Base url
  static const String baseUrl = "https://kos.brotani.com/api/v1";

  ///Auth API
  static const String login = "/auth/login";

  static const String register = "/auth/register";

  ///Request OTP
  static const String requestOtp = "/auth/resend-otp";

  ///Send OTP
  static const String sendOtp = '/auth/verify';

  ///Change Password
  static const String changePassword = '/auth/forgot-password/reset-password';

  ///Dashboard API
  static const String listRoom = "/room/list";

  ///Jadwal Obat Sesi
  static const String jadwalObatSesi = "/dashboard/jadwal-obat/sesi/";

  ///Set Riwayat
  static const String setRiwayat = "/dashboard/riwayat/set/";
}
