class ApiConst{
  ApiConst._();
  ///Base url
  static const String baseUrl="https://5017-158-140-172-121.ngrok-free.app/api/v1";

  ///Auth API
  static const String login="/auth/masuk";

  ///Request OTP
  static const String requestOtp="/auth/forgot-password/send-otp";

  ///Send OTP
  static const String sendOtp='/auth/forgot-password/validate-otp';

  ///Change Password
  static const String changePassword='/auth/forgot-password/reset-password';

  ///Dashboard API
  static const String dashboard="/dashboard/jadwal-obat/";

  ///Jadwal Obat Sesi
  static const String jadwalObatSesi="/dashboard/jadwal-obat/sesi/";

  ///Set Riwayat
  static const String setRiwayat="/dashboard/riwayat/set/";
}