// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'CaffChat';

  @override
  String get login => 'Masuk';

  @override
  String get email => 'Email';

  @override
  String get password => 'Kata Sandi';

  @override
  String get emailRequired => 'Email wajib diisi';

  @override
  String get emailInvalid => 'Masukkan alamat email yang valid';

  @override
  String get passwordRequired => 'Kata sandi wajib diisi';

  @override
  String get passwordMinLength => 'Kata sandi minimal 6 karakter';

  @override
  String get forgotPassword => 'Lupa kata sandi?';

  @override
  String get noAccount => 'Belum punya akun? ';

  @override
  String get register => 'Daftar';

  @override
  String get createAccount => 'Buat Akun';

  @override
  String get createAccountButton => 'Buat Akun →';

  @override
  String get registerSubtitle => 'Masukkan nama Anda dan\nfoto profil opsional';

  @override
  String get displayName => 'Nama Tampilan';

  @override
  String get enterYourName => 'Masukkan nama Anda';

  @override
  String get displayNameRequired => 'Nama tampilan wajib diisi';

  @override
  String get displayNameMinLength => 'Nama minimal 3 karakter';

  @override
  String get emailAddress => 'Alamat Email';

  @override
  String get emailHint => 'contoh@email.com';

  @override
  String get phoneNumberOptional => 'Nomor Telepon (Opsional)';

  @override
  String get phoneNumberHint => '+62 812 3456 7890';

  @override
  String get phoneNumberInvalid => 'Masukkan nomor telepon yang valid';

  @override
  String get enterPassword => 'Masukkan kata sandi Anda';

  @override
  String get confirmPassword => 'Konfirmasi Kata Sandi';

  @override
  String get confirmPasswordHint => 'Konfirmasi kata sandi Anda';

  @override
  String get confirmPasswordRequired => 'Harap konfirmasi kata sandi Anda';

  @override
  String get passwordMismatch => 'Kata sandi tidak cocok';

  @override
  String get alreadyHaveAccount => 'Sudah punya akun? ';

  @override
  String get resetPassword => 'Atur Ulang Kata Sandi';

  @override
  String get enterEmailAddress => 'Masukkan alamat email Anda';

  @override
  String get cancel => 'Batal';

  @override
  String get send => 'Kirim';

  @override
  String get resetEmailSent =>
      'Jika akun dengan email tersebut ada, tautan atur ulang telah dikirim.';

  @override
  String get chats => 'Obrolan';

  @override
  String get status => 'Status';

  @override
  String get settings => 'Pengaturan';

  @override
  String get statusComingSoon => 'Status - Segera Hadir!';

  @override
  String get settingsComingSoon => 'Pengaturan — Segera hadir';

  @override
  String get signOut => 'Keluar';

  @override
  String get noConversationYet => 'Belum ada percakapan';

  @override
  String get startNewChat => 'Mulai obrolan baru!';

  @override
  String get pinnedChats => 'Obrolan Disematkan';

  @override
  String get searchFeatureComingSoon => 'Fitur pencarian segera hadir';

  @override
  String get failedToLoadConversation => 'Gagal memuat percakapan';

  @override
  String get newChat => 'Obrolan Baru';

  @override
  String get enterUserUid => 'Masukkan UID pengguna';

  @override
  String get otherUserUid => 'UID Pengguna Lain';

  @override
  String get startChat => 'Mulai Obrolan';

  @override
  String get featureNotReady => 'Fitur belum tersedia';

  @override
  String get typing => 'mengetik...';

  @override
  String versionLabel(String version) {
    return 'v$version';
  }
}
