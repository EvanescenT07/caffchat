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
