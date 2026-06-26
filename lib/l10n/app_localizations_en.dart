// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'CaffChat';

  @override
  String get login => 'Login';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get emailInvalid => 'Enter a valid email address';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordMinLength => 'Password must be at least 6 characters';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get noAccount => 'Don\'t have an account? ';

  @override
  String get register => 'Register';

  @override
  String get createAccount => 'Create Account';

  @override
  String get createAccountButton => 'Create Account →';

  @override
  String get registerSubtitle =>
      'Please provide your name and an\noptional profile photo';

  @override
  String get displayName => 'Display Name';

  @override
  String get enterYourName => 'Enter your name';

  @override
  String get displayNameRequired => 'Display name is required';

  @override
  String get displayNameMinLength => 'Name must be at least 3 characters';

  @override
  String get emailAddress => 'Email Address';

  @override
  String get emailHint => 'example@email.com';

  @override
  String get phoneNumberOptional => 'Phone Number (Optional)';

  @override
  String get phoneNumberHint => '+62 812 3456 7890';

  @override
  String get phoneNumberInvalid => 'Enter a valid phone number';

  @override
  String get enterPassword => 'Enter your password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get confirmPasswordHint => 'Confirm your password';

  @override
  String get confirmPasswordRequired => 'Please confirm your password';

  @override
  String get passwordMismatch => 'Passwords do not match';

  @override
  String get alreadyHaveAccount => 'Already have an account? ';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get enterEmailAddress => 'Enter your email address';

  @override
  String get cancel => 'Cancel';

  @override
  String get send => 'Send';

  @override
  String get resetEmailSent =>
      'If an account exists with that email, a reset link has been sent.';

  @override
  String get chats => 'Chats';

  @override
  String get status => 'Status';

  @override
  String get settings => 'Settings';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get changePassword => 'Change Password';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get about => 'About';

  @override
  String get account => 'Account';

  @override
  String get preferences => 'Preferences';

  @override
  String get dangerZone => 'Danger Zone';

  @override
  String get signOutConfirmTitle => 'Sign Out';

  @override
  String get signOutConfirmMessage => 'Are you sure you want to sign out?';

  @override
  String get confirm => 'Confirm';

  @override
  String get fullName => 'Full Name';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get changePhoto => 'Change Photo';

  @override
  String get profileUpdated => 'Profile updated successfully';

  @override
  String get profileUpdateFailed => 'Failed to update profile';

  @override
  String get discoverableByPhone => 'Discoverable by Phone Number';

  @override
  String get discoverableByPhoneSubtitle =>
      'Allow other users to find you by phone number';

  @override
  String get currentPassword => 'Current Password';

  @override
  String get newPassword => 'New Password';

  @override
  String get confirmNewPassword => 'Confirm New Password';

  @override
  String get updatePassword => 'Update Password';

  @override
  String get passwordUpdated => 'Password updated successfully';

  @override
  String get passwordUpdateFailed => 'Failed to update password';

  @override
  String get currentPasswordRequired => 'Current password is required';

  @override
  String get newPasswordRequired => 'New password is required';

  @override
  String get newPasswordMinLength =>
      'New password must be at least 6 characters';

  @override
  String get newPasswordMismatch => 'New passwords do not match';

  @override
  String get enterPhoneNumber => 'Enter phone number';

  @override
  String get searchByPhone => 'Search by Phone Number';

  @override
  String get noUserFoundWithPhone => 'No user found with this phone number';

  @override
  String get searchChats => 'Search chats...';

  @override
  String get noMatchingChats => 'No matching chats';

  @override
  String get english => 'English';

  @override
  String get indonesian => 'Indonesian';

  @override
  String get lightTheme => 'Light';

  @override
  String get darkTheme => 'Dark';

  @override
  String get systemTheme => 'System';

  @override
  String get statusComingSoon => 'Status - Coming Soon!';

  @override
  String get settingsComingSoon => 'Settings — Coming soon';

  @override
  String get signOut => 'Sign Out';

  @override
  String get noConversationYet => 'No Conversation yet';

  @override
  String get startNewChat => 'Start a new chat!';

  @override
  String get pinnedChats => 'Pinned Chats';

  @override
  String get searchFeatureComingSoon => 'Search feature coming soon';

  @override
  String get failedToLoadConversation => 'Failed to load conversation';

  @override
  String get newChat => 'New Chat';

  @override
  String get enterUserUid => 'Enter user UID';

  @override
  String get otherUserUid => 'Other User UID';

  @override
  String get startChat => 'Start Chat';

  @override
  String get featureNotReady => 'Feature not ready yet';

  @override
  String get typing => 'typing...';

  @override
  String versionLabel(String version) {
    return 'v$version';
  }
}
