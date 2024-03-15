class ApiConst {
  ApiConst._();

  ///Base url
  static const String baseUrl = "https://kos.brotani.com/api/v1";

  ///Auth API
  static const String login = "/auth/register";

  ///Request OTP
  static const String requestOtp = "/auth/forgot-password/send-otp";

  ///Send OTP
  static const String sendOtp = '/auth/forgot-password/validate-otp';

  ///Change Password
  static const String changePassword = '/auth/forgot-password/reset-password';

  ///Dashboard API
  static const String dashboard = "/dashboard/jadwal-obat/";

  ///Jadwal Obat Sesi
  static const String jadwalObatSesi = "/dashboard/jadwal-obat/sesi/";

  ///Set Riwayat
  static const String setRiwayat = "/dashboard/riwayat/set/";
}
