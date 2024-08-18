
/*
 * Generated file. Do not edit.
 *
 * Locales: 16
 * Strings: 4768 (298.0 per locale)
 *
 * Built on 2024-08-18 at 09:12 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.en;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale {
	en, // 'en' (base locale, fallback)
	bn, // 'bn'
	dz, // 'dz'
	es, // 'es'
	fr, // 'fr'
	hi, // 'hi'
	id, // 'id'
	kn, // 'kn'
	mr, // 'mr'
	ne, // 'ne'
	or, // 'or'
	pa, // 'pa'
	pt, // 'pt'
	ta, // 'ta'
	te, // 'te'
	ur, // 'ur'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn _t = _currLocale.translations;
_StringsEn get t => _t;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale useDeviceLocale() {
		final locale = AppLocaleUtils.findDeviceLocale();
		return setLocale(locale);
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_t = _currLocale.translations;

		// force rebuild if TranslationProvider is used
		_translationProviderKey.currentState?.setLocale(_currLocale);

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String rawLocale) {
		final locale = AppLocaleUtils.parse(rawLocale);
		return setLocale(locale);
	}

	/// Gets current locale.
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
	AppLocaleUtils._(); // no constructor

	/// Returns the locale of the device as the enum type.
	/// Fallbacks to base locale.
	static AppLocale findDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			final typedLocale = _selectLocale(deviceLocale);
			if (typedLocale != null) {
				return typedLocale;
			}
		}
		return _baseLocale;
	}

	/// Returns the enum type of the raw locale.
	/// Fallbacks to base locale.
	static AppLocale parse(String rawLocale) {
		return _selectLocale(rawLocale) ?? _baseLocale;
	}
}

// context enums

// interfaces generated as mixins

// translation instances

late _StringsEn _translationsEn = _StringsEn.build();
late _StringsBn _translationsBn = _StringsBn.build();
late _StringsDz _translationsDz = _StringsDz.build();
late _StringsEs _translationsEs = _StringsEs.build();
late _StringsFr _translationsFr = _StringsFr.build();
late _StringsHi _translationsHi = _StringsHi.build();
late _StringsId _translationsId = _StringsId.build();
late _StringsKn _translationsKn = _StringsKn.build();
late _StringsMr _translationsMr = _StringsMr.build();
late _StringsNe _translationsNe = _StringsNe.build();
late _StringsOr _translationsOr = _StringsOr.build();
late _StringsPa _translationsPa = _StringsPa.build();
late _StringsPt _translationsPt = _StringsPt.build();
late _StringsTa _translationsTa = _StringsTa.build();
late _StringsTe _translationsTe = _StringsTe.build();
late _StringsUr _translationsUr = _StringsUr.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
			case AppLocale.bn: return _translationsBn;
			case AppLocale.dz: return _translationsDz;
			case AppLocale.es: return _translationsEs;
			case AppLocale.fr: return _translationsFr;
			case AppLocale.hi: return _translationsHi;
			case AppLocale.id: return _translationsId;
			case AppLocale.kn: return _translationsKn;
			case AppLocale.mr: return _translationsMr;
			case AppLocale.ne: return _translationsNe;
			case AppLocale.or: return _translationsOr;
			case AppLocale.pa: return _translationsPa;
			case AppLocale.pt: return _translationsPt;
			case AppLocale.ta: return _translationsTa;
			case AppLocale.te: return _translationsTe;
			case AppLocale.ur: return _translationsUr;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.en.build(); // build
	/// String a = t.my.path; // access
	_StringsEn build() {
		switch (this) {
			case AppLocale.en: return _StringsEn.build();
			case AppLocale.bn: return _StringsBn.build();
			case AppLocale.dz: return _StringsDz.build();
			case AppLocale.es: return _StringsEs.build();
			case AppLocale.fr: return _StringsFr.build();
			case AppLocale.hi: return _StringsHi.build();
			case AppLocale.id: return _StringsId.build();
			case AppLocale.kn: return _StringsKn.build();
			case AppLocale.mr: return _StringsMr.build();
			case AppLocale.ne: return _StringsNe.build();
			case AppLocale.or: return _StringsOr.build();
			case AppLocale.pa: return _StringsPa.build();
			case AppLocale.pt: return _StringsPt.build();
			case AppLocale.ta: return _StringsTa.build();
			case AppLocale.te: return _StringsTe.build();
			case AppLocale.ur: return _StringsUr.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.bn: return 'bn';
			case AppLocale.dz: return 'dz';
			case AppLocale.es: return 'es';
			case AppLocale.fr: return 'fr';
			case AppLocale.hi: return 'hi';
			case AppLocale.id: return 'id';
			case AppLocale.kn: return 'kn';
			case AppLocale.mr: return 'mr';
			case AppLocale.ne: return 'ne';
			case AppLocale.or: return 'or';
			case AppLocale.pa: return 'pa';
			case AppLocale.pt: return 'pt';
			case AppLocale.ta: return 'ta';
			case AppLocale.te: return 'te';
			case AppLocale.ur: return 'ur';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.bn: return const Locale.fromSubtags(languageCode: 'bn');
			case AppLocale.dz: return const Locale.fromSubtags(languageCode: 'dz');
			case AppLocale.es: return const Locale.fromSubtags(languageCode: 'es');
			case AppLocale.fr: return const Locale.fromSubtags(languageCode: 'fr');
			case AppLocale.hi: return const Locale.fromSubtags(languageCode: 'hi');
			case AppLocale.id: return const Locale.fromSubtags(languageCode: 'id');
			case AppLocale.kn: return const Locale.fromSubtags(languageCode: 'kn');
			case AppLocale.mr: return const Locale.fromSubtags(languageCode: 'mr');
			case AppLocale.ne: return const Locale.fromSubtags(languageCode: 'ne');
			case AppLocale.or: return const Locale.fromSubtags(languageCode: 'or');
			case AppLocale.pa: return const Locale.fromSubtags(languageCode: 'pa');
			case AppLocale.pt: return const Locale.fromSubtags(languageCode: 'pt');
			case AppLocale.ta: return const Locale.fromSubtags(languageCode: 'ta');
			case AppLocale.te: return const Locale.fromSubtags(languageCode: 'te');
			case AppLocale.ur: return const Locale.fromSubtags(languageCode: 'ur');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'bn': return AppLocale.bn;
			case 'dz': return AppLocale.dz;
			case 'es': return AppLocale.es;
			case 'fr': return AppLocale.fr;
			case 'hi': return AppLocale.hi;
			case 'id': return AppLocale.id;
			case 'kn': return AppLocale.kn;
			case 'mr': return AppLocale.mr;
			case 'ne': return AppLocale.ne;
			case 'or': return AppLocale.or;
			case 'pa': return AppLocale.pa;
			case 'pt': return AppLocale.pt;
			case 'ta': return AppLocale.ta;
			case 'te': return AppLocale.te;
			case 'ur': return AppLocale.ur;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _StringsEn translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

// Path: <root>
class _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build();

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	String get appname => 'VirtualPastor';
	String get selectlanguage => 'selectLanguage';
	String get deletemyaccount => 'Delete my account';
	String get deleteaccount => 'Delete my account';
	String get deleteaccounthint => 'This action will delete your account and remove all your data, once your data is deleted, it cannot be recovered.';
	String get deleteaccountsuccess => 'Account deletion was succesful';
	String get chooseapplanguage => 'Choose App Language';
	String get nightmode => 'Night Mode';
	String get initializingapp => 'initializing...';
	String get home => 'Home';
	String get branches => 'Branches';
	String get inbox => 'Inbox';
	String get downloads => 'Downloads';
	String get settings => 'Settings';
	String get events => 'Events';
	String get myplaylists => 'My Playlists';
	String get website => 'Website';
	String get hymns => 'Hymns';
	String get articles => 'Articles';
	String get notes => 'Notes';
	String get donate => 'Donate';
	String get offering => 'Offering';
	String get savenotetitle => 'Note Title';
	String get nonotesfound => 'No notes found';
	String get newnote => 'New';
	String get deletenote => 'Delete Note';
	String get deletenotehint => 'Do you want to delete this note? This action cannot be reversed.';
	String get bookmarks => 'Bookmarks';
	String get socialplatforms => 'Social Platforms';
	List<String> get onboardingpagetitles => [
		'Welcome to MyChurch',
		'Packed with Features',
		'Audio, Video \n and Live Streaming',
		'Create Account',
	];
	List<String> get onboardingpagehints => [
		'Extend beyond the Sunday mornings &amp; the four walls of your church. Everything you need to communicate and engage with a mobile-focused world.',
		'We have brought together all of the top features that your church app must have. Events, Devotionals, Notifications, Notes and multi-version bible.',
		'Allow users across the globe watch videos, listen to audio messages and watch live streams of your church services.',
		'Start your journey to a never-ending worship experience.',
	];
	String get next => 'NEXT';
	String get done => 'Get Started';
	String get quitapp => 'Quit App!';
	String get quitappwarning => 'Do you wish to close the app?';
	String get quitappaudiowarning => 'You are currently playing an audio, quitting the app will stop the audio playback. If you do not wish to stop playback, just minimize the app with the center button or click the Ok button to quit app now.';
	String get ok => 'Ok';
	String get retry => 'RETRY';
	String get oops => 'Ooops!';
	String get save => 'Save';
	String get cancel => 'Cancel';
	String get error => 'Error';
	String get success => 'Success';
	String get skip => 'Skip';
	String get skiplogin => 'Skip Login';
	String get skipregister => 'Skip Registration';
	String get dataloaderror => 'Could not load requested data at the moment, check your data connection and click to retry.';
	String get suggestedforyou => 'Suggested for you';
	String get videomessages => 'Video Messages';
	String get audiomessages => 'Audio Messages';
	String get devotionals => 'Devotionals';
	String get categories => 'Categories';
	String get category => 'Category';
	String get videos => 'Videos';
	String get audios => 'Audios';
	String get biblebooks => 'Bible';
	String get sermons => 'Sermons';
	String get tools => 'Tools';
	String get profile => 'Profile';
	String get audiobible => 'Audio Bible';
	String get homesentence => 'Your Pastor for a Year: Helping You Grow into Your Calling';
	String get livestreams => 'Livestreams';
	String get radio => 'Radio';
	String get allitems => 'All Items';
	String get emptyplaylist => 'No Playlists';
	String get notsupported => 'Not Supported';
	String get cleanupresources => 'Cleaning up resources';
	String get grantstoragepermission => 'Please grant accessing storage permission to continue';
	String get sharefiletitle => 'Watch or Listen to ';
	String get sharefilebody => 'Via MyVirtualPastor App, Download now at ';
	String get sharetext => 'Enjoy unlimited Audio & Video streaming';
	String get sharetexthint => 'Join the Video and Audio streaming platform that lets you watch and listen to millions of files from around the world. Download now at';
	String get download => 'Download';
	String get addplaylist => 'Add to playlist';
	String get bookmark => 'Bookmark';
	String get unbookmark => 'UnBookmark';
	String get share => 'Share';
	String get deletemedia => 'Delete File';
	String get deletemediahint => 'Do you wish to delete this downloaded file? This action cannot be undone.';
	String get searchhint => 'Search Audio & Video Messages';
	String get performingsearch => 'Searching Audios and Videos';
	String get nosearchresult => 'No results Found';
	String get nosearchresulthint => 'Try input more general keyword';
	String get addtoplaylist => 'Add to playlist';
	String get newplaylist => 'New playlist';
	String get playlistitm => 'Playlist';
	String get mediaaddedtoplaylist => 'Media added to playlist.';
	String get mediaremovedfromplaylist => 'Media removed from playlist';
	String get clearplaylistmedias => 'Clear All Media';
	String get deletePlayList => 'Delete Playlist';
	String get clearplaylistmediashint => 'Go ahead and remove all media from this playlist?';
	String get deletePlayListhint => 'Go ahead and delete this playlist and clear all media?';
	String get comments => 'Comments';
	String get replies => 'Replies';
	String get reply => 'Reply';
	String get logintoaddcomment => 'Login to add a comment';
	String get logintoreply => 'Login to reply';
	String get writeamessage => 'Write a message...';
	String get nocomments => 'No Comments found \nclick to retry';
	String get errormakingcomments => 'Cannot process commenting at the moment..';
	String get errordeletingcomments => 'Cannot delete this comment at the moment..';
	String get erroreditingcomments => 'Cannot edit this comment at the moment..';
	String get errorloadingmorecomments => 'Cannot load more comments at the moment..';
	String get deletingcomment => 'Deleting comment';
	String get editingcomment => 'Editing comment';
	String get deletecommentalert => 'Delete Comment';
	String get editcommentalert => 'Edit Comment';
	String get deletecommentalerttext => 'Do you wish to delete this comment? This action cannot be undone';
	String get loadmore => 'load more';
	String get messages => 'Messages';
	String get guestuser => 'Guest User';
	String get fullname => 'Full Name';
	String get emailaddress => 'Email Address';
	String get password => 'Password';
	String get repeatpassword => 'Repeat Password';
	String get register => 'Register';
	String get login => 'Login';
	String get logout => 'Logout';
	String get logoutfromapp => 'Logout from app?';
	String get logoutfromapphint => 'You wont be able to like or comment on articles and videos if you are not logged in.';
	String get gotologin => 'Go to Login';
	String get resetpassword => 'Reset Password';
	String get logintoaccount => 'Already have an account? Login';
	String get emptyfielderrorhint => 'You need to fill all the fields';
	String get invalidemailerrorhint => 'You need to enter a valid email address';
	String get passwordsdontmatch => 'Passwords dont match';
	String get processingpleasewait => 'Processing, Please wait...';
	String get createaccount => 'Create an account';
	String get forgotpassword => 'Forgot Password?';
	String get orloginwith => 'Or Login With';
	String get facebook => 'Facebook';
	String get google => 'Google';
	String get moreoptions => 'More Options';
	String get about => 'About Us';
	String get privacy => 'Privacy Policy';
	String get terms => 'App Terms';
	String get rate => 'Rate App';
	String get version => 'Version';
	String get pulluploadmore => 'pull up load';
	String get loadfailedretry => 'Load Failed!Click retry!';
	String get releaseloadmore => 'release to load more';
	String get nomoredata => 'No more Data';
	String get errorReportingComment => 'Error Reporting Comment';
	String get reportingComment => 'Reporting Comment';
	String get reportcomment => 'Report Options';
	List<String> get reportCommentsList => [
		'Unwanted commercial content or spam',
		'Pornography or sexual explicit material',
		'Hate speech or graphic violence',
		'Harassment or bullying',
	];
	String get bookmarksMedia => 'My Bookmarks';
	String get noitemstodisplay => 'No Items To Display';
	String get loginrequired => 'Login Required';
	String get loginrequiredhint => 'To subscribe on this platform, you need to be logged in. Create a free account now or log in to your existing account.';
	String get subscriptions => 'App Subscriptions';
	String get subscribe => 'SUBSCRIBE';
	String get subscribehint => 'Subscription Required';
	String get playsubscriptionrequiredhint => 'You need to subscribe before you can listen to or watch this media.';
	String get previewsubscriptionrequiredhint => 'You have reached the allowed preview duration for this media. You need to subscribe to continue listening or watching this media.';
	String get copiedtoclipboard => 'Copied to clipboard';
	String get downloadbible => 'Download Bible';
	String get downloadversion => 'Download';
	String get downloading => 'Downloading';
	String get failedtodownload => 'Failed to download';
	String get pleaseclicktoretry => 'Please click to retry.';
	String get of => 'Of';
	String get nobibleversionshint => 'There is no bible data to display, click on the button below to download atleast one bible version.';
	String get downloaded => 'Downloaded';
	String get enteremailaddresstoresetpassword => 'Enter your email to reset your password';
	String get backtologin => 'BACK TO LOGIN';
	String get signintocontinue => 'Sign in to continue';
	String get signin => 'S I G N  I N';
	String get signinforanaccount => 'SIGN UP FOR AN ACCOUNT?';
	String get alreadyhaveanaccount => 'Already have an account?';
	String get updateprofile => 'Update Profile';
	String get updateprofilehint => 'To get started, please update your profile page, this will help us in connecting you with other people';
	String get autoplayvideos => 'AutoPlay Videos';
	String get gosocial => 'Go Social';
	String get searchbible => 'Search Bible';
	String get filtersearchoptions => 'Filter Search Options';
	String get narrowdownsearch => 'Use the filter button below to narrow down search for a more precise result.';
	String get searchbibleversion => 'Search Bible Version';
	String get searchbiblebook => 'Search Bible Book';
	String get search => 'Search';
	String get setBibleBook => 'Set Bible Book';
	String get oldtestament => 'Old Testament';
	String get newtestament => 'New Testament';
	String get limitresults => 'Limit Results';
	String get setfilters => 'Set Filters';
	String get bibletranslator => 'Bible Translator';
	String get chapter => ' Chapter ';
	String get verse => ' Verse ';
	String get translate => 'translate';
	String get bibledownloadinfo => 'Bible Download started, Please do not close this page until the download is done.';
	String get received => 'received';
	String get outoftotal => 'out of total';
	String get set => 'SET';
	String get selectColor => 'Select Color';
	String get switchbibleversion => 'Switch Bible Version';
	String get switchbiblebook => 'Switch Bible Book';
	String get gotosearch => 'Go to Chapter';
	String get changefontsize => 'Change Font Size';
	String get font => 'Font';
	String get readchapter => 'Read Chapter';
	String get showhighlightedverse => 'Show Highlighted Verses';
	String get downloadmoreversions => 'Download more versions';
	String get suggestedusers => 'Suggested users to follow';
	String get unfollow => 'UnFollow';
	String get follow => 'Follow';
	String get searchforpeople => 'Search for people';
	String get viewpost => 'View Post';
	String get viewprofile => 'View Profile';
	String get mypins => 'My Pins';
	String get viewpinnedposts => 'View Pinned Posts';
	String get personal => 'Personal';
	String get update => 'Update';
	String get phonenumber => 'Phone Number';
	String get showmyphonenumber => 'Show my phone number to users';
	String get dateofbirth => 'Date of Birth';
	String get showmyfulldateofbirth => 'Show my full date of birth to people viewing my status';
	String get notifications => 'Notifications';
	String get notifywhenuserfollowsme => 'Notify me when a user follows me';
	String get notifymewhenusercommentsonmypost => 'Notify me when users comment on my post';
	String get notifymewhenuserlikesmypost => 'Notify me when users like my post';
	String get churchsocial => 'Church Social';
	String get shareyourthoughts => 'Share your thoughts';
	String get readmore => '...Read more';
	String get less => ' Less';
	String get couldnotprocess => 'Could not process requested action.';
	String get pleaseselectprofilephoto => 'Please select a profile photo to upload';
	String get pleaseselectprofilecover => 'Please select a cover photo to upload';
	String get updateprofileerrorhint => 'You need to fill your name, date of birth, gender, phone and location before you can proceed.';
	String get gender => 'Gender';
	String get male => 'Male';
	String get female => 'Female';
	String get dob => 'Date Of Birth';
	String get location => 'Current Location';
	String get qualification => 'Qualification';
	String get aboutme => 'About Me';
	String get facebookprofilelink => 'Facebook Profile Link';
	String get twitterprofilelink => 'Twitter Profile Link';
	String get linkdln => 'Linkedln Profile Link';
	String get likes => 'Likes';
	String get likess => 'Like(s)';
	String get pinnedposts => 'My Pinned Posts';
	String get unpinpost => 'Unpin Post';
	String get unpinposthint => 'Do you wish to remove this post from your pinned posts?';
	String get postdetails => 'Post Details';
	String get posts => 'Posts';
	String get followers => 'Followers';
	String get followings => 'Followings';
	String get my => 'My';
	String get edit => 'Edit';
	String get delete => 'Delete';
	String get deletepost => 'Delete Post';
	String get deleteposthint => 'Do you wish to delete this post? Posts can still appear on some users feeds.';
	String get maximumallowedsizehint => 'Maximum allowed file upload reached';
	String get maximumuploadsizehint => 'The selected file exceeds the allowed upload file size limit.';
	String get makeposterror => 'Unable to make post at the moment, please click to retry.';
	String get makepost => 'Make Post';
	String get selectfile => 'Select File';
	String get images => 'Images';
	String get shareYourThoughtsNow => 'Share your thoughts ...';
	String get photoviewer => 'Photo Viewer';
	String get nochatsavailable => 'No Conversations available \n Click the add icon below \nto select users to chat with';
	String get typing => 'Typing...';
	String get photo => 'Photo';
	String get online => 'Online';
	String get offline => 'Offline';
	String get lastseen => 'Last Seen';
	String get deleteselectedhint => 'This action will delete the selected messages.  Please note that this only deletes your side of the conversation, \n the messages will still show on your partners device.';
	String get deleteselected => 'Delete selected';
	String get unabletofetchconversation => 'Unable to Fetch \nyour conversation with \n';
	String get loadmoreconversation => 'Load more conversations';
	String get sendyourfirstmessage => 'Send your first message to \n';
	String get unblock => 'Unblock ';
	String get block => 'Block';
	String get writeyourmessage => 'Write your message...';
	String get clearconversation => 'Clear Conversation';
	String get clearconversationhintone => 'This action will clear all your conversation with ';
	String get clearconversationhinttwo => '.\n  Please note that this only deletes your side of the conversation, the messages will still show on your partners chat.';
	String get facebookloginerror => 'Something went wrong with the login process.\n, Here is the error Facebook gave us';
	String get selectLanguage => 'Select Language';
	String get howTo => 'How To';
	String get noBibleTextsAvailable => 'No Bible texts available';
	String get languages => 'Languages';
	String get searchLanguages => 'Search languages...';
	String get biblesFilesets => 'Bibles: {bibles}, Filesets: {filesets}';
	String get oldTestament => 'Old Testament';
	String get newTestament => 'New Testament';
	String get play => 'play';
	String get no_verse_content => 'No Bible verse content available to display.';
	String get no_audio_content => 'No Bible Audio content available to display.';
}

// Path: <root>
class _StringsBn implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsBn.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsBn _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'মাই ভার্চুয়াল পাস্টর';
	@override String get selectlanguage => 'ভাষা নির্বাচন করুন';
	@override String get deletemyaccount => 'আমার অ্যাকাউন্ট মুছুন';
	@override String get deleteaccount => 'আমার অ্যাকাউন্ট মুছুন';
	@override String get deleteaccounthint => 'এই পদক্ষেপটি আপনার অ্যাকাউন্ট মুছে ফেলবে এবং আপনার সমস্ত ডেটা সরিয়ে দেবে, একবার আপনার ডেটা মুছে ফেলা হলে, এটি পুনরুদ্ধার করা যাবে না।';
	@override String get deleteaccountsuccess => 'অ্যাকাউন্ট মুছে ফেলা সফল হয়েছে';
	@override String get chooseapplanguage => 'অ্যাপ ভাষা নির্বাচন করুন';
	@override String get nightmode => 'নাইট মোড';
	@override String get initializingapp => 'প্রারম্ভিক করা হচ্ছে...';
	@override String get home => 'বাড়ি';
	@override String get branches => 'শাখা';
	@override String get inbox => 'ইনবক্স';
	@override String get downloads => 'ডাউনলোড';
	@override String get settings => 'সেটিংস';
	@override String get events => 'ইভেন্টস';
	@override String get myplaylists => 'আমার প্লেলিস্ট';
	@override String get website => 'ওয়েবসাইট';
	@override String get hymns => 'ভজন';
	@override String get articles => 'প্রবন্ধ';
	@override String get notes => 'নোট';
	@override String get donate => 'দান করুন';
	@override String get offering => 'অফারিং';
	@override String get savenotetitle => 'নোট শিরোনাম সংরক্ষণ করুন';
	@override String get nonotesfound => 'কোন নোট পাওয়া যায়নি';
	@override String get newnote => 'নতুন';
	@override String get deletenote => 'নোট মুছুন';
	@override String get deletenotehint => 'আপনি কি এই নোটটি মুছতে চান? এই পদক্ষেপটি উল্টানো যাবে না।';
	@override String get bookmarks => 'বুকমার্কস';
	@override String get socialplatforms => 'সামাজিক প্ল্যাটফর্ম';
	@override List<String> get onboardingpagetitles => [
		'আমাদের চার্চে স্বাগতম',
		'বৈশিষ্ট্য সমৃদ্ধ',
		'অডিও, ভিডিও \n এবং লাইভ স্ট্রিমিং',
		'অ্যাকাউন্ট তৈরি করুন',
	];
	@override List<String> get onboardingpagehints => [
		'রবিবারের সকালে এবং আপনার চার্চের চার দেয়ালের বাইরেও প্রসারিত করুন। একটি মোবাইল-কেন্দ্রিক বিশ্বে যোগাযোগ ও সম্পৃক্ততা বজায় রাখতে যা কিছু দরকার তা সবই এখানে।',
		'আমরা সব শীর্ষ বৈশিষ্ট্যগুলি একত্রিত করেছি যা আপনার চার্চ অ্যাপে থাকা উচিত। ইভেন্টস, ডিভোশনালস, নোটিফিকেশনস, নোট এবং বহু সংস্করণ বাইবেল।',
		'ব্যবহারকারীরা সারা বিশ্ব থেকে ভিডিও দেখুন, অডিও বার্তা শুনুন এবং আপনার চার্চ পরিষেবার লাইভ স্ট্রিম দেখুন।',
		'একটি অন্তহীন উপাসনা অভিজ্ঞতার পথে আপনার যাত্রা শুরু করুন।',
	];
	@override String get next => 'পরবর্তী';
	@override String get done => 'শুরু করুন';
	@override String get quitapp => 'অ্যাপ বন্ধ করুন!';
	@override String get quitappwarning => 'আপনি কি অ্যাপ বন্ধ করতে চান?';
	@override String get quitappaudiowarning => 'আপনি বর্তমানে একটি অডিও প্লে করছেন, অ্যাপ বন্ধ করলে অডিও প্লেব্যাক বন্ধ হবে। যদি আপনি প্লেব্যাক বন্ধ করতে না চান, তবে কেন্দ্রীয় বোতাম দিয়ে অ্যাপটি মিনিমাইজ করুন বা এখন অ্যাপ বন্ধ করতে ঠিক বোতামটি ক্লিক করুন।';
	@override String get ok => 'ঠিক আছে';
	@override String get retry => 'পুনরায় চেষ্টা করুন';
	@override String get oops => 'ওপ্স!';
	@override String get save => 'সংরক্ষণ করুন';
	@override String get cancel => 'বাতিল করুন';
	@override String get error => 'ত্রুটি';
	@override String get success => 'সাফল্য';
	@override String get skip => 'এড়িয়ে যান';
	@override String get skiplogin => 'লগইন এড়িয়ে যান';
	@override String get skipregister => 'নিবন্ধন এড়িয়ে যান';
	@override String get dataloaderror => 'এই মুহূর্তে অনুরোধকৃত ডেটা লোড করতে পারিনি, আপনার ডেটা সংযোগ পরীক্ষা করুন এবং পুনরায় চেষ্টা করতে ক্লিক করুন।';
	@override String get suggestedforyou => 'আপনার জন্য সুপারিশকৃত';
	@override String get videomessages => 'ভিডিও বার্তা';
	@override String get audiomessages => 'অডিও বার্তা';
	@override String get devotionals => 'ভক্তিমূলক';
	@override String get categories => 'বিভাগ';
	@override String get category => 'বিভাগ';
	@override String get videos => 'ভিডিও';
	@override String get audios => 'অডিও';
	@override String get biblebooks => 'বাইবেল';
	@override String get sermons => 'ধর্মোপদেশ';
	@override String get tools => 'সরঞ্জাম';
	@override String get profile => 'প্রোফাইল';
	@override String get audiobible => 'অডিও বাইবেল';
	@override String get homesentence => 'আপনার পাস্টর 1 বছরের জন্য, আপনাকে এমন একজন ব্যক্তিতে পরিণত করতে সাহায্য করবে যাকে ঈশ্বর আপনাকে ডাক দিয়েছেন।';
	@override String get livestreams => 'লাইভ স্ট্রিম';
	@override String get radio => 'রেডিও';
	@override String get allitems => 'সব আইটেম';
	@override String get emptyplaylist => 'কোন প্লেলিস্ট নেই';
	@override String get notsupported => 'সমর্থিত নয়';
	@override String get cleanupresources => 'সম্পদগুলি পরিস্কার করা হচ্ছে';
	@override String get grantstoragepermission => 'চালিয়ে যেতে দয়া করে সংরক্ষণ অনুমতি দিন';
	@override String get sharefiletitle => 'দেখুন বা শুনুন ';
	@override String get sharefilebody => 'মাই ভার্চুয়াল পাস্টর অ্যাপ দ্বারা, এখন ডাউনলোড করুন ';
	@override String get sharetext => 'সীমাহীন অডিও ও ভিডিও স্ট্রিমিং উপভোগ করুন';
	@override String get sharetexthint => 'ভিডিও এবং অডিও স্ট্রিমিং প্ল্যাটফর্মে যোগদান করুন যা আপনাকে সারা বিশ্বের লক্ষ লক্ষ ফাইল দেখতে এবং শুনতে দেয়। এখন ডাউনলোড করুন';
	@override String get download => 'ডাউনলোড';
	@override String get addplaylist => 'প্লেলিস্টে যোগ করুন';
	@override String get bookmark => 'বুকমার্ক';
	@override String get unbookmark => 'আনবুকমার্ক';
	@override String get share => 'শেয়ার করুন';
	@override String get deletemedia => 'ফাইল মুছুন';
	@override String get deletemediahint => 'আপনি কি এই ডাউনলোড করা ফাইলটি মুছতে চান? এই পদক্ষেপটি উল্টানো যাবে না।';
	@override String get searchhint => 'অডিও ও ভিডিও বার্তা অনুসন্ধান করুন';
	@override String get performingsearch => 'অডিও এবং ভিডিও অনুসন্ধান করা হচ্ছে';
	@override String get nosearchresult => 'কোন ফলাফল পাওয়া যায়নি';
	@override String get nosearchresulthint => 'আরও সাধারণ কীওয়ার্ড প্রবেশ করার চেষ্টা করুন';
	@override String get addtoplaylist => 'প্লেলিস্টে যোগ করুন';
	@override String get newplaylist => 'নতুন প্লেলিস্ট';
	@override String get playlistitm => 'প্লেলিস্ট';
	@override String get mediaaddedtoplaylist => 'প্লেলিস্টে মিডিয়া যোগ করা হয়েছে।';
	@override String get mediaremovedfromplaylist => 'প্লেলিস্ট থেকে মিডিয়া সরানো হয়েছে';
	@override String get clearplaylistmedias => 'সব মিডিয়া পরিষ্কার করুন';
	@override String get deletePlayList => 'প্লেলিস্ট মুছুন';
	@override String get clearplaylistmediashint => 'এই প্লেলিস্ট থেকে সমস্ত মিডিয়া সরিয়ে ফেলার জন্য এগিয়ে যান?';
	@override String get deletePlayListhint => 'এই প্লেলিস্টটি মুছতে এবং সমস্ত মিডিয়া পরিষ্কার করতে এগিয়ে যান?';
	@override String get comments => 'মন্তব্য';
	@override String get replies => 'প্রতিউত্তর';
	@override String get reply => 'প্রতিউত্তর দিন';
	@override String get logintoaddcomment => 'মন্তব্য যোগ করতে লগইন করুন';
	@override String get logintoreply => 'প্রতিউত্তর দিতে লগইন করুন';
	@override String get writeamessage => 'একটি বার্তা লিখুন...';
	@override String get nocomments => 'কোন মন্তব্য পাওয়া যায়নি \nপুনরায় চেষ্টা করতে ক্লিক করুন';
	@override String get errormakingcomments => 'এই মুহূর্তে মন্তব্য প্রক্রিয়া করতে পারছি না..';
	@override String get errordeletingcomments => 'এই মুহূর্তে এই মন্তব্যটি মুছে ফেলতে পারছি না..';
	@override String get erroreditingcomments => 'এই মুহূর্তে এই মন্তব্যটি সম্পাদনা করতে পারছি না..';
	@override String get errorloadingmorecomments => 'এই মুহূর্তে আরও মন্তব্য লোড করতে পারছি না..';
	@override String get deletingcomment => 'মন্তব্য মুছে ফেলা হচ্ছে';
	@override String get editingcomment => 'মন্তব্য সম্পাদনা করা হচ্ছে';
	@override String get deletecommentalert => 'মন্তব্য মুছুন';
	@override String get editcommentalert => 'মন্তব্য সম্পাদনা করুন';
	@override String get deletecommentalerttext => 'আপনি কি এই মন্তব্যটি মুছতে চান? এই পদক্ষেপটি উল্টানো যাবে না';
	@override String get loadmore => 'আরও লোড করুন';
	@override String get messages => 'বার্তা';
	@override String get guestuser => 'অতিথি ব্যবহারকারী';
	@override String get fullname => 'পূর্ণ নাম';
	@override String get emailaddress => 'ইমেল ঠিকানা';
	@override String get password => 'পাসওয়ার্ড';
	@override String get repeatpassword => 'পাসওয়ার্ড পুনরাবৃত্তি করুন';
	@override String get register => 'নিবন্ধন করুন';
	@override String get login => 'লগইন';
	@override String get logout => 'লগআউট';
	@override String get logoutfromapp => 'অ্যাপ থেকে লগআউট করুন?';
	@override String get logoutfromapphint => 'আপনি যদি লগ ইন না করেন তবে আপনি নিবন্ধ বা ভিডিওতে পছন্দ বা মন্তব্য করতে পারবেন না।';
	@override String get gotologin => 'লগইনে যান';
	@override String get resetpassword => 'পাসওয়ার্ড রিসেট করুন';
	@override String get logintoaccount => 'ইতিমধ্যে একটি অ্যাকাউন্ট আছে? লগইন করুন';
	@override String get emptyfielderrorhint => 'আপনাকে সমস্ত ক্ষেত্র পূরণ করতে হবে';
	@override String get invalidemailerrorhint => 'আপনাকে একটি বৈধ ইমেল ঠিকানা প্রবেশ করতে হবে';
	@override String get passwordsdontmatch => 'পাসওয়ার্ডগুলি মেলে না';
	@override String get processingpleasewait => 'প্রক্রিয়া করা হচ্ছে, অনুগ্রহ করে অপেক্ষা করুন...';
	@override String get createaccount => 'একটি অ্যাকাউন্ট তৈরি করুন';
	@override String get forgotpassword => 'পাসওয়ার্ড ভুলে গেছেন?';
	@override String get orloginwith => 'অথবা লগইন করুন';
	@override String get facebook => 'ফেসবুক';
	@override String get google => 'গুগল';
	@override String get moreoptions => 'আরও বিকল্প';
	@override String get about => 'আমাদের সম্পর্কে';
	@override String get privacy => 'গোপনীয়তা নীতি';
	@override String get terms => 'অ্যাপ শর্তাবলী';
	@override String get rate => 'অ্যাপ রেট করুন';
	@override String get version => 'সংস্করণ';
	@override String get pulluploadmore => 'উপরে টেনে লোড করুন';
	@override String get loadfailedretry => 'লোড ব্যর্থ হয়েছে! পুনরায় চেষ্টা করতে ক্লিক করুন!';
	@override String get releaseloadmore => 'আরও লোড করতে মুক্ত করুন';
	@override String get nomoredata => 'আর কোন ডেটা নেই';
	@override String get errorReportingComment => 'মন্তব্য রিপোর্ট করার ত্রুটি';
	@override String get reportingComment => 'মন্তব্য রিপোর্ট করা হচ্ছে';
	@override String get reportcomment => 'রিপোর্ট বিকল্প';
	@override List<String> get reportCommentsList => [
		'অযাচিত বাণিজ্যিক সামগ্রী বা স্প্যাম',
		'অশ্লীলতা বা যৌন স্পষ্ট সামগ্রী',
		'ঘৃণামূলক বক্তব্য বা গ্রাফিক সহিংসতা',
		'হয়রানি বা বুলিং',
	];
	@override String get bookmarksMedia => 'আমার বুকমার্কস';
	@override String get noitemstodisplay => 'প্রদর্শন করার জন্য কোন আইটেম নেই';
	@override String get loginrequired => 'লগইন প্রয়োজন';
	@override String get loginrequiredhint => 'এই প্ল্যাটফর্মে সদস্যতা নিতে, আপনাকে লগ ইন করতে হবে। এখন একটি বিনামূল্যের অ্যাকাউন্ট তৈরি করুন বা আপনার বিদ্যমান অ্যাকাউন্টে লগ ইন করুন।';
	@override String get subscriptions => 'অ্যাপ সদস্যতা';
	@override String get subscribe => 'সদস্যতা নিন';
	@override String get subscribehint => 'সদস্যতা প্রয়োজন';
	@override String get playsubscriptionrequiredhint => 'এই মিডিয়া শুনতে বা দেখতে হলে আপনাকে সদস্যতা নিতে হবে।';
	@override String get previewsubscriptionrequiredhint => 'এই মিডিয়ার জন্য অনুমোদিত প্রিভিউ সময়সীমা অতিক্রম করেছে। চালিয়ে যেতে আপনাকে সদস্যতা নিতে হবে।';
	@override String get copiedtoclipboard => 'ক্লিপবোর্ডে কপি করা হয়েছে';
	@override String get downloadbible => 'বাইবেল ডাউনলোড করুন';
	@override String get downloadversion => 'ডাউনলোড করুন';
	@override String get downloading => 'ডাউনলোড করা হচ্ছে';
	@override String get failedtodownload => 'ডাউনলোড ব্যর্থ হয়েছে';
	@override String get pleaseclicktoretry => 'পুনরায় চেষ্টা করতে ক্লিক করুন।';
	@override String get of => 'এর';
	@override String get nobibleversionshint => 'প্রদর্শন করার জন্য কোন বাইবেল ডেটা নেই, অন্তত একটি বাইবেল সংস্করণ ডাউনলোড করতে নিচের বোতামে ক্লিক করুন।';
	@override String get downloaded => 'ডাউনলোড করা হয়েছে';
	@override String get enteremailaddresstoresetpassword => 'আপনার পাসওয়ার্ড রিসেট করতে আপনার ইমেল প্রবেশ করুন';
	@override String get backtologin => 'লগইনে ফিরে যান';
	@override String get signintocontinue => 'চালিয়ে যেতে সাইন ইন করুন';
	@override String get signin => 'সাইন ইন করুন';
	@override String get signinforanaccount => 'একটি অ্যাকাউন্টের জন্য সাইন আপ?';
	@override String get alreadyhaveanaccount => 'ইতিমধ্যে একটি অ্যাকাউন্ট আছে?';
	@override String get updateprofile => 'প্রোফাইল আপডেট করুন';
	@override String get updateprofilehint => 'শুরু করতে, অনুগ্রহ করে আপনার প্রোফাইল পৃষ্ঠা আপডেট করুন, এটি আমাদেরকে অন্য লোকেদের সাথে আপনাকে সংযুক্ত করতে সাহায্য করবে';
	@override String get autoplayvideos => 'ভিডিও স্বয়ংক্রিয়ভাবে চালান';
	@override String get gosocial => 'সামাজিক হোন';
	@override String get searchbible => 'বাইবেল অনুসন্ধান করুন';
	@override String get filtersearchoptions => 'অনুসন্ধান বিকল্পগুলি ফিল্টার করুন';
	@override String get narrowdownsearch => 'আরও নির্দিষ্ট ফলাফলের জন্য অনুসন্ধান সংকুচিত করতে নিচের ফিল্টার বোতামটি ব্যবহার করুন।';
	@override String get searchbibleversion => 'বাইবেল সংস্করণ অনুসন্ধান করুন';
	@override String get searchbiblebook => 'বাইবেল বই অনুসন্ধান করুন';
	@override String get search => 'অনুসন্ধান করুন';
	@override String get setBibleBook => 'বাইবেল বই সেট করুন';
	@override String get oldtestament => 'পুরাতন নিয়ম';
	@override String get newtestament => 'নতুন নিয়ম';
	@override String get limitresults => 'ফলাফল সীমাবদ্ধ করুন';
	@override String get setfilters => 'ফিল্টার সেট করুন';
	@override String get bibletranslator => 'বাইবেল অনুবাদক';
	@override String get chapter => ' অধ্যায় ';
	@override String get verse => ' পদ ';
	@override String get translate => 'অনুবাদ';
	@override String get bibledownloadinfo => 'বাইবেল ডাউনলোড শুরু হয়েছে, ডাউনলোড সম্পন্ন না হওয়া পর্যন্ত এই পৃষ্ঠাটি বন্ধ করবেন না।';
	@override String get received => 'প্রাপ্ত';
	@override String get outoftotal => 'মোট থেকে';
	@override String get set => 'সেট';
	@override String get selectColor => 'রং নির্বাচন করুন';
	@override String get switchbibleversion => 'বাইবেল সংস্করণ পরিবর্তন করুন';
	@override String get switchbiblebook => 'বাইবেল বই পরিবর্তন করুন';
	@override String get gotosearch => 'অধ্যায়ে যান';
	@override String get changefontsize => 'ফন্টের আকার পরিবর্তন করুন';
	@override String get font => 'ফন্ট';
	@override String get readchapter => 'অধ্যায় পড়ুন';
	@override String get showhighlightedverse => 'হাইলাইট করা পদগুলি দেখান';
	@override String get downloadmoreversions => 'আরও সংস্করণ ডাউনলোড করুন';
	@override String get suggestedusers => 'অনুসরণ করার জন্য প্রস্তাবিত ব্যবহারকারীরা';
	@override String get unfollow => 'অনুসরণ বন্ধ করুন';
	@override String get follow => 'অনুসরণ করুন';
	@override String get searchforpeople => 'মানুষের জন্য অনুসন্ধান করুন';
	@override String get viewpost => 'পোস্ট দেখুন';
	@override String get viewprofile => 'প্রোফাইল দেখুন';
	@override String get mypins => 'আমার পিন';
	@override String get viewpinnedposts => 'পিন করা পোস্টগুলি দেখুন';
	@override String get personal => 'ব্যক্তিগত';
	@override String get update => 'আপডেট';
	@override String get phonenumber => 'ফোন নম্বর';
	@override String get showmyphonenumber => 'ব্যবহারকারীদের কাছে আমার ফোন নম্বর দেখান';
	@override String get dateofbirth => 'জন্ম তারিখ';
	@override String get showmyfulldateofbirth => 'আমার স্থিতি দেখার জন্য আমার পূর্ণ জন্ম তারিখ দেখান';
	@override String get notifications => 'বিজ্ঞপ্তি';
	@override String get notifywhenuserfollowsme => 'যখন একজন ব্যবহারকারী আমাকে অনুসরণ করে তখন আমাকে জানাতে দিন';
	@override String get notifymewhenusercommentsonmypost => 'যখন ব্যবহারকারীরা আমার পোস্টে মন্তব্য করে তখন আমাকে জানাতে দিন';
	@override String get notifymewhenuserlikesmypost => 'যখন ব্যবহারকারীরা আমার পোস্টে লাইক দেয় তখন আমাকে জানাতে দিন';
	@override String get churchsocial => 'চার্চ সোশ্যাল';
	@override String get shareyourthoughts => 'আপনার চিন্তা শেয়ার করুন';
	@override String get readmore => '...আরও পড়ুন';
	@override String get less => ' কম';
	@override String get couldnotprocess => 'অনুরোধকৃত পদক্ষেপ প্রক্রিয়া করতে পারিনি।';
	@override String get pleaseselectprofilephoto => 'আপলোড করার জন্য একটি প্রোফাইল ফটো নির্বাচন করুন';
	@override String get pleaseselectprofilecover => 'আপলোড করার জন্য একটি কভার ফটো নির্বাচন করুন';
	@override String get updateprofileerrorhint => 'আপনার নাম, জন্ম তারিখ, লিঙ্গ, ফোন এবং অবস্থান পূরণ করতে হবে আগে আপনি এগিয়ে যেতে পারেন।';
	@override String get gender => 'লিঙ্গ';
	@override String get male => 'পুরুষ';
	@override String get female => 'মহিলা';
	@override String get dob => 'জন্ম তারিখ';
	@override String get location => 'বর্তমান অবস্থান';
	@override String get qualification => 'যোগ্যতা';
	@override String get aboutme => 'আমার সম্পর্কে';
	@override String get facebookprofilelink => 'ফেসবুক প্রোফাইল লিঙ্ক';
	@override String get twitterprofilelink => 'টুইটার প্রোফাইল লিঙ্ক';
	@override String get linkdln => 'লিংকডইন প্রোফাইল লিঙ্ক';
	@override String get likes => 'লাইক';
	@override String get likess => 'লাইক(গুলি)';
	@override String get pinnedposts => 'আমার পিন করা পোস্টগুলি';
	@override String get unpinpost => 'পোস্ট আনপিন করুন';
	@override String get unpinposthint => 'আপনি কি এই পোস্টটি আপনার পিন করা পোস্টগুলি থেকে সরাতে চান?';
	@override String get postdetails => 'পোস্ট বিবরণ';
	@override String get posts => 'পোস্ট';
	@override String get followers => 'অনুসরণকারীরা';
	@override String get followings => 'অনুসরণকারী';
	@override String get my => 'আমার';
	@override String get edit => 'সম্পাদনা করুন';
	@override String get delete => 'মুছুন';
	@override String get deletepost => 'পোস্ট মুছুন';
	@override String get deleteposthint => 'আপনি কি এই পোস্টটি মুছতে চান? পোস্টগুলি এখনও কিছু ব্যবহারকারীর ফিডে উপস্থিত হতে পারে।';
	@override String get maximumallowedsizehint => 'সর্বাধিক অনুমোদিত ফাইল আপলোডের আকার পৌঁছেছে';
	@override String get maximumuploadsizehint => 'নির্বাচিত ফাইলটি অনুমোদিত আপলোড ফাইলের আকার সীমা অতিক্রম করেছে।';
	@override String get makeposterror => 'এই মুহূর্তে পোস্ট করতে পারছি না, পুনরায় চেষ্টা করতে ক্লিক করুন।';
	@override String get makepost => 'পোস্ট তৈরি করুন';
	@override String get selectfile => 'ফাইল নির্বাচন করুন';
	@override String get images => 'চিত্রগুলি';
	@override String get shareYourThoughtsNow => 'আপনার চিন্তা শেয়ার করুন ...';
	@override String get photoviewer => 'ফটো ভিউয়ার';
	@override String get nochatsavailable => 'কোনও কথোপকথন উপলব্ধ নেই \nনিচের যোগ বোতামটি ক্লিক করুন \nব্যবহারকারীদের সাথে চ্যাট করার জন্য নির্বাচন করতে';
	@override String get typing => 'টাইপ করা হচ্ছে...';
	@override String get photo => 'ফটো';
	@override String get online => 'অনলাইন';
	@override String get offline => 'অফলাইন';
	@override String get lastseen => 'শেষ দেখা';
	@override String get deleteselectedhint => 'এই পদক্ষেপটি নির্বাচিত বার্তাগুলি মুছে ফেলবে। অনুগ্রহ করে লক্ষ্য করুন যে এটি কেবল আপনার কথোপকথনটি মুছে দেয়, \n বার্তাগুলি এখনও আপনার অংশীদারের ডিভাইসে প্রদর্শিত হবে।';
	@override String get deleteselected => 'নির্বাচিত মুছুন';
	@override String get unabletofetchconversation => 'আপনার কথোপকথন আনতে অক্ষম \n';
	@override String get loadmoreconversation => 'আরও কথোপকথন লোড করুন';
	@override String get sendyourfirstmessage => 'আপনার প্রথম বার্তাটি পাঠান \n';
	@override String get unblock => 'আনব্লক ';
	@override String get block => 'ব্লক করুন';
	@override String get writeyourmessage => 'আপনার বার্তা লিখুন...';
	@override String get clearconversation => 'কথোপকথন মুছুন';
	@override String get clearconversationhintone => 'এই পদক্ষেপটি আপনার সাথে সমস্ত কথোপকথন পরিষ্কার করবে ';
	@override String get clearconversationhinttwo => '.\n দয়া করে লক্ষ্য করুন যে এটি কেবল আপনার কথোপকথনটি মুছে দেয়, বার্তাগুলি এখনও আপনার অংশীদারের চ্যাটে প্রদর্শিত হবে।';
	@override String get facebookloginerror => 'লগইন প্রক্রিয়ায় কিছু ভুল হয়েছে।\n, এখানে ফেসবুক আমাদের যা ত্রুটি দিয়েছে';
	@override String get selectLanguage => 'ভাষা নির্বাচন করুন';
	@override String get howTo => 'কিভাবে';
	@override String get noBibleTextsAvailable => 'কোন বাইবেল পাঠ্য উপলব্ধ নয়';
	@override String get languages => 'ভাষাসমূহ';
	@override String get searchLanguages => 'ভাষা অনুসন্ধান করুন...';
	@override String get biblesFilesets => 'বাইবেল: {bibles}, ফাইলসেট: {filesets}';
	@override String get oldTestament => 'পুরাতন নিয়ম';
	@override String get newTestament => 'নতুন নিয়ম';
	@override String get play => 'বাজান';
	@override String get no_verse_content => 'প্রদর্শনের জন্য কোনও বাইবেলের আয়াতের সামগ্রী নেই।';
	@override String get no_audio_content => 'প্রদর্শনের জন্য কোনও বাইবেলের অডিও সামগ্রী নেই।';
}

// Path: <root>
class _StringsDz implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsDz.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsDz _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'ངེད་རིགས་དབང་ཕྱུག་';
	@override String get selectlanguage => 'དྲུང་ལེགས་སྐད་ཡིག་འདེམས་འཐུ་';
	@override String get deletemyaccount => 'ངེད་དངུལ་རྫས་གཏོང་བ་';
	@override String get deleteaccount => 'ངེད་དངུལ་རྫས་གཏོང་བ་';
	@override String get deleteaccounthint => 'འདི་གནོན་བཅུག་བཞག་ནས་རྫས་འཛིན་དངུལ་གཏོང་བ་དང་གཏོང་བའི་དངུལ་རྫས་མཐར་བསྐྲུན་ཡོད་འདུག དེ་རུ་མི་དགོས་པ་བསམ་གཏོང་མེད་མི་རིམ་པ་གི་སྡུད་མཐུན་བཅད་སྒོ་';
	@override String get deleteaccountsuccess => 'དངུལ་རྫས་གཏོང་བ་རོལ་བཞག་';
	@override String get chooseapplanguage => 'དངུལ་རྫས་གཏོང་བའི་སྐད་ཡིག་འདེམས་འཐུ་';
	@override String get nightmode => 'མགུར་འགྱུར་བསྒྱུར་བ་';
	@override String get initializingapp => 'བརྟེན་བཟུང་འབྱོད་འདི་...';
	@override String get home => 'མཚམས་དབྱིབས་';
	@override String get branches => 'ཚགས་གཅིག་';
	@override String get inbox => 'ནང་མངོན་ཐོན་';
	@override String get downloads => 'འབབ་ཡོན་གཏོང་བ་';
	@override String get settings => 'སྒྲིག་བརྡར་';
	@override String get events => 'བརྡ་འཛུགས་';
	@override String get myplaylists => 'ངེད་སྣང་དུས་རིམ་';
	@override String get website => 'དྲི་བཟུང་སྒྲོག་ཚུ་';
	@override String get hymns => 'མུ་གཞས་';
	@override String get articles => 'བྱང་རྩོམ་';
	@override String get notes => 'དྲི་བཟུང་སྒྲོག་ཚུ་';
	@override String get donate => 'དངུལ་རྫས་གཏོང་བ་';
	@override String get offering => 'ཕྱིར་དངུལ་རྫས་གཏོང་བ་';
	@override String get savenotetitle => 'དྲི་བཟུང་གནོད་དེ་གསར་བཟོ་བའི་མགུལ་དོན་';
	@override String get nonotesfound => 'དྲི་བཟུང་མ་རིགས་འཛིན་';
	@override String get newnote => 'གསར་པ་';
	@override String get deletenote => 'དྲི་བཟུང་གཏོང་བ་';
	@override String get deletenotehint => 'དྲི་བཟུང་གཏོང་དགོས་འདུག་ འདི་མ་གནོད་འཛིན་འདེད་སྒྲོག་';
	@override String get bookmarks => 'མིག་ཆུང་';
	@override String get socialplatforms => 'སྤྱིར་བཤད་གཏོང་ཚོད་མེད་';
	@override List<String> get onboardingpagetitles => [
		'ངེད་དབང་ཕྱུག་ལ་དོ་གསར་དོ་',
		'ལེགས་བཅུད་མང་ཚུ་གཏོང་ཚུ་',
		'ཡིན་ལག་རྩོལ་བ་དང་སྒྲོག་ཚུ་ \n དང་མཚམས་དབྱིབས་གཏོང་ཚུ་',
		'ངེད་རྣམས་ལ་བོད་ལྗང་ཁག་སྟེར་བ་',
	];
	@override List<String> get onboardingpagehints => [
		'དོ་གསར་མི་ཚུ་རྣམས་ལ་དྲང་རྒྱན་གསལ་བསྟན་',
		'བརྡ་འཛུགས་དང་བསྟེན་གྲུབ་པ་དང་དྲི་བཟུང་སྒྲོག་དང་བསྟེན་གྲུབ་དང་དུས་རིམ་དང་དུས་རིམ་སྒྲིག་འབེབས་',
		'ཡིན་ལག་རྩོལ་དང་རྒྱུན་བཅངས་གཏོང་གི་དེ་བསྟེན་གྲུབ་',
		'ངེད་རྣམས་གནོན་རྣམ་གསལ་བཟུང་བཞག་མི་ཚུ་གཏོང་ཚུ་',
	];
	@override String get next => 'དུས་གཉིས་མ་';
	@override String get done => 'འབོད་བསྐྲུན་གཏོང་';
	@override String get quitapp => 'བརྡ་འཛུགས་མགུར་འགྱུར་བསྒྱུར་བ་';
	@override String get quitappwarning => 'དྲི་བཟུང་བརྡ་འཛུགས་ནང་མགུར་འགྱུར་བསྒྱུར་བ་སྟེར་བའི་རྣམ་བསྟན་རོལ་བཞག་';
	@override String get quitappaudiowarning => 'དྲི་བཟུང་བརྡ་འཛུགས་བརྟེན་མགུར་འགྱུར་བསྒྱུར་བ་སྟེར་བའི་རྣམ་བསྟན་རོལ་བཞག་';
	@override String get ok => 'ངེད་';
	@override String get retry => 'བསྒྲུབས་བཀོད་';
	@override String get oops => 'འབད་གཏོང་བའི་དྲི་བཟུང་སྒྲོག་སྒྲིག་';
	@override String get save => 'གསར་བཟོ་';
	@override String get cancel => 'འབད་མི་བཏུབ་';
	@override String get error => 'དགག་བསྒྲུབས་སྟེར་';
	@override String get success => 'བརྡ་འཛུགས་སྟེར་';
	@override String get skip => 'མཐུད་འཁོར་འབད་དགོས་';
	@override String get skiplogin => 'དྲི་བཟུང་བརྡ་འཛུགས་འཁོར་འབད་དགོས་';
	@override String get skipregister => 'དྲི་བཟུང་བརྡ་འཛུགས་འཁོར་འབད་དགོས་';
	@override String get dataloaderror => 'འབད་བཏུབ་མ་ཚུ་དྲི་བཟུང་རོལ་བཞག་དུས་རིམ་བཀོད་དང་རྣམ་དགག་བཅད་སྒྲོག་';
	@override String get suggestedforyou => 'མཐུད་བསྟེན་རོལ་བཞག་';
	@override String get videomessages => 'ཡིན་ལག་རྩོལ་བ་གཏོང་';
	@override String get audiomessages => 'དྲི་བཟུང་གཏོང་';
	@override String get devotionals => 'བསྟེན་འབད་དེ་གསར་དུས་རིམ་བཏོན་མཁན་';
	@override String get categories => 'དངུལ་རྫས་';
	@override String get category => 'དངུལ་རྫས་';
	@override String get videos => 'ཡིན་ལག་རྩོལ་';
	@override String get audios => 'ཡིན་ལག་རྩོལ་';
	@override String get biblebooks => 'དངུལ་རྫས་སྟེང་གི་གཏོང་';
	@override String get sermons => 'དངུལ་རྫས་སྟེང་གི་གཏོང་';
	@override String get tools => 'འབད་འགུལ་བསྒྲུབས་སྟེར་';
	@override String get profile => 'རྒྱས་ཚད་';
	@override String get audiobible => 'དངུལ་རྫས་སྟེང་གཏོང་';
	@override String get homesentence => 'ངེད་བཞུགས་འདི་གིས་ཁོམ་དགོན་གཟུང་';
	@override String get livestreams => 'ཡིན་ལག་རྩོལ་གྱི་བསྒྲུབས་';
	@override String get radio => 'རོལ་བཞག་';
	@override String get allitems => 'མང་སྣང་';
	@override String get emptyplaylist => 'དངུལ་རྫས་སྟེང་མཐུད་སྒྲིག་གཏོང་';
	@override String get notsupported => 'དགག་བསྒྲུབས་སྟེར་';
	@override String get cleanupresources => 'འབད་མི་བཏུབ་དྲི་བཟུང་དྲི་བཟུང་གཏོང་';
	@override String get grantstoragepermission => 'དྲི་བཟུང་གཏོང་སྒྲིག་རིམ་བཟུགས་';
	@override String get sharefiletitle => 'ཡིན་ལག་རྩོལ་གཏོང་ ';
	@override String get sharefilebody => 'དངུལ་རྫས་སྟེང་གི་གཏོང་ ';
	@override String get sharetext => 'འབད་མི་བཏུབ་དྲི་བཟུང་གཏོང་';
	@override String get sharetexthint => 'དྲི་བཟུང་རྒྱུན་འབད་དྲི་བཟུང་གཏོང་';
	@override String get download => 'དངུལ་རྫས་སྟེང་གཏོང་';
	@override String get addplaylist => 'དངུལ་རྫས་སྟེང་གཏོང་';
	@override String get bookmark => 'དངུལ་རྫས་སྟེང་གཏོང་';
	@override String get unbookmark => 'དངུལ་རྫས་སྟེང་གཏོང་';
	@override String get share => 'དངུལ་རྫས་སྟེང་གཏོང་';
	@override String get deletemedia => 'དངུལ་རྫས་སྟེང་གཏོང་';
	@override String get deletemediahint => 'དངུལ་རྫས་སྟེང་གཏོང་གནོན་བཅུག་';
	@override String get searchhint => 'དངུལ་རྫས་སྟེང་གཏོང་';
	@override String get performingsearch => 'དངུལ་རྫས་སྟེང་གཏོང་སྒྲིག་དྲི་བཟུང་';
	@override String get nosearchresult => 'དངུལ་རྫས་མ་རིགས་སྒྲིག་གཏོང་';
	@override String get nosearchresulthint => 'དངུལ་རྫས་སྒྲིག་གཏོང་དྲི་བཟུང་';
	@override String get addtoplaylist => 'དངུལ་རྫས་སྟེང་གཏོང་བསྒྲུབས་';
	@override String get newplaylist => 'དངུལ་རྫས་སྒྲིག་';
	@override String get playlistitm => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་';
	@override String get mediaaddedtoplaylist => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་';
	@override String get mediaremovedfromplaylist => 'དངུལ་རྫས་སྒྲིག་གཏོང་';
	@override String get clearplaylistmedias => 'དངུལ་རྫས་སྒྲིག་གཏོང་';
	@override String get deletePlayList => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་';
	@override String get clearplaylistmediashint => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་སྒྲིག་';
	@override String get deletePlayListhint => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་གཏོང་';
	@override String get comments => 'དངུལ་རྫས་སྒྲིག་བསྒྲུབས་';
	@override String get replies => 'དངུལ་རྫས་སྒྲིག་བསྒྲུབས་';
	@override String get reply => 'དངུལ་རྫས་སྒྲིག་བསྒྲུབས་';
	@override String get logintoaddcomment => 'དངུལ་རྫས་སྒྲིག་བསྒྲུབས་';
	@override String get logintoreply => 'དངུལ་རྫས་སྒྲིག་བསྒྲུབས་';
	@override String get writeamessage => 'དངུལ་རྫས་སྒྲིག་བསྒྲུབས་';
	@override String get nocomments => 'དངུལ་རྫས་སྒྲིག་བསྒྲུབས་ \nབཏུབ་མ་ཚུ་';
	@override String get errormakingcomments => 'དངུལ་རྫས་སྒྲིག་བསྒྲུབས་';
	@override String get errordeletingcomments => 'དངུལ་རྫས་སྒྲིག་གཏོང་';
	@override String get erroreditingcomments => 'དངུལ་རྫས་སྒྲིག་བསྒྲུབས་';
	@override String get errorloadingmorecomments => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་';
	@override String get deletingcomment => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་';
	@override String get editingcomment => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་';
	@override String get deletecommentalert => 'དངུལ་རྫས་སྒྲིག་བསྒྲུབས་';
	@override String get editcommentalert => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་';
	@override String get deletecommentalerttext => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་གཏོང་';
	@override String get loadmore => 'དངུལ་རྫས་དྲི་བཟུང་';
	@override String get messages => 'དངུལ་རྫས་སྟེང་གཏོང་';
	@override String get guestuser => 'མཁན་གྱིས་བསྟེན་གྲུབ་';
	@override String get fullname => 'དངུལ་རྫས་དྲི་བཟུང་';
	@override String get emailaddress => 'དངུལ་རྫས་དྲི་བཟུང་';
	@override String get password => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་';
	@override String get repeatpassword => 'དངུལ་རྫས་དྲི་བཟུང་སྒྲིག་';
	@override String get register => 'དངུལ་རྫས་དྲི་བཟུང་';
	@override String get login => 'དངུལ་རྫས་དྲི་བཟུང་';
	@override String get logout => 'དངུལ་རྫས་སྒྲིག་';
	@override String get logoutfromapp => 'དངུལ་རྫས་སྒྲིག་གཏོང་?';
	@override String get logoutfromapphint => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་དང་བསྟེན་གྲུབ་མ་ཚུ་སྒྲིག་';
	@override String get gotologin => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་';
	@override String get resetpassword => 'དངུལ་རྫས་གཏོང་སྒྲིག་';
	@override String get logintoaccount => 'མི་དྲི་བཟུང་སྒྲིག་དྲི་བཟུང་? བསྟེན་གྲུབ་སྒྲིག་';
	@override String get emptyfielderrorhint => 'དངུལ་རྫས་དྲི་བཟུང་སྒྲིག་';
	@override String get invalidemailerrorhint => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་';
	@override String get passwordsdontmatch => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་';
	@override String get processingpleasewait => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་རྣམ་བཞིན་...';
	@override String get createaccount => 'དངུལ་རྫས་སྒྲིག་གཏོང་';
	@override String get forgotpassword => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་?';
	@override String get orloginwith => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་གཏོང་';
	@override String get facebook => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་';
	@override String get google => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་';
	@override String get moreoptions => 'དངུལ་རྫས་སྒྲིག་';
	@override String get about => 'ངེད་དངུལ་རྫས་དྲི་བཟུང་';
	@override String get privacy => 'དངུལ་རྫས་སྒྲིག་';
	@override String get terms => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་';
	@override String get rate => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་';
	@override String get version => 'དངུལ་རྫས་སྒྲིག་';
	@override String get pulluploadmore => 'དངུལ་རྫས་སྒྲིག་གཏོང་';
	@override String get loadfailedretry => 'དངུལ་རྫས་གཏོང་བསྒྲུབས་! གཏོང་རྣམ་རོལ་བཞག་!';
	@override String get releaseloadmore => 'དངུལ་རྫས་སྒྲིག་';
	@override String get nomoredata => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་';
	@override String get errorReportingComment => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་';
	@override String get reportingComment => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་';
	@override String get reportcomment => 'དངུལ་རྫས་སྒྲིག་';
	@override List<String> get reportCommentsList => [
		'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་དྲི་བཟུང་',
		'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་',
		'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་',
		'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་',
	];
	@override String get bookmarksMedia => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་';
	@override String get noitemstodisplay => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་སྒྲིག་';
	@override String get loginrequired => 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་';
	@override String get loginrequiredhint => 'དངུལ་རྫས་དྲི་བཟུང་སྒྲིག་དྲི་བཟུང་';
	@override String get subscriptions => 'དངུལ་རྫས་སྒྲིག་';
	@override String get subscribe => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་';
	@override String get subscribehint => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་དྲི་བཟུང་';
	@override String get playsubscriptionrequiredhint => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་';
	@override String get previewsubscriptionrequiredhint => 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་སྒྲིག་';
	@override String get copiedtoclipboard => 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་';
	@override String get downloadbible => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་དྲི་བཟུང་';
	@override String get downloadversion => 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་གཏོང་';
	@override String get downloading => 'དངུལ་རྫས་གཏོང་སྒྲིག་དྲི་བཟུང་';
	@override String get failedtodownload => 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་';
	@override String get pleaseclicktoretry => 'དངུལ་རྫས་གཏོང་བསྒྲུབས་སྟེར་བའི་རྣམ་བསྟན་དང་རིགས་འཛིན་གནོད་དེ་དྲི་བཟུང་གཏོང་';
	@override String get of => 'དངུལ་རྫས་དྲི་བཟུང་';
	@override String get nobibleversionshint => 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་སྒྲིག་དྲི་བཟུང་';
	@override String get downloaded => 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་གཏོང་གནོད་';
	@override String get enteremailaddresstoresetpassword => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་སྒྲིག་';
	@override String get backtologin => 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་གཏོང་';
	@override String get signintocontinue => 'དངུལ་རྫས་སྒྲིག་གཏོང་';
	@override String get signin => 'དངུལ་རྫས་སྒྲིག་གཏོང་';
	@override String get signinforanaccount => 'དངུལ་རྫས་སྒྲིག་གཏོང་བསྒྲུབས་?';
	@override String get alreadyhaveanaccount => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་?';
	@override String get updateprofile => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་';
	@override String get updateprofilehint => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་';
	@override String get autoplayvideos => 'དངུལ་རྫས་གཏོང་བསྒྲུབས་';
	@override String get gosocial => 'དངུལ་རྫས་སྒྲིག་';
	@override String get searchbible => 'དངུལ་རྫས་སྒྲིག་གཏོང་དྲི་བཟུང་';
	@override String get filtersearchoptions => 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་དྲི་བཟུང་';
	@override String get narrowdownsearch => 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་';
	@override String get searchbibleversion => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་བསྒྲུབས་';
	@override String get searchbiblebook => 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་';
	@override String get search => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་';
	@override String get setBibleBook => 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་སྒྲིག་';
	@override String get oldtestament => 'དངུལ་རྫས་གཏོང་བསྒྲུབས་';
	@override String get newtestament => 'དངུལ་རྫས་སྒྲིག་';
	@override String get limitresults => 'དངུལ་རྫས་དྲི་བཟུང་';
	@override String get setfilters => 'དངུལ་རྫས་དྲི་བཟུང་';
	@override String get bibletranslator => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་';
	@override String get chapter => ' དངུལ་རྫས་ ';
	@override String get verse => ' དངུལ་རྫས་ ';
	@override String get translate => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་';
	@override String get bibledownloadinfo => 'དངུལ་རྫས་གཏོང་སྒྲིག་གཏོང་དང་དངུལ་རྫས་སྒྲིག་';
	@override String get received => 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་';
	@override String get outoftotal => 'དངུལ་རྫས་གཏོང་གཏོང་དྲི་བཟུང་';
	@override String get set => 'དངུལ་རྫས་དྲི་བཟུང་';
	@override String get selectColor => 'དངུལ་རྫས་དྲི་བཟུང་';
	@override String get switchbibleversion => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་';
	@override String get switchbiblebook => 'དངུལ་རྫས་སྒྲིག་གཏོང་དྲི་བཟུང་';
	@override String get gotosearch => 'དངུལ་རྫས་སྒྲིག་གཏོང་དྲི་བཟུང་';
	@override String get changefontsize => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་';
	@override String get font => 'དངུལ་རྫས་';
	@override String get readchapter => 'དངུལ་རྫས་གཏོང་གཏོང་དྲི་བཟུང་';
	@override String get showhighlightedverse => 'དངུལ་རྫས་གཏོང་གཏོང་དྲི་བཟུང་སྒྲིག་';
	@override String get downloadmoreversions => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་གཏོང་';
	@override String get suggestedusers => 'དངུལ་རྫས་གཏོང་སྒྲིག་དྲི་བཟུང་';
	@override String get unfollow => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་';
	@override String get follow => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་';
	@override String get searchforpeople => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་སྒྲིག་';
	@override String get viewpost => 'དངུལ་རྫས་སྒྲིག་གཏོང་';
	@override String get viewprofile => 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་';
	@override String get mypins => 'དངུལ་རྫས་གཏོང་གཏོང་དྲི་བཟུང་';
	@override String get viewpinnedposts => 'དངུལ་རྫས་གཏོང་གཏོང་གཏོང་གཏོང་གཏོང་གཏོང་';
	@override String get personal => 'དངུལ་རྫས་སྒྲིག་';
	@override String get update => 'དངུལ་རྫས་སྒྲིག་';
	@override String get phonenumber => 'དངུལ་རྫས་དྲི་བཟུང་';
	@override String get showmyphonenumber => 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་';
	@override String get dateofbirth => 'དངུལ་རྫས་གཏོང་གཏོང་དྲི་བཟུང་';
	@override String get showmyfulldateofbirth => 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་';
	@override String get notifications => 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་དྲི་བཟུང་';
	@override String get notifywhenuserfollowsme => 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་གཏོང་སྒྲིག་སྒྲིག་གཏོང་སྒྲིག་གཏོང་';
	@override String get notifymewhenusercommentsonmypost => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་དྲི་བཟུང་གཏོང་སྒྲིག་དྲི་བཟུང་';
	@override String get notifymewhenuserlikesmypost => 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་སྒྲིག་གཏོང་སྒྲིག་';
	@override String get churchsocial => 'དངུལ་རྫས་དྲི་བཟུང་སྒྲིག་';
	@override String get shareyourthoughts => 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་གཏོང་གཏོང་དྲི་བཟུང་དྲི་བཟུང་';
	@override String get readmore => '...དངུལ་རྫས་སྒྲིག་';
	@override String get less => ' དངུལ་རྫས་སྒྲིག་';
	@override String get couldnotprocess => 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་';
	@override String get pleaseselectprofilephoto => 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་སྒྲིག་';
	@override String get pleaseselectprofilecover => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་གཏོང་དྲི་བཟུང་གཏོང་དྲི་བཟུང་';
	@override String get updateprofileerrorhint => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་སྒྲིག་དྲི་བཟུང་དྲི་བཟུང་གཏོང་གཏོང་སྒྲིག་དྲི་བཟུང་དྲི་བཟུང་';
	@override String get gender => 'དངུལ་རྫས་དྲི་བཟུང་';
	@override String get male => 'དངུལ་རྫས་སྒྲིག་';
	@override String get female => 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་';
	@override String get dob => 'དངུལ་རྫས་གཏོང་';
	@override String get location => 'དངུལ་རྫས་གཏོང་གཏོང་དྲི་བཟུང་';
	@override String get qualification => 'དངུལ་རྫས་གཏོང་གཏོང་དྲི་བཟུང་';
	@override String get aboutme => 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་གཏོང་';
	@override String get facebookprofilelink => 'དངུལ་རྫས་སྒྲིག་གཏོང་གཏོང་གཏོང་སྒྲིག་';
	@override String get twitterprofilelink => 'དངུལ་རྫས་གཏོང་གཏོང་གཏོང་དྲི་བཟུང་';
	@override String get linkdln => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་གཏོང་གཏོང་གཏོང་གཏོང་';
	@override String get likes => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་གཏོང་';
	@override String get likess => 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་གཏོང་དྲི་བཟུང་གཏོང་';
	@override String get pinnedposts => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་';
	@override String get unpinpost => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་';
	@override String get unpinposthint => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་སྒྲིག་དྲི་བཟུང་དྲི་བཟུང་གཏོང་སྒྲིག་';
	@override String get postdetails => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་གཏོང་';
	@override String get posts => 'དངུལ་རྫས་དྲི་བཟུང་';
	@override String get followers => 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་';
	@override String get followings => 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་གཏོང་སྒྲིག་';
	@override String get my => 'དངུལ་རྫས་གཏོང་';
	@override String get edit => 'དངུལ་རྫས་གཏོང་';
	@override String get delete => 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་';
	@override String get deletepost => 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་གཏོང་';
	@override String get deleteposthint => 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་སྒྲིག་དྲི་བཟུང་';
	@override String get maximumallowedsizehint => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་གཏོང་སྒྲིག་གཏོང་དྲི་བཟུང་གཏོང་གཏོང་དྲི་བཟུང་';
	@override String get maximumuploadsizehint => 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་གཏོང་དྲི་བཟུང་སྒྲིག་';
	@override String get makeposterror => 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་སྒྲིག་སྒྲིག་དྲི་བཟུང་';
	@override String get makepost => 'དངུལ་རྫས་དྲི་བཟུང་སྒྲིག་གཏོང་';
	@override String get selectfile => 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་';
	@override String get images => 'དངུལ་རྫས་སྒྲིག་';
	@override String get shareYourThoughtsNow => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་...';
	@override String get photoviewer => 'དངུལ་རྫས་དྲི་བཟུང་སྒྲིག་གཏོང་';
	@override String get nochatsavailable => 'དངུལ་རྫས་གཏོང་སྒྲིག་སྒྲིག་དྲི་བཟུང་ \nདྲི་བཟུང་གཏོང་སྒྲིག་ \nདྲི་བཟུང་གཏོང་གཏོང་གཏོང་སྒྲིག་དྲི་བཟུང་';
	@override String get typing => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་གཏོང་དྲི་བཟུང་...';
	@override String get photo => 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་སྒྲིག་';
	@override String get online => 'དངུལ་རྫས་སྒྲིག་';
	@override String get offline => 'དངུལ་རྫས་སྒྲིག་';
	@override String get lastseen => 'དངུལ་རྫས་གཏོང་';
	@override String get deleteselectedhint => 'དངུལ་རྫས་གཏོང་གཏོང་གཏོང་དྲི་བཟུང་གཏོང་གཏོང་གཏོང་དྲི་བཟུང་ \n དངུལ་རྫས་སྒྲིག་གཏོང་དྲི་བཟུང་གཏོང་གཏོང་སྒྲིག་གཏོང་དྲི་བཟུང་སྒྲིག་';
	@override String get deleteselected => 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་གཏོང་';
	@override String get unabletofetchconversation => 'དངུལ་རྫས་དྲི་བཟུང་སྒྲིག་དྲི་བཟུང་ \n';
	@override String get loadmoreconversation => 'དངུལ་རྫས་སྒྲིག་གཏོང་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་';
	@override String get sendyourfirstmessage => 'དངུལ་རྫས་གཏོང་སྒྲིག་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་ \n';
	@override String get unblock => 'དངུལ་རྫས་གཏོང་ ';
	@override String get block => 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་';
	@override String get writeyourmessage => 'དངུལ་རྫས་གཏོང་གཏོང་དྲི་བཟུང་...';
	@override String get clearconversation => 'དངུལ་རྫས་གཏོང་གཏོང་གཏོང་གཏོང་གཏོང་';
	@override String get clearconversationhintone => 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་སྒྲིག་གཏོང་དྲི་བཟུང་གཏོང་སྒྲིག་དྲི་བཟུང་ ';
	@override String get clearconversationhinttwo => '.\n  དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་གཏོང་དྲི་བཟུང་སྒྲིག་';
	@override String get facebookloginerror => 'དངུལ་རྫས་གཏོང་སྒྲིག་གཏོང་དྲི་བཟུང་སྒྲིག་སྒྲིག་。\n, དངུལ་རྫས་གཏོང་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་';
	@override String get selectLanguage => 'དབྱིན་རྒྱུད་སྐད་འབྱུང་།';
	@override String get howTo => 'ག་འདྲ་བྱས།';
	@override String get noBibleTextsAvailable => 'བཀོལ་སྟོན་ནང་མིན་འདུག';
	@override String get languages => 'སྐད་ཡིག';
	@override String get searchLanguages => 'སྐད་ཡིག་འཚོལ་སྐབས...';
	@override String get biblesFilesets => 'བཀོལ་སྟོན: {bibles}, ཡིག་སྒེའི་མིང་།: {filesets}';
	@override String get oldTestament => 'རྒྱལ་མཚན་རྒྱུད་རྙིང་པ།';
	@override String get newTestament => 'རྒྱལ་མཚན་རྒྱུད་གསར་པ།';
	@override String get play => 'གཏོང་';
	@override String get no_verse_content => 'གསལ་སྟོན་གྱི་དོན་ལུ་དངོས་གྲངས་མེད།';
	@override String get no_audio_content => 'གསལ་སྟོན་གྱི་དོན་ལུ་དངོས་གྲངས་མེད།';
}

// Path: <root>
class _StringsEs implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEs.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsEs _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'VirtualPastor';
	@override String get deleteaccount => 'Delete my account';
	@override String get deletemyaccount => 'Delete my account';
	@override String get deleteaccounthint => 'This action will delete your account and remove all your data, once your data is deleted, it cannot be recovered.';
	@override String get deleteaccountsuccess => 'Account deletion was succesful';
	@override String get selectlanguage => 'Seleccione el idioma';
	@override String get chooseapplanguage => 'Elija el idioma de la aplicación';
	@override String get nightmode => 'Modo nocturno';
	@override String get initializingapp => 'inicializando...';
	@override String get home => 'Hogar';
	@override String get branches => 'Ramas';
	@override String get inbox => 'Bandeja de entrada';
	@override String get downloads => 'Descargas';
	@override String get settings => 'Configuraciones';
	@override String get events => 'Eventos';
	@override String get myplaylists => 'Mis listas de reproducción';
	@override String get website => 'Sitio web';
	@override String get hymns => 'Himnos';
	@override String get articles => 'Artículos';
	@override String get notes => 'Notas';
	@override String get donate => 'Donar';
	@override String get offering => 'Oferta';
	@override String get savenotetitle => 'Título de la nota';
	@override String get bookmarks => 'Marcadores';
	@override String get socialplatforms => 'Plataformas sociales';
	@override List<String> get onboardingpagetitles => [
		'Bienvenido a mychurch',
		'Repleto de características',
		'Audio, Video \n and Live Streaming',
		'Crear una cuenta',
	];
	@override List<String> get onboardingpagehints => [
		'Extienda más allá de las mañanas de los domingos y las cuatro paredes de su iglesia. Todo lo que necesita para comunicarse e interactuar con un mundo centrado en dispositivos móviles.',
		'Hemos reunido todas las funciones principales que debe tener la aplicación de su iglesia. Eventos, devocionales, notificaciones, notas y biblia de múltiples versiones.',
		'Permita que los usuarios de todo el mundo vean videos, escuchen mensajes de audio y vean transmisiones en vivo de los servicios de su iglesia.',
		'Comience su viaje hacia una experiencia de adoración sin fin.',
	];
	@override String get next => 'SIGUIENTE';
	@override String get done => 'EMPEZAR';
	@override String get quitapp => 'Salir de la aplicación!';
	@override String get quitappwarning => '¿Deseas cerrar la aplicación?';
	@override String get quitappaudiowarning => 'Actualmente está reproduciendo un audio, al salir de la aplicación se detendrá la reproducción del audio. Si no desea detener la reproducción, simplemente minimice la aplicación con el botón central o haga clic en el botón Aceptar para salir de la aplicación ahora.';
	@override String get deletenote => 'Borrar nota';
	@override String get deletenotehint => '¿Quieres borrar esta nota? Esta acción no se puede revertir.';
	@override String get nonotesfound => 'No se encontraron notas';
	@override String get newnote => 'Nuevo';
	@override String get ok => 'Okay';
	@override String get retry => 'REVER';
	@override String get oops => 'Vaya!';
	@override String get save => 'Salvar';
	@override String get cancel => 'Cancelar';
	@override String get error => 'Error';
	@override String get success => 'éxito';
	@override String get skip => 'Omitir';
	@override String get skiplogin => 'Omitir inicio de sesión';
	@override String get skipregister => 'Evitar el registro';
	@override String get dataloaderror => 'No se pudieron cargar los datos solicitados en este momento, verifique su conexión de datos y haga clic para volver a intentarlo.';
	@override String get suggestedforyou => 'Sugerido para ti';
	@override String get devotionals => 'Devocionales';
	@override String get categories => 'Categorías';
	@override String get category => 'Categoría';
	@override String get videos => 'Videos';
	@override String get audios => 'Audios';
	@override String get biblebooks => 'Biblia';
	@override String get audiobible => 'Biblia en audio';
	@override String get sermons => 'Sermones';
	@override String get profile => 'Perfil';
	@override String get tools => 'Herramientas';
	@override String get homesentence => 'Tu pastor durante 1 año, para ayudarte a convertirte en la persona que Dios te llamó a ser.';
	@override String get livestreams => 'Transmisiones en vivo';
	@override String get radio => 'Radio';
	@override String get allitems => 'Todos los artículos';
	@override String get emptyplaylist => 'Sin listas de reproducción';
	@override String get notsupported => 'No soportado';
	@override String get cleanupresources => 'Limpieza de recursos';
	@override String get grantstoragepermission => 'Otorgue permiso de acceso al almacenamiento para continuar';
	@override String get sharefiletitle => 'Mira o escucha ';
	@override String get sharefilebody => 'Vía MyVirtualPastor App, Descarga ahora en ';
	@override String get sharetext => 'Disfrute de transmisión ilimitada de audio y video';
	@override String get sharetexthint => 'Únase a la plataforma de transmisión de video y audio que le permite ver y escuchar millones de archivos de todo el mundo. Descarga ahora en';
	@override String get download => 'Descargar';
	@override String get addplaylist => 'Agregar a la lista de reproducción';
	@override String get bookmark => 'Marcador';
	@override String get unbookmark => 'Desmarcar';
	@override String get share => 'Compartir';
	@override String get deletemedia => 'Borrar archivo';
	@override String get deletemediahint => '¿Desea eliminar este archivo descargado? Esta acción no se puede deshacer.';
	@override String get searchhint => 'Buscar mensajes de audio y video';
	@override String get performingsearch => 'Búsqueda de audios y videos';
	@override String get nosearchresult => 'No se han encontrado resultados';
	@override String get nosearchresulthint => 'Intente ingresar una palabra clave más general';
	@override String get addtoplaylist => 'Agregar a la lista de reproducción';
	@override String get newplaylist => 'Nueva lista de reproducción';
	@override String get playlistitm => 'Lista de reproducción';
	@override String get mediaaddedtoplaylist => 'Medios agregados a la lista de reproducción.';
	@override String get mediaremovedfromplaylist => 'Medios eliminados de la lista de reproducción';
	@override String get clearplaylistmedias => 'Borrar todos los medios';
	@override String get deletePlayList => 'Eliminar lista de reproducción';
	@override String get clearplaylistmediashint => '¿Continuar y eliminar todos los medios de esta lista de reproducción?';
	@override String get deletePlayListhint => '¿Continuar y eliminar esta lista de reproducción y borrar todos los medios?';
	@override String get videomessages => 'Mensajes de video';
	@override String get audiomessages => 'Mensajes de audio';
	@override String get comments => 'Comentarios';
	@override String get replies => 'Respuestas';
	@override String get reply => 'Respuesta';
	@override String get logintoaddcomment => 'Inicia sesión para añadir un comentario';
	@override String get logintoreply => 'Inicia sesión para responder';
	@override String get writeamessage => 'Escribe un mensaje...';
	@override String get nocomments => 'No se encontraron comentarios \nhaga clic para reintentar';
	@override String get errormakingcomments => 'No se pueden procesar los comentarios en este momento..';
	@override String get errordeletingcomments => 'No se puede eliminar este comentario en este momento..';
	@override String get erroreditingcomments => 'No se puede editar este comentario en este momento..';
	@override String get errorloadingmorecomments => 'No se pueden cargar más comentarios en este momento..';
	@override String get deletingcomment => 'Eliminando comentario';
	@override String get editingcomment => 'Editando comentario';
	@override String get deletecommentalert => 'Eliminar comentario';
	@override String get editcommentalert => 'Editar comentario';
	@override String get deletecommentalerttext => '¿Deseas borrar este comentario? Esta acción no se puede deshacer';
	@override String get loadmore => 'carga más';
	@override String get messages => 'Mensajes';
	@override String get guestuser => 'Usuario invitado';
	@override String get fullname => 'Nombre completo';
	@override String get emailaddress => 'Dirección de correo electrónico';
	@override String get password => 'Contraseña';
	@override String get repeatpassword => 'Repite la contraseña';
	@override String get register => 'Registrarse';
	@override String get login => 'Iniciar sesión';
	@override String get logout => 'Cerrar sesión';
	@override String get logoutfromapp => '¿Salir de la aplicación?';
	@override String get logoutfromapphint => 'No podrá dar me gusta o comentar artículos y videos si no ha iniciado sesión.';
	@override String get gotologin => 'Ir a Iniciar sesión';
	@override String get resetpassword => 'Restablecer la contraseña';
	@override String get logintoaccount => '¿Ya tienes una cuenta? Iniciar sesión';
	@override String get emptyfielderrorhint => 'Necesitas llenar todos los campos';
	@override String get invalidemailerrorhint => 'Debes ingresar una dirección de correo electrónico válida';
	@override String get passwordsdontmatch => 'Las contraseñas no coinciden';
	@override String get processingpleasewait => 'Procesando .. por favor espere...';
	@override String get createaccount => 'Crea una cuenta';
	@override String get forgotpassword => '¿Se te olvidó tu contraseña?';
	@override String get orloginwith => 'O inicie sesión con';
	@override String get facebook => 'Facebook';
	@override String get google => 'Google';
	@override String get moreoptions => 'Mas opciones';
	@override String get about => 'Sobre nosotros';
	@override String get privacy => 'Privacidad';
	@override String get terms => 'Términos de la aplicación';
	@override String get rate => 'Calificar aplicacion';
	@override String get version => 'Versión';
	@override String get pulluploadmore => 'levantar la carga';
	@override String get loadfailedretry => 'Error de carga. Haga clic en reintentar!';
	@override String get releaseloadmore => 'suelte para cargar más';
	@override String get nomoredata => 'No más datos';
	@override String get errorReportingComment => 'Comentario de informe de error';
	@override String get reportingComment => 'Informe de comentario';
	@override String get reportcomment => 'Opciones de informe';
	@override List<String> get reportCommentsList => [
		'Contenido comercial no deseado o spam',
		'Pornografía o material sexual explícito',
		'Discurso de odio o violencia gráfica',
		'Acoso o intimidación',
	];
	@override String get bookmarksMedia => 'Mis marcadores';
	@override String get noitemstodisplay => 'No hay elementos para mostrar';
	@override String get loginrequired => 'Necesario iniciar sesión';
	@override String get loginrequiredhint => 'Para suscribirse en esta plataforma, debe iniciar sesión. Cree una cuenta gratuita ahora o inicie sesión en su cuenta existente.';
	@override String get subscriptions => 'Suscripciones de aplicaciones';
	@override String get subscribe => 'SUSCRIBIR';
	@override String get subscribehint => 'Se requiere suscripción';
	@override String get playsubscriptionrequiredhint => 'Debe suscribirse antes de poder escuchar o ver este medio.';
	@override String get previewsubscriptionrequiredhint => 'Ha alcanzado la duración de vista previa permitida para este medio. Debes suscribirte para seguir escuchando o viendo este medio.';
	@override String get copiedtoclipboard => 'Copiado al portapapeles';
	@override String get downloadbible => 'Descargar Biblia';
	@override String get downloadversion => 'Descargar';
	@override String get downloading => 'Descargando';
	@override String get failedtodownload => 'Error al descargar';
	@override String get pleaseclicktoretry => 'Haga clic para volver a intentarlo.';
	@override String get of => 'De';
	@override String get nobibleversionshint => 'No hay datos bíblicos para mostrar, haga clic en el botón de abajo para descargar al menos una versión bíblica.';
	@override String get downloaded => 'Descargado';
	@override String get enteremailaddresstoresetpassword => 'Ingrese su correo electrónico para restablecer su contraseña';
	@override String get backtologin => 'ATRÁS PARA INICIAR SESIÓN';
	@override String get signintocontinue => 'Regístrate para continuar';
	@override String get signin => 'REGISTRARSE';
	@override String get signinforanaccount => '¿REGÍSTRESE PARA OBTENER UNA CUENTA?';
	@override String get alreadyhaveanaccount => '¿Ya tienes una cuenta?';
	@override String get updateprofile => 'Actualización del perfil';
	@override String get updateprofilehint => 'Para comenzar, actualice su página de perfil, esto nos ayudará a conectarlo con otras personas';
	@override String get autoplayvideos => 'Reproducción automática de vídeos';
	@override String get gosocial => 'Vuélvete social';
	@override String get searchbible => 'Buscar Biblia';
	@override String get filtersearchoptions => 'Opciones de búsqueda de filtros';
	@override String get narrowdownsearch => 'Utilice el botón de filtro a continuación para reducir la búsqueda y obtener un resultado más preciso.';
	@override String get searchbibleversion => 'Buscar la versión de la Biblia';
	@override String get searchbiblebook => 'Buscar libro de la Biblia';
	@override String get search => 'Buscar';
	@override String get setBibleBook => 'Establecer libro de la Biblia';
	@override String get oldtestament => 'Viejo Testamento';
	@override String get newtestament => 'Nuevo Testamento';
	@override String get limitresults => 'Establecer filtros';
	@override String get setfilters => 'Establecer filtros';
	@override String get bibletranslator => 'Traductor de la Biblia';
	@override String get chapter => ' Capítulo ';
	@override String get verse => ' Verso ';
	@override String get translate => 'traducir';
	@override String get bibledownloadinfo => 'Se inició la descarga de la Biblia. No cierre esta página hasta que se haya realizado la descarga.';
	@override String get received => 'recibido';
	@override String get outoftotal => 'fuera del total';
	@override String get set => 'CONJUNTO';
	@override String get selectColor => 'Seleccionar el color';
	@override String get switchbibleversion => 'Cambiar versión de la Biblia';
	@override String get switchbiblebook => 'Cambiar libro de la Biblia';
	@override String get gotosearch => 'Ir al capítulo';
	@override String get changefontsize => 'Cambia tamaño de fuente';
	@override String get font => 'Font';
	@override String get readchapter => 'Leer capítulo';
	@override String get showhighlightedverse => 'Mostrar versículos destacados';
	@override String get downloadmoreversions => 'Descarga más versiones';
	@override String get suggestedusers => 'Usuarios sugeridos para seguir';
	@override String get unfollow => 'Dejar de seguir';
	@override String get follow => 'Seguir';
	@override String get searchforpeople => 'Búsqueda de personas';
	@override String get viewpost => 'Ver publicacion';
	@override String get viewprofile => 'Ver perfil';
	@override String get mypins => 'Mis Pines';
	@override String get viewpinnedposts => 'Ver publicaciones fijadas';
	@override String get personal => 'Personal';
	@override String get update => 'Actualizar';
	@override String get phonenumber => 'Número de teléfono';
	@override String get showmyphonenumber => 'Mostrar mi número de teléfono a los usuarios';
	@override String get dateofbirth => 'Fecha de nacimiento';
	@override String get showmyfulldateofbirth => 'Mostrar mi fecha de nacimiento completa a las personas que ven mi estado';
	@override String get notifications => 'Notificaciones';
	@override String get notifywhenuserfollowsme => 'Notificarme cuando un usuario me siga';
	@override String get notifymewhenusercommentsonmypost => 'Notificarme cuando los usuarios comenten en mi publicación';
	@override String get notifymewhenuserlikesmypost => 'Notificarme cuando a los usuarios les guste mi publicación';
	@override String get churchsocial => 'Iglesia Social';
	@override String get shareyourthoughts => 'Comparte tus pensamientos';
	@override String get readmore => '...Lee mas';
	@override String get less => ' Menos';
	@override String get couldnotprocess => 'No se pudo procesar la acción solicitada.';
	@override String get pleaseselectprofilephoto => 'Seleccione una foto de perfil para cargar';
	@override String get pleaseselectprofilecover => 'Seleccione una foto de portada para cargar';
	@override String get updateprofileerrorhint => 'Debe ingresar su nombre, fecha de nacimiento, sexo, teléfono y ubicación antes de poder continuar.';
	@override String get gender => 'Género';
	@override String get male => 'Masculino';
	@override String get female => 'Hembra';
	@override String get dob => 'Fecha de nacimiento';
	@override String get location => 'Ubicación actual';
	@override String get qualification => 'Calificación';
	@override String get aboutme => 'Sobre mí';
	@override String get facebookprofilelink => 'Facebook Enlace de perfil';
	@override String get twitterprofilelink => 'Twitter Enlace de perfil';
	@override String get linkdln => 'Linkedln Enlace de perfil';
	@override String get likes => 'Gustos';
	@override String get likess => 'Me gusta(s)';
	@override String get pinnedposts => 'Mis publicaciones fijadas';
	@override String get unpinpost => 'Desanclar publicación';
	@override String get unpinposthint => '¿Deseas eliminar esta publicación de tus publicaciones fijadas?';
	@override String get postdetails => 'Detalles de la publicación';
	@override String get posts => 'Publicaciones';
	@override String get followers => 'Seguidores';
	@override String get followings => 'Siguientes';
	@override String get my => 'Mi';
	@override String get edit => 'Editar';
	@override String get delete => 'Eliminar';
	@override String get deletepost => 'Eliminar mensaje';
	@override String get deleteposthint => '¿Deseas eliminar esta publicación? Las publicaciones aún pueden aparecer en los feeds de algunos usuarios.';
	@override String get maximumallowedsizehint => 'Se alcanzó la carga máxima de archivos permitida';
	@override String get maximumuploadsizehint => 'El archivo seleccionado supera el límite de tamaño de archivo de carga permitido.';
	@override String get makeposterror => 'No se puede publicar en este momento, haga clic para volver a intentarlo.';
	@override String get makepost => 'Hacer publicación';
	@override String get selectfile => 'Seleccione Archivo';
	@override String get images => 'Imagenes';
	@override String get shareYourThoughtsNow => 'Share your thoughts ...';
	@override String get photoviewer => 'Visionneuse de photos';
	@override String get nochatsavailable => 'No hay conversaciones disponibles \n Haga clic en el icono de agregar a continuación \n para seleccionar los usuarios con los que chatear';
	@override String get typing => 'Mecanografía...';
	@override String get photo => 'Photo';
	@override String get online => 'En línea';
	@override String get offline => 'Desconectado';
	@override String get lastseen => 'Ultima vez visto';
	@override String get deleteselectedhint => 'Esta acción eliminará los mensajes seleccionados. Tenga en cuenta que esto solo elimina su lado de la conversación, \n los mensajes seguirán apareciendo en el dispositivo de su socio.';
	@override String get deleteselected => 'Eliminar seleccionado';
	@override String get unabletofetchconversation => 'No se pudo recuperar \ntu conversación con \n';
	@override String get loadmoreconversation => 'Cargar más conversaciones';
	@override String get sendyourfirstmessage => 'Envía tu primer mensaje a \n';
	@override String get unblock => 'Desatascar ';
	@override String get block => 'Bloquear ';
	@override String get writeyourmessage => 'escribe tu mensaje...';
	@override String get clearconversation => 'Conversación clara';
	@override String get clearconversationhintone => 'Esta acción borrará toda su conversación con ';
	@override String get clearconversationhinttwo => '.\n  Tenga en cuenta que esto solo elimina su lado de la conversación, los mensajes aún se mostrarán en el chat de sus socios.';
	@override String get facebookloginerror => 'Something went wrong with the login process.\n, Here is the error Facebook gave us';
	@override String get selectLanguage => 'Seleccionar idioma';
	@override String get howTo => 'Cómo';
	@override String get noBibleTextsAvailable => 'No hay textos bíblicos disponibles';
	@override String get languages => 'Idiomas';
	@override String get searchLanguages => 'Buscar idiomas...';
	@override String get biblesFilesets => 'Biblias: {bibles}, Conjuntos de archivos: {filesets}';
	@override String get oldTestament => 'Antiguo Testamento';
	@override String get newTestament => 'Nuevo Testamento';
	@override String get play => 'Reproducir';
	@override String get no_verse_content => 'No hay contenido de versículos bíblicos disponible para mostrar.';
	@override String get no_audio_content => 'No hay contenido de audio de la Biblia disponible para mostrar.';
}

// Path: <root>
class _StringsFr implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsFr.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsFr _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'VirtualPastor';
	@override String get deleteaccount => 'Delete my account';
	@override String get deletemyaccount => 'Delete my account';
	@override String get deleteaccounthint => 'This action will delete your account and remove all your data, once your data is deleted, it cannot be recovered.';
	@override String get deleteaccountsuccess => 'Account deletion was succesful';
	@override String get selectlanguage => 'Choisir la langue';
	@override String get chooseapplanguage => 'Choisissez la langue de l\'application';
	@override String get nightmode => 'Mode nuit';
	@override String get initializingapp => 'initialisation...';
	@override String get home => 'Accueil';
	@override String get branches => 'Branches';
	@override String get inbox => 'Boîte de réception';
	@override String get downloads => 'Téléchargements';
	@override String get settings => 'Paramètres';
	@override String get events => 'Événements';
	@override String get myplaylists => 'Mes listes de lecture';
	@override String get nonotesfound => 'Aucune note trouvée';
	@override String get newnote => 'Nouveau';
	@override String get website => 'Site Internet';
	@override String get hymns => 'Hymnes';
	@override String get articles => 'Des articles';
	@override String get notes => 'Remarques';
	@override String get donate => 'Faire un don';
	@override String get offering => 'Offre';
	@override String get deletenote => 'Supprimer la note';
	@override String get deletenotehint => 'Voulez-vous supprimer cette note? Cette action ne peut pas être annulée.';
	@override String get savenotetitle => 'Titre de la note';
	@override String get bookmarks => 'Favoris';
	@override String get socialplatforms => 'Plateformes sociales';
	@override List<String> get onboardingpagetitles => [
		'Bienvenue à MyChurch',
		'Plein de fonctionnalités',
		'Audio, Video \n et diffusion en direct',
		'Créer un compte',
	];
	@override List<String> get onboardingpagehints => [
		'Prolongez-vous au-delà des dimanches matins et des quatre murs de votre église. Tout ce dont vous avez besoin pour communiquer et interagir avec un monde axé sur le mobile.',
		'Nous avons rassemblé toutes les fonctionnalités principales que votre application d\'église doit avoir. Événements, dévotions, notifications, notes et bible multi-version.',
		'Permettez aux utilisateurs du monde entier de regarder des vidéos, d\'écouter des messages audio et de regarder des flux en direct de vos services religieux.',
		'Commencez votre voyage vers une expérience de culte sans fin.',
	];
	@override String get next => 'SUIVANT';
	@override String get done => 'COMMENCER';
	@override String get quitapp => 'Quitter l\'application!';
	@override String get quitappwarning => 'Souhaitez-vous fermer l\'application?';
	@override String get quitappaudiowarning => 'Vous êtes en train de lire un fichier audio, quitter l\'application arrêtera la lecture audio. Si vous ne souhaitez pas arrêter la lecture, réduisez simplement l\'application avec le bouton central ou cliquez sur le bouton OK pour quitter l\'application maintenant.';
	@override String get ok => 'D\'accord';
	@override String get retry => 'RECOMMENCEZ';
	@override String get oops => 'Oups!';
	@override String get save => 'sauver';
	@override String get cancel => 'Annuler';
	@override String get error => 'Erreur';
	@override String get success => 'Succès';
	@override String get skip => 'Sauter';
	@override String get skiplogin => 'Passer l\'identification';
	@override String get skipregister => 'Sauter l\'inscription';
	@override String get dataloaderror => 'Impossible de charger les données demandées pour le moment, vérifiez votre connexion de données et cliquez pour réessayer.';
	@override String get suggestedforyou => 'Suggéré pour vous';
	@override String get devotionals => 'Dévotion';
	@override String get categories => 'Catégories';
	@override String get category => 'Catégorie';
	@override String get videos => 'Vidéos';
	@override String get audios => 'Audios';
	@override String get biblebooks => 'Bible';
	@override String get sermons => 'Sermons';
	@override String get profile => 'Profil';
	@override String get tools => 'Outils';
	@override String get audiobible => 'Bible audio';
	@override String get homesentence => 'Votre pasteur pour 1 an, pour vous aider à devenir la personne que Dieu vous a appelé à être.';
	@override String get livestreams => 'Livestreams';
	@override String get radio => 'Radio';
	@override String get allitems => 'Tous les articles';
	@override String get emptyplaylist => 'Aucune liste de lecture';
	@override String get notsupported => 'Non supporté';
	@override String get cleanupresources => 'Nettoyage des ressources';
	@override String get grantstoragepermission => 'Veuillez accorder l\'autorisation d\'accès au stockage pour continuer';
	@override String get sharefiletitle => 'Regarder ou écouter ';
	@override String get sharefilebody => 'Via MyVirtualPastor App, Téléchargez maintenant sur ';
	@override String get sharetext => 'Profitez d\'un streaming audio et vidéo illimité';
	@override String get sharetexthint => 'Rejoignez la plateforme de streaming vidéo et audio qui vous permet de regarder et d\'écouter des millions de fichiers du monde entier. Téléchargez maintenant sur';
	@override String get download => 'Télécharger';
	@override String get addplaylist => 'Ajouter à la playlist';
	@override String get bookmark => 'Signet';
	@override String get unbookmark => 'Supprimer les favoris';
	@override String get share => 'Partager';
	@override String get deletemedia => 'Supprimer le fichier';
	@override String get deletemediahint => 'Souhaitez-vous supprimer ce fichier téléchargé? Cette action ne peut pas être annulée.';
	@override String get searchhint => 'Rechercher des messages audio et vidéo';
	@override String get performingsearch => 'Recherche d\'audio et de vidéos';
	@override String get nosearchresult => 'Aucun résultat trouvé';
	@override String get nosearchresulthint => 'Essayez de saisir un mot clé plus général';
	@override String get addtoplaylist => 'Ajouter à la playlist';
	@override String get newplaylist => 'Nouvelle playlist';
	@override String get playlistitm => 'Playlist';
	@override String get mediaaddedtoplaylist => 'Média ajouté à la playlist.';
	@override String get mediaremovedfromplaylist => 'Média supprimé de la playlist';
	@override String get clearplaylistmedias => 'Effacer tous les médias';
	@override String get deletePlayList => 'Supprimer la playlist';
	@override String get clearplaylistmediashint => 'Voulez-vous supprimer tous les médias de cette liste de lecture?';
	@override String get deletePlayListhint => 'Voulez-vous supprimer cette liste de lecture et effacer tous les médias?';
	@override String get videomessages => 'Messages vidéo';
	@override String get audiomessages => 'Messages audio';
	@override String get comments => 'commentaires';
	@override String get replies => 'réponses';
	@override String get reply => 'Répondre';
	@override String get logintoaddcomment => 'Connectez-vous pour ajouter un commentaire';
	@override String get logintoreply => 'Connectez-vous pour répondre';
	@override String get writeamessage => 'Écrire un message...';
	@override String get nocomments => 'Aucun commentaire trouvé \ncliquez pour réessayer';
	@override String get errormakingcomments => 'Impossible de traiter les commentaires pour le moment..';
	@override String get errordeletingcomments => 'Impossible de supprimer ce commentaire pour le moment..';
	@override String get erroreditingcomments => 'Impossible de modifier ce commentaire pour le moment..';
	@override String get errorloadingmorecomments => 'Impossible de charger plus de commentaires pour le moment..';
	@override String get deletingcomment => 'Suppression du commentaire';
	@override String get editingcomment => 'Modification du commentaire';
	@override String get deletecommentalert => 'Supprimer le commentaire';
	@override String get editcommentalert => 'Modifier le commentaire';
	@override String get deletecommentalerttext => 'Souhaitez-vous supprimer ce commentaire? Cette action ne peut pas être annulée';
	@override String get loadmore => 'charger plus';
	@override String get messages => 'Messages';
	@override String get guestuser => 'Utilisateur invité';
	@override String get fullname => 'Nom complet';
	@override String get emailaddress => 'Adresse électronique';
	@override String get password => 'Mot de passe';
	@override String get repeatpassword => 'Répéter le mot de passe';
	@override String get register => 'S\'inscrire';
	@override String get login => 'S\'identifier';
	@override String get logout => 'Se déconnecter';
	@override String get logoutfromapp => 'Déconnexion de l\'application?';
	@override String get logoutfromapphint => 'Vous ne pourrez pas aimer ou commenter des articles et des vidéos si vous n\'êtes pas connecté.';
	@override String get gotologin => 'Aller à la connexion';
	@override String get resetpassword => 'réinitialiser le mot de passe';
	@override String get logintoaccount => 'Vous avez déjà un compte? S\'identifier';
	@override String get emptyfielderrorhint => 'Vous devez remplir tous les champs';
	@override String get invalidemailerrorhint => 'Vous devez saisir une adresse e-mail valide';
	@override String get passwordsdontmatch => 'Les mots de passe ne correspondent pas';
	@override String get processingpleasewait => 'Traitement, veuillez patienter...';
	@override String get createaccount => 'Créer un compte';
	@override String get forgotpassword => 'Mot de passe oublié?';
	@override String get orloginwith => 'Ou connectez-vous avec';
	@override String get facebook => 'Facebook';
	@override String get google => 'Google';
	@override String get moreoptions => 'Plus d\'options';
	@override String get about => 'À propos de nous';
	@override String get privacy => 'confidentialité';
	@override String get terms => 'Termes de l\'application';
	@override String get rate => 'Application de taux';
	@override String get version => 'Version';
	@override String get pulluploadmore => 'tirer la charge';
	@override String get loadfailedretry => 'Échec du chargement! Cliquez sur Réessayer!';
	@override String get releaseloadmore => 'relâchez pour charger plus';
	@override String get nomoredata => 'Plus de données';
	@override String get errorReportingComment => 'Commentaire de rapport d\'erreur';
	@override String get reportingComment => 'Signaler un commentaire';
	@override String get reportcomment => 'Options de rapport';
	@override List<String> get reportCommentsList => [
		'Contenu commercial indésirable ou spam',
		'Pornographie ou matériel sexuel explicite',
		'Discours haineux ou violence graphique',
		'Harcèlement ou intimidation',
	];
	@override String get bookmarksMedia => 'Mes marque-pages';
	@override String get noitemstodisplay => 'Aucun élément à afficher';
	@override String get loginrequired => 'Connexion requise';
	@override String get loginrequiredhint => 'Pour vous abonner à cette plateforme, vous devez être connecté. Créez un compte gratuit maintenant ou connectez-vous à votre compte existant.';
	@override String get subscriptions => 'Abonnements aux applications';
	@override String get subscribe => 'SOUSCRIRE';
	@override String get subscribehint => 'Abonnement requis';
	@override String get playsubscriptionrequiredhint => 'Vous devez vous abonner avant de pouvoir écouter ou regarder ce média.';
	@override String get previewsubscriptionrequiredhint => 'Vous avez atteint la durée de prévisualisation autorisée pour ce média. Vous devez vous abonner pour continuer à écouter ou à regarder ce média.';
	@override String get copiedtoclipboard => 'Copié dans le presse-papier';
	@override String get downloadbible => 'Télécharger la Bible';
	@override String get downloadversion => 'Télécharger';
	@override String get downloading => 'Téléchargement';
	@override String get failedtodownload => 'Échec du téléchargement';
	@override String get pleaseclicktoretry => 'Veuillez cliquer pour réessayer.';
	@override String get of => 'De';
	@override String get nobibleversionshint => 'Il n\'y a pas de données bibliques à afficher, cliquez sur le bouton ci-dessous pour télécharger au moins une version biblique.';
	@override String get downloaded => 'Téléchargé';
	@override String get enteremailaddresstoresetpassword => 'Entrez votre e-mail pour réinitialiser votre mot de passe';
	@override String get backtologin => 'RETOUR CONNEXION';
	@override String get signintocontinue => 'Connectez-vous pour continuer';
	@override String get signin => 'SE CONNECTER';
	@override String get signinforanaccount => 'INSCRIVEZ-VOUS POUR UN COMPTE?';
	@override String get alreadyhaveanaccount => 'Vous avez déjà un compte?';
	@override String get updateprofile => 'Mettre à jour le profil';
	@override String get updateprofilehint => 'Pour commencer, veuillez mettre à jour votre page de profil, cela nous aidera à vous connecter avec d\'autres personnes';
	@override String get autoplayvideos => 'Vidéos de lecture automatique';
	@override String get gosocial => 'Passez aux réseaux sociaux';
	@override String get searchbible => 'Rechercher dans la Bible';
	@override String get filtersearchoptions => 'Filtrer les options de recherche';
	@override String get narrowdownsearch => 'Utilisez le bouton de filtrage ci-dessous pour affiner la recherche pour un résultat plus précis.';
	@override String get searchbibleversion => 'Rechercher la version de la Bible';
	@override String get searchbiblebook => 'Rechercher un livre biblique';
	@override String get search => 'Chercher';
	@override String get setBibleBook => 'Définir le livre de la Bible';
	@override String get oldtestament => 'L\'Ancien Testament';
	@override String get newtestament => 'Nouveau Testament';
	@override String get limitresults => 'Limiter les résultats';
	@override String get setfilters => 'Définir les filtres';
	@override String get bibletranslator => 'Traducteur de la Bible';
	@override String get chapter => ' Chapitre ';
	@override String get verse => ' Verset ';
	@override String get translate => 'traduire';
	@override String get bibledownloadinfo => 'Le téléchargement de la Bible a commencé, veuillez ne pas fermer cette page tant que le téléchargement n\'est pas terminé.';
	@override String get received => 'reçu';
	@override String get outoftotal => 'sur le total';
	@override String get set => 'ENSEMBLE';
	@override String get selectColor => 'Select Color';
	@override String get switchbibleversion => 'Changer de version de la Bible';
	@override String get switchbiblebook => 'Changer de livre biblique';
	@override String get gotosearch => 'Aller au chapitre';
	@override String get changefontsize => 'Changer la taille de la police';
	@override String get font => 'Police de caractère';
	@override String get readchapter => 'Lire le chapitre';
	@override String get showhighlightedverse => 'Afficher les versets en surbrillance';
	@override String get downloadmoreversions => 'Télécharger plus de versions';
	@override String get suggestedusers => 'Utilisateurs suggérés à suivre';
	@override String get unfollow => 'Ne pas suivre';
	@override String get follow => 'Suivre';
	@override String get searchforpeople => 'Recherche de personnes';
	@override String get viewpost => 'Voir l\'article';
	@override String get viewprofile => 'Voir le profil';
	@override String get mypins => 'Mes épingles';
	@override String get viewpinnedposts => 'Afficher les messages épinglés';
	@override String get personal => 'Personnel';
	@override String get update => 'Mettre à jour';
	@override String get phonenumber => 'Numéro de téléphone';
	@override String get showmyphonenumber => 'Afficher mon numéro de téléphone aux utilisateurs';
	@override String get dateofbirth => 'Date de naissance';
	@override String get showmyfulldateofbirth => 'Afficher ma date de naissance complète aux personnes qui consultent mon statut';
	@override String get notifications => 'Notifications';
	@override String get notifywhenuserfollowsme => 'M\'avertir lorsqu\'un utilisateur me suit';
	@override String get notifymewhenusercommentsonmypost => 'M\'avertir lorsque les utilisateurs commentent mon message';
	@override String get notifymewhenuserlikesmypost => 'M\'avertir lorsque les utilisateurs aiment mon message';
	@override String get churchsocial => 'Église sociale';
	@override String get shareyourthoughts => 'Partage tes pensées';
	@override String get readmore => '...Lire la suite';
	@override String get less => ' Moins';
	@override String get couldnotprocess => 'Impossible de traiter l\'action demandée.';
	@override String get pleaseselectprofilephoto => 'Veuillez sélectionner une photo de profil à télécharger';
	@override String get pleaseselectprofilecover => 'Veuillez sélectionner une photo de couverture à télécharger';
	@override String get updateprofileerrorhint => 'Vous devez renseigner votre nom, date de naissance, sexe, téléphone et lieu avant de pouvoir continuer.';
	@override String get gender => 'Le sexe';
	@override String get male => 'Mâle';
	@override String get female => 'Femme';
	@override String get dob => 'Date de naissance';
	@override String get location => 'Localisation actuelle';
	@override String get qualification => 'Qualification';
	@override String get aboutme => 'À propos de moi';
	@override String get facebookprofilelink => 'Lien de profil Facebook';
	@override String get twitterprofilelink => 'Lien de profil Twitter';
	@override String get linkdln => 'Lien de profil Linkedln';
	@override String get likes => 'Aime';
	@override String get likess => 'Comme';
	@override String get pinnedposts => 'Mes messages épinglés';
	@override String get unpinpost => 'Détacher le message';
	@override String get unpinposthint => 'Souhaitez-vous supprimer ce message de vos messages épinglés?';
	@override String get postdetails => 'Détails de l\'article';
	@override String get posts => 'Des postes';
	@override String get followers => 'Suiveurs';
	@override String get followings => 'Suivi';
	@override String get my => 'Mon';
	@override String get edit => 'Éditer';
	@override String get delete => 'Supprimer';
	@override String get deletepost => 'Supprimer le message';
	@override String get deleteposthint => 'Souhaitez-vous supprimer ce message? Les publications peuvent toujours apparaître sur les flux de certains utilisateurs.';
	@override String get maximumallowedsizehint => 'Téléchargement de fichier maximum autorisé atteint';
	@override String get maximumuploadsizehint => 'Le fichier sélectionné dépasse la limite de taille de fichier de téléchargement autorisée.';
	@override String get makeposterror => 'Impossible de publier un message pour le moment, veuillez cliquer pour réessayer.';
	@override String get makepost => 'Faire un message';
	@override String get selectfile => 'Choisir le dossier';
	@override String get images => 'Images';
	@override String get shareYourThoughtsNow => 'Share your thoughts ...';
	@override String get photoviewer => 'Visor de fotos';
	@override String get nochatsavailable => 'Aucune conversation disponible \n Cliquez sur l\'icône d\'ajout ci-dessous \n pour sélectionner les utilisateurs avec lesquels discuter';
	@override String get typing => 'Dactylographie...';
	@override String get photo => 'Foto';
	@override String get online => 'En ligne';
	@override String get offline => 'Hors ligne';
	@override String get lastseen => 'Dernière vue';
	@override String get deleteselectedhint => 'Cette action supprimera les messages sélectionnés. Veuillez noter que cela ne supprime que votre côté de la conversation, \n les messages s\'afficheront toujours sur votre appareil partenaire.';
	@override String get deleteselected => 'Supprimer sélectionnée';
	@override String get unabletofetchconversation => 'Impossible de récupérer \n votre conversation avec \n';
	@override String get loadmoreconversation => 'Charger plus de conversations';
	@override String get sendyourfirstmessage => 'Envoyez votre premier message à \n';
	@override String get unblock => 'Débloquer ';
	@override String get block => 'Bloquer ';
	@override String get writeyourmessage => 'Rédigez votre message...';
	@override String get clearconversation => 'Conversation claire';
	@override String get clearconversationhintone => 'Cette action effacera toute votre conversation avec ';
	@override String get clearconversationhinttwo => '.\n  Veuillez noter que cela ne supprime que votre côté de la conversation, les messages seront toujours affichés sur le chat de votre partenaire.';
	@override String get facebookloginerror => 'Something went wrong with the login process.\n, Here is the error Facebook gave us';
	@override String get selectLanguage => 'Choisir la langue';
	@override String get howTo => 'Comment';
	@override String get noBibleTextsAvailable => 'Aucun texte biblique disponible';
	@override String get languages => 'Langues';
	@override String get searchLanguages => 'Rechercher des langues...';
	@override String get biblesFilesets => 'Bibles: {bibles}, Jeux de fichiers: {filesets}';
	@override String get oldTestament => 'Ancien Testament';
	@override String get newTestament => 'Nouveau Testament';
	@override String get play => 'Reproducir';
	@override String get no_verse_content => 'Aucun contenu de verset biblique disponible à afficher.';
	@override String get no_audio_content => 'Aucun contenu audio de la Bible disponible à afficher.';
}

// Path: <root>
class _StringsHi implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsHi.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsHi _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'मेरा वर्चुअल पास्टर';
	@override String get selectlanguage => 'भाषा चुनें';
	@override String get deletemyaccount => 'मेरा खाता हटाएं';
	@override String get deleteaccount => 'खाता हटाएं';
	@override String get deleteaccounthint => 'यह कार्रवाई आपके खाते को हटा देगी और आपके सभी डेटा को निकाल देगी। एक बार डेटा हटा दिया गया, तो इसे पुनः प्राप्त नहीं किया जा सकता।';
	@override String get deleteaccountsuccess => 'खाता हटाने में सफल रहा';
	@override String get chooseapplanguage => 'ऐप भाषा चुनें';
	@override String get nightmode => 'रात मोड';
	@override String get initializingapp => 'प्रारंभ हो रहा है...';
	@override String get home => 'होम';
	@override String get branches => 'शाखाएँ';
	@override String get inbox => 'इनबॉक्स';
	@override String get downloads => 'डाउनलोड्स';
	@override String get settings => 'सेटिंग्स';
	@override String get events => 'घटनाएँ';
	@override String get myplaylists => 'मेरी प्लेलिस्ट्स';
	@override String get website => 'वेबसाइट';
	@override String get hymns => 'भजन';
	@override String get articles => 'लेख';
	@override String get notes => 'टिप्पणियाँ';
	@override String get donate => 'दान';
	@override String get offering => 'प्रस्ताव';
	@override String get savenotetitle => 'टिप्पणी शीर्षक';
	@override String get nonotesfound => 'कोई टिप्पणियाँ नहीं मिलीं';
	@override String get newnote => 'नया';
	@override String get deletenote => 'टिप्पणी हटाएं';
	@override String get deletenotehint => 'क्या आप इस टिप्पणी को हटाना चाहते हैं? इस कार्रवाई को वापस नहीं किया जा सकता।';
	@override String get bookmarks => 'बुकमार्क्स';
	@override String get socialplatforms => 'सामाजिक प्लेटफ़ॉर्म्स';
	@override List<String> get onboardingpagetitles => [
		'मेरे चर्च में स्वागत है',
		'विशेषताओं से भरपूर',
		'ऑडियो, वीडियो \n और लाइव स्ट्रीमिंग',
		'खाता बनाएं',
	];
	@override List<String> get onboardingpagehints => [
		'रविवार की सुबहों और आपके गिरजाघर की चार दीवारों से आगे बढ़ें। एक मोबाइल-मुख्य की दुनिया के साथ संवाद करने और जुड़ने के लिए सब कुछ।',
		'हमने आपके चर्च ऐप में होने वाले सभी शीर्ष सुविधाओं को एक साथ लाया है। घटनाएँ, भक्तिगान, सूचनाएं, टिप्पणियाँ और बहु-संस्करणीय बाइबल।',
		'यह उपयोगकर्ताओं को पूरे विश्व में आपकी चर्च सेवाओं की वीडियो देखने, ऑडियो संदेश सुनने और लाइव स्ट्रीमिंग करने की स्वीकृति देता है।',
		'अनंत आराधना अनुभव के लिए अपनी यात्रा शुरू करें।',
	];
	@override String get next => 'आगे';
	@override String get done => 'शुरू करें';
	@override String get quitapp => 'ऐप छोड़ें!';
	@override String get quitappwarning => 'क्या आप ऐप को बंद करना चाहते हैं?';
	@override String get quitappaudiowarning => 'आप वर्तमान में ऑडियो चला रहे हैं। ऐप बंद करने से ऑडियो प्लेबैक रुक जाएगा। यदि आप प्लेबैक रोकना नहीं चाहते हैं, तो केंद्रीय बटन के साथ ऐप को मिनिमाइज करें या ठीक बटन पर क्लिक करें।';
	@override String get ok => 'ठीक है';
	@override String get retry => 'पुनः प्रयास करें';
	@override String get oops => 'ऊप्स!';
	@override String get save => 'सहेजें';
	@override String get cancel => 'रद्द करें';
	@override String get error => 'त्रुटि';
	@override String get success => 'सफलता';
	@override String get skip => 'छोड़ें';
	@override String get skiplogin => 'लॉगिन छोड़ें';
	@override String get skipregister => 'रजिस्ट्रेशन छोड़ें';
	@override String get dataloaderror => 'वर्तमान में अनुरोधित डेटा लोड नहीं किया जा सका। अपना डेटा कनेक्शन जांचें और पुनः प्रयास करें।';
	@override String get suggestedforyou => 'आपके लिए सुझावित';
	@override String get videomessages => 'वीडियो संदेश';
	@override String get audiomessages => 'ऑडियो संदेश';
	@override String get devotionals => 'ध्यान';
	@override String get categories => 'श्रेणियाँ';
	@override String get category => 'श्रेणी';
	@override String get videos => 'वीडियो';
	@override String get audios => 'ऑडियो';
	@override String get biblebooks => 'बाइबल';
	@override String get sermons => 'उपदेश';
	@override String get tools => 'उपकरण';
	@override String get profile => 'प्रोफ़ाइल';
	@override String get audiobible => 'ऑडियो बाइबल';
	@override String get homesentence => 'आपके पास्टर के रूप में 1 वर्ष के लिए, आपको उस व्यक्ति में बढ़ने में मदद करने के लिए जो भगवान ने आपको बुलाया है।';
	@override String get livestreams => 'लाइव स्ट्रीम्स';
	@override String get radio => 'रेडियो';
	@override String get allitems => 'सभी आइटम्स';
	@override String get emptyplaylist => 'कोई प्लेलिस्ट नहीं';
	@override String get notsupported => 'समर्थित नहीं है';
	@override String get cleanupresources => 'संसाधन साफ़ करें';
	@override String get grantstoragepermission => 'कृपया जारी रखने के लिए भंडारण अनुमति प्रदान करें';
	@override String get sharefiletitle => 'देखें या सुनें ';
	@override String get sharefilebody => 'मेरा वर्चुअल पास्टर ऐप के माध्यम से, अभी डाउनलोड करें ';
	@override String get sharetext => 'असीमित ऑडियो और वीडियो स्ट्रीमिंग का आनंद लें';
	@override String get sharetexthint => 'वीडियो और ऑडियो स्ट्रीमिंग प्लेटफ़ॉर्म से जुड़ें जो आपको दुनिया भर से लाखों फ़ाइलें देखने और सुनने देता है। अभी डाउनलोड करें ';
	@override String get download => 'डाउनलोड';
	@override String get addplaylist => 'प्लेलिस्ट में जोड़ें';
	@override String get bookmark => 'बुकमार्क';
	@override String get unbookmark => 'बुकमार्क हटाएं';
	@override String get share => 'शेयर करें';
	@override String get deletemedia => 'फ़ाइल हटाएं';
	@override String get deletemediahint => 'क्या आप इस डाउनलोड की गई फ़ाइल को हटाना चाहते हैं? यह कार्रवाई पूर्ववत नहीं की जा सकती।';
	@override String get searchhint => 'ऑडियो और वीडियो संदेश खोजें';
	@override String get performingsearch => 'ऑडियो और वीडियो खोज रहे हैं';
	@override String get nosearchresult => 'कोई परिणाम नहीं मिला';
	@override String get nosearchresulthint => 'अधिक सामान्य कीवर्ड दर्ज करने का प्रयास करें';
	@override String get addtoplaylist => 'प्लेलिस्ट में जोड़ें';
	@override String get newplaylist => 'नई प्लेलिस्ट';
	@override String get playlistitm => 'प्लेलिस्ट';
	@override String get mediaaddedtoplaylist => 'मीडिया प्लेलिस्ट में जोड़ा गया।';
	@override String get mediaremovedfromplaylist => 'मीडिया प्लेलिस्ट से हटाया गया';
	@override String get clearplaylistmedias => 'सभी मीडिया साफ़ करें';
	@override String get deletePlayList => 'प्लेलिस्ट हटाएं';
	@override String get clearplaylistmediashint => 'क्या आप इस प्लेलिस्ट से सभी मीडिया हटाना चाहते हैं?';
	@override String get deletePlayListhint => 'क्या आप इस प्लेलिस्ट को हटाना चाहते हैं और सभी मीडिया को साफ़ करना चाहते हैं?';
	@override String get comments => 'टिप्पणियाँ';
	@override String get replies => 'उत्तर';
	@override String get reply => 'उत्तर दें';
	@override String get logintoaddcomment => 'टिप्पणी जोड़ने के लिए लॉगिन करें';
	@override String get logintoreply => 'उत्तर देने के लिए लॉगिन करें';
	@override String get writeamessage => 'संदेश लिखें...';
	@override String get nocomments => 'कोई टिप्पणियाँ नहीं मिलीं \nकृपया पुनः प्रयास करें';
	@override String get errormakingcomments => 'वर्तमान में टिप्पणी करने में असमर्थ।';
	@override String get errordeletingcomments => 'वर्तमान में इस टिप्पणी को हटाने में असमर्थ।';
	@override String get erroreditingcomments => 'वर्तमान में इस टिप्पणी को संपादित करने में असमर्थ।';
	@override String get errorloadingmorecomments => 'वर्तमान में अधिक टिप्पणियाँ लोड करने में असमर्थ।';
	@override String get deletingcomment => 'टिप्पणी हटा रहे हैं';
	@override String get editingcomment => 'टिप्पणी संपादित कर रहे हैं';
	@override String get deletecommentalert => 'टिप्पणी हटाएं';
	@override String get editcommentalert => 'टिप्पणी संपादित करें';
	@override String get deletecommentalerttext => 'क्या आप इस टिप्पणी को हटाना चाहते हैं? यह कार्रवाई पूर्ववत नहीं की जा सकती';
	@override String get loadmore => 'अधिक लोड करें';
	@override String get messages => 'संदेश';
	@override String get guestuser => 'अतिथि उपयोगकर्ता';
	@override String get fullname => 'पूरा नाम';
	@override String get emailaddress => 'ईमेल पता';
	@override String get password => 'पासवर्ड';
	@override String get repeatpassword => 'पासवर्ड दोहराएं';
	@override String get register => 'रजिस्टर करें';
	@override String get login => 'लॉगिन';
	@override String get logout => 'लॉगआउट';
	@override String get logoutfromapp => 'ऐप से लॉगआउट करें?';
	@override String get logoutfromapphint => 'यदि आप लॉगिन नहीं हैं तो आप लेख और वीडियो पर टिप्पणी या पसंद नहीं कर पाएंगे।';
	@override String get gotologin => 'लॉगिन पर जाएं';
	@override String get resetpassword => 'पासवर्ड रीसेट करें';
	@override String get logintoaccount => 'पहले से ही एक खाता है? लॉगिन करें';
	@override String get emptyfielderrorhint => 'आपको सभी फ़ील्ड भरने की आवश्यकता है';
	@override String get invalidemailerrorhint => 'आपको एक वैध ईमेल पता दर्ज करना होगा';
	@override String get passwordsdontmatch => 'पासवर्ड मेल नहीं खाते';
	@override String get processingpleasewait => 'प्रसंस्करण हो रहा है, कृपया प्रतीक्षा करें...';
	@override String get createaccount => 'खाता बनाएं';
	@override String get forgotpassword => 'पासवर्ड भूल गए?';
	@override String get orloginwith => 'या लॉगिन करें';
	@override String get facebook => 'फेसबुक';
	@override String get google => 'गूगल';
	@override String get moreoptions => 'अधिक विकल्प';
	@override String get about => 'हमारे बारे में';
	@override String get privacy => 'गोपनीयता नीति';
	@override String get terms => 'ऐप की शर्तें';
	@override String get rate => 'ऐप को रेट करें';
	@override String get version => 'संस्करण';
	@override String get pulluploadmore => 'लोड करने के लिए ऊपर खींचें';
	@override String get loadfailedretry => 'लोड असफल! पुनः प्रयास के लिए क्लिक करें!';
	@override String get releaseloadmore => 'लोड करने के लिए जारी करें';
	@override String get nomoredata => 'और डेटा नहीं';
	@override String get errorReportingComment => 'टिप्पणी की रिपोर्टिंग त्रुटि';
	@override String get reportingComment => 'टिप्पणी की रिपोर्टिंग';
	@override String get reportcomment => 'रिपोर्ट विकल्प';
	@override List<String> get reportCommentsList => [
		'अनचाहा व्यावसायिक सामग्री या स्पैम',
		'अश्लीलता या यौन स्पष्ट सामग्री',
		'घृणा भाषण या ग्राफिक हिंसा',
		'उत्पीड़न या धमकाना',
	];
	@override String get bookmarksMedia => 'मेरे बुकमार्क्स';
	@override String get noitemstodisplay => 'प्रदर्शित करने के लिए कोई आइटम नहीं';
	@override String get loginrequired => 'लॉगिन आवश्यक';
	@override String get loginrequiredhint => 'इस प्लेटफ़ॉर्म पर सदस्यता लेने के लिए, आपको लॉगिन करना होगा। अभी एक मुफ्त खाता बनाएं या अपने मौजूदा खाते में लॉगिन करें।';
	@override String get subscriptions => 'ऐप सब्स्क्रिप्शन';
	@override String get subscribe => 'सदस्यता लें';
	@override String get subscribehint => 'सदस्यता आवश्यक';
	@override String get playsubscriptionrequiredhint => 'इस मीडिया को सुनने या देखने से पहले आपको सदस्यता लेनी होगी।';
	@override String get previewsubscriptionrequiredhint => 'आपने इस मीडिया के लिए अनुमत पूर्वावलोकन अवधि पूरी कर ली है। सुनने या देखने के लिए आपको सदस्यता लेनी होगी।';
	@override String get copiedtoclipboard => 'क्लिपबोर्ड में कॉपी किया गया';
	@override String get downloadbible => 'बाइबल डाउनलोड करें';
	@override String get downloadversion => 'डाउनलोड करें';
	@override String get downloading => 'डाउनलोड हो रहा है';
	@override String get failedtodownload => 'डाउनलोड करने में विफल';
	@override String get pleaseclicktoretry => 'कृपया पुनः प्रयास के लिए क्लिक करें।';
	@override String get of => 'का';
	@override String get nobibleversionshint => 'प्रदर्शित करने के लिए कोई बाइबल डेटा नहीं है, कम से कम एक बाइबल संस्करण डाउनलोड करने के लिए नीचे दिए गए बटन पर क्लिक करें।';
	@override String get downloaded => 'डाउनलोड किया गया';
	@override String get enteremailaddresstoresetpassword => 'अपना पासवर्ड रीसेट करने के लिए अपना ईमेल दर्ज करें';
	@override String get backtologin => 'लॉगिन पर वापस जाएं';
	@override String get signintocontinue => 'जारी रखने के लिए साइन इन करें';
	@override String get signin => 'साइन इन';
	@override String get signinforanaccount => 'खाता बनाने के लिए साइन अप करें?';
	@override String get alreadyhaveanaccount => 'पहले से ही खाता है?';
	@override String get updateprofile => 'प्रोफ़ाइल अपडेट करें';
	@override String get updateprofilehint => 'शुरू करने के लिए, कृपया अपनी प्रोफ़ाइल पृष्ठ को अपडेट करें, यह हमें अन्य लोगों के साथ जोड़ने में मदद करेगा';
	@override String get autoplayvideos => 'वीडियो ऑटोप्ले';
	@override String get gosocial => 'सोशल पर जाएं';
	@override String get searchbible => 'बाइबल खोजें';
	@override String get filtersearchoptions => 'खोज विकल्पों को फ़िल्टर करें';
	@override String get narrowdownsearch => 'अधिक सटीक परिणाम के लिए नीचे दिए गए फ़िल्टर बटन का उपयोग करें।';
	@override String get searchbibleversion => 'बाइबल संस्करण खोजें';
	@override String get searchbiblebook => 'बाइबल पुस्तक खोजें';
	@override String get search => 'खोजें';
	@override String get setBibleBook => 'बाइबल पुस्तक सेट करें';
	@override String get oldtestament => 'पुराना नियम';
	@override String get newtestament => 'नया नियम';
	@override String get limitresults => 'परिणाम सीमित करें';
	@override String get setfilters => 'फ़िल्टर सेट करें';
	@override String get bibletranslator => 'बाइबल अनुवादक';
	@override String get chapter => ' अध्याय ';
	@override String get verse => ' पद ';
	@override String get translate => 'अनुवाद करें';
	@override String get bibledownloadinfo => 'बाइबल डाउनलोड शुरू हो गया है, कृपया डाउनलोड पूरा होने तक इस पृष्ठ को बंद न करें।';
	@override String get received => 'प्राप्त';
	@override String get outoftotal => 'कुल में से';
	@override String get set => 'सेट करें';
	@override String get selectColor => 'रंग चुनें';
	@override String get switchbibleversion => 'बाइबल संस्करण बदलें';
	@override String get switchbiblebook => 'बाइबल पुस्तक बदलें';
	@override String get gotosearch => 'अध्याय पर जाएं';
	@override String get changefontsize => 'फ़ॉन्ट आकार बदलें';
	@override String get font => 'फ़ॉन्ट';
	@override String get readchapter => 'अध्याय पढ़ें';
	@override String get showhighlightedverse => 'हाइलाइट किए गए पद दिखाएं';
	@override String get downloadmoreversions => 'अधिक संस्करण डाउनलोड करें';
	@override String get suggestedusers => 'अनुशंसित उपयोगकर्ता';
	@override String get unfollow => 'अनफॉलो';
	@override String get follow => 'फॉलो करें';
	@override String get searchforpeople => 'लोगों को खोजें';
	@override String get viewpost => 'पोस्ट देखें';
	@override String get viewprofile => 'प्रोफ़ाइल देखें';
	@override String get mypins => 'मेरे पिन्स';
	@override String get viewpinnedposts => 'पिन किए गए पोस्ट देखें';
	@override String get personal => 'व्यक्तिगत';
	@override String get update => 'अपडेट करें';
	@override String get phonenumber => 'फ़ोन नंबर';
	@override String get showmyphonenumber => 'मेरा फ़ोन नंबर उपयोगकर्ताओं को दिखाएं';
	@override String get dateofbirth => 'जन्म तिथि';
	@override String get showmyfulldateofbirth => 'मेरा पूरा जन्मदिन देखने वाले लोगों को दिखाएं';
	@override String get notifications => 'सूचनाएं';
	@override String get notifywhenuserfollowsme => 'जब कोई उपयोगकर्ता मुझे फॉलो करे तो सूचित करें';
	@override String get notifymewhenusercommentsonmypost => 'जब उपयोगकर्ता मेरी पोस्ट पर टिप्पणी करें तो सूचित करें';
	@override String get notifymewhenuserlikesmypost => 'जब उपयोगकर्ता मेरी पोस्ट को पसंद करें तो सूचित करें';
	@override String get churchsocial => 'चर्च सोशल';
	@override String get shareyourthoughts => 'अपने विचार साझा करें';
	@override String get readmore => '...और पढ़ें';
	@override String get less => ' कम';
	@override String get couldnotprocess => 'अनुरोधित कार्रवाई को संसाधित नहीं कर सका।';
	@override String get pleaseselectprofilephoto => 'कृपया अपलोड करने के लिए एक प्रोफ़ाइल फोटो चुनें';
	@override String get pleaseselectprofilecover => 'कृपया अपलोड करने के लिए एक कवर फोटो चुनें';
	@override String get updateprofileerrorhint => 'आगे बढ़ने से पहले आपको अपना नाम, जन्म तिथि, लिंग, फोन और स्थान भरना होगा।';
	@override String get gender => 'लिंग';
	@override String get male => 'पुरुष';
	@override String get female => 'महिला';
	@override String get dob => 'जन्म तिथि';
	@override String get location => 'वर्तमान स्थान';
	@override String get qualification => 'योग्यता';
	@override String get aboutme => 'मेरे बारे में';
	@override String get facebookprofilelink => 'फेसबुक प्रोफ़ाइल लिंक';
	@override String get twitterprofilelink => 'ट्विटर प्रोफ़ाइल लिंक';
	@override String get linkdln => 'लिंक्डइन प्रोफ़ाइल लिंक';
	@override String get likes => 'पसंद';
	@override String get likess => 'पसंद';
	@override String get pinnedposts => 'मेरे पिन किए गए पोस्ट';
	@override String get unpinpost => 'पोस्ट को अनपिन करें';
	@override String get unpinposthint => 'क्या आप इस पोस्ट को अपने पिन किए गए पोस्ट से हटाना चाहते हैं?';
	@override String get postdetails => 'पोस्ट विवरण';
	@override String get posts => 'पोस्ट';
	@override String get followers => 'अनुयायी';
	@override String get followings => 'अनुसरण';
	@override String get my => 'मेरा';
	@override String get edit => 'संपादित करें';
	@override String get delete => 'हटाएं';
	@override String get deletepost => 'पोस्ट हटाएं';
	@override String get deleteposthint => 'क्या आप इस पोस्ट को हटाना चाहते हैं? पोस्ट अभी भी कुछ उपयोगकर्ताओं की फीड पर दिखाई दे सकती है।';
	@override String get maximumallowedsizehint => 'अधिकतम अनुमत फ़ाइल अपलोड आकार पहुँच गया';
	@override String get maximumuploadsizehint => 'चयनित फ़ाइल अनुमत अपलोड फ़ाइल आकार सीमा से अधिक है।';
	@override String get makeposterror => 'वर्तमान में पोस्ट बनाने में असमर्थ, कृपया पुनः प्रयास करने के लिए क्लिक करें।';
	@override String get makepost => 'पोस्ट बनाएं';
	@override String get selectfile => 'फ़ाइल चुनें';
	@override String get images => 'छवियाँ';
	@override String get shareYourThoughtsNow => 'अपने विचार साझा करें...';
	@override String get photoviewer => 'फोटो व्यूअर';
	@override String get nochatsavailable => 'कोई वार्तालाप उपलब्ध नहीं \nनीचे दिए गए आइकन पर क्लिक करें \nउपयोगकर्ताओं का चयन करने के लिए';
	@override String get typing => 'टाइप कर रहे हैं...';
	@override String get photo => 'फोटो';
	@override String get online => 'ऑनलाइन';
	@override String get offline => 'ऑफ़लाइन';
	@override String get lastseen => 'अंतिम बार देखा गया';
	@override String get deleteselectedhint => 'यह कार्रवाई चयनित संदेशों को हटा देगी। कृपया ध्यान दें कि यह केवल आपकी बातचीत का भाग हटाता है, \n संदेश अभी भी आपके साथी के डिवाइस पर दिखाए जाएंगे।';
	@override String get deleteselected => 'चयनित हटाएं';
	@override String get unabletofetchconversation => 'आपकी बातचीत नहीं लोड कर सका \n';
	@override String get loadmoreconversation => 'अधिक वार्तालाप लोड करें';
	@override String get sendyourfirstmessage => 'अपना पहला संदेश भेजें \n';
	@override String get unblock => 'अनब्लॉक ';
	@override String get block => 'ब्लॉक';
	@override String get writeyourmessage => 'अपना संदेश लिखें...';
	@override String get clearconversation => 'वार्तालाप साफ़ करें';
	@override String get clearconversationhintone => 'यह कार्रवाई आपकी पूरी बातचीत को साफ़ कर देगी ';
	@override String get clearconversationhinttwo => '.\n कृपया ध्यान दें कि यह केवल आपकी बातचीत का भाग हटाता है, संदेश अभी भी आपके साथी के चैट में दिखाए जाएंगे।';
	@override String get facebookloginerror => 'लॉगिन प्रक्रिया के साथ कुछ गलत हो गया।\n, यहाँ फेसबुक ने हमें त्रुटि दी है';
	@override String get selectLanguage => 'भाषा चुनें';
	@override String get howTo => 'कैसे';
	@override String get noBibleTextsAvailable => 'कोई बाइबल पाठ उपलब्ध नहीं है';
	@override String get languages => 'भाषाएँ';
	@override String get searchLanguages => 'भाषाओं की खोज करें...';
	@override String get biblesFilesets => 'बाइबल: {bibles}, फाइलसेट्स: {filesets}';
	@override String get oldTestament => 'पुराना नियम';
	@override String get newTestament => 'नया नियम';
	@override String get play => 'चलाएं';
	@override String get no_verse_content => 'प्रदर्शित करने के लिए कोई बाइबिल पद्य सामग्री उपलब्ध नहीं है।';
	@override String get no_audio_content => 'प्रदर्शित करने के लिए कोई बाइबिल ऑडियो सामग्री उपलब्ध नहीं है।';
}

// Path: <root>
class _StringsId implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsId.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsId _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'Pastor Virtual';
	@override String get selectlanguage => 'Pilih Bahasa';
	@override String get deletemyaccount => 'Hapus akun saya';
	@override String get deleteaccount => 'Hapus akun saya';
	@override String get deleteaccounthint => 'Tindakan ini akan menghapus akun Anda dan menghapus semua data Anda. Setelah data Anda dihapus, data tersebut tidak dapat dipulihkan.';
	@override String get deleteaccountsuccess => 'Penghapusan akun berhasil';
	@override String get chooseapplanguage => 'Pilih Bahasa Aplikasi';
	@override String get nightmode => 'Mode Malam';
	@override String get initializingapp => 'Memulai...';
	@override String get home => 'Beranda';
	@override String get branches => 'Cabang';
	@override String get inbox => 'Kotak Masuk';
	@override String get downloads => 'Unduhan';
	@override String get settings => 'Pengaturan';
	@override String get events => 'Acara';
	@override String get myplaylists => 'Playlist Saya';
	@override String get website => 'Situs Web';
	@override String get hymns => 'Himne';
	@override String get articles => 'Artikel';
	@override String get notes => 'Catatan';
	@override String get donate => 'Donasi';
	@override String get offering => 'Persembahan';
	@override String get savenotetitle => 'Judul Catatan';
	@override String get nonotesfound => 'Tidak ada catatan ditemukan';
	@override String get newnote => 'Baru';
	@override String get deletenote => 'Hapus Catatan';
	@override String get deletenotehint => 'Apakah Anda ingin menghapus catatan ini? Tindakan ini tidak dapat dibatalkan.';
	@override String get bookmarks => 'Penanda';
	@override String get socialplatforms => 'Platform Sosial';
	@override List<String> get onboardingpagetitles => [
		'Selamat Datang di Gereja Saya',
		'Penuh dengan Fitur',
		'Audio, Video \n dan Streaming Langsung',
		'Buat Akun',
	];
	@override List<String> get onboardingpagehints => [
		'Lebih jauh dari pagi Minggu & empat dinding gereja Anda. Semua yang Anda butuhkan untuk berkomunikasi dan terhubung dengan dunia yang berfokus pada seluler.',
		'Kami telah mengumpulkan semua fitur utama yang harus dimiliki aplikasi gereja Anda. Acara, Devosi, Notifikasi, Catatan, dan Alkitab multi-versi.',
		'Izinkan pengguna di seluruh dunia menonton video, mendengarkan pesan audio, dan menonton streaming langsung layanan gereja Anda.',
		'Mulailah perjalanan Anda menuju pengalaman penyembahan yang tak berujung.',
	];
	@override String get next => 'BERIKUTNYA';
	@override String get done => 'Mulai';
	@override String get quitapp => 'Keluar Aplikasi!';
	@override String get quitappwarning => 'Apakah Anda ingin menutup aplikasi?';
	@override String get quitappaudiowarning => 'Anda sedang memutar audio, keluar dari aplikasi akan menghentikan pemutaran audio. Jika Anda tidak ingin menghentikan pemutaran, cukup minimalkan aplikasi dengan tombol tengah atau klik tombol Oke untuk keluar dari aplikasi sekarang.';
	@override String get ok => 'Oke';
	@override String get retry => 'COBA LAGI';
	@override String get oops => 'Ups!';
	@override String get save => 'Simpan';
	@override String get cancel => 'Batal';
	@override String get error => 'Kesalahan';
	@override String get success => 'Sukses';
	@override String get skip => 'Lewati';
	@override String get skiplogin => 'Lewati Login';
	@override String get skipregister => 'Lewati Pendaftaran';
	@override String get dataloaderror => 'Tidak dapat memuat data yang diminta saat ini, periksa koneksi data Anda dan klik untuk mencoba lagi.';
	@override String get suggestedforyou => 'Disarankan untuk Anda';
	@override String get videomessages => 'Pesan Video';
	@override String get audiomessages => 'Pesan Audio';
	@override String get devotionals => 'Devosi';
	@override String get categories => 'Kategori';
	@override String get category => 'Kategori';
	@override String get videos => 'Video';
	@override String get audios => 'Audio';
	@override String get biblebooks => 'Alkitab';
	@override String get sermons => 'Khotbah';
	@override String get tools => 'Alat';
	@override String get profile => 'Profil';
	@override String get audiobible => 'Alkitab Audio';
	@override String get homesentence => 'Pastor Anda selama 1 tahun, untuk membantu Anda tumbuh menjadi orang yang Tuhan panggil untuk menjadi.';
	@override String get livestreams => 'Streaming Langsung';
	@override String get radio => 'Radio';
	@override String get allitems => 'Semua Item';
	@override String get emptyplaylist => 'Tidak ada Playlist';
	@override String get notsupported => 'Tidak Didukung';
	@override String get cleanupresources => 'Membersihkan sumber daya';
	@override String get grantstoragepermission => 'Harap berikan izin akses penyimpanan untuk melanjutkan';
	@override String get sharefiletitle => 'Tonton atau Dengarkan ';
	@override String get sharefilebody => 'Melalui Aplikasi Pastor Virtual Saya, Unduh sekarang di ';
	@override String get sharetext => 'Nikmati streaming Audio & Video tanpa batas';
	@override String get sharetexthint => 'Bergabunglah dengan platform streaming Video dan Audio yang memungkinkan Anda menonton dan mendengarkan jutaan file dari seluruh dunia. Unduh sekarang di';
	@override String get download => 'Unduh';
	@override String get addplaylist => 'Tambahkan ke playlist';
	@override String get bookmark => 'Penanda';
	@override String get unbookmark => 'Batalkan Penanda';
	@override String get share => 'Bagikan';
	@override String get deletemedia => 'Hapus File';
	@override String get deletemediahint => 'Apakah Anda ingin menghapus file yang diunduh ini? Tindakan ini tidak dapat dibatalkan.';
	@override String get searchhint => 'Cari Pesan Audio & Video';
	@override String get performingsearch => 'Mencari Audio dan Video';
	@override String get nosearchresult => 'Tidak ada hasil yang ditemukan';
	@override String get nosearchresulthint => 'Coba masukkan kata kunci yang lebih umum';
	@override String get addtoplaylist => 'Tambahkan ke playlist';
	@override String get newplaylist => 'Playlist baru';
	@override String get playlistitm => 'Playlist';
	@override String get mediaaddedtoplaylist => 'Media ditambahkan ke playlist.';
	@override String get mediaremovedfromplaylist => 'Media dihapus dari playlist';
	@override String get clearplaylistmedias => 'Bersihkan Semua Media';
	@override String get deletePlayList => 'Hapus Playlist';
	@override String get clearplaylistmediashint => 'Apakah Anda ingin menghapus semua media dari playlist ini?';
	@override String get deletePlayListhint => 'Apakah Anda ingin menghapus playlist ini dan membersihkan semua media?';
	@override String get comments => 'Komentar';
	@override String get replies => 'Balasan';
	@override String get reply => 'Balas';
	@override String get logintoaddcomment => 'Login untuk menambahkan komentar';
	@override String get logintoreply => 'Login untuk membalas';
	@override String get writeamessage => 'Tulis pesan...';
	@override String get nocomments => 'Tidak ada komentar ditemukan \nklik untuk mencoba lagi';
	@override String get errormakingcomments => 'Tidak dapat memproses komentar saat ini..';
	@override String get errordeletingcomments => 'Tidak dapat menghapus komentar ini saat ini..';
	@override String get erroreditingcomments => 'Tidak dapat mengedit komentar ini saat ini..';
	@override String get errorloadingmorecomments => 'Tidak dapat memuat lebih banyak komentar saat ini..';
	@override String get deletingcomment => 'Menghapus komentar';
	@override String get editingcomment => 'Mengedit komentar';
	@override String get deletecommentalert => 'Hapus Komentar';
	@override String get editcommentalert => 'Edit Komentar';
	@override String get deletecommentalerttext => 'Apakah Anda ingin menghapus komentar ini? Tindakan ini tidak dapat dibatalkan';
	@override String get loadmore => 'muat lebih banyak';
	@override String get messages => 'Pesan';
	@override String get guestuser => 'Pengguna Tamu';
	@override String get fullname => 'Nama Lengkap';
	@override String get emailaddress => 'Alamat Email';
	@override String get password => 'Kata Sandi';
	@override String get repeatpassword => 'Ulangi Kata Sandi';
	@override String get register => 'Daftar';
	@override String get login => 'Login';
	@override String get logout => 'Logout';
	@override String get logoutfromapp => 'Logout dari aplikasi?';
	@override String get logoutfromapphint => 'Anda tidak akan dapat menyukai atau berkomentar pada artikel dan video jika Anda tidak masuk.';
	@override String get gotologin => 'Pergi ke Login';
	@override String get resetpassword => 'Atur Ulang Kata Sandi';
	@override String get logintoaccount => 'Sudah punya akun? Login';
	@override String get emptyfielderrorhint => 'Anda harus mengisi semua kolom';
	@override String get invalidemailerrorhint => 'Anda harus memasukkan alamat email yang valid';
	@override String get passwordsdontmatch => 'Kata sandi tidak cocok';
	@override String get processingpleasewait => 'Memproses, Harap tunggu...';
	@override String get createaccount => 'Buat akun';
	@override String get forgotpassword => 'Lupa Kata Sandi?';
	@override String get orloginwith => 'Atau Login Dengan';
	@override String get facebook => 'Facebook';
	@override String get google => 'Google';
	@override String get moreoptions => 'Lebih Banyak Opsi';
	@override String get about => 'Tentang Kami';
	@override String get privacy => 'Kebijakan Privasi';
	@override String get terms => 'Ketentuan Aplikasi';
	@override String get rate => 'Beri Peringkat Aplikasi';
	@override String get version => 'Versi';
	@override String get pulluploadmore => 'tarik ke atas untuk memuat';
	@override String get loadfailedretry => 'Gagal Memuat! Klik untuk mencoba lagi!';
	@override String get releaseloadmore => 'lepaskan untuk memuat lebih banyak';
	@override String get nomoredata => 'Tidak ada Data lagi';
	@override String get errorReportingComment => 'Kesalahan Pelaporan Komentar';
	@override String get reportingComment => 'Pelaporan Komentar';
	@override String get reportcomment => 'Opsi Pelaporan';
	@override List<String> get reportCommentsList => [
		'Konten komersial yang tidak diinginkan atau spam',
		'Pornografi atau materi seksual eksplisit',
		'Pidato kebencian atau kekerasan grafis',
		'Pelecehan atau penindasan',
	];
	@override String get bookmarksMedia => 'Penanda Saya';
	@override String get noitemstodisplay => 'Tidak Ada Item Untuk Ditampilkan';
	@override String get loginrequired => 'Login Diperlukan';
	@override String get loginrequiredhint => 'Untuk berlangganan di platform ini, Anda harus masuk. Buat akun gratis sekarang atau masuk ke akun Anda yang sudah ada.';
	@override String get subscriptions => 'Langganan Aplikasi';
	@override String get subscribe => 'BERLANGGANAN';
	@override String get subscribehint => 'Langganan Diperlukan';
	@override String get playsubscriptionrequiredhint => 'Anda harus berlangganan sebelum dapat mendengarkan atau menonton media ini.';
	@override String get previewsubscriptionrequiredhint => 'Anda telah mencapai durasi pratinjau yang diperbolehkan untuk media ini. Anda harus berlangganan untuk melanjutkan mendengarkan atau menonton media ini.';
	@override String get copiedtoclipboard => 'Disalin ke papan klip';
	@override String get downloadbible => 'Unduh Alkitab';
	@override String get downloadversion => 'Unduh';
	@override String get downloading => 'Mengunduh';
	@override String get failedtodownload => 'Gagal mengunduh';
	@override String get pleaseclicktoretry => 'Silakan klik untuk mencoba lagi.';
	@override String get of => 'Dari';
	@override String get nobibleversionshint => 'Tidak ada data Alkitab yang ditampilkan, klik tombol di bawah untuk mengunduh setidaknya satu versi Alkitab.';
	@override String get downloaded => 'Diunduh';
	@override String get enteremailaddresstoresetpassword => 'Masukkan email Anda untuk mengatur ulang kata sandi Anda';
	@override String get backtologin => 'KEMBALI KE LOGIN';
	@override String get signintocontinue => 'Masuk untuk melanjutkan';
	@override String get signin => 'M A S U K';
	@override String get signinforanaccount => 'DAFTAR UNTUK AKUN?';
	@override String get alreadyhaveanaccount => 'Sudah punya akun?';
	@override String get updateprofile => 'Perbarui Profil';
	@override String get updateprofilehint => 'Untuk memulai, perbarui halaman profil Anda, ini akan membantu kami menghubungkan Anda dengan orang lain';
	@override String get autoplayvideos => 'Video Putar Otomatis';
	@override String get gosocial => 'Masuk Sosial';
	@override String get searchbible => 'Cari Alkitab';
	@override String get filtersearchoptions => 'Filter Opsi Pencarian';
	@override String get narrowdownsearch => 'Gunakan tombol filter di bawah untuk mempersempit pencarian agar hasil lebih akurat.';
	@override String get searchbibleversion => 'Cari Versi Alkitab';
	@override String get searchbiblebook => 'Cari Kitab Alkitab';
	@override String get search => 'Cari';
	@override String get setBibleBook => 'Atur Kitab Alkitab';
	@override String get oldtestament => 'Perjanjian Lama';
	@override String get newtestament => 'Perjanjian Baru';
	@override String get limitresults => 'Batasi Hasil';
	@override String get setfilters => 'Atur Filter';
	@override String get bibletranslator => 'Penerjemah Alkitab';
	@override String get chapter => ' Bab ';
	@override String get verse => ' Ayat ';
	@override String get translate => 'terjemahkan';
	@override String get bibledownloadinfo => 'Unduhan Alkitab dimulai, Jangan tutup halaman ini sampai unduhan selesai.';
	@override String get received => 'diterima';
	@override String get outoftotal => 'dari total';
	@override String get set => 'ATUR';
	@override String get selectColor => 'Pilih Warna';
	@override String get switchbibleversion => 'Ganti Versi Alkitab';
	@override String get switchbiblebook => 'Ganti Kitab Alkitab';
	@override String get gotosearch => 'Pergi ke Bab';
	@override String get changefontsize => 'Ubah Ukuran Font';
	@override String get font => 'Font';
	@override String get readchapter => 'Baca Bab';
	@override String get showhighlightedverse => 'Tampilkan Ayat yang Disorot';
	@override String get downloadmoreversions => 'Unduh lebih banyak versi';
	@override String get suggestedusers => 'Pengguna yang disarankan';
	@override String get unfollow => 'Berhenti Mengikuti';
	@override String get follow => 'Ikuti';
	@override String get searchforpeople => 'Cari orang';
	@override String get viewpost => 'Lihat Postingan';
	@override String get viewprofile => 'Lihat Profil';
	@override String get mypins => 'Pin Saya';
	@override String get viewpinnedposts => 'Lihat Postingan yang Dipin';
	@override String get personal => 'Pribadi';
	@override String get update => 'Perbarui';
	@override String get phonenumber => 'Nomor Telepon';
	@override String get showmyphonenumber => 'Tampilkan nomor telepon saya kepada pengguna';
	@override String get dateofbirth => 'Tanggal Lahir';
	@override String get showmyfulldateofbirth => 'Tampilkan tanggal lahir lengkap saya kepada orang yang melihat status saya';
	@override String get notifications => 'Notifikasi';
	@override String get notifywhenuserfollowsme => 'Beritahu saya ketika pengguna mengikuti saya';
	@override String get notifymewhenusercommentsonmypost => 'Beritahu saya ketika pengguna berkomentar pada postingan saya';
	@override String get notifymewhenuserlikesmypost => 'Beritahu saya ketika pengguna menyukai postingan saya';
	@override String get churchsocial => 'Sosial Gereja';
	@override String get shareyourthoughts => 'Bagikan pikiran Anda';
	@override String get readmore => '...Baca lebih lanjut';
	@override String get less => ' Kurang';
	@override String get couldnotprocess => 'Tidak dapat memproses tindakan yang diminta.';
	@override String get pleaseselectprofilephoto => 'Harap pilih foto profil untuk diunggah';
	@override String get pleaseselectprofilecover => 'Harap pilih foto sampul untuk diunggah';
	@override String get updateprofileerrorhint => 'Anda perlu mengisi nama, tanggal lahir, jenis kelamin, telepon, dan lokasi Anda sebelum dapat melanjutkan.';
	@override String get gender => 'Jenis Kelamin';
	@override String get male => 'Laki-laki';
	@override String get female => 'Perempuan';
	@override String get dob => 'Tanggal Lahir';
	@override String get location => 'Lokasi Saat Ini';
	@override String get qualification => 'Kualifikasi';
	@override String get aboutme => 'Tentang Saya';
	@override String get facebookprofilelink => 'Tautan Profil Facebook';
	@override String get twitterprofilelink => 'Tautan Profil Twitter';
	@override String get linkdln => 'Tautan Profil LinkedIn';
	@override String get likes => 'Suka';
	@override String get likess => 'Suka';
	@override String get pinnedposts => 'Postingan yang Dipin';
	@override String get unpinpost => 'Lepaskan Pin Postingan';
	@override String get unpinposthint => 'Apakah Anda ingin menghapus postingan ini dari postingan yang dipin?';
	@override String get postdetails => 'Detail Postingan';
	@override String get posts => 'Postingan';
	@override String get followers => 'Pengikut';
	@override String get followings => 'Mengikuti';
	@override String get my => 'Saya';
	@override String get edit => 'Edit';
	@override String get delete => 'Hapus';
	@override String get deletepost => 'Hapus Postingan';
	@override String get deleteposthint => 'Apakah Anda ingin menghapus postingan ini? Postingan masih bisa muncul di feed beberapa pengguna.';
	@override String get maximumallowedsizehint => 'Ukuran unggahan file maksimal tercapai';
	@override String get maximumuploadsizehint => 'File yang dipilih melebihi batas ukuran unggahan file yang diizinkan.';
	@override String get makeposterror => 'Tidak dapat membuat postingan saat ini, klik untuk mencoba lagi.';
	@override String get makepost => 'Buat Postingan';
	@override String get selectfile => 'Pilih File';
	@override String get images => 'Gambar';
	@override String get shareYourThoughtsNow => 'Bagikan pikiran Anda...';
	@override String get photoviewer => 'Penampil Foto';
	@override String get nochatsavailable => 'Tidak ada percakapan tersedia \n Klik ikon tambah di bawah \n untuk memilih pengguna untuk mengobrol dengan';
	@override String get typing => 'Mengetik...';
	@override String get photo => 'Foto';
	@override String get online => 'Online';
	@override String get offline => 'Offline';
	@override String get lastseen => 'Terakhir Dilihat';
	@override String get deleteselectedhint => 'Tindakan ini akan menghapus pesan yang dipilih. Harap dicatat bahwa ini hanya menghapus sisi percakapan Anda, \n pesan masih akan terlihat di perangkat pasangan Anda.';
	@override String get deleteselected => 'Hapus yang dipilih';
	@override String get unabletofetchconversation => 'Tidak dapat mengambil \npercakapan Anda dengan \n';
	@override String get loadmoreconversation => 'Muat lebih banyak percakapan';
	@override String get sendyourfirstmessage => 'Kirim pesan pertama Anda ke \n';
	@override String get unblock => 'Buka Blokir ';
	@override String get block => 'Blokir';
	@override String get writeyourmessage => 'Tulis pesan Anda...';
	@override String get clearconversation => 'Bersihkan Percakapan';
	@override String get clearconversationhintone => 'Tindakan ini akan membersihkan semua percakapan Anda dengan ';
	@override String get clearconversationhinttwo => '.\n Harap dicatat bahwa ini hanya menghapus sisi percakapan Anda, pesan masih akan terlihat di chat pasangan Anda.';
	@override String get facebookloginerror => 'Ada yang salah dengan proses login.\n, Ini kesalahan yang diberikan Facebook kepada kami';
	@override String get selectLanguage => 'Pilih Bahasa';
	@override String get howTo => 'Cara';
	@override String get noBibleTextsAvailable => 'Tidak ada teks Alkitab yang tersedia';
	@override String get languages => 'Bahasa';
	@override String get searchLanguages => 'Cari bahasa...';
	@override String get biblesFilesets => 'Alkitab: {bibles}, Set berkas: {filesets}';
	@override String get oldTestament => 'Perjanjian Lama';
	@override String get newTestament => 'Perjanjian Baru';
	@override String get play => 'Putar';
	@override String get no_verse_content => 'Tidak ada konten ayat Alkitab yang tersedia untuk ditampilkan.';
	@override String get no_audio_content => 'Tidak ada konten audio Alkitab yang tersedia untuk ditampilkan.';
}

// Path: <root>
class _StringsKn implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsKn.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsKn _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'ನನ್ನ ವರ್ಚುವಲ್ ಪಾಸ್ಟರ್';
	@override String get selectlanguage => 'ಭಾಷೆ ಆಯ್ಕೆಮಾಡಿ';
	@override String get deletemyaccount => 'ನನ್ನ ಖಾತೆಯನ್ನು ಅಳಿಸಿ';
	@override String get deleteaccount => 'ಖಾತೆ ಅಳಿಸಿ';
	@override String get deleteaccounthint => 'ಈ ಕ್ರಿಯೆಯಿಂದ ನಿಮ್ಮ ಖಾತೆ ಮತ್ತು ಎಲ್ಲಾ ಡೇಟಾವನ್ನು ಅಳಿಸಲಾಗುತ್ತದೆ. ನಿಮ್ಮ ಡೇಟಾ ಅಳಿಸಿದ ನಂತರ, ಅದನ್ನು ಪುನಃ ಪಡೆಯಲು ಸಾಧ್ಯವಿಲ್ಲ.';
	@override String get deleteaccountsuccess => 'ಖಾತೆ ಅಳಿಸುವಿಕೆಯಲ್ಲಿ ಯಶಸ್ವಿಯಾಯಿತು';
	@override String get chooseapplanguage => 'ಅಪ್ಲಿಕೇಶನ್ ಭಾಷೆ ಆಯ್ಕೆಮಾಡಿ';
	@override String get nightmode => 'ರಾತ್ರಿ ಮೋಡ್';
	@override String get initializingapp => 'ಆರಂಭಿಸುತ್ತಿದೆ...';
	@override String get home => 'ಮನೆ';
	@override String get branches => 'ಶಾಖೆಗಳು';
	@override String get inbox => 'ಇನ್‌ಬಾಕ್ಸ್';
	@override String get downloads => 'ಡೌನ್‌ಲೋಡ್‌ಗಳು';
	@override String get settings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';
	@override String get events => 'ಈವೆಂಟ್‌ಗಳು';
	@override String get myplaylists => 'ನನ್ನ ಪ್ಲೇಲಿಸ್ಟ್‌ಗಳು';
	@override String get website => 'ವೆಬ್‌ಸೈಟ್';
	@override String get hymns => 'ಹಾಡುಗಳು';
	@override String get articles => 'ಲೆಖನಗಳು';
	@override String get notes => 'ಕಾತ್ರಿಕೆಗಳು';
	@override String get donate => 'ದಾನ';
	@override String get offering => 'ಮೂಲೆಮಾಡು';
	@override String get savenotetitle => 'ಕಾತ್ರಿಕೆ ಶೀರ್ಷಿಕೆ';
	@override String get nonotesfound => 'ಯಾವುದೇ ಕಾತ್ರಿಕೆಗಳಿಲ್ಲ';
	@override String get newnote => 'ಹೊಸದು';
	@override String get deletenote => 'ಕಾತ್ರಿಕೆ ಅಳಿಸಿ';
	@override String get deletenotehint => 'ಈ ಕಾತ್ರಿಕೆಯನ್ನು ಅಳಿಸಲು ಬಯಸುತ್ತೀರಾ? ಈ ಕ್ರಿಯೆಯನ್ನು ಮರುಕಳಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ.';
	@override String get bookmarks => 'ಬುಕ್‌ಮಾರ್ಕ್‌ಗಳು';
	@override String get socialplatforms => 'ಸಾಮಾಜಿಕ ವೇದಿಕೆಗಳು';
	@override List<String> get onboardingpagetitles => [
		'ನನ್ನ ಚರ್ಚ್‌ಗೆ ಸ್ವಾಗತ',
		'ಲಕ್ಷಣಗಳಿಂದ ತುಂಬಿದೆ',
		'ಆಡಿಯೋ, ವಿಡಿಯೋ \n ಮತ್ತು ಲೈವ್ ಸ್ಟ್ರೀಮಿಂಗ್',
		'ಖಾತೆ ರಚಿಸಿ',
	];
	@override List<String> get onboardingpagehints => [
		'ಭಾನುವಾರ ಬೆಳಗ್ಗಿನ ಬಡ್ತಿ ಮತ್ತು ನಿಮ್ಮ ಚರ್ಚ್‌ನ ನಾಲ್ಕು ಗೋಡೆಗಳಿಗಿಂತ ಮುಂದೆ ಹೋಗಿ. ಮೊಬೈಲ್‌ಗೂ ಸಂಬಂಧಪಟ್ಟ ವಿಶ್ವದೊಂದಿಗೆ ಸಂಪರ್ಕಿಸಲು ಮತ್ತು ಸಂವಹನ ಮಾಡಲು ನೀವು ಬೇಕಾದ ಎಲ್ಲವನ್ನೂ.',
		'ನೀವು ನಿಮ್ಮ ಚರ್ಚ್ ಆಪ್‌ಗುರ್ತಿಸುವ ಎಲ್ಲಾ ಪ್ರಮುಖ ಲಕ್ಷಣಗಳನ್ನು ಒಟ್ಟುಗೂಡಿಸಿದ್ದೇವೆ. ಈವೆಂಟ್‌ಗಳು, ಭಕ್ತಿಗೀತೆಗಳು, ಅಧಿಸೂಚನೆಗಳು, ಕಾತ್ರಿಕೆಗಳು ಮತ್ತು ಬಹು-ಪಠಣ ಬೈಬಲ್.',
		'ಪರಿಷರಕ್ಕೆ ನಿಮ್ಮ ಚರ್ಚ್ ಸೇವೆಗಳನ್ನು ವೀಕ್ಷಿಸಲು, ಆಡಿಯೋ ಸಂದೇಶಗಳನ್ನು ಕೇಳಲು ಮತ್ತು ಲೈವ್ ಸ್ಟ್ರೀಮ್ ನೋಡಲು ಅನುಮತಿ ನೀಡಿ.',
		'ಒಂದು ನಿರಂತರ ಪ್ರಾರ್ಥನಾ ಅನುಭವಕ್ಕೆ ನಿಮ್ಮ ಪ್ರಯಾಣವನ್ನು ಪ್ರಾರಂಭಿಸಿ.',
	];
	@override String get next => 'ಮುಂದೆ';
	@override String get done => 'ಪ್ರಾರಂಭಿಸಿ';
	@override String get quitapp => 'ಅಪ್ಲಿಕೇಶನ್ ಬಿಡಿ!';
	@override String get quitappwarning => 'ನೀವು ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಮುಚ್ಚಲು ಬಯಸುವಿರಾ?';
	@override String get quitappaudiowarning => 'ನೀವು ಪ್ರಸ್ತುತ ಆಡಿಯೋ ಪ್ಲೇ ಮಾಡುತ್ತಿದ್ದೀರಿ, ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಬಿಡುವುದು ಆಡಿಯೋ ಪ್ಲೇಬ್ಯಾಕ್ ಅನ್ನು ನಿಲ್ಲಿಸುತ್ತದೆ. ಪ್ಲೇಬ್ಯಾಕ್ ನಿಲ್ಲಿಸಲು ಬಯಸದಿದ್ದರೆ, ಕೇಂದ್ರ ಬಟನ್ ಮೂಲಕ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಕಡಿಮೆಮಾಡಿ ಅಥವಾ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಈಗ ಬಿಡಲು ಓಕೆ ಬಟನ್ ಕ್ಲಿಕ್ ಮಾಡಿ.';
	@override String get ok => 'ಓಕೆ';
	@override String get retry => 'ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';
	@override String get oops => 'ಊಪ್!';
	@override String get save => 'ಉಳಿಸಿ';
	@override String get cancel => 'ರದ್ದುಮಾಡಿ';
	@override String get error => 'ದೋಷ';
	@override String get success => 'ಯಶಸ್ಸು';
	@override String get skip => 'ಬಿಟ್ಟುಬಿಡಿ';
	@override String get skiplogin => 'ಲಾಗಿನ್ ಬಿಟ್ಟುಬಿಡಿ';
	@override String get skipregister => 'ನೋಂದಣಿ ಬಿಟ್ಟುಬಿಡಿ';
	@override String get dataloaderror => 'ಈಗ ಪ್ರಸ್ತುತ ಡೇಟಾವನ್ನು ಲೋಡ್ ಮಾಡಲಾಗುವುದಿಲ್ಲ, ನಿಮ್ಮ ಡೇಟಾ ಸಂಪರ್ಕವನ್ನು ಪರಿಶೀಲಿಸಿ ಮತ್ತು ಪುನಃ ಪ್ರಯತ್ನಿಸಲು ಕ್ಲಿಕ್ ಮಾಡಿ.';
	@override String get suggestedforyou => 'ನಿಮಗಾಗಿ ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ';
	@override String get videomessages => 'ವೀಡಿಯೋ ಸಂದೇಶಗಳು';
	@override String get audiomessages => 'ಆಡಿಯೋ ಸಂದೇಶಗಳು';
	@override String get devotionals => 'ಭಕ್ತಿಗೀತೆಗಳು';
	@override String get categories => 'ವರ್ಗಗಳು';
	@override String get category => 'ವರ್ಗ';
	@override String get videos => 'ವೀಡಿಯೊಗಳು';
	@override String get audios => 'ಆಡಿಯೊಗಳು';
	@override String get biblebooks => 'ಬೈಬಲ್';
	@override String get sermons => 'ಪ್ರವಚನೆಗಳು';
	@override String get tools => 'ಆಯುಧಗಳು';
	@override String get profile => 'ಪ್ರೊಫೈಲ್';
	@override String get audiobible => 'ಆಡಿಯೋ ಬೈಬಲ್';
	@override String get homesentence => 'ಭಗವಂತನ ಕರೆಯಲಾದ ವ್ಯಕ್ತಿಯಾಗಿ ಬೆಳೆಯಲು ನಿಮ್ಮ ಪಾಸ್ಟರ್ 1 ವರ್ಷಕ್ಕೆ ಸಹಾಯಮಾಡಲು.';
	@override String get livestreams => 'ಲೈವ್ ಸ್ಟ್ರೀಮ್‌ಗಳು';
	@override String get radio => 'ರೆಡಿಯೋ';
	@override String get allitems => 'ಎಲ್ಲಾ ಐಟಂಗಳು';
	@override String get emptyplaylist => 'ಯಾವುದೇ ಪ್ಲೇಲಿಸ್ಟ್ ಇಲ್ಲ';
	@override String get notsupported => 'ಸಮರ್ಥಿಸಲಾಗುವುದಿಲ್ಲ';
	@override String get cleanupresources => 'ಸಂಪತ್ತುಗಳನ್ನು ಶುದ್ಧಗೊಳಿಸಲಾಗುತ್ತಿದೆ';
	@override String get grantstoragepermission => 'ಮುಂದುವರಿಯಲು ದಯವಿಟ್ಟು ಸಂಗ್ರಹಣೆ ಅನುಮತಿಯನ್ನು ನೀಡಿರಿ';
	@override String get sharefiletitle => 'ನೋಡಿ ಅಥವಾ ಕೇಳಿ ';
	@override String get sharefilebody => 'ನನ್ನ ವರ್ಚುವಲ್ ಪಾಸ್ಟರ್ ಅಪ್ಲಿಕೇಶನ್ ಮೂಲಕ, ಈಗ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ ';
	@override String get sharetext => 'ಅಸೀಮಿತ ಆಡಿಯೋ ಮತ್ತು ವೀಡಿಯೋ ಸ್ಟ್ರೀಮಿಂಗ್ ಅನ್ನು ಆನಂದಿಸಿ';
	@override String get sharetexthint => 'ನೋಡುವ ಮತ್ತು ಕೇಳುವ ವಿಶ್ವದಾದ್ಯಂತದ ಮಿಲಿಯನ್‌ಗಳ ಫೈಲ್‌ಗಳನ್ನು ಒದಗಿಸುವ ವೀಡಿಯೋ ಮತ್ತು ಆಡಿಯೋ ಸ್ಟ್ರೀಮಿಂಗ್ ವೇದಿಕೆಗೆ ಸೇರಿ. ಈಗ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ ';
	@override String get download => 'ಡೌನ್‌ಲೋಡ್';
	@override String get addplaylist => 'ಪ್ಲೇಲಿಸ್ಟ್‌ಗೆ ಸೇರಿಸಿ';
	@override String get bookmark => 'ಪುಟಗುಡುಸು';
	@override String get unbookmark => 'ಪುಟಗುಡಿಸುವಿಕೆಯನ್ನು ರದ್ದುಮಾಡಿ';
	@override String get share => 'ಹಂಚಿಕೊಳ್ಳಿ';
	@override String get deletemedia => 'ಫೈಲ್ ಅಳಿಸಿ';
	@override String get deletemediahint => 'ನೀವು ಈ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಫೈಲ್ ಅನ್ನು ಅಳಿಸಲು ಬಯಸುತ್ತೀರಾ? ಈ ಕ್ರಿಯೆಯನ್ನು ಮರುಕಳಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ.';
	@override String get searchhint => 'ಆಡಿಯೋ ಮತ್ತು ವೀಡಿಯೋ ಸಂದೇಶಗಳನ್ನು ಹುಡುಕಿ';
	@override String get performingsearch => 'ಆಡಿಯೋಗಳು ಮತ್ತು ವೀಡಿಯೊಗಳನ್ನು ಹುಡುಕುತ್ತಿದೆ';
	@override String get nosearchresult => 'ಯಾವುದೇ ಫಲಿತಾಂಶ ಕಂಡುಬಂದಿಲ್ಲ';
	@override String get nosearchresulthint => 'ಹೆಚ್ಚು ಸಾಮಾನ್ಯ ಕೀವರ್ಡ್ ಅನ್ನು ನಮೂದಿಸಲು ಪ್ರಯತ್ನಿಸಿ';
	@override String get addtoplaylist => 'ಪ್ಲೇಲಿಸ್ಟ್‌ಗೆ ಸೇರಿಸಿ';
	@override String get newplaylist => 'ಹೊಸ ಪ್ಲೇಲಿಸ್ಟ್';
	@override String get playlistitm => 'ಪ್ಲೇಲಿಸ್ಟ್';
	@override String get mediaaddedtoplaylist => 'ಮೀಡಿಯಾ ಪ್ಲೇಲಿಸ್ಟ್‌ಗೆ ಸೇರಿಸಲಾಗಿದೆ.';
	@override String get mediaremovedfromplaylist => 'ಮೀಡಿಯಾ ಪ್ಲೇಲಿಸ್ಟ್‌ನಿಂದ ತೆಗೆದುಹಾಕಲಾಗಿದೆ';
	@override String get clearplaylistmedias => 'ಎಲ್ಲಾ ಮೀಡಿಯಾವನ್ನು ಶುದ್ಧಗೊಳಿಸಿ';
	@override String get deletePlayList => 'ಪ್ಲೇಲಿಸ್ಟ್ ಅಳಿಸಿ';
	@override String get clearplaylistmediashint => 'ನೀವು ಈ ಪ್ಲೇಲಿಸ್ಟ್‌ನಿಂದ ಎಲ್ಲಾ ಮೀಡಿಯಾವನ್ನು ತೆಗೆದುಹಾಕಲು ಬಯಸುತ್ತೀರಾ?';
	@override String get deletePlayListhint => 'ನೀವು ಈ ಪ್ಲೇಲಿಸ್ಟ್ ಅನ್ನು ಅಳಿಸಲು ಮತ್ತು ಎಲ್ಲಾ ಮೀಡಿಯಾವನ್ನು ಶುದ್ಧಗೊಳಿಸಲು ಬಯಸುತ್ತೀರಾ?';
	@override String get comments => 'ಕಾಮೆಂಟ್‌ಗಳು';
	@override String get replies => 'ಪ್ರತಿಕ್ರಿಯೆಗಳು';
	@override String get reply => 'ಪ್ರತಿಕ್ರಿಯೆ';
	@override String get logintoaddcomment => 'ಕಾಮೆಂಟ್ ಸೇರಿಸಲು ಲಾಗಿನ್ ಮಾಡಿ';
	@override String get logintoreply => 'ಪ್ರತಿಕ್ರಿಯಿಸಲು ಲಾಗಿನ್ ಮಾಡಿ';
	@override String get writeamessage => 'ಸಂದೇಶವನ್ನು ಬರೆಯಿರಿ...';
	@override String get nocomments => 'ಯಾವುದೇ ಕಾಮೆಂಟ್‌ಗಳಿಲ್ಲ \nಮತ್ತೆ ಪ್ರಯತ್ನಿಸಲು ಕ್ಲಿಕ್ ಮಾಡಿ';
	@override String get errormakingcomments => 'ಪ್ರಸ್ತುತ ಕಾಮೆಂಟ್ ಮಾಡುವಲ್ಲಿ ವಿಫಲವಾಗಿದೆ.';
	@override String get errordeletingcomments => 'ಪ್ರಸ್ತುತ ಈ ಕಾಮೆಂಟ್ ಅಳಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ.';
	@override String get erroreditingcomments => 'ಪ್ರಸ್ತುತ ಈ ಕಾಮೆಂಟ್ ಅನ್ನು ಸಂಪಾದಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ.';
	@override String get errorloadingmorecomments => 'ಪ್ರಸ್ತುತ ಹೆಚ್ಚು ಕಾಮೆಂಟ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಿಲ್ಲ.';
	@override String get deletingcomment => 'ಕಾಮೆಂಟ್ ಅನ್ನು ಅಳಿಸಲಾಗುತ್ತಿದೆ';
	@override String get editingcomment => 'ಕಾಮೆಂಟ್ ಸಂಪಾದಿಸಲಾಗುತ್ತಿದೆ';
	@override String get deletecommentalert => 'ಕಾಮೆಂಟ್ ಅಳಿಸಿ';
	@override String get editcommentalert => 'ಕಾಮೆಂಟ್ ಸಂಪಾದಿಸಿ';
	@override String get deletecommentalerttext => 'ನೀವು ಈ ಕಾಮೆಂಟ್ ಅನ್ನು ಅಳಿಸಲು ಬಯಸುತ್ತೀರಾ? ಈ ಕ್ರಿಯೆಯನ್ನು ಮರುಕಳಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ';
	@override String get loadmore => 'ಹೆಚ್ಚು ಲೋಡ್ ಮಾಡಿ';
	@override String get messages => 'ಸಂದೇಶಗಳು';
	@override String get guestuser => 'ಅತಿಥಿ ಬಳಕೆದಾರ';
	@override String get fullname => 'ಪೂರ್ಣ ಹೆಸರು';
	@override String get emailaddress => 'ಇಮೇಲ್ ವಿಳಾಸ';
	@override String get password => 'ಪಾಸ್ವರ್ಡ್';
	@override String get repeatpassword => 'ಪಾಸ್ವರ್ಡ್ ಅನ್ನು ಪುನಃ ನಮೂದಿಸಿ';
	@override String get register => 'ನೋಂದಣಿ';
	@override String get login => 'ಲಾಗಿನ್';
	@override String get logout => 'ಲಾಗ್ಔಟ್';
	@override String get logoutfromapp => 'ಅಪ್ಲಿಕೇಶನ್‌ನಿಂದ ಲಾಗ್ಔಟ್ ಮಾಡುತ್ತೀರಾ?';
	@override String get logoutfromapphint => 'ನೀವು ಲಾಗಿನ್ ಆಗಿಲ್ಲದಿದ್ದರೆ ನೀವು ಲೇಖನಗಳು ಮತ್ತು ವೀಡಿಯೊಗಳ ಮೇಲೆ ಕಾಮೆಂಟ್ ಮಾಡಲು ಅಥವಾ ಇಷ್ಟಪಡಲು ಸಾಧ್ಯವಿಲ್ಲ.';
	@override String get gotologin => 'ಲಾಗಿನ್ ಗೆ ಹೋಗಿ';
	@override String get resetpassword => 'ಪಾಸ್ವರ್ಡ್ ಮರುಹೊಂದಿಸಿ';
	@override String get logintoaccount => 'ಈಗಾಗಲೇ ಖಾತೆ ಇದ್ದೇ? ಲಾಗಿನ್';
	@override String get emptyfielderrorhint => 'ನೀವು ಎಲ್ಲಾ ಕ್ಷೇತ್ರಗಳನ್ನು ತುಂಬಬೇಕಾಗಿದೆ';
	@override String get invalidemailerrorhint => 'ನೀವು ಮಾನ್ಯವಾದ ಇಮೇಲ್ ವಿಳಾಸವನ್ನು ನಮೂದಿಸಬೇಕಾಗಿದೆ';
	@override String get passwordsdontmatch => 'ಪಾಸ್ವರ್ಡ್‌ಗಳು ಹೊಂದುತ್ತಿಲ್ಲ';
	@override String get processingpleasewait => 'ಪ್ರಕ್ರಿಯೆ ನಡೆಯುತ್ತಿದೆ, ದಯವಿಟ್ಟು ನಿರೀಕ್ಷಿಸಿ...';
	@override String get createaccount => 'ಖಾತೆ ರಚಿಸಿ';
	@override String get forgotpassword => 'ಪಾಸ್ವರ್ಡ್ ಮರೆತಿದ್ದೀರಾ?';
	@override String get orloginwith => 'ಅಥವಾ ಲಾಗಿನ್ ಮಾಡಿ';
	@override String get facebook => 'ಫೇಸ್ಬುಕ್';
	@override String get google => 'ಗೂಗಲ್';
	@override String get moreoptions => 'ಹೆಚ್ಚು ಆಯ್ಕೆಗಳು';
	@override String get about => 'ನಮ್ಮ ಬಗ್ಗೆ';
	@override String get privacy => 'ಗೋಪ್ಯತಾ ನೀತಿ';
	@override String get terms => 'ಅಪ್ಲಿಕೇಶನ್ ಷರತ್ತುಗಳು';
	@override String get rate => 'ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಮೌಲ್ಯಮಾಪನ ಮಾಡಿ';
	@override String get version => 'ಆವೃತ್ತಿ';
	@override String get pulluploadmore => 'ಲೋಡ್ ಮಾಡಲು ಮೇಲಕ್ಕೆ ತಳ್ಳಿ';
	@override String get loadfailedretry => 'ಲೋಡ್ ವಿಫಲವಾಯಿತು! ಪುನಃ ಪ್ರಯತ್ನಿಸಲು ಕ್ಲಿಕ್ ಮಾಡಿ!';
	@override String get releaseloadmore => 'ಹೆಚ್ಚು ಲೋಡ್ ಮಾಡಲು ಬಿಡುಗಡೆ ಮಾಡಿ';
	@override String get nomoredata => 'ಹೆಚ್ಚು ಡೇಟಾ ಇಲ್ಲ';
	@override String get errorReportingComment => 'ಕಾಮೆಂಟ್ ವರದಿ ದೋಷ';
	@override String get reportingComment => 'ಕಾಮೆಂಟ್ ವರದಿ ಮಾಡಲಾಗುತ್ತಿದೆ';
	@override String get reportcomment => 'ವರದಿ ಆಯ್ಕೆಗಳು';
	@override List<String> get reportCommentsList => [
		'ಅನಗತ್ಯ ವ್ಯಾಪಾರ ವಿಷಯ ಅಥವಾ ಸ್ಪ್ಯಾಮ್',
		'ಅಶ್ಲೀಲತೆ ಅಥವಾ ಲೈಂಗಿಕ ಸ್ಪಷ್ಟವಾದ ವಿಷಯ',
		'ದ್ವೇಷ ಭಾಷಣ ಅಥವಾ ಗ್ರಾಫಿಕ್ ಹಿಂಸೆ',
		'ತೊಂದರೆ ಅಥವಾ ಧೈರ್ಯವಿಲ್ಲ',
	];
	@override String get bookmarksMedia => 'ನನ್ನ ಬುಕ್‌ಮಾರ್ಕ್‌ಗಳು';
	@override String get noitemstodisplay => 'ಪ್ರದರ್ಶಿಸಲು ಯಾವುದೇ ಐಟಂ ಇಲ್ಲ';
	@override String get loginrequired => 'ಲಾಗಿನ್ ಅಗತ್ಯವಿದೆ';
	@override String get loginrequiredhint => 'ಈ ವೇದಿಕೆಯಲ್ಲಿ ಚಂದಾ ಪಡೆಯಲು, ನೀವು ಲಾಗಿನ್ ಆಗಬೇಕಾಗಿದೆ. ಉಚಿತ ಖಾತೆಯನ್ನು ಈಗ ರಚಿಸಿ ಅಥವಾ ನಿಮ್ಮ ಈಗಿರುವ ಖಾತೆಗೆ ಲಾಗಿನ್ ಮಾಡಿ.';
	@override String get subscriptions => 'ಅಪ್ಲಿಕೇಶನ್ ಚಂದಾ';
	@override String get subscribe => 'ಚಂದಾದಾರರಾಗಿ';
	@override String get subscribehint => 'ಚಂದಾದಾರಿಕೆ ಅಗತ್ಯವಿದೆ';
	@override String get playsubscriptionrequiredhint => 'ಈ ಮೀಡಿಯಾವನ್ನು ಕೇಳಲು ಅಥವಾ ವೀಕ್ಷಿಸಲು ಮೊದಲು ನೀವು ಚಂದಾದಾರರಾಗಬೇಕು.';
	@override String get previewsubscriptionrequiredhint => 'ಈ ಮೀಡಿಯಾ ಆಲಿಸಲು ಅಥವಾ ವೀಕ್ಷಿಸಲು ನಿಮಗೆ ಅನುಮತಿಸಲಾದ ಪೂರ್ವಾವಲೋಕನ ಅವಧಿಯನ್ನು ನೀವು ತಲುಪಿದ್ದೀರಿ. ಆಲಿಸಲು ಅಥವಾ ವೀಕ್ಷಿಸಲು ನೀವು ಚಂದಾದಾರರಾಗಬೇಕಾಗಿದೆ.';
	@override String get copiedtoclipboard => 'ಕ್ಲಿಪ್‌ಬೋರ್ಡ್‌ಗೆ ನಕಲಿಸಲಾಗಿದೆ';
	@override String get downloadbible => 'ಬೈಬಲ್ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ';
	@override String get downloadversion => 'ಡೌನ್‌ಲೋಡ್';
	@override String get downloading => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡುತ್ತಿದೆ';
	@override String get failedtodownload => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';
	@override String get pleaseclicktoretry => 'ದಯವಿಟ್ಟು ಪುನಃ ಪ್ರಯತ್ನಿಸಲು ಕ್ಲಿಕ್ ಮಾಡಿ.';
	@override String get of => 'ನ';
	@override String get nobibleversionshint => 'ಪ್ರದರ್ಶಿಸಲು ಯಾವುದೇ ಬೈಬಲ್ ಡೇಟಾ ಇಲ್ಲ, ಕನಿಷ್ಟ ಒಂದು ಬೈಬಲ್ ಆವೃತ್ತಿಯನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಲು ಕೆಳಗಿನ ಬಟನ್ ಅನ್ನು ಕ್ಲಿಕ್ ಮಾಡಿ.';
	@override String get downloaded => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಲಾಗಿದೆ';
	@override String get enteremailaddresstoresetpassword => 'ನಿಮ್ಮ ಪಾಸ್ವರ್ಡ್ ಅನ್ನು ಮರುಹೊಂದಿಸಲು ನಿಮ್ಮ ಇಮೇಲ್ ಅನ್ನು ನಮೂದಿಸಿ';
	@override String get backtologin => 'ಲಾಗಿನ್ ಗೆ ಹಿಂದಿರುಗಿ';
	@override String get signintocontinue => 'ಮುಂದುವರಿಸಲು ಸೈನ್ ಇನ್ ಮಾಡಿ';
	@override String get signin => 'ಸೈನ್ ಇನ್';
	@override String get signinforanaccount => 'ಖಾತೆಗೆ ಸೈನ್ ಅಪ್ ಮಾಡಿ?';
	@override String get alreadyhaveanaccount => 'ಈಗಾಗಲೇ ಖಾತೆ ಇದೆ?';
	@override String get updateprofile => 'ಪ್ರೊಫೈಲ್ ನವೀಕರಿಸಿ';
	@override String get updateprofilehint => 'ಪ್ರಾರಂಭಿಸಲು, ದಯವಿಟ್ಟು ನಿಮ್ಮ ಪ್ರೊಫೈಲ್ ಪುಟವನ್ನು ನವೀಕರಿಸಿ, ಇದು ನಮಗೆ ಇತರ ಜನರೊಂದಿಗೆ ಸಂಪರ್ಕಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ';
	@override String get autoplayvideos => 'ವೀಡಿಯೊಗಳನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ವೀಕ್ಷಿಸಿ';
	@override String get gosocial => 'ಸಾಮಾಜಿಕ ಗೆ ಹೋಗಿ';
	@override String get searchbible => 'ಬೈಬಲ್ ಅನ್ನು ಹುಡುಕಿ';
	@override String get filtersearchoptions => 'ಹುಡುಕಾಟ ಆಯ್ಕೆಗಳನ್ನು ಫಿಲ್ಟರ್ ಮಾಡಿ';
	@override String get narrowdownsearch => 'ಹೆಚ್ಚು ನಿಖರವಾದ ಫಲಿತಾಂಶಕ್ಕಾಗಿ ಹುಡುಕಾಟವನ್ನು ನಾರು ಮಾಡಲು ಕೆಳಗಿನ ಫಿಲ್ಟರ್ ಬಟನ್ ಅನ್ನು ಬಳಸಿ.';
	@override String get searchbibleversion => 'ಬೈಬಲ್ ಆವೃತ್ತಿಯನ್ನು ಹುಡುಕಿ';
	@override String get searchbiblebook => 'ಬೈಬಲ್ ಪುಸ್ತಕವನ್ನು ಹುಡುಕಿ';
	@override String get search => 'ಹುಡುಕಿ';
	@override String get setBibleBook => 'ಬೈಬಲ್ ಪುಸ್ತಕವನ್ನು ಸೆಟ್ ಮಾಡಿ';
	@override String get oldtestament => 'ಹಳೆಯ ಒಪ್ಪಂದ';
	@override String get newtestament => 'ಹೊಸ ಒಪ್ಪಂದ';
	@override String get limitresults => 'ಫಲಿತಾಂಶಗಳನ್ನು ಮಿತಿ';
	@override String get setfilters => 'ಫಿಲ್ಟರ್‌ಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ';
	@override String get bibletranslator => 'ಬೈಬಲ್ ಅನುವಾದಕ';
	@override String get chapter => ' ಅಧ್ಯಾಯ ';
	@override String get verse => ' ಪದ್ಯ ';
	@override String get translate => 'ಅನುವಾದಿಸಿ';
	@override String get bibledownloadinfo => 'ಬೈಬಲ್ ಡೌನ್‌ಲೋಡ್ ಪ್ರಾರಂಭವಾಗಿದೆ, ಡೌನ್‌ಲೋಡ್ ಮುಗಿಯುವವರೆಗೆ ಈ ಪುಟವನ್ನು ಮುಚ್ಚಬೇಡಿ.';
	@override String get received => 'ಸ್ವೀಕರಿಸಲಾಗಿದೆ';
	@override String get outoftotal => 'ಒಟ್ಟು';
	@override String get set => 'ಸೆಟ್';
	@override String get selectColor => 'ಬಣ್ಣವನ್ನು ಆಯ್ಕೆಮಾಡಿ';
	@override String get switchbibleversion => 'ಬೈಬಲ್ ಆವೃತ್ತಿಯನ್ನು ಬದಲಿಸಿ';
	@override String get switchbiblebook => 'ಬೈಬಲ್ ಪುಸ್ತಕವನ್ನು ಬದಲಿಸಿ';
	@override String get gotosearch => 'ಅಧ್ಯಾಯಕ್ಕೆ ಹೋಗಿ';
	@override String get changefontsize => 'ಅಕ್ಷರದ ಗಾತ್ರವನ್ನು ಬದಲಿಸಿ';
	@override String get font => 'ಅಕ್ಷರ';
	@override String get readchapter => 'ಅಧ್ಯಾಯವನ್ನು ಓದಿ';
	@override String get showhighlightedverse => 'ಪ್ರಮುಖ ಪದ್ಯಗಳನ್ನು ತೋರಿಸಿ';
	@override String get downloadmoreversions => 'ಹೆಚ್ಚು ಆವೃತ್ತಿಗಳನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ';
	@override String get suggestedusers => 'ಹೆಚ್ಚು ಆವೃತ್ತಿಗಳನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ';
	@override String get unfollow => 'ಅನುಸರಿಸದಿರಿ';
	@override String get follow => 'ಅನುಸರಿಸು';
	@override String get searchforpeople => 'ಜನರನ್ನು ಹುಡುಕಿ';
	@override String get viewpost => 'ಪೋಸ್ಟ್ ವೀಕ್ಷಿಸಿ';
	@override String get viewprofile => 'ಪ್ರೊಫೈಲ್ ವೀಕ್ಷಿಸಿ';
	@override String get mypins => 'ನನ್ನ ಪಿನ್‌ಗಳು';
	@override String get viewpinnedposts => 'ಪಿನ್ ಮಾಡಿದ ಪೋಸ್ಟ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ';
	@override String get personal => 'ವೈಯಕ್ತಿಕ';
	@override String get update => 'ನವೀಕರಿಸಿ';
	@override String get phonenumber => 'ಫೋನ್ ಸಂಖ್ಯೆ';
	@override String get showmyphonenumber => 'ನನ್ನ ಫೋನ್ ಸಂಖ್ಯೆಯನ್ನು ಬಳಕೆದಾರರಿಗೆ ತೋರಿಸಿ';
	@override String get dateofbirth => 'ಜನ್ಮ ದಿನಾಂಕ';
	@override String get showmyfulldateofbirth => 'ನನ್ನ ಸ್ಥಿತಿಯನ್ನು ವೀಕ್ಷಿಸುವವರಿಗೆ ನನ್ನ ಸಂಪೂರ್ಣ ಜನ್ಮ ದಿನಾಂಕವನ್ನು ತೋರಿಸಿ';
	@override String get notifications => 'ಅಧಿಸೂಚನೆಗಳು';
	@override String get notifywhenuserfollowsme => 'ಬಳಕೆದಾರರು ನನ್ನನ್ನು ಅನುಸರಿಸಿದಾಗ ನನಗೆ ಸೂಚಿಸಿ';
	@override String get notifymewhenusercommentsonmypost => 'ಬಳಕೆದಾರರು ನನ್ನ ಪೋಸ್ಟ್‌ಗಳ ಮೇಲೆ ಕಾಮೆಂಟ್ ಮಾಡಿದಾಗ ನನಗೆ ಸೂಚಿಸಿ';
	@override String get notifymewhenuserlikesmypost => 'ಬಳಕೆದಾರರು ನನ್ನ ಪೋಸ್ಟ್ ಅನ್ನು ಇಷ್ಟಪಟ್ಟಾಗ ನನಗೆ ಸೂಚಿಸಿ';
	@override String get churchsocial => 'ಚರ್ಚ್ ಸಾಮಾಜಿಕ';
	@override String get shareyourthoughts => 'ನಿಮ್ಮ ಆಲೋಚನೆಗಳನ್ನು ಹಂಚಿಕೊಳ್ಳಿ';
	@override String get readmore => '...ಇನ್ನಷ್ಟು ಓದಿ';
	@override String get less => ' ಕಡಿಮೆ';
	@override String get couldnotprocess => 'ಕೋರಿದ ಕ್ರಿಯೆಯನ್ನು ಪ್ರಕ್ರಿಯೆ ಮಾಡಲು ಸಾಧ್ಯವಿಲ್ಲ.';
	@override String get pleaseselectprofilephoto => 'ದಯವಿಟ್ಟು ಅಪ್‌ಲೋಡ್ ಮಾಡಲು ಪ್ರೊಫೈಲ್ ಫೋಟೋ ಆಯ್ಕೆಮಾಡಿ';
	@override String get pleaseselectprofilecover => 'ದಯವಿಟ್ಟು ಅಪ್‌ಲೋಡ್ ಮಾಡಲು ಕವರ್ ಫೋಟೋ ಆಯ್ಕೆಮಾಡಿ';
	@override String get updateprofileerrorhint => 'ಮುಂದುವರೆಯಲು ನಿಮ್ಮ ಹೆಸರು, ಜನ್ಮದಿನಾಂಕ, ಲಿಂಗ, ಫೋನ್ ಮತ್ತು ಸ್ಥಳವನ್ನು ತುಂಬಬೇಕು.';
	@override String get gender => 'ಲಿಂಗ';
	@override String get male => 'ಪುರುಷ';
	@override String get female => 'ಮಹಿಳೆ';
	@override String get dob => 'ಜನ್ಮದಿನಾಂಕ';
	@override String get location => 'ಪ್ರಸ್ತುತ ಸ್ಥಳ';
	@override String get qualification => 'ಯೋಗ್ಯತೆ';
	@override String get aboutme => 'ನನ್ನ ಬಗ್ಗೆ';
	@override String get facebookprofilelink => 'ಫೇಸ್ಬುಕ್ ಪ್ರೊಫೈಲ್ ಲಿಂಕ್';
	@override String get twitterprofilelink => 'ಟ್ವಿಟ್ಟರ್ ಪ್ರೊಫೈಲ್ ಲಿಂಕ್';
	@override String get linkdln => 'ಲಿಂಕ್ಡಿನ್ ಪ್ರೊಫೈಲ್ ಲಿಂಕ್';
	@override String get likes => 'ಇಷ್ಟಗಳು';
	@override String get likess => 'ಇಷ್ಟಗಳು';
	@override String get pinnedposts => 'ನನ್ನ ಪಿನ್ ಮಾಡಿದ ಪೋಸ್ಟ್‌ಗಳು';
	@override String get unpinpost => 'ಪೋಸ್ಟ್ ಅನ್ನು ಅನ್ಪಿನ್ ಮಾಡಿ';
	@override String get unpinposthint => 'ನೀವು ಈ ಪೋಸ್ಟ್ ಅನ್ನು ನಿಮ್ಮ ಪಿನ್ ಮಾಡಿದ ಪೋಸ್ಟ್‌ಗಳಿಂದ ತೆಗೆದುಹಾಕಲು ಬಯಸುತ್ತೀರಾ?';
	@override String get postdetails => 'ಪೋಸ್ಟ್ ವಿವರಗಳು';
	@override String get posts => 'ಪೋಸ್ಟ್‌ಗಳು';
	@override String get followers => 'ಅನುಯಾಯಿಗಳು';
	@override String get followings => 'ಅನುಸರಿಸುತ್ತಿದ್ದಾರೆ';
	@override String get my => 'ನನ್ನ';
	@override String get edit => 'ಸಂಪಾದಿಸಿ';
	@override String get delete => 'ಅಳಿಸಿ';
	@override String get deletepost => 'ಪೋಸ್ಟ್ ಅಳಿಸಿ';
	@override String get deleteposthint => 'ನೀವು ಈ ಪೋಸ್ಟ್ ಅನ್ನು ಅಳಿಸಲು ಬಯಸುತ್ತೀರಾ? ಪೋಸ್ಟ್‌ಗಳು ಇನ್ನೂ ಕೆಲವು ಬಳಕೆದಾರರ ಫೀಡ್‌ಗಳಲ್ಲಿ ಕಾಣಿಸಬಹುದು.';
	@override String get maximumallowedsizehint => 'ಅನುಮತಿಸಲಾದ ಫೈಲ್ ಅಪ್ಲೋಡ್ ಗಾತ್ರವನ್ನು ತಲುಪಿದೆ';
	@override String get maximumuploadsizehint => 'ಆಯ್ಕೆ ಮಾಡಿದ ಫೈಲ್ ಅನುಮತಿಸಲಾದ ಅಪ್ಲೋಡ್ ಫೈಲ್ ಗಾತ್ರ ಮಿತಿಯನ್ನು ಮೀರಿಸುತ್ತದೆ.';
	@override String get makeposterror => 'ಈಗಾಗಲೇ ಪೋಸ್ಟ್ ಮಾಡಲು ಸಾಧ್ಯವಿಲ್ಲ, ಪುನಃ ಪ್ರಯತ್ನಿಸಲು ಕ್ಲಿಕ್ ಮಾಡಿ.';
	@override String get makepost => 'ಪೋಸ್ಟ್ ಮಾಡಿ';
	@override String get selectfile => 'ಫೈಲ್ ಆಯ್ಕೆ ಮಾಡಿ';
	@override String get images => 'ಚಿತ್ರಗಳು';
	@override String get shareYourThoughtsNow => 'ನಿಮ್ಮ ಆಲೋಚನೆಗಳನ್ನು ಹಂಚಿಕೊಳ್ಳಿ...';
	@override String get photoviewer => 'ಫೋಟೋ ವೀಕ್ಷಕ';
	@override String get nochatsavailable => 'ಯಾವುದೇ ಸಂವಾದಗಳು ಲಭ್ಯವಿಲ್ಲ \n ಕೆಳಗಿನ ಚಿಹ್ನೆ ಮೇಲೆ ಕ್ಲಿಕ್ ಮಾಡಿ \n ಬಳಕೆದಾರರನ್ನು ಆಯ್ಕೆಮಾಡಿ';
	@override String get typing => 'ಟೈಪಿಂಗ್...';
	@override String get photo => 'ಫೋಟೋ';
	@override String get online => 'ಆನ್‌ಲೈನ್';
	@override String get offline => 'ಆಫ್‌ಲೈನ್';
	@override String get lastseen => 'ಕೊನೆಯದು';
	@override String get deleteselectedhint => 'ಈ ಕ್ರಿಯೆಯಿಂದ ಆಯ್ಕೆಮಾಡಿದ ಸಂದೇಶಗಳನ್ನು ಅಳಿಸಲಾಗುತ್ತದೆ. ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಇದು ನಿಮ್ಮ ಪಾರ್ಟ್ನರ್‌ಗಾಗಿ ಮೆಸೇಜ್‌ಗಳನ್ನು ಇನ್ನೂ ತೋರಿಸುತ್ತದೆ.';
	@override String get deleteselected => 'ಆಯ್ಕೆಮಾಡಿದನ್ನು ಅಳಿಸಿ';
	@override String get unabletofetchconversation => 'ನಿಮ್ಮ ಸಂವಾದವನ್ನು ತೆಗೆದುಕೊಳ್ಳಲು ಸಾಧ್ಯವಿಲ್ಲ \n';
	@override String get loadmoreconversation => 'ಹೆಚ್ಚು ಸಂವಾದಗಳನ್ನು ಲೋಡ್ ಮಾಡಿ';
	@override String get sendyourfirstmessage => 'ನಿಮ್ಮ ಮೊದಲ ಸಂದೇಶವನ್ನು ಕಳುಹಿಸಿ \n';
	@override String get unblock => 'ಅನ್ಬ್ಲಾಕ್ ';
	@override String get block => 'ಬ್ಲಾಕ್';
	@override String get writeyourmessage => 'ನಿಮ್ಮ ಸಂದೇಶವನ್ನು ಬರೆಯಿರಿ...';
	@override String get clearconversation => 'ಸಂಭಾಷಣೆಗಳನ್ನು ಶುದ್ಧಗೊಳಿಸಿ';
	@override String get clearconversationhintone => 'ಈ ಕ್ರಿಯೆಯಿಂದ ನಿಮ್ಮ ಸಂಪೂರ್ಣ ಸಂಭಾಷಣೆ ಶುದ್ಧಗೊಳಿಸಲಾಗುತ್ತದೆ ';
	@override String get clearconversationhinttwo => '.\n ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಇದು ನಿಮ್ಮ ಪಾರ್ಟ್ನರ್‌ಗಾಗಿ ಮೆಸೇಜ್‌ಗಳನ್ನು ಇನ್ನೂ ತೋರಿಸುತ್ತದೆ.';
	@override String get facebookloginerror => 'ಲಾಗಿನ್ ಪ್ರಕ್ರಿಯೆಯಲ್ಲಿ ಏನೋ ತಪ್ಪಾಗಿದೆ.\n, ಫೇಸ್ಬುಕ್ ನಮಗೆ ನೀಡಿದ ದೋಷ ಇಲ್ಲಿದೆ';
	@override String get selectLanguage => 'ಭಾಷೆ ಆಯ್ಕೆಮಾಡಿ';
	@override String get howTo => 'ಹೇಗೆ';
	@override String get noBibleTextsAvailable => 'ಯಾವುದೇ ಬೈಬಲ್ ಪಾಠಗಳೂ ಲಭ್ಯವಿಲ್ಲ';
	@override String get languages => 'ಭಾಷೆಗಳು';
	@override String get searchLanguages => 'ಭಾಷೆಗಳನ್ನು ಹುಡುಕಿ...';
	@override String get biblesFilesets => 'ಬೈಬಲ್ಗಳು: {bibles}, ಕಡತಗಳ ಸೆಟ್‌ಗಳು: {filesets}';
	@override String get oldTestament => 'ಹಳೆಯ ಒಡಂಬಡಿಕೆ';
	@override String get newTestament => 'ಹೊಸ ಒಡಂಬಡಿಕೆ';
	@override String get play => 'ಆಡಲು';
	@override String get no_verse_content => 'ಪ್ರದರ್ಶಿಸಲು ಯಾವುದೇ ಬೈಬಲ್ ಪದ್ಯದ ವಿಷಯವಿಲ್ಲ.';
	@override String get no_audio_content => 'ಪ್ರದರ್ಶಿಸಲು ಯಾವುದೇ ಬೈಬಲ್ ಆಡಿಯೋ ವಿಷಯವಿಲ್ಲ.';
}

// Path: <root>
class _StringsMr implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsMr.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsMr _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'माझा वर्च्युअल पाद्री';
	@override String get selectlanguage => 'भाषा निवडा';
	@override String get deletemyaccount => 'माझे खाते हटवा';
	@override String get deleteaccount => 'माझे खाते हटवा';
	@override String get deleteaccounthint => 'ही क्रिया तुमचे खाते हटवेल आणि तुमचा सर्व डेटा काढेल. एकदा डेटा हटवल्यानंतर, तो पुन्हा प्राप्त केला जाऊ शकत नाही.';
	@override String get deleteaccountsuccess => 'खाते हटवण्यात यशस्वी';
	@override String get chooseapplanguage => 'अ‍ॅप भाषा निवडा';
	@override String get nightmode => 'रात्र मोड';
	@override String get initializingapp => 'प्रारंभ करीत आहे...';
	@override String get home => 'मुख्यपृष्ठ';
	@override String get branches => 'शाखा';
	@override String get inbox => 'इनबॉक्स';
	@override String get downloads => 'डाउनलोड';
	@override String get settings => 'सेटिंग्ज';
	@override String get events => 'कार्यक्रम';
	@override String get myplaylists => 'माझ्या प्लेलिस्ट';
	@override String get website => 'वेबसाइट';
	@override String get hymns => 'भजने';
	@override String get articles => 'लेख';
	@override String get notes => 'टिप्पण्या';
	@override String get donate => 'देणगी';
	@override String get offering => 'अर्पण';
	@override String get savenotetitle => 'टिप्पणी शीर्षक';
	@override String get nonotesfound => 'कोणत्याही टिप्पणी आढळल्या नाहीत';
	@override String get newnote => 'नवीन';
	@override String get deletenote => 'टिप्पणी हटवा';
	@override String get deletenotehint => 'तुम्हाला ही टिप्पणी हटवायची आहे का? ही क्रिया परत केली जाऊ शकत नाही.';
	@override String get bookmarks => 'बुकमार्क्स';
	@override String get socialplatforms => 'सामाजिक प्लॅटफॉर्म';
	@override List<String> get onboardingpagetitles => [
		'माझ्या चर्चमध्ये स्वागत आहे',
		'वैशिष्ट्यांनी भरलेले',
		'ऑडिओ, व्हिडिओ \n आणि थेट प्रसारण',
		'खाते तयार करा',
	];
	@override List<String> get onboardingpagehints => [
		'रविवारी सकाळी आणि आपल्या चर्चच्या चार भिंतींवरून पुढे जा. मोबाईल-केंद्रित जगाशी संवाद साधण्यासाठी आणि संवाद साधण्यासाठी तुम्हाला जे काही आवश्यक आहे ते सर्व काही.',
		'आपल्या चर्च अ‍ॅपमध्ये असणे आवश्यक असलेल्या सर्व शीर्ष वैशिष्ट्यांना एकत्र आणले आहे. कार्यक्रम, भक्तिगीते, सूचना, टिप्पणी आणि बहु-आवृत्ती बायबल.',
		'जगभरातील वापरकर्त्यांना तुमच्या चर्च सेवांचे व्हिडिओ पाहण्याची, ऑडिओ संदेश ऐकण्याची आणि थेट प्रसारण पाहण्याची परवानगी द्या.',
		'कधीही न संपणाऱ्या उपासनेच्या अनुभवासाठी तुमचा प्रवास सुरू करा.',
	];
	@override String get next => 'पुढे';
	@override String get done => 'प्रारंभ करा';
	@override String get quitapp => 'अ‍ॅप सोडा!';
	@override String get quitappwarning => 'आपण अ‍ॅप बंद करू इच्छिता?';
	@override String get quitappaudiowarning => 'आपण सध्या ऑडिओ प्ले करत आहात, अ‍ॅप बंद केल्याने ऑडिओ प्लेबॅक थांबेल. आपण प्लेबॅक थांबवू इच्छित नसल्यास, फक्त मध्य बटणासह अ‍ॅप कमी करा किंवा अ‍ॅप सोडण्यासाठी ओके बटणावर क्लिक करा.';
	@override String get ok => 'ठीक आहे';
	@override String get retry => 'पुन्हा प्रयत्न करा';
	@override String get oops => 'अरेरे!';
	@override String get save => 'जतन करा';
	@override String get cancel => 'रद्द करा';
	@override String get error => 'त्रुटी';
	@override String get success => 'यश';
	@override String get skip => 'वगळा';
	@override String get skiplogin => 'लॉगिन वगळा';
	@override String get skipregister => 'नोंदणी वगळा';
	@override String get dataloaderror => 'सध्या विनंती केलेला डेटा लोड करू शकत नाही, आपला डेटा कनेक्शन तपासा आणि पुन्हा प्रयत्न करण्यासाठी क्लिक करा.';
	@override String get suggestedforyou => 'तुमच्यासाठी सुचवलेले';
	@override String get videomessages => 'व्हिडिओ संदेश';
	@override String get audiomessages => 'ऑडिओ संदेश';
	@override String get devotionals => 'भक्तिगीते';
	@override String get categories => 'श्रेण्या';
	@override String get category => 'श्रेणी';
	@override String get videos => 'व्हिडिओ';
	@override String get audios => 'ऑडिओ';
	@override String get biblebooks => 'बायबल';
	@override String get sermons => 'प्रवचने';
	@override String get tools => 'साधने';
	@override String get profile => 'प्रोफाइल';
	@override String get audiobible => 'ऑडिओ बायबल';
	@override String get homesentence => 'तुमचा पाद्री 1 वर्षासाठी, तुम्हाला देवाने बोलावलेल्या व्यक्तीमध्ये वाढण्यास मदत करण्यासाठी.';
	@override String get livestreams => 'थेट प्रसारण';
	@override String get radio => 'रेडिओ';
	@override String get allitems => 'सर्व आयटम';
	@override String get emptyplaylist => 'प्लेलिस्ट नाहीत';
	@override String get notsupported => 'समर्थित नाही';
	@override String get cleanupresources => 'साधने स्वच्छ करत आहे';
	@override String get grantstoragepermission => 'कृपया पुढे जाण्यासाठी संग्रहण परवानगी प्रदान करा';
	@override String get sharefiletitle => 'पहा किंवा ऐका ';
	@override String get sharefilebody => 'माझ्या वर्च्युअल पाद्री अ‍ॅपच्या माध्यमातून, आता डाउनलोड करा ';
	@override String get sharetext => 'असीमित ऑडिओ आणि व्हिडिओ प्रवाहाचा आनंद घ्या';
	@override String get sharetexthint => 'तुम्हाला जगभरातील लाखो फाईल्स पाहू आणि ऐकू देणाऱ्या व्हिडिओ आणि ऑडिओ प्रवाहित प्लॅटफॉर्ममध्ये सामील व्हा. आता डाउनलोड करा ';
	@override String get download => 'डाउनलोड';
	@override String get addplaylist => 'प्लेलिस्टमध्ये जोडा';
	@override String get bookmark => 'बुकमार्क';
	@override String get unbookmark => 'बुकमार्क काढा';
	@override String get share => 'शेअर करा';
	@override String get deletemedia => 'फाइल हटवा';
	@override String get deletemediahint => 'आपण हे डाउनलोड केलेले फाइल हटवू इच्छिता? ही क्रिया पूर्ववत केली जाऊ शकत नाही.';
	@override String get searchhint => 'ऑडिओ आणि व्हिडिओ संदेश शोधा';
	@override String get performingsearch => 'ऑडिओ आणि व्हिडिओ शोधत आहे';
	@override String get nosearchresult => 'कोणतेही निकाल सापडले नाहीत';
	@override String get nosearchresulthint => 'अधिक सामान्य कीवर्ड प्रविष्ट करण्याचा प्रयत्न करा';
	@override String get addtoplaylist => 'प्लेलिस्टमध्ये जोडा';
	@override String get newplaylist => 'नवीन प्लेलिस्ट';
	@override String get playlistitm => 'प्लेलिस्ट';
	@override String get mediaaddedtoplaylist => 'मीडिया प्लेलिस्टमध्ये जोडले.';
	@override String get mediaremovedfromplaylist => 'मीडिया प्लेलिस्टमधून काढले';
	@override String get clearplaylistmedias => 'सर्व मीडिया स्वच्छ करा';
	@override String get deletePlayList => 'प्लेलिस्ट हटवा';
	@override String get clearplaylistmediashint => 'आपण या प्लेलिस्टमधून सर्व मीडिया काढू इच्छिता?';
	@override String get deletePlayListhint => 'आपण ही प्लेलिस्ट हटवू आणि सर्व मीडिया स्वच्छ करू इच्छिता?';
	@override String get comments => 'टिप्पण्या';
	@override String get replies => 'प्रत्युत्तरे';
	@override String get reply => 'प्रत्युत्तर द्या';
	@override String get logintoaddcomment => 'टिप्पणी जोडण्यासाठी लॉगिन करा';
	@override String get logintoreply => 'प्रत्युत्तर देण्यासाठी लॉगिन करा';
	@override String get writeamessage => 'संदेश लिहा...';
	@override String get nocomments => 'कोणत्याही टिप्पणी आढळल्या नाहीत \nपुन्हा प्रयत्न करण्यासाठी क्लिक करा';
	@override String get errormakingcomments => 'सध्या टिप्पणी करू शकत नाही.';
	@override String get errordeletingcomments => 'सध्या ही टिप्पणी हटवू शकत नाही.';
	@override String get erroreditingcomments => 'सध्या ही टिप्पणी संपादित करू शकत नाही.';
	@override String get errorloadingmorecomments => 'सध्या अधिक टिप्पण्या लोड करू शकत नाही.';
	@override String get deletingcomment => 'टिप्पणी हटवत आहे';
	@override String get editingcomment => 'टिप्पणी संपादित करत आहे';
	@override String get deletecommentalert => 'टिप्पणी हटवा';
	@override String get editcommentalert => 'टिप्पणी संपादित करा';
	@override String get deletecommentalerttext => 'आपण ही टिप्पणी हटवू इच्छिता? ही क्रिया पूर्ववत केली जाऊ शकत नाही';
	@override String get loadmore => 'अधिक लोड करा';
	@override String get messages => 'संदेश';
	@override String get guestuser => 'अतिथी वापरकर्ता';
	@override String get fullname => 'पूर्ण नाव';
	@override String get emailaddress => 'ईमेल पत्ता';
	@override String get password => 'पासवर्ड';
	@override String get repeatpassword => 'पासवर्ड पुन्हा प्रविष्ट करा';
	@override String get register => 'नोंदणी करा';
	@override String get login => 'लॉगिन';
	@override String get logout => 'लॉगआउट';
	@override String get logoutfromapp => 'अ‍ॅपमधून लॉगआउट करायचे?';
	@override String get logoutfromapphint => 'आपण लॉगिन नसल्यास आपल्याला लेख आणि व्हिडिओवर टिप्पणी करण्यासाठी किंवा आवडण्यासाठी सक्षम होणार नाही.';
	@override String get gotologin => 'लॉगिन वर जा';
	@override String get resetpassword => 'पासवर्ड रीसेट करा';
	@override String get logintoaccount => 'आधीच खाते आहे? लॉगिन';
	@override String get emptyfielderrorhint => 'आपण सर्व फील्ड भरणे आवश्यक आहे';
	@override String get invalidemailerrorhint => 'आपल्याला वैध ईमेल पत्ता प्रविष्ट करणे आवश्यक आहे';
	@override String get passwordsdontmatch => 'पासवर्ड जुळत नाहीत';
	@override String get processingpleasewait => 'प्रक्रिया करत आहे, कृपया प्रतीक्षा करा...';
	@override String get createaccount => 'खाते तयार करा';
	@override String get forgotpassword => 'पासवर्ड विसरलात?';
	@override String get orloginwith => 'किंवा लॉगिन करा';
	@override String get facebook => 'फेसबुक';
	@override String get google => 'गूगल';
	@override String get moreoptions => 'अधिक पर्याय';
	@override String get about => 'आमच्याबद्दल';
	@override String get privacy => 'गोपनीयता धोरण';
	@override String get terms => 'अ‍ॅपची अटी';
	@override String get rate => 'अ‍ॅपला रेट करा';
	@override String get version => 'आवृत्ती';
	@override String get pulluploadmore => 'लोड करण्यासाठी वर ओढा';
	@override String get loadfailedretry => 'लोड करण्यात अयशस्वी! पुन्हा प्रयत्न करण्यासाठी क्लिक करा!';
	@override String get releaseloadmore => 'अधिक लोड करण्यासाठी सोडा';
	@override String get nomoredata => 'आणखी डेटा नाही';
	@override String get errorReportingComment => 'टिप्पणी अहवाल त्रुटी';
	@override String get reportingComment => 'टिप्पणी अहवाल';
	@override String get reportcomment => 'अहवाल पर्याय';
	@override List<String> get reportCommentsList => [
		'अनावश्यक व्यावसायिक सामग्री किंवा स्पॅम',
		'अश्लीलता किंवा लैंगिक स्पष्ट सामग्री',
		'द्वेष भाषण किंवा ग्राफिक हिंसा',
		'छळ किंवा धमकावणे',
	];
	@override String get bookmarksMedia => 'माझे बुकमार्क्स';
	@override String get noitemstodisplay => 'प्रदर्शित करण्यासाठी कोणतीही वस्तू नाहीत';
	@override String get loginrequired => 'लॉगिन आवश्यक आहे';
	@override String get loginrequiredhint => 'या प्लॅटफॉर्मवर सदस्यता घेण्यासाठी, आपल्याला लॉगिन करणे आवश्यक आहे. आता एक विनामूल्य खाते तयार करा किंवा आपल्या विद्यमान खात्यात लॉगिन करा.';
	@override String get subscriptions => 'अ‍ॅप सदस्यता';
	@override String get subscribe => 'सदस्यता घ्या';
	@override String get subscribehint => 'सदस्यता आवश्यक आहे';
	@override String get playsubscriptionrequiredhint => 'हे मीडिया ऐकण्यासाठी किंवा पाहण्यासाठी आपल्याला सदस्यता घ्यावी लागेल.';
	@override String get previewsubscriptionrequiredhint => 'आपण या मीडियासाठी अनुमत पूर्वावलोकन कालावधी पूर्ण केला आहे. ऐकणे किंवा पाहण्यासाठी आपण सदस्यता घ्यावी लागेल.';
	@override String get copiedtoclipboard => 'क्लिपबोर्डवर कॉपी केले';
	@override String get downloadbible => 'बायबल डाउनलोड करा';
	@override String get downloadversion => 'डाउनलोड';
	@override String get downloading => 'डाउनलोड करत आहे';
	@override String get failedtodownload => 'डाउनलोड करण्यात अयशस्वी';
	@override String get pleaseclicktoretry => 'कृपया पुन्हा प्रयत्न करण्यासाठी क्लिक करा.';
	@override String get of => 'पैकी';
	@override String get nobibleversionshint => 'प्रदर्शित करण्यासाठी कोणतेही बायबल डेटा नाहीत, कमीत कमी एक बायबल आवृत्ती डाउनलोड करण्यासाठी खालील बटणावर क्लिक करा.';
	@override String get downloaded => 'डाउनलोड केले';
	@override String get enteremailaddresstoresetpassword => 'आपला पासवर्ड रीसेट करण्यासाठी आपला ईमेल प्रविष्ट करा';
	@override String get backtologin => 'लॉगिन वर परत जा';
	@override String get signintocontinue => 'पुढे जाण्यासाठी साइन इन करा';
	@override String get signin => 'साइन इन';
	@override String get signinforanaccount => 'खात्यासाठी साइन अप करा?';
	@override String get alreadyhaveanaccount => 'आधीपासूनच खाते आहे?';
	@override String get updateprofile => 'प्रोफाइल अद्यतनित करा';
	@override String get updateprofilehint => 'प्रारंभ करण्यासाठी, कृपया आपले प्रोफाइल पृष्ठ अद्यतनित करा, हे आम्हाला इतर लोकांशी जोडण्यास मदत करेल';
	@override String get autoplayvideos => 'व्हिडिओ स्वयंचलित प्ले';
	@override String get gosocial => 'सोशल वर जा';
	@override String get searchbible => 'बायबल शोधा';
	@override String get filtersearchoptions => 'शोध पर्याय फिल्टर करा';
	@override String get narrowdownsearch => 'अधिक अचूक परिणामांसाठी शोध कमी करण्यासाठी खालील फिल्टर बटण वापरा.';
	@override String get searchbibleversion => 'बायबल आवृत्ती शोधा';
	@override String get searchbiblebook => 'बायबल पुस्तक शोधा';
	@override String get search => 'शोधा';
	@override String get setBibleBook => 'बायबल पुस्तक सेट करा';
	@override String get oldtestament => 'जुना करार';
	@override String get newtestament => 'नवीन करार';
	@override String get limitresults => 'परिणाम मर्यादित करा';
	@override String get setfilters => 'फिल्टर सेट करा';
	@override String get bibletranslator => 'बायबल अनुवादक';
	@override String get chapter => ' अध्याय ';
	@override String get verse => ' श्लोक ';
	@override String get translate => 'अनुवाद करा';
	@override String get bibledownloadinfo => 'बायबल डाउनलोड प्रारंभ झाला आहे, डाउनलोड पूर्ण होईपर्यंत कृपया हे पृष्ठ बंद करू नका.';
	@override String get received => 'प्राप्त झाले';
	@override String get outoftotal => 'एकूण';
	@override String get set => 'सेट करा';
	@override String get selectColor => 'रंग निवडा';
	@override String get switchbibleversion => 'बायबल आवृत्ती बदला';
	@override String get switchbiblebook => 'बायबल पुस्तक बदला';
	@override String get gotosearch => 'अध्यायावर जा';
	@override String get changefontsize => 'फॉन्ट आकार बदला';
	@override String get font => 'फॉन्ट';
	@override String get readchapter => 'अध्याय वाचा';
	@override String get showhighlightedverse => 'हायलाइट केलेले श्लोक दाखवा';
	@override String get downloadmoreversions => 'अधिक आवृत्त्या डाउनलोड करा';
	@override String get suggestedusers => 'शिफारस केलेले वापरकर्ते';
	@override String get unfollow => 'अनफॉलो करा';
	@override String get follow => 'फॉलो करा';
	@override String get searchforpeople => 'लोकांना शोधा';
	@override String get viewpost => 'पोस्ट पहा';
	@override String get viewprofile => 'प्रोफाइल पहा';
	@override String get mypins => 'माझे पिन्स';
	@override String get viewpinnedposts => 'पिन केलेले पोस्ट पहा';
	@override String get personal => 'वैयक्तिक';
	@override String get update => 'अद्यतनित करा';
	@override String get phonenumber => 'फोन नंबर';
	@override String get showmyphonenumber => 'माझा फोन नंबर वापरकर्त्यांना दाखवा';
	@override String get dateofbirth => 'जन्मतारीख';
	@override String get showmyfulldateofbirth => 'माझी स्थिती पाहणाऱ्या लोकांना माझी पूर्ण जन्मतारीख दाखवा';
	@override String get notifications => 'सूचना';
	@override String get notifywhenuserfollowsme => 'जेव्हा एखादा वापरकर्ता मला फॉलो करतो तेव्हा मला सूचित करा';
	@override String get notifymewhenusercommentsonmypost => 'जेव्हा वापरकर्ते माझ्या पोस्टवर टिप्पणी करतात तेव्हा मला सूचित करा';
	@override String get notifymewhenuserlikesmypost => 'जेव्हा वापरकर्ते माझ्या पोस्टला आवडतात तेव्हा मला सूचित करा';
	@override String get churchsocial => 'चर्च सोशल';
	@override String get shareyourthoughts => 'तुमचे विचार शेअर करा';
	@override String get readmore => '...अधिक वाचा';
	@override String get less => ' कमी';
	@override String get couldnotprocess => 'विनंती केलेली कृती प्रक्रिया करू शकली नाही.';
	@override String get pleaseselectprofilephoto => 'कृपया अपलोड करण्यासाठी प्रोफाइल फोटो निवडा';
	@override String get pleaseselectprofilecover => 'कृपया अपलोड करण्यासाठी कव्हर फोटो निवडा';
	@override String get updateprofileerrorhint => 'आपण पुढे जाण्यापूर्वी आपले नाव, जन्मतारीख, लिंग, फोन आणि स्थान भरावे लागेल.';
	@override String get gender => 'लिंग';
	@override String get male => 'पुरुष';
	@override String get female => 'महिला';
	@override String get dob => 'जन्मतारीख';
	@override String get location => 'सध्याचे स्थान';
	@override String get qualification => 'पात्रता';
	@override String get aboutme => 'माझ्याबद्दल';
	@override String get facebookprofilelink => 'फेसबुक प्रोफाइल लिंक';
	@override String get twitterprofilelink => 'ट्विटर प्रोफाइल लिंक';
	@override String get linkdln => 'लिंक्डइन प्रोफाइल लिंक';
	@override String get likes => 'आवडते';
	@override String get likess => 'आवडले';
	@override String get pinnedposts => 'माझ्या पिन केलेल्या पोस्ट';
	@override String get unpinpost => 'पोस्ट अनपिन करा';
	@override String get unpinposthint => 'आपण हे पोस्ट आपल्या पिन केलेल्या पोस्टमधून काढू इच्छिता?';
	@override String get postdetails => 'पोस्ट तपशील';
	@override String get posts => 'पोस्ट';
	@override String get followers => 'अनुयायी';
	@override String get followings => 'अनुसरण करीत आहे';
	@override String get my => 'माझे';
	@override String get edit => 'संपादित करा';
	@override String get delete => 'हटवा';
	@override String get deletepost => 'पोस्ट हटवा';
	@override String get deleteposthint => 'आपण हे पोस्ट हटवू इच्छिता? पोस्ट्स काही वापरकर्त्यांच्या फीडवर दिसू शकतात.';
	@override String get maximumallowedsizehint => 'अनुमत अपलोड फाइल आकार मर्यादेपर्यंत पोहोचले';
	@override String get maximumuploadsizehint => 'निवडलेले फाइल अनुमत अपलोड फाइल आकार मर्यादेपेक्षा जास्त आहे.';
	@override String get makeposterror => 'सध्या पोस्ट बनवू शकत नाही, पुन्हा प्रयत्न करण्यासाठी क्लिक करा.';
	@override String get makepost => 'पोस्ट बनवा';
	@override String get selectfile => 'फाइल निवडा';
	@override String get images => 'प्रतिमा';
	@override String get shareYourThoughtsNow => 'तुमचे विचार शेअर करा...';
	@override String get photoviewer => 'फोटो दर्शक';
	@override String get nochatsavailable => 'कोणत्याही संभाषणे उपलब्ध नाहीत \n खालील चिन्हावर क्लिक करा \n वापरकर्त्यांची निवड करण्यासाठी';
	@override String get typing => 'टायपिंग...';
	@override String get photo => 'फोटो';
	@override String get online => 'ऑनलाइन';
	@override String get offline => 'ऑफलाइन';
	@override String get lastseen => 'शेवटचे दिसले';
	@override String get deleteselectedhint => 'ही क्रिया निवडलेल्या संदेशांना हटवेल. कृपया लक्षात ठेवा की हे केवळ आपली बाजूची संभाषणे हटवते, \n संदेश अजूनही आपल्या पार्टनरच्या डिव्हाइसवर दिसतील.';
	@override String get deleteselected => 'निवडलेले हटवा';
	@override String get unabletofetchconversation => 'आपले संभाषण आणू शकले नाही \n';
	@override String get loadmoreconversation => 'अधिक संभाषणे लोड करा';
	@override String get sendyourfirstmessage => 'आपला पहिला संदेश पाठवा \n';
	@override String get unblock => 'अनब्लॉक ';
	@override String get block => 'ब्लॉक';
	@override String get writeyourmessage => 'आपला संदेश लिहा...';
	@override String get clearconversation => 'संभाषण स्वच्छ करा';
	@override String get clearconversationhintone => 'ही क्रिया आपले सर्व संभाषण स्वच्छ करेल ';
	@override String get clearconversationhinttwo => '.\n कृपया लक्षात ठेवा की हे केवळ आपली बाजूची संभाषणे हटवते, संदेश अजूनही आपल्या पार्टनरच्या चॅटवर दिसतील.';
	@override String get facebookloginerror => 'लॉगिन प्रक्रियेत काहीतरी चुकीचे झाले.\n, येथे फेसबुकने आम्हाला दिलेली त्रुटी आहे';
	@override String get selectLanguage => 'भाषा निवडा';
	@override String get howTo => 'कसे';
	@override String get noBibleTextsAvailable => 'कोणतेही बायबल मजकूर उपलब्ध नाहीत';
	@override String get languages => 'भाषा';
	@override String get searchLanguages => 'भाषा शोधा...';
	@override String get biblesFilesets => 'बायबल: {bibles}, फाईलसेट: {filesets}';
	@override String get oldTestament => 'जुना करार';
	@override String get newTestament => 'नवीन करार';
	@override String get play => 'वाजवा';
	@override String get no_verse_content => 'प्रदर्शित करण्यासाठी कोणतीही बायबल श्लोक सामग्री उपलब्ध नाही.';
	@override String get no_audio_content => 'प्रदर्शित करण्यासाठी कोणतीही बायबल ऑडिओ सामग्री उपलब्ध नाही.';
}

// Path: <root>
class _StringsNe implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsNe.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsNe _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'मेरो भर्चुअल पास्टर';
	@override String get selectlanguage => 'भाषा चयन गर्नुहोस्';
	@override String get deletemyaccount => 'मेरो खाता मेटाउनुहोस्';
	@override String get deleteaccount => 'खाता मेटाउनुहोस्';
	@override String get deleteaccounthint => 'यस कार्यले तपाईंको खाता मेट्छ र सबै डाटा हटाउँछ। एक पटक तपाईंको डाटा मेटिएको छ भने, यसलाई पुन: प्राप्त गर्न सकिँदैन।';
	@override String get deleteaccountsuccess => 'खाता मेटाउने कार्य सफल भयो';
	@override String get chooseapplanguage => 'एप भाषा चयन गर्नुहोस्';
	@override String get nightmode => 'रात मोड';
	@override String get initializingapp => 'आरम्भ गर्दैछ...';
	@override String get home => 'गृहपृष्ठ';
	@override String get branches => 'शाखाहरू';
	@override String get inbox => 'इनबक्स';
	@override String get downloads => 'डाउनलोडहरू';
	@override String get settings => 'सेटिङहरू';
	@override String get events => 'घटनाहरू';
	@override String get myplaylists => 'मेरो प्ले सूचीहरू';
	@override String get website => 'वेबसाइट';
	@override String get hymns => 'भजनहरू';
	@override String get articles => 'लेखहरू';
	@override String get notes => 'टिप्पणीहरू';
	@override String get donate => 'दान';
	@override String get offering => 'अर्पण';
	@override String get savenotetitle => 'टिप्पणी शीर्षक';
	@override String get nonotesfound => 'कुनै टिप्पणी भेटिएन';
	@override String get newnote => 'नयाँ';
	@override String get deletenote => 'टिप्पणी मेटाउनुहोस्';
	@override String get deletenotehint => 'के तपाईं यो टिप्पणी मेटाउन चाहनुहुन्छ? यस कार्यलाई उल्टाउन सकिँदैन।';
	@override String get bookmarks => 'बुकमार्कहरू';
	@override String get socialplatforms => 'सामाजिक प्लेटफार्महरू';
	@override List<String> get onboardingpagetitles => [
		'मेरो चर्चमा स्वागत छ',
		'विशेषताहरूले भरिएको',
		'अडियो, भिडियो \n र लाइभ स्ट्रिमिङ',
		'खाता सिर्जना गर्नुहोस्',
	];
	@override List<String> get onboardingpagehints => [
		'आइतबार बिहान र तपाईंको चर्चका चार पर्खालहरू भन्दा बाहिर फैलिनुहोस्। मोबाइल-केन्द्रित विश्वसँग संवाद गर्न र संलग्न हुन तपाईंलाई चाहिने सबै कुरा।',
		'हामीले तपाईंको चर्च एपले आवश्यक पर्ने सबै शीर्ष सुविधाहरूलाई एकत्र गरेका छौं। घटनाहरू, भक्तिगीतहरू, सूचनाहरू, टिप्पणीहरू र बहु-संस्करण बाइबल।',
		'प्रयोगकर्ताहरूलाई विश्वभरि भिडियोहरू हेर्न, अडियो सन्देशहरू सुन्न र तपाईंको चर्च सेवाहरूको लाइभ स्ट्रिम हेर्न अनुमति दिनुहोस्।',
		'कहिल्यै नसकिने उपासना अनुभवतर्फ तपाईंको यात्रा सुरु गर्नुहोस्।',
	];
	@override String get next => 'अर्को';
	@override String get done => 'सुरु गर्नुहोस्';
	@override String get quitapp => 'एप बन्द गर्नुहोस्!';
	@override String get quitappwarning => 'के तपाईं एप बन्द गर्न चाहनुहुन्छ?';
	@override String get quitappaudiowarning => 'तपाईं हाल अडियो प्ले गर्दै हुनुहुन्छ, एप बन्द गर्दा अडियो प्लेब्याक बन्द हुन्छ। यदि तपाईं प्लेब्याक रोक्न चाहनुहुन्न भने, केवल केन्द्र बटन प्रयोग गरेर एपलाई मिनिमाइज गर्नुहोस् वा एप बन्द गर्न ठिक बटन क्लिक गर्नुहोस्।';
	@override String get ok => 'ठिक';
	@override String get retry => 'पुन: प्रयास गर्नुहोस्';
	@override String get oops => 'अरे!';
	@override String get save => 'सेभ गर्नुहोस्';
	@override String get cancel => 'रद्द गर्नुहोस्';
	@override String get error => 'त्रुटि';
	@override String get success => 'सफलता';
	@override String get skip => 'छोड्नुहोस्';
	@override String get skiplogin => 'लगइन छोड्नुहोस्';
	@override String get skipregister => 'दर्ता छोड्नुहोस्';
	@override String get dataloaderror => 'हाल अनुरोध गरिएको डाटा लोड गर्न सकिएन, कृपया तपाईंको डाटा कनेक्शन जाँच गर्नुहोस् र पुन: प्रयास गर्न क्लिक गर्नुहोस्।';
	@override String get suggestedforyou => 'तपाईंको लागि सिफारिस गरिएको';
	@override String get videomessages => 'भिडियो सन्देशहरू';
	@override String get audiomessages => 'अडियो सन्देशहरू';
	@override String get devotionals => 'भक्तिगीतहरू';
	@override String get categories => 'श्रेणीहरू';
	@override String get category => 'श्रेणी';
	@override String get videos => 'भिडियोहरू';
	@override String get audios => 'अडियोहरू';
	@override String get biblebooks => 'बाइबल';
	@override String get sermons => 'प्रवचनहरू';
	@override String get tools => 'उपकरणहरू';
	@override String get profile => 'प्रोफाइल';
	@override String get audiobible => 'अडियो बाइबल';
	@override String get homesentence => 'तपाईंलाई भगवानले बोलाएको व्यक्तिमा हुर्काउन मद्दत गर्न १ वर्षको लागि तपाईंको पादरी।';
	@override String get livestreams => 'लाइभ स्ट्रिमहरू';
	@override String get radio => 'रेडियो';
	@override String get allitems => 'सबै वस्तुहरू';
	@override String get emptyplaylist => 'कुनै प्ले सूचीहरू छैनन्';
	@override String get notsupported => 'समर्थन छैन';
	@override String get cleanupresources => 'स्रोतहरू सफा गर्दै';
	@override String get grantstoragepermission => 'कृपया अगाडि बढ्न संग्रहण अनुमति प्रदान गर्नुहोस्';
	@override String get sharefiletitle => 'हेर्नुहोस् वा सुन्नुहोस् ';
	@override String get sharefilebody => 'मेरो भर्चुअल पास्टर एपमार्फत, अहिले डाउनलोड गर्नुहोस् ';
	@override String get sharetext => 'असीमित अडियो र भिडियो स्ट्रिमिङको आनन्द लिनुहोस्';
	@override String get sharetexthint => 'तपाईंलाई विश्वभरका लाखौं फाइलहरू हेर्न र सुन्न दिने भिडियो र अडियो स्ट्रिमिङ प्लेटफर्ममा सामेल हुनुहोस्। अहिले डाउनलोड गर्नुहोस् ';
	@override String get download => 'डाउनलोड गर्नुहोस्';
	@override String get addplaylist => 'प्ले सूचीमा थप्नुहोस्';
	@override String get bookmark => 'बुकमार्क';
	@override String get unbookmark => 'बुकमार्क हटाउनुहोस्';
	@override String get share => 'सेयर गर्नुहोस्';
	@override String get deletemedia => 'फाइल मेटाउनुहोस्';
	@override String get deletemediahint => 'के तपाईं यो डाउनलोड गरिएको फाइल मेटाउन चाहनुहुन्छ? यस कार्यलाई उल्टाउन सकिँदैन।';
	@override String get searchhint => 'अडियो र भिडियो सन्देशहरू खोज्नुहोस्';
	@override String get performingsearch => 'अडियो र भिडियो खोज्दैछ';
	@override String get nosearchresult => 'कुनै नतिजा भेटिएन';
	@override String get nosearchresulthint => 'अधिक सामान्य कुञ्जीशब्द प्रविष्ट गर्ने प्रयास गर्नुहोस्';
	@override String get addtoplaylist => 'प्ले सूचीमा थप्नुहोस्';
	@override String get newplaylist => 'नयाँ प्ले सूची';
	@override String get playlistitm => 'प्ले सूची';
	@override String get mediaaddedtoplaylist => 'मीडिया प्ले सूचीमा थपियो।';
	@override String get mediaremovedfromplaylist => 'मीडिया प्ले सूचीबाट हटाइयो';
	@override String get clearplaylistmedias => 'सबै मिडिया सफा गर्नुहोस्';
	@override String get deletePlayList => 'प्ले सूची मेटाउनुहोस्';
	@override String get clearplaylistmediashint => 'के तपाईं यो प्ले सूचीबाट सबै मिडिया हटाउन चाहनुहुन्छ?';
	@override String get deletePlayListhint => 'के तपाईं यो प्ले सूची मेटाउन र सबै मिडिया सफा गर्न चाहनुहुन्छ?';
	@override String get comments => 'टिप्पणीहरू';
	@override String get replies => 'उत्तरहरू';
	@override String get reply => 'उत्तर';
	@override String get logintoaddcomment => 'टिप्पणी थप्न लगइन गर्नुहोस्';
	@override String get logintoreply => 'उत्तर दिन लगइन गर्नुहोस्';
	@override String get writeamessage => 'सन्देश लेख्नुहोस्...';
	@override String get nocomments => 'कुनै टिप्पणी भेटिएन \nपुन: प्रयास गर्न क्लिक गर्नुहोस्';
	@override String get errormakingcomments => 'हाल टिप्पणी गर्न सकिएन..';
	@override String get errordeletingcomments => 'हाल यो टिप्पणी मेटाउन सकिँदैन..';
	@override String get erroreditingcomments => 'हाल यो टिप्पणी सम्पादन गर्न सकिँदैन..';
	@override String get errorloadingmorecomments => 'हाल अधिक टिप्पणीहरू लोड गर्न सकिँदैन..';
	@override String get deletingcomment => 'टिप्पणी मेट्दै';
	@override String get editingcomment => 'टिप्पणी सम्पादन गर्दै';
	@override String get deletecommentalert => 'टिप्पणी मेटाउनुहोस्';
	@override String get editcommentalert => 'टिप्पणी सम्पादन गर्नुहोस्';
	@override String get deletecommentalerttext => 'के तपाईं यो टिप्पणी मेटाउन चाहनुहुन्छ? यस कार्यलाई उल्टाउन सकिँदैन';
	@override String get loadmore => 'अधिक लोड गर्नुहोस्';
	@override String get messages => 'सन्देशहरू';
	@override String get guestuser => 'अतिथि प्रयोगकर्ता';
	@override String get fullname => 'पूरा नाम';
	@override String get emailaddress => 'इमेल ठेगाना';
	@override String get password => 'पासवर्ड';
	@override String get repeatpassword => 'पासवर्ड पुन: प्रविष्ट गर्नुहोस्';
	@override String get register => 'दर्ता गर्नुहोस्';
	@override String get login => 'लगइन गर्नुहोस्';
	@override String get logout => 'लगआउट गर्नुहोस्';
	@override String get logoutfromapp => 'एपबाट लगआउट गर्नुहोस्?';
	@override String get logoutfromapphint => 'तपाईं लगइन नभएको अवस्थामा तपाईंलाई लेखहरू र भिडियोहरूमा टिप्पणी गर्न वा मन पराउन सक्षम हुने छैन।';
	@override String get gotologin => 'लगइनमा जानुहोस्';
	@override String get resetpassword => 'पासवर्ड रिसेट गर्नुहोस्';
	@override String get logintoaccount => 'पहिले नै खाता छ? लगइन गर्नुहोस्';
	@override String get emptyfielderrorhint => 'तपाईंले सबै क्षेत्रहरू भर्न आवश्यक छ';
	@override String get invalidemailerrorhint => 'तपाईंले मान्य इमेल ठेगाना प्रविष्ट गर्नु आवश्यक छ';
	@override String get passwordsdontmatch => 'पासवर्डहरू मेल खाँदैनन्';
	@override String get processingpleasewait => 'प्रसंस्करण गर्दै, कृपया पर्खनुहोस्...';
	@override String get createaccount => 'खाता सिर्जना गर्नुहोस्';
	@override String get forgotpassword => 'पासवर्ड बिर्सनुभयो?';
	@override String get orloginwith => 'वा लगइन गर्नुहोस्';
	@override String get facebook => 'फेसबुक';
	@override String get google => 'गुगल';
	@override String get moreoptions => 'थप विकल्पहरू';
	@override String get about => 'हाम्रोबारे';
	@override String get privacy => 'गोपनीयता नीति';
	@override String get terms => 'एपका सर्तहरू';
	@override String get rate => 'एपलाई रेट गर्नुहोस्';
	@override String get version => 'संस्करण';
	@override String get pulluploadmore => 'लोड गर्न तान्नुहोस्';
	@override String get loadfailedretry => 'लोड असफल भयो! पुन: प्रयास गर्न क्लिक गर्नुहोस्!';
	@override String get releaseloadmore => 'अधिक लोड गर्न छोड्नुहोस्';
	@override String get nomoredata => 'अझै डाटा छैन';
	@override String get errorReportingComment => 'टिप्पणी रिपोर्टिङ त्रुटि';
	@override String get reportingComment => 'टिप्पणी रिपोर्ट गर्दै';
	@override String get reportcomment => 'रिपोर्ट विकल्पहरू';
	@override List<String> get reportCommentsList => [
		'अनचाहिएको व्यावसायिक सामग्री वा स्प्याम',
		'अश्लीलता वा यौन स्पष्ट सामग्री',
		'घृणा भाषण वा ग्राफिक हिंसा',
		'उत्पीडन वा धम्की',
	];
	@override String get bookmarksMedia => 'मेरो बुकमार्कहरू';
	@override String get noitemstodisplay => 'प्रदर्शन गर्न कुनै वस्तु छैन';
	@override String get loginrequired => 'लगइन आवश्यक छ';
	@override String get loginrequiredhint => 'यस प्लेटफर्ममा सदस्यता लिन, तपाईंलाई लगइन गर्न आवश्यक छ। अहिले एक निःशुल्क खाता सिर्जना गर्नुहोस् वा तपाईंको विद्यमान खातामा लगइन गर्नुहोस्।';
	@override String get subscriptions => 'एप सदस्यता';
	@override String get subscribe => 'सदस्यता लिनुहोस्';
	@override String get subscribehint => 'सदस्यता आवश्यक छ';
	@override String get playsubscriptionrequiredhint => 'यस मिडिया सुन्न वा हेर्नका लागि तपाईंलाई सदस्यता लिन आवश्यक छ।';
	@override String get previewsubscriptionrequiredhint => 'यस मिडियाका लागि तपाईंले अनुमति दिइएको पूर्वावलोकन अवधि पुग्नुभएको छ। सुन्न वा हेर्नका लागि तपाईंलाई सदस्यता लिन आवश्यक छ।';
	@override String get copiedtoclipboard => 'क्लिपबोर्डमा प्रतिलिपि गरियो';
	@override String get downloadbible => 'बाइबल डाउनलोड गर्नुहोस्';
	@override String get downloadversion => 'डाउनलोड गर्नुहोस्';
	@override String get downloading => 'डाउनलोड गर्दै';
	@override String get failedtodownload => 'डाउनलोड गर्न असफल भयो';
	@override String get pleaseclicktoretry => 'कृपया पुन: प्रयास गर्न क्लिक गर्नुहोस्।';
	@override String get of => 'को';
	@override String get nobibleversionshint => 'प्रदर्शन गर्न कुनै बाइबल डाटा छैन, कम्तिमा एउटा बाइबल संस्करण डाउनलोड गर्न तलको बटनमा क्लिक गर्नुहोस्।';
	@override String get downloaded => 'डाउनलोड गरियो';
	@override String get enteremailaddresstoresetpassword => 'तपाईंको पासवर्ड रिसेट गर्न तपाईंको इमेल प्रविष्ट गर्नुहोस्';
	@override String get backtologin => 'लगइनमा फिर्ता जानुहोस्';
	@override String get signintocontinue => 'अगाडि बढ्न साइन इन गर्नुहोस्';
	@override String get signin => 'साइन इन गर्नुहोस्';
	@override String get signinforanaccount => 'खाताका लागि साइन अप गर्नुहोस्?';
	@override String get alreadyhaveanaccount => 'पहिले नै खाता छ?';
	@override String get updateprofile => 'प्रोफाइल अद्यावधिक गर्नुहोस्';
	@override String get updateprofilehint => 'सुरु गर्न, कृपया तपाईंको प्रोफाइल पृष्ठ अद्यावधिक गर्नुहोस्, यसले हामीलाई अन्य व्यक्तिहरूसँग जोड्न मद्दत गर्दछ';
	@override String get autoplayvideos => 'स्वतः प्ले भिडियोहरू';
	@override String get gosocial => 'सामाजिक जानुहोस्';
	@override String get searchbible => 'बाइबल खोज्नुहोस्';
	@override String get filtersearchoptions => 'खोज विकल्पहरू फिल्टर गर्नुहोस्';
	@override String get narrowdownsearch => 'अधिक सटीक परिणामहरूको लागि खोजलाई संकीर्ण गर्न तलको फिल्टर बटन प्रयोग गर्नुहोस्।';
	@override String get searchbibleversion => 'बाइबल संस्करण खोज्नुहोस्';
	@override String get searchbiblebook => 'बाइबल पुस्तक खोज्नुहोस्';
	@override String get search => 'खोज्नुहोस्';
	@override String get setBibleBook => 'बाइबल पुस्तक सेट गर्नुहोस्';
	@override String get oldtestament => 'पुरानो करार';
	@override String get newtestament => 'नयाँ करार';
	@override String get limitresults => 'परिणामहरू सीमित गर्नुहोस्';
	@override String get setfilters => 'फिल्टरहरू सेट गर्नुहोस्';
	@override String get bibletranslator => 'बाइबल अनुवादक';
	@override String get chapter => ' अध्याय ';
	@override String get verse => ' पद ';
	@override String get translate => 'अनुवाद गर्नुहोस्';
	@override String get bibledownloadinfo => 'बाइबल डाउनलोड सुरु भयो, डाउनलोड पूरा नभएसम्म कृपया यो पृष्ठ बन्द नगर्नुहोस्।';
	@override String get received => 'प्राप्त';
	@override String get outoftotal => 'कुल';
	@override String get set => 'सेट गर्नुहोस्';
	@override String get selectColor => 'रंग चयन गर्नुहोस्';
	@override String get switchbibleversion => 'बाइबल संस्करण बदल्नुहोस्';
	@override String get switchbiblebook => 'बाइबल पुस्तक बदल्नुहोस्';
	@override String get gotosearch => 'अध्यायमा जानुहोस्';
	@override String get changefontsize => 'फन्ट आकार बदल्नुहोस्';
	@override String get font => 'फन्ट';
	@override String get readchapter => 'अध्याय पढ्नुहोस्';
	@override String get showhighlightedverse => 'हाइलाइट गरिएको पद देखाउनुहोस्';
	@override String get downloadmoreversions => 'अधिक संस्करणहरू डाउनलोड गर्नुहोस्';
	@override String get suggestedusers => 'सुझाव गरिएका प्रयोगकर्ताहरू';
	@override String get unfollow => 'अनफॉलो गर्नुहोस्';
	@override String get follow => 'अनुसरण गर्नुहोस्';
	@override String get searchforpeople => 'व्यक्तिहरू खोज्नुहोस्';
	@override String get viewpost => 'पोस्ट हेर्नुहोस्';
	@override String get viewprofile => 'प्रोफाइल हेर्नुहोस्';
	@override String get mypins => 'मेरो पिनहरू';
	@override String get viewpinnedposts => 'पिन गरिएको पोस्टहरू हेर्नुहोस्';
	@override String get personal => 'व्यक्तिगत';
	@override String get update => 'अद्यावधिक गर्नुहोस्';
	@override String get phonenumber => 'फोन नम्बर';
	@override String get showmyphonenumber => 'मेरो फोन नम्बर प्रयोगकर्ताहरूलाई देखाउनुहोस्';
	@override String get dateofbirth => 'जन्म मिति';
	@override String get showmyfulldateofbirth => 'मेरो स्थिति हेर्ने व्यक्तिहरूलाई मेरो पूरा जन्म मिति देखाउनुहोस्';
	@override String get notifications => 'सूचनाहरू';
	@override String get notifywhenuserfollowsme => 'प्रयोगकर्ताले मलाई अनुसरण गर्दा मलाई सूचित गर्नुहोस्';
	@override String get notifymewhenusercommentsonmypost => 'प्रयोगकर्ताहरूले मेरो पोस्टमा टिप्पणी गर्दा मलाई सूचित गर्नुहोस्';
	@override String get notifymewhenuserlikesmypost => 'प्रयोगकर्ताहरूले मेरो पोस्टलाई मन पराउँदा मलाई सूचित गर्नुहोस्';
	@override String get churchsocial => 'चर्च सामाजिक';
	@override String get shareyourthoughts => 'तपाईंका विचारहरू साझा गर्नुहोस्';
	@override String get readmore => '...अधिक पढ्नुहोस्';
	@override String get less => ' कम';
	@override String get couldnotprocess => 'अनुरोधित कार्य प्रक्रिया गर्न सकिएन।';
	@override String get pleaseselectprofilephoto => 'कृपया अपलोड गर्न प्रोफाइल फोटो चयन गर्नुहोस्';
	@override String get pleaseselectprofilecover => 'कृपया अपलोड गर्न कभर फोटो चयन गर्नुहोस्';
	@override String get updateprofileerrorhint => 'तपाईंले अगाडि बढ्न तपाईंको नाम, जन्म मिति, लिंग, फोन र स्थान भर्नु आवश्यक छ।';
	@override String get gender => 'लिंग';
	@override String get male => 'पुरुष';
	@override String get female => 'महिला';
	@override String get dob => 'जन्म मिति';
	@override String get location => 'हालको स्थान';
	@override String get qualification => 'योग्यता';
	@override String get aboutme => 'मेरो बारेमा';
	@override String get facebookprofilelink => 'फेसबुक प्रोफाइल लिङ्क';
	@override String get twitterprofilelink => 'ट्विटर प्रोफाइल लिङ्क';
	@override String get linkdln => 'लिंक्डइन प्रोफाइल लिङ्क';
	@override String get likes => 'मन पराउनुहोस्';
	@override String get likess => 'मन परे';
	@override String get pinnedposts => 'मेरो पिन गरिएको पोस्टहरू';
	@override String get unpinpost => 'पोस्ट अनपिन गर्नुहोस्';
	@override String get unpinposthint => 'के तपाईं यो पोस्ट तपाईंको पिन गरिएको पोस्टबाट हटाउन चाहनुहुन्छ?';
	@override String get postdetails => 'पोस्ट विवरण';
	@override String get posts => 'पोस्टहरू';
	@override String get followers => 'अनुयायीहरू';
	@override String get followings => 'अनुसरण गर्दै';
	@override String get my => 'मेरो';
	@override String get edit => 'सम्पादन गर्नुहोस्';
	@override String get delete => 'मेटाउनुहोस्';
	@override String get deletepost => 'पोस्ट मेटाउनुहोस्';
	@override String get deleteposthint => 'के तपाईं यो पोस्ट मेटाउन चाहनुहुन्छ? पोस्टहरू अझै केही प्रयोगकर्ताहरूको फीडमा देखिन सक्छन्।';
	@override String get maximumallowedsizehint => 'अनुमत अपलोड फाइल आकार सीमा पुगेको';
	@override String get maximumuploadsizehint => 'चयन गरिएको फाइल अनुमत अपलोड फाइल आकार सीमालाई नाघेको छ।';
	@override String get makeposterror => 'हाल पोस्ट बनाउन सकिएन, कृपया पुन: प्रयास गर्न क्लिक गर्नुहोस्।';
	@override String get makepost => 'पोस्ट गर्नुहोस्';
	@override String get selectfile => 'फाइल चयन गर्नुहोस्';
	@override String get images => 'तस्बिरहरू';
	@override String get shareYourThoughtsNow => 'तपाईंका विचारहरू अहिले साझा गर्नुहोस्...';
	@override String get photoviewer => 'फोटो दर्शक';
	@override String get nochatsavailable => 'कुनै पनि कुराकानी उपलब्ध छैन \n तलको चिन्हमा क्लिक गर्नुहोस् \n प्रयोगकर्ताहरूलाई चयन गर्न';
	@override String get typing => 'टाइप गर्दै...';
	@override String get photo => 'फोटो';
	@override String get online => 'अनलाइन';
	@override String get offline => 'अफलाइन';
	@override String get lastseen => 'अन्तिम देखिएको';
	@override String get deleteselectedhint => 'यस कार्यले चयन गरिएको सन्देशहरू मेटाउँछ। कृपया ध्यान दिनुहोस् कि यसले केवल तपाईंको पक्षको कुराकानी मेटाउँछ,\n सन्देशहरू अझै तपाईंको साथीको उपकरणमा देखिन्छ।';
	@override String get deleteselected => 'चयन गरिएको मेटाउनुहोस्';
	@override String get unabletofetchconversation => 'तपाईंको कुराकानी प्राप्त गर्न सकेन \n';
	@override String get loadmoreconversation => 'अधिक कुराकानी लोड गर्नुहोस्';
	@override String get sendyourfirstmessage => 'तपाईंको पहिलो सन्देश पठाउनुहोस् \n';
	@override String get unblock => 'अनब्लक गर्नुहोस् ';
	@override String get block => 'ब्लक गर्नुहोस्';
	@override String get writeyourmessage => 'तपाईंको सन्देश लेख्नुहोस्...';
	@override String get clearconversation => 'कुराकानी सफा गर्नुहोस्';
	@override String get clearconversationhintone => 'यस कार्यले तपाईंको सबै कुराकानी सफा गर्छ ';
	@override String get clearconversationhinttwo => '.\n कृपया ध्यान दिनुहोस् कि यसले केवल तपाईंको पक्षको कुराकानी मेटाउँछ, सन्देशहरू अझै तपाईंको साथीको च्याटमा देखिन्छ।';
	@override String get facebookloginerror => 'लॉगिन प्रक्रियामा केही गडबड भयो।\n यहाँ फेसबुकले हामीलाई दिएको त्रुटि छ';
	@override String get selectLanguage => 'भाषा चयन गर्नुहोस्';
	@override String get howTo => 'कसरी';
	@override String get noBibleTextsAvailable => 'कुनै बाइबल पाठ उपलब्ध छैन';
	@override String get languages => 'भाषाहरू';
	@override String get searchLanguages => 'भाषाहरू खोज्नुहोस्...';
	@override String get biblesFilesets => 'बाइबल: {bibles}, फाइलसेटहरू: {filesets}';
	@override String get oldTestament => 'पुरानो करार';
	@override String get newTestament => 'नयाँ करार';
	@override String get play => 'बजाउनुहोस्';
	@override String get no_verse_content => 'प्रदर्शन गर्न कुनै बाइबल पद्य सामग्री उपलब्ध छैन।';
	@override String get no_audio_content => 'प्रदर्शन गर्न कुनै बाइबल अडियो सामग्री उपलब्ध छैन।';
}

// Path: <root>
class _StringsOr implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsOr.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsOr _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'ମୋଭର୍ଚୁଆଲପାଷ୍ଟର';
	@override String get selectlanguage => 'ଭାଷା ବାଛନ୍ତୁ';
	@override String get deletemyaccount => 'ମୋ ଖାତା ବାହାର କରନ୍ତୁ';
	@override String get deleteaccount => 'ଖାତା ବାହାର କରନ୍ତୁ';
	@override String get deleteaccounthint => 'ଏହି କାର୍ଯ୍ୟଟି ଆପଣଙ୍କର ଖାତା ବାହାର କରି ଆପଣଙ୍କର ସମସ୍ତ ତଥ୍ୟ ବାହାର କରିବ। ଯଦି ତଥ୍ୟ ବାହାର ହୋଇ ଯାଇଛି, ତାହା ପୁନଃପ୍ରାପ୍ତ ହେବା ନାହିଁ।';
	@override String get deleteaccountsuccess => 'ଖାତା ବାହାର କରିବା ସଫଳ ହୋଇଛି';
	@override String get chooseapplanguage => 'ଆପ୍ ପାଇଁ ଭାଷା ବାଛନ୍ତୁ';
	@override String get nightmode => 'ରାତି ମୋଡ୍';
	@override String get initializingapp => 'ଆରମ୍ଭ କରାଯାଉଛି...';
	@override String get home => 'ମୂଳପୃଷ୍ଠା';
	@override String get branches => 'ଶାଖାଗୁଡ଼ିକ';
	@override String get inbox => 'ଇନବକ୍ସ';
	@override String get downloads => 'ଡାଉନଲୋଡ୍ସ';
	@override String get settings => 'ସେଟିଙ୍ଗ୍ସ';
	@override String get events => 'ଇବେଣ୍ଟଗୁଡ଼ିକ';
	@override String get myplaylists => 'ମୋର ପ୍ଲେଲିଷ୍ଟଗୁଡ଼ିକ';
	@override String get website => 'ୱେବସାଇଟ୍';
	@override String get hymns => 'ଭଜନଗୁଡ଼ିକ';
	@override String get articles => 'ଲେଖାଗୁଡ଼ିକ';
	@override String get notes => 'ଟିପ୍ପଣୀଗୁଡ଼ିକ';
	@override String get donate => 'ଦାନ';
	@override String get offering => 'ଅର୍ପଣ';
	@override String get savenotetitle => 'ଟିପ୍ପଣୀ ଶୀର୍ଷକ';
	@override String get nonotesfound => 'କୌଣସି ଟିପ୍ପଣୀ ମିଳିଲା ନାହିଁ';
	@override String get newnote => 'ନୂଆ';
	@override String get deletenote => 'ଟିପ୍ପଣୀ ବାହାର କରନ୍ତୁ';
	@override String get deletenotehint => 'ଆପଣ ଏହି ଟିପ୍ପଣୀ ବାହାର କରିବାକୁ ଚାହୁଁଛନ୍ତି କି? ଏହି କାର୍ଯ୍ୟଟି ପୁନଃ ପାଇଁ କରାଯାଇପାରିବ ନାହିଁ।';
	@override String get bookmarks => 'ବୁକମାର୍କଗୁଡ଼ିକ';
	@override String get socialplatforms => 'ସାମାଜିକ ପ୍ଲାଟଫର୍ମଗୁଡ଼ିକ';
	@override List<String> get onboardingpagetitles => [
		'ମୋ ଚର୍ଚ୍ଚରେ ସ୍ୱାଗତ',
		'ସୁବିଧାଗୁଡ଼ିକ ସହିତ ପୂର୍ଣ୍ଣ',
		'ଅଡିଓ, ଭିଡିଓ \n ଏବଂ ଲାଇଭ୍ ସ୍ଟ୍ରିମିଂ',
		'ଖାତା ସୃଷ୍ଟି କରନ୍ତୁ',
	];
	@override List<String> get onboardingpagehints => [
		'ସୁନ୍ଦର ସକାଳ ବା ଆପଣଙ୍କର ଚର୍ଚ୍ଚର ଚାରିଟିଏ ପରିସର। ଏକ ମୋବାଇଲ୍ କେନ୍ଦ୍ରିକ ଲୋକ ସହିତ ଆପଣଙ୍କୁ ଯୋଡ଼ିବାକୁ ଯାହା କାହିଁକି ଆପଣକୁ ଆବଶ୍ୟକ।',
		'ଆମେ ଆପଣଙ୍କର ଚର୍ଚ୍ଚ ଆପ୍ ପାଇଁ ଆବଶ୍ୟକ ତଥ୍ୟଗୁଡ଼ିକ ଆଣିଛୁ। ଇବେଣ୍ଟଗୁଡ଼ିକ, ଭକ୍ତିଗୀତ, ନୋଟିଫିକେସନ୍ସ, ଟିପ୍ପଣୀଗୁଡ଼ିକ ଏବଂ ବହୁ-ସଂସ୍କରଣ ବାଇବଲ୍।',
		'ବିଶ୍ୱରେ ଭିନ୍ନ-ଭିନ୍ନ ସ୍ଥାନରୁ ବିଭିନ୍ନ ଭିଡିଓ ଦେଖିବାକୁ, ଅଡିଓ ସନ୍ଦେଶଗୁଡ଼ିକ ଶୁଣିବାକୁ ଏବଂ ଆପଣଙ୍କ ଚର୍ଚ୍ଚ ସେବାଗୁଡ଼ିକର ଲାଇଭ୍ ସ୍ଟ୍ରିମ୍ ମାନେ ଦେଖିବାକୁ ଅନୁମତି ଦିଅନ୍ତୁ।',
		'କେବଳ ଏକ ସମ୍ପର୍କ ଉପବାସ ଅନୁଭୂତିକୁ ଆପଣଙ୍କ ଯାତ୍ରା ଆରମ୍ଭ କରନ୍ତୁ।',
	];
	@override String get next => 'ପରେ';
	@override String get done => 'ଆରମ୍ଭ କରନ୍ତୁ';
	@override String get quitapp => 'ଆପ୍ ବନ୍ଦ କରନ୍ତୁ!';
	@override String get quitappwarning => 'ଆପଣ ଆପ୍ ବନ୍ଦ କରିବାକୁ ଚାହୁଁଛନ୍ତି କି?';
	@override String get quitappaudiowarning => 'ଆପଣ ବର୍ତ୍ତମାନ ଏକ ଅଡିଓ ପ୍ଲେ କରୁଛନ୍ତି, ଆପ୍ ବନ୍ଦ କଲେ ଅଡିଓ ପ୍ଲେବାକ୍ ଥମ୍ବିବ। ଯଦି ଆପଣ ପ୍ଲେବାକ୍ ବନ୍ଦ କରିବାକୁ ଚାହୁଁନାହିଁ, କେବଳ ମଧ୍ୟ ବଟନ୍ ସହିତ ଆପ୍କୁ ମିନିମାଇଜ୍ କରନ୍ତୁ କିମ୍ବା ଠିକ ମଧ୍ୟ କରି ଆପ୍କୁ ବନ୍ଦ କରନ୍ତୁ।';
	@override String get ok => 'ଠିକ';
	@override String get retry => 'ପୁନଃପ୍ରୟାସ କରନ୍ତୁ';
	@override String get oops => 'ଆହ!';
	@override String get save => 'ସଂରକ୍ଷଣ କରନ୍ତୁ';
	@override String get cancel => 'ବାତିଲ୍ କରନ୍ତୁ';
	@override String get error => 'ତ୍ରୁଟି';
	@override String get success => 'ସଫଳତା';
	@override String get skip => 'ଛାଡ଼ନ୍ତୁ';
	@override String get skiplogin => 'ଲଗଇନ୍ ଛାଡ଼ନ୍ତୁ';
	@override String get skipregister => 'ପଞ୍ଜୀକରଣ ଛାଡ଼ନ୍ତୁ';
	@override String get dataloaderror => 'ବର୍ତ୍ତମାନ ଅନୁରୋଧ କରାଯାଇଥିବା ତଥ୍ୟ ଲୋଡ୍ କରିପାରିବା ନାହିଁ, ଆପଣଙ୍କର ତଥ୍ୟ ସଂଯୋଗ ଯାଞ୍ଚ କରନ୍ତୁ ଏବଂ ପୁନଃ ପ୍ରୟାସ କରିବାକୁ କ୍ଲିକ୍ କରନ୍ତୁ।';
	@override String get suggestedforyou => 'ଆପଣଙ୍କ ପାଇଁ ସୁପାରିସ୍ କରାଯାଇଛି';
	@override String get videomessages => 'ଭିଡିଓ ସନ୍ଦେଶଗୁଡ଼ିକ';
	@override String get audiomessages => 'ଅଡିଓ ସନ୍ଦେଶଗୁଡ଼ିକ';
	@override String get devotionals => 'ଭକ୍ତିଗୀତଗୁଡ଼ିକ';
	@override String get categories => 'ଶ୍ରେଣୀଗୁଡ଼ିକ';
	@override String get category => 'ଶ୍ରେଣୀ';
	@override String get videos => 'ଭିଡିଓଗୁଡ଼ିକ';
	@override String get audios => 'ଅଡିଓଗୁଡ଼ିକ';
	@override String get biblebooks => 'ବାଇବଲ୍';
	@override String get sermons => 'ପ୍ରବଚନଗୁଡ଼ିକ';
	@override String get tools => 'ଉପକରଣଗୁଡ଼ିକ';
	@override String get profile => 'ପ୍ରୋଫାଇଲ୍';
	@override String get audiobible => 'ଅଡିଓ ବାଇବଲ୍';
	@override String get homesentence => 'ଆପଣଙ୍କୁ ଭଗବାନଙ୍କର ଆହ୍ୱାନ କରାଯାଇଥିବା ଲୋକ ପର୍ଯ୍ୟନ୍ତ ବୃଦ୍ଧି ପାଇଁ ସାହାଯ୍ୟ କରିବା ପାଇଁ 1 ବର୍ଷ ପାଇଁ ଆପଣଙ୍କର ପାଷ୍ଟର।';
	@override String get livestreams => 'ଲାଇଭ୍ ସ୍ଟ୍ରିମ୍ଗୁଡ଼ିକ';
	@override String get radio => 'ରେଡିଓ';
	@override String get allitems => 'ସମସ୍ତ ବସ୍ତୁଗୁଡ଼ିକ';
	@override String get emptyplaylist => 'କୌଣସି ପ୍ଲେଲିଷ୍ଟ ନାହିଁ';
	@override String get notsupported => 'ସମର୍ଥନ କରିନଥିଲେ';
	@override String get cleanupresources => 'ସାଧନଗୁଡ଼ିକ ସଫା କରାଯାଉଛି';
	@override String get grantstoragepermission => 'ଦୟାକରି ଅଗ୍ରଗତି କରିବା ପାଇଁ ଷ୍ଟୋରେଜ୍ ପରିସ୍ରମନ୍ ଦିଅନ୍ତୁ';
	@override String get sharefiletitle => 'ପହଁଚନ୍ତୁ କିମ୍ବା ଶୁଣନ୍ତୁ ';
	@override String get sharefilebody => 'ମୋଭର୍ଚୁଆଲପାଷ୍ଟର ଆପ୍ ମାଧ୍ୟମରେ, ବର୍ତ୍ତମାନ ଡାଉନଲୋଡ୍ କରନ୍ତୁ ';
	@override String get sharetext => 'ଅସୀମିତ ଅଡିଓ ଏବଂ ଭିଡିଓ ସ୍ଟ୍ରିମିଂର ଆନନ୍ଦ ନିଅନ୍ତୁ';
	@override String get sharetexthint => 'ଆପଣଙ୍କୁ ବିଶ୍ୱରୁ ଆଣିଥିବା ଲାଖୋ ଫାଇଲ ଦେଖିବାକୁ ଏବଂ ଶୁଣିବାକୁ ଦେଇଥିବା ଭିଡିଓ ଏବଂ ଅଡିଓ ସ୍ଟ୍ରିମିଂ ପ୍ଲାଟଫର୍ମକୁ ଯୋଗ ଦିଅନ୍ତୁ। ବର୍ତ୍ତମାନ ଡାଉନଲୋଡ୍ କରନ୍ତୁ ';
	@override String get download => 'ଡାଉନଲୋଡ୍ କରନ୍ତୁ';
	@override String get addplaylist => 'ପ୍ଲେଲିଷ୍ଟରେ ଯୋଡନ୍ତୁ';
	@override String get bookmark => 'ବୁକମାର୍କ୍';
	@override String get unbookmark => 'ବୁକମାର୍କ୍ ବାହାର କରନ୍ତୁ';
	@override String get share => 'ସେୟାର କରନ୍ତୁ';
	@override String get deletemedia => 'ଫାଇଲ ବାହାର କରନ୍ତୁ';
	@override String get deletemediahint => 'ଆପଣ ଏହି ଡାଉନଲୋଡ୍ ହୋଇଥିବା ଫାଇଲ ବାହାର କରିବାକୁ ଚାହୁଁଛନ୍ତି କି? ଏହି କାର୍ଯ୍ୟଟି ପୁନଃ କରାଯାଇପାରିବ ନାହିଁ।';
	@override String get searchhint => 'ଅଡିଓ ଏବଂ ଭିଡିଓ ସନ୍ଦେଶଗୁଡ଼ିକୁ ଖୋଜନ୍ତୁ';
	@override String get performingsearch => 'ଅଡିଓ ଏବଂ ଭିଡିଓ ଖୋଜୁଛି';
	@override String get nosearchresult => 'କୌଣସି ଫଳ ମିଳିଲା ନାହିଁ';
	@override String get nosearchresulthint => 'ଅଧିକ ସାଧାରଣ କିୱାର୍ଡ ପ୍ରବେଶ କରିବାକୁ ଚେଷ୍ଟା କରନ୍ତୁ';
	@override String get addtoplaylist => 'ପ୍ଲେଲିଷ୍ଟରେ ଯୋଡନ୍ତୁ';
	@override String get newplaylist => 'ନୂଆ ପ୍ଲେଲିଷ୍ଟ';
	@override String get playlistitm => 'ପ୍ଲେଲିଷ୍ଟ';
	@override String get mediaaddedtoplaylist => 'ମିଡିଆ ପ୍ଲେଲିଷ୍ଟରେ ଯୋଡାଯାଇଛି।';
	@override String get mediaremovedfromplaylist => 'ମିଡିଆ ପ୍ଲେଲିଷ୍ଟରୁ ବାହାର ହୋଇଛି';
	@override String get clearplaylistmedias => 'ସମସ୍ତ ମିଡିଆ ସଫା କରନ୍ତୁ';
	@override String get deletePlayList => 'ପ୍ଲେଲିଷ୍ଟ ବାହାର କରନ୍ତୁ';
	@override String get clearplaylistmediashint => 'ଆପଣ ଏହି ପ୍ଲେଲିଷ୍ଟରୁ ସମସ୍ତ ମିଡିଆ ବାହାର କରିବାକୁ ଚାହୁଁଛନ୍ତି?';
	@override String get deletePlayListhint => 'ଆପଣ ଏହି ପ୍ଲେଲିଷ୍ଟ ବାହାର କରିବାକୁ ଏବଂ ସମସ୍ତ ମିଡିଆ ସଫା କରିବାକୁ ଚାହୁଁଛନ୍ତି?';
	@override String get comments => 'ଟିପ୍ପଣୀଗୁଡ଼ିକ';
	@override String get replies => 'ପ୍ରତିଉତ୍ତରଗୁଡ଼ିକ';
	@override String get reply => 'ପ୍ରତିଉତ୍ତର';
	@override String get logintoaddcomment => 'ଟିପ୍ପଣୀ ଯୋଡିବାକୁ ଲଗଇନ୍ କରନ୍ତୁ';
	@override String get logintoreply => 'ପ୍ରତିଉତ୍ତର ପାଇଁ ଲଗଇନ୍ କରନ୍ତୁ';
	@override String get writeamessage => 'ଏକ ସନ୍ଦେଶ ଲେଖନ୍ତୁ...';
	@override String get nocomments => 'କୌଣସି ଟିପ୍ପଣୀ ମିଳିଲା ନାହିଁ \nପୁନଃ ପ୍ରୟାସ କରିବାକୁ କ୍ଲିକ୍ କରନ୍ତୁ';
	@override String get errormakingcomments => 'ଏବେ ବର୍ତ୍ତମାନ ଟିପ୍ପଣୀ କରିପାରିବା ନାହିଁ..';
	@override String get errordeletingcomments => 'ଏବେ ବର୍ତ୍ତମାନ ଏହି ଟିପ୍ପଣୀ ବାହାର କରିପାରିବା ନାହିଁ..';
	@override String get erroreditingcomments => 'ଏବେ ବର୍ତ୍ତମାନ ଏହି ଟିପ୍ପଣୀ ସମ୍ପାଦନ କରିପାରିବା ନାହିଁ..';
	@override String get errorloadingmorecomments => 'ଏବେ ବର୍ତ୍ତମାନ ଅଧିକ ଟିପ୍ପଣୀ ଲୋଡ୍ କରିପାରିବା ନାହିଁ..';
	@override String get deletingcomment => 'ଟିପ୍ପଣୀ ବାହାର କରାଯାଉଛି';
	@override String get editingcomment => 'ଟିପ୍ପଣୀ ସମ୍ପାଦନ କରାଯାଉଛି';
	@override String get deletecommentalert => 'ଟିପ୍ପଣୀ ବାହାର କରନ୍ତୁ';
	@override String get editcommentalert => 'ଟିପ୍ପଣୀ ସମ୍ପାଦନ କରନ୍ତୁ';
	@override String get deletecommentalerttext => 'ଆପଣ ଏହି ଟିପ୍ପଣୀ ବାହାର କରିବାକୁ ଚାହୁଁଛନ୍ତି କି? ଏହି କାର୍ଯ୍ୟଟି ପୁନଃ କରାଯାଇପାରିବ ନାହିଁ';
	@override String get loadmore => 'ଅଧିକ ଲୋଡ୍ କରନ୍ତୁ';
	@override String get messages => 'ସନ୍ଦେଶଗୁଡ଼ିକ';
	@override String get guestuser => 'ଅତିଥି ବ୍ୟବହାରକାରୀ';
	@override String get fullname => 'ପୂରା ନାମ';
	@override String get emailaddress => 'ଇମେଲ୍ ପତା';
	@override String get password => 'ପାସୱାର୍ଡ୍';
	@override String get repeatpassword => 'ପାସୱାର୍ଡ୍ ପୁନଃ ପ୍ରବେଶ କରନ୍ତୁ';
	@override String get register => 'ପଞ୍ଜୀକରଣ କରନ୍ତୁ';
	@override String get login => 'ଲଗଇନ୍ କରନ୍ତୁ';
	@override String get logout => 'ଲଗାଉଟ୍ କରନ୍ତୁ';
	@override String get logoutfromapp => 'ଆପ୍ରୁ ଲଗାଉଟ୍ କରିବାକୁ?';
	@override String get logoutfromapphint => 'ଆପଣ ଲଗଇନ୍ ନଥିଲେ ଆପଣଙ୍କୁ ଲେଖାଗୁଡ଼ିକ ଏବଂ ଭିଡିଓଗୁଡ଼ିକରେ ଟିପ୍ପଣୀ କରିବାକୁ କିମ୍ବା ପସନ୍ଦ କରିବାକୁ ସମର୍ଥ ହେବା ନାହିଁ।';
	@override String get gotologin => 'ଲଗଇନ୍କୁ ଯାନ୍ତୁ';
	@override String get resetpassword => 'ପାସୱାର୍ଡ୍ ପୁନଃ ସେଟ୍ କରନ୍ତୁ';
	@override String get logintoaccount => 'ପୂର୍ବରୁ ଖାତା ଅଛି? ଲଗଇନ୍ କରନ୍ତୁ';
	@override String get emptyfielderrorhint => 'ଆପଣ ସମସ୍ତ କ୍ଷେତ୍ରଗୁଡ଼ିକୁ ପୂରଣ କରିବା ଆବଶ୍ୟକ';
	@override String get invalidemailerrorhint => 'ଆପଣ ଏକ ବୈଧ ଇମେଲ୍ ପତା ପ୍ରବେଶ କରିବାକୁ ଆବଶ୍ୟକ';
	@override String get passwordsdontmatch => 'ପାସୱାର୍ଡଗୁଡ଼ିକ ମେଳ ଖାଉନାହିଁ';
	@override String get processingpleasewait => 'ପ୍ରସେସ୍ କରାଯାଉଛି, ଦୟାକରି ପ୍ରତିକ୍ଷା କରନ୍ତୁ...';
	@override String get createaccount => 'ଏକ ଖାତା ସୃଷ୍ଟି କରନ୍ତୁ';
	@override String get forgotpassword => 'ପାସୱାର୍ଡ୍ ବିସରିଯାଇଛନ୍ତି?';
	@override String get orloginwith => 'କିମ୍ବା ଲଗଇନ୍ କରନ୍ତୁ';
	@override String get facebook => 'ଫେସବୁକ୍';
	@override String get google => 'ଗୁଗୁଲ୍';
	@override String get moreoptions => 'ଅଧିକ ବିକଳ୍ପଗୁଡ଼ିକ';
	@override String get about => 'ଆମ୍ଭାନଙ୍କ ବିଷୟରେ';
	@override String get privacy => 'ଗୋପନୀୟତା ନୀତି';
	@override String get terms => 'ଆପ୍ ନିୟମଗୁଡ଼ିକ';
	@override String get rate => 'ଆପ୍ରେ ରେଟ୍ କରନ୍ତୁ';
	@override String get version => 'ସଂସ୍କରଣ';
	@override String get pulluploadmore => 'ଲୋଡ୍ କରିବାକୁ ଟାଣନ୍ତୁ';
	@override String get loadfailedretry => 'ଲୋଡ୍ ବିଫଳ ହେଲା! ପୁନଃ ପ୍ରୟାସ କରିବାକୁ କ୍ଲିକ୍ କରନ୍ତୁ!';
	@override String get releaseloadmore => 'ଅଧିକ ଲୋଡ୍ କରିବାକୁ ଛାଡ଼ନ୍ତୁ';
	@override String get nomoredata => 'ଆଉ ତଥ୍ୟ ନାହିଁ';
	@override String get errorReportingComment => 'ଟିପ୍ପଣୀ ରିପୋର୍ଟ୍ ତ୍ରୁଟି';
	@override String get reportingComment => 'ଟିପ୍ପଣୀ ରିପୋର୍ଟ୍ କରାଯାଉଛି';
	@override String get reportcomment => 'ରିପୋର୍ଟ୍ ବିକଳ୍ପଗୁଡ଼ିକ';
	@override List<String> get reportCommentsList => [
		'ଅନବାଞ୍ଛିତ ବ୍ୟାବସାୟିକ ବିଷୟବସ୍ତୁ କିମ୍ବା ସ୍ପାମ୍',
		'ଅଶ୍ଳୀଳ କିମ୍ବା ଲିଙ୍ଗୀୟ ସ୍ପଷ୍ଟ ବିଷୟବସ୍ତୁ',
		'ଘୃଣାଭାଷଣ କିମ୍ବା ଗ୍ରାଫିକ୍ ହିଂସା',
		'ଅତ୍ୟାଚାର କିମ୍ବା ଧମକ',
	];
	@override String get bookmarksMedia => 'ମୋର ବୁକମାର୍କଗୁଡ଼ିକ';
	@override String get noitemstodisplay => 'ଦେଖାଇବାକୁ କୌଣସି ବସ୍ତୁ ନାହିଁ';
	@override String get loginrequired => 'ଲଗଇନ୍ ଆବଶ୍ୟକ';
	@override String get loginrequiredhint => 'ଏହି ପ୍ଲାଟଫର୍ମରେ ସଦସ୍ୟତା ପାଇଁ, ଆପଣଙ୍କୁ ଲଗଇନ୍ କରିବାକୁ ଆବଶ୍ୟକ। ଏକ ମାଗଣା ଖାତା ବର୍ତ୍ତମାନ ସୃଷ୍ଟି କରନ୍ତୁ କିମ୍ବା ଆପଣଙ୍କର ମୂଲ ଖାତାରେ ଲଗଇନ୍ କରନ୍ତୁ।';
	@override String get subscriptions => 'ଆପ୍ ସଦସ୍ୟତା';
	@override String get subscribe => 'ସଦସ୍ୟତା';
	@override String get subscribehint => 'ସଦସ୍ୟତା ଆବଶ୍ୟକ';
	@override String get playsubscriptionrequiredhint => 'ଏହି ମିଡିଆ ଶୁଣିବା କିମ୍ବା ଦେଖିବା ପାଇଁ ଆପଣଙ୍କୁ ସଦସ୍ୟତା ଦେବାକୁ ଆବଶ୍ୟକ।';
	@override String get previewsubscriptionrequiredhint => 'ଏହି ମିଡିଆ ପାଇଁ ଆପଣ ଅନୁମୋଦିତ ପ୍ରାରମ୍ଭିକ ଅବଧି ସ୍ୱାଧୀନତା ହାସଲ କରିଛନ୍ତି। ଶୁଣିବା କିମ୍ବା ଦେଖିବା ପାଇଁ ଆପଣଙ୍କୁ ସଦସ୍ୟତା ଆବଶ୍ୟକ।';
	@override String get copiedtoclipboard => 'କ୍ଲିପବୋର୍ଡ୍ରେ ଅନୁକୃତି କରାଯାଇଛି';
	@override String get downloadbible => 'ବାଇବଲ୍ ଡାଉନଲୋଡ୍ କରନ୍ତୁ';
	@override String get downloadversion => 'ଡାଉନଲୋଡ୍ କରନ୍ତୁ';
	@override String get downloading => 'ଡାଉନଲୋଡ୍ କରାଯାଉଛି';
	@override String get failedtodownload => 'ଡାଉନଲୋଡ୍ ବିଫଳ ହୋଇଛି';
	@override String get pleaseclicktoretry => 'ଦୟାକରି ପୁନଃ ପ୍ରୟାସ କରିବାକୁ କ୍ଲିକ୍ କରନ୍ତୁ।';
	@override String get of => 'ର';
	@override String get nobibleversionshint => 'ଦେଖାଇବାକୁ କୌଣସି ବାଇବଲ୍ ତଥ୍ୟ ନାହିଁ, ଅନ୍ୟତମ ଏକ ବାଇବଲ୍ ସଂସ୍କରଣ ଡାଉନଲୋଡ୍ କରିବା ପାଇଁ ତଳେ ବଟନ୍ କ୍ଲିକ୍ କରନ୍ତୁ।';
	@override String get downloaded => 'ଡାଉନଲୋଡ୍ ହୋଇଛି';
	@override String get enteremailaddresstoresetpassword => 'ଆପଣଙ୍କର ପାସୱାର୍ଡ୍ ପୁନଃ ସେଟ୍ କରିବା ପାଇଁ ଆପଣଙ୍କର ଇମେଲ୍ ପତା ପ୍ରବେଶ କରନ୍ତୁ';
	@override String get backtologin => 'ଲଗଇନ୍କୁ ଫେରନ୍ତୁ';
	@override String get signintocontinue => 'ଅଗ୍ରଗତି କରିବା ପାଇଁ ସାଇନ୍ ଇନ୍ କରନ୍ତୁ';
	@override String get signin => 'ସାଇନ୍ ଇନ୍ କରନ୍ତୁ';
	@override String get signinforanaccount => 'ଏକ ଖାତା ପାଇଁ ସାଇନ୍ ଅପ୍ କରନ୍ତୁ?';
	@override String get alreadyhaveanaccount => 'ପୂର୍ବରୁ ଏକ ଖାତା ଅଛି?';
	@override String get updateprofile => 'ପ୍ରୋଫାଇଲ୍ ଅଦ୍ୟତନ କରନ୍ତୁ';
	@override String get updateprofilehint => 'ଆରମ୍ଭ କରିବାକୁ, ଦୟାକରି ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ପୃଷ୍ଠା ଅଦ୍ୟତନ କରନ୍ତୁ, ଏହା ଆମକୁ ଅନ୍ୟ ଲୋକମାନଙ୍କ ସହିତ ଯୋଡିବାକୁ ସାହାଯ୍ୟ କରିବ';
	@override String get autoplayvideos => 'ଅଟୋପ୍ଲେ ଭିଡିଓଗୁଡ଼ିକ';
	@override String get gosocial => 'ସୋସିଆଲକୁ ଯାନ୍ତୁ';
	@override String get searchbible => 'ବାଇବଲ୍ ଖୋଜନ୍ତୁ';
	@override String get filtersearchoptions => 'ଖୋଜ ବିକଳ୍ପଗୁଡ଼ିକୁ ଫିଲ୍ଟର କରନ୍ତୁ';
	@override String get narrowdownsearch => 'ଅଧିକ ସଠିକ୍ ପରିଣାମ ପାଇଁ ତଳର ଫିଲ୍ଟର ବଟନ୍ ବ୍ୟବହାର କରି ଖୋଜ ସଂକୀର୍ଣ୍ଣ କରନ୍ତୁ।';
	@override String get searchbibleversion => 'ବାଇବଲ୍ ସଂସ୍କରଣ ଖୋଜନ୍ତୁ';
	@override String get searchbiblebook => 'ବାଇବଲ୍ ପୁସ୍ତକ ଖୋଜନ୍ତୁ';
	@override String get search => 'ଖୋଜନ୍ତୁ';
	@override String get setBibleBook => 'ବାଇବଲ୍ ପୁସ୍ତକ ସେଟ୍ କରନ୍ତୁ';
	@override String get oldtestament => 'ପୁରାତନ ତତ୍ତ୍ଵ';
	@override String get newtestament => 'ନୂତନ ତତ୍ତ୍ଵ';
	@override String get limitresults => 'ପରିଣାମଗୁଡ଼ିକୁ ସୀମାବଦ୍ଧ କରନ୍ତୁ';
	@override String get setfilters => 'ଫିଲ୍ଟରଗୁଡ଼ିକୁ ସେଟ୍ କରନ୍ତୁ';
	@override String get bibletranslator => 'ବାଇବଲ୍ ଅନୁବାଦକ';
	@override String get chapter => ' ଅଧ୍ୟାୟ ';
	@override String get verse => ' ପଦ ';
	@override String get translate => 'ଅନୁବାଦ କରନ୍ତୁ';
	@override String get bibledownloadinfo => 'ବାଇବଲ୍ ଡାଉନଲୋଡ୍ ଆରମ୍ଭ ହୋଇଛି, ଡାଉନଲୋଡ୍ ସମାପ୍ତ ହେବା ପର୍ଯ୍ୟନ୍ତ ଦୟାକରି ଏହି ପୃଷ୍ଠାକୁ ବନ୍ଦ କରନ୍ତୁ ନାହିଁ।';
	@override String get received => 'ଗ୍ରହଣ କରାଗଲା';
	@override String get outoftotal => 'ମୋଟରୁ';
	@override String get set => 'ସେଟ୍ କରନ୍ତୁ';
	@override String get selectColor => 'ରଙ୍ଗ ବାଛନ୍ତୁ';
	@override String get switchbibleversion => 'ବାଇବଲ୍ ସଂସ୍କରଣ ବଦଳାନ୍ତୁ';
	@override String get switchbiblebook => 'ବାଇବଲ୍ ପୁସ୍ତକ ବଦଳାନ୍ତୁ';
	@override String get gotosearch => 'ଅଧ୍ୟାୟକୁ ଯାନ୍ତୁ';
	@override String get changefontsize => 'ଫନ୍ଟ୍ ଆକାର ବଦଳାନ୍ତୁ';
	@override String get font => 'ଫନ୍ଟ୍';
	@override String get readchapter => 'ଅଧ୍ୟାୟ ପଢନ୍ତୁ';
	@override String get showhighlightedverse => 'ହାଇଲାଇଟ୍ କରାଯାଇଥିବା ପଦ ଦେଖନ୍ତୁ';
	@override String get downloadmoreversions => 'ଅଧିକ ସଂସ୍କରଣଗୁଡ଼ିକୁ ଡାଉନଲୋଡ୍ କରନ୍ତୁ';
	@override String get suggestedusers => 'ସୁପାରିସ୍ କରାଯାଇଥିବା ବ୍ୟବହାରକାରୀମାନେ';
	@override String get unfollow => 'ଅନଫଲୋ କରନ୍ତୁ';
	@override String get follow => 'ଫଲୋ କରନ୍ତୁ';
	@override String get searchforpeople => 'ଲୋକମାନଙ୍କୁ ଖୋଜନ୍ତୁ';
	@override String get viewpost => 'ପୋଷ୍ଟ ଦେଖନ୍ତୁ';
	@override String get viewprofile => 'ପ୍ରୋଫାଇଲ୍ ଦେଖନ୍ତୁ';
	@override String get mypins => 'ମୋ ପିନ୍ସ୍';
	@override String get viewpinnedposts => 'ପିନ୍ କରାଯାଇଥିବା ପୋଷ୍ଟଗୁଡ଼ିକୁ ଦେଖନ୍ତୁ';
	@override String get personal => 'ବ୍ୟକ୍ତିଗତ';
	@override String get update => 'ଅଦ୍ୟତନ କରନ୍ତୁ';
	@override String get phonenumber => 'ଫୋନ୍ ନମ୍ବର';
	@override String get showmyphonenumber => 'ମୋର ଫୋନ୍ ନମ୍ବରକୁ ବ୍ୟବହାରକାରୀମାନଙ୍କୁ ଦେଖନ୍ତୁ';
	@override String get dateofbirth => 'ଜନ୍ମ ତାରିଖ';
	@override String get showmyfulldateofbirth => 'ମୋର ଅବସ୍ଥାକୁ ଦେଖୁଥିବା ଲୋକମାନଙ୍କୁ ମୋର ପୂରା ଜନ୍ମ ତାରିଖ ଦେଖନ୍ତୁ';
	@override String get notifications => 'ସୂଚନାଗୁଡ଼ିକ';
	@override String get notifywhenuserfollowsme => 'ଯେତେବେଳେ ଏକ ବ୍ୟବହାରକାରୀ ମୋତେ ଫଲୋ କରିଥାଏ ତାହା ଆମକୁ ସୂଚିତ କରନ୍ତୁ';
	@override String get notifymewhenusercommentsonmypost => 'ଯେତେବେଳେ ବ୍ୟବହାରକାରୀମାନେ ମୋର ପୋଷ୍ଟରେ ଟିପ୍ପଣୀ କରନ୍ତି ମୋତେ ସୂଚିତ କରନ୍ତୁ';
	@override String get notifymewhenuserlikesmypost => 'ଯେତେବେଳେ ବ୍ୟବହାରକାରୀମାନେ ମୋର ପୋଷ୍ଟକୁ ପସନ୍ଦ କରନ୍ତି ମୋତେ ସୂଚିତ କରନ୍ତୁ';
	@override String get churchsocial => 'ଚର୍ଚ୍ଚ ସାମାଜିକ';
	@override String get shareyourthoughts => 'ଆପଣଙ୍କର ଭାବନାଗୁଡ଼ିକୁ ସେୟାର କରନ୍ତୁ';
	@override String get readmore => '...ଅଧିକ ପଢନ୍ତୁ';
	@override String get less => ' କମ୍';
	@override String get couldnotprocess => 'ଅନୁରୋଧ କରାଯାଇଥିବା କାର୍ଯ୍ୟ ପ୍ରକ୍ରିୟାକୁ କରିପାରିବା ନାହିଁ।';
	@override String get pleaseselectprofilephoto => 'ଦୟାକରି ଅପଲୋଡ୍ କରିବା ପାଇଁ ଏକ ପ୍ରୋଫାଇଲ୍ ଫଟୋ ବାଛନ୍ତୁ';
	@override String get pleaseselectprofilecover => 'ଦୟାକରି ଅପଲୋଡ୍ କରିବା ପାଇଁ ଏକ କଭର୍ ଫଟୋ ବାଛନ୍ତୁ';
	@override String get updateprofileerrorhint => 'ଆଗେକୁ ବଢିବା ପୂର୍ବରୁ ଆପଣଙ୍କର ନାମ, ଜନ୍ମତାରିଖ, ଲିଙ୍ଗ, ଫୋନ୍ ଏବଂ ସ୍ଥାନ ପୂରଣ କରିବା ଆବଶ୍ୟକ।';
	@override String get gender => 'ଲିଙ୍ଗ';
	@override String get male => 'ପୁରୁଷ';
	@override String get female => 'ମହିଳା';
	@override String get dob => 'ଜନ୍ମ ତାରିଖ';
	@override String get location => 'ଚାଲୁ ଅବସ୍ଥାନ';
	@override String get qualification => 'ଯୋଗ୍ୟତା';
	@override String get aboutme => 'ମୋ ବିଷୟରେ';
	@override String get facebookprofilelink => 'ଫେସବୁକ୍ ପ୍ରୋଫାଇଲ୍ ଲିଙ୍କ୍';
	@override String get twitterprofilelink => 'ଟ୍ୱିଟର୍ ପ୍ରୋଫାଇଲ୍ ଲିଙ୍କ୍';
	@override String get linkdln => 'ଲିଙ୍କ୍ଡ୍ଇନ୍ ପ୍ରୋଫାଇଲ୍ ଲିଙ୍କ୍';
	@override String get likes => 'ଭଲପାଉଛି';
	@override String get likess => 'ପସନ୍ଦ';
	@override String get pinnedposts => 'ମୋର ପିନ୍ ହୋଇଥିବା ପୋଷ୍ଟଗୁଡ଼ିକ';
	@override String get unpinpost => 'ପୋଷ୍ଟ ପିନ୍ କରନ୍ତୁ';
	@override String get unpinposthint => 'ଆପଣ ଏହି ପୋଷ୍ଟକୁ ଆପଣଙ୍କର ପିନ୍ ହୋଇଥିବା ପୋଷ୍ଟରୁ ବାହାର କରିବାକୁ ଚାହୁଁଛନ୍ତି?';
	@override String get postdetails => 'ପୋଷ୍ଟ ତଥ୍ୟ';
	@override String get posts => 'ପୋଷ୍ଟଗୁଡ଼ିକ';
	@override String get followers => 'ଅନୁସରଣକାରୀମାନେ';
	@override String get followings => 'ଅନୁସରଣ କରୁଛି';
	@override String get my => 'ମୋର';
	@override String get edit => 'ସମ୍ପାଦନ କରନ୍ତୁ';
	@override String get delete => 'ବାହାର କରନ୍ତୁ';
	@override String get deletepost => 'ପୋଷ୍ଟ ବାହାର କରନ୍ତୁ';
	@override String get deleteposthint => 'ଆପଣ ଏହି ପୋଷ୍ଟ ବାହାର କରିବାକୁ ଚାହୁଁଛନ୍ତି? ଏହି ପୋଷ୍ଟ ଅଜାଣା ବ୍ୟବହାରକାରୀମାନଙ୍କ ପ୍ରତିକ୍ରିୟାରେ ଦେଖାଯାଇପାରିବ।';
	@override String get maximumallowedsizehint => 'ଅନୁମତି କରାଯାଇଥିବା ଅପଲୋଡ୍ ଫାଇଲ୍ ଆକାର ସୀମାକୁ ପହଞ୍ଚିଯାଇଛି';
	@override String get maximumuploadsizehint => 'ଅନୁମତି କରାଯାଇଥିବା ଅପଲୋଡ୍ ଫାଇଲ୍ ଆକାର ସୀମାକୁ ପର୍ଯ୍ୟାନ୍ତ ଚୟନ କରାଯାଇଥିବା ଫାଇଲ୍ ଅଧିକ ଆଛି।';
	@override String get makeposterror => 'ବର୍ତ୍ତମାନ ଏହି ପୋଷ୍ଟ ବନ୍ଦ କରାଯାଇପାରିବ ନାହିଁ, ଦୟାକରି ପୁନଃପ୍ରୟାସ କରିବାକୁ କ୍ଲିକ୍ କରନ୍ତୁ।';
	@override String get makepost => 'ପୋଷ୍ଟ କରନ୍ତୁ';
	@override String get selectfile => 'ଫାଇଲ୍ ବାଛନ୍ତୁ';
	@override String get images => 'ଚିତ୍ରଗୁଡ଼ିକ';
	@override String get shareYourThoughtsNow => 'ଆପଣଙ୍କର ଭାବନାଗୁଡ଼ିକ ସେୟାର କରନ୍ତୁ...';
	@override String get photoviewer => 'ଫଟୋ ଦର୍ଶକ';
	@override String get nochatsavailable => 'କୌଣସି କଥାବାର୍ତ୍ତା ଉପଲବ୍ଧ ନାହିଁ \n ତଳକୁ ଲୋଡ୍ ଅଇକନ୍ କ୍ଲିକ୍ କରନ୍ତୁ \n ଦର୍ଶକମାନଙ୍କୁ ବାଛନ୍ତୁ';
	@override String get typing => 'ଟାଇପ୍ କରାଯାଉଛି...';
	@override String get photo => 'ଫଟୋ';
	@override String get online => 'ଅନଲାଇନ୍';
	@override String get offline => 'ଅଫଲାଇନ୍';
	@override String get lastseen => 'ଶେଷ ଦେଖାଯାଇଥିଲା';
	@override String get deleteselectedhint => 'ଏହି କାର୍ଯ୍ୟଟି ଚୟନ କରାଯାଇଥିବା ସନ୍ଦେଶଗୁଡ଼ିକୁ ବାହାର କରିବ। ଦୟାକରି ଧ୍ୟାନ ଦିଅନ୍ତୁ ଏହା କେବଳ ଆପଣଙ୍କର ପର୍ଯ୍ୟନ୍ତ ସନ୍ଦେଶଗୁଡ଼ିକୁ ବାହାର କରିବ,\n ସନ୍ଦେଶଗୁଡ଼ିକ ଏବେ ଆପଣଙ୍କର ସାଥୀଙ୍କର ଡିଭାଇସରେ ଦେଖାଯାଇପାରିବ।';
	@override String get deleteselected => 'ଚୟନ କରାଯାଇଥିବାକୁ ବାହାର କରନ୍ତୁ';
	@override String get unabletofetchconversation => 'ଆପଣଙ୍କର କଥାବାର୍ତ୍ତାକୁ ଆଣିପାରିବା ନାହିଁ \n';
	@override String get loadmoreconversation => 'ଅଧିକ କଥାବାର୍ତ୍ତାଗୁଡ଼ିକୁ ଲୋଡ୍ କରନ୍ତୁ';
	@override String get sendyourfirstmessage => 'ଆପଣଙ୍କର ପ୍ରଥମ ସନ୍ଦେଶ ପଠାନ୍ତୁ \n';
	@override String get unblock => 'ଅନବ୍ଲକ୍ କରନ୍ତୁ ';
	@override String get block => 'ବ୍ଲକ୍ କରନ୍ତୁ';
	@override String get writeyourmessage => 'ଆପଣଙ୍କର ସନ୍ଦେଶ ଲେଖନ୍ତୁ...';
	@override String get clearconversation => 'କଥାବାର୍ତ୍ତାଗୁଡ଼ିକୁ ସଫା କରନ୍ତୁ';
	@override String get clearconversationhintone => 'ଏହି କାର୍ଯ୍ୟଟି ଆପଣଙ୍କର ସମସ୍ତ କଥାବାର୍ତ୍ତାକୁ ସଫା କରିବ ';
	@override String get clearconversationhinttwo => '.\n ଦୟାକରି ଧ୍ୟାନ ଦିଅନ୍ତୁ ଏହା କେବଳ ଆପଣଙ୍କର ପର୍ଯ୍ୟନ୍ତ କଥାବାର୍ତ୍ତାକୁ ବାହାର କରିବ, ସନ୍ଦେଶଗୁଡ଼ିକ ଏବେ ଆପଣଙ୍କର ସାଥୀଙ୍କର ଚ୍ୟାଟରେ ଦେଖାଯାଇପାରିବ।';
	@override String get facebookloginerror => 'ଲଗଇନ୍ ପ୍ରକ୍ରିୟାରେ କିଛି ତ୍ରୁଟି ହୋଇଛି।\n ଏହି ସମୟରେ ଫେସବୁକ୍ ଆମକୁ ଯେତେବେଳେ ତ୍ରୁଟି ଦେଲା';
	@override String get selectLanguage => 'ଭାଷା ଚୟନ କରନ୍ତୁ';
	@override String get howTo => 'କିପରି';
	@override String get noBibleTextsAvailable => 'କ any ଣସି ବାଇବେଲ ଟେକ୍ସଟ୍ ଉପଲବ୍ଧ ନାହିଁ';
	@override String get languages => 'ଭାଷାଗୁଡିକ';
	@override String get searchLanguages => 'ଭାଷାଗୁଡିକୁ ଖୋଜନ୍ତୁ...';
	@override String get biblesFilesets => 'ବାଇବେଲ: {bibles}, ଫାଇଲସେଟ୍‌ସ: {filesets}';
	@override String get oldTestament => 'ପୁରାତନ ନିୟମ';
	@override String get newTestament => 'ନୂତନ ନିୟମ';
	@override String get play => 'ଖେଳିବା';
	@override String get no_verse_content => 'ପ୍ରଦର୍ଶନ କରିବା ପାଇଁ କୌଣସି ବାଇବେଲ ଶ୍ଲୋକ ବିଷୟବସ୍ତୁ ଉପଲବ୍ଧ ନାହିଁ।';
	@override String get no_audio_content => 'ପ୍ରଦର୍ଶନ କରିବା ପାଇଁ କୌଣସି ବାଇବେଲ ଅଡିଓ ବିଷୟବସ୍ତୁ ଉପଲବ୍ଧ ନାହିଁ।';
}

// Path: <root>
class _StringsPa implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsPa.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsPa _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'VirtualPastor';
	@override String get selectlanguage => 'ਭਾਸ਼ਾ ਚੁਣੋ';
	@override String get deletemyaccount => 'ਮੇਰਾ ਖਾਤਾ ਮਿਟਾਓ';
	@override String get deleteaccount => 'ਖਾਤਾ ਮਿਟਾਓ';
	@override String get deleteaccounthint => 'ਇਹ ਕਿਰਿਆ ਤੁਹਾਡਾ ਖਾਤਾ ਮਿਟਾ ਦੇਵੇਗੀ ਅਤੇ ਤੁਹਾਡੇ ਸਾਰੇ ਡਾਟਾ ਨੂੰ ਮਿਟਾ ਦੇਵੇਗੀ, ਇੱਕ ਵਾਰ ਡਾਟਾ ਮਿਟਾ ਦਿੱਤਾ ਗਿਆ ਤਾਂ ਇਹ ਦੁਬਾਰਾ ਪ੍ਰਾਪਤ ਨਹੀਂ ਹੋ ਸਕਦਾ।';
	@override String get deleteaccountsuccess => 'ਖਾਤਾ ਮਿਟਾਉਣਾ ਸਫਲ ਰਿਹਾ';
	@override String get chooseapplanguage => 'ਐਪ ਭਾਸ਼ਾ ਚੁਣੋ';
	@override String get nightmode => 'ਰਾਤੀ ਮੋਡ';
	@override String get initializingapp => 'ਸ਼ੁਰੂ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';
	@override String get home => 'ਹੋਮ';
	@override String get branches => 'ਸ਼ਾਖਾਵਾਂ';
	@override String get inbox => 'ਇਨਬਾਕਸ';
	@override String get downloads => 'ਡਾਊਨਲੋਡਸ';
	@override String get settings => 'ਸੈਟਿੰਗਸ';
	@override String get events => 'ਘਟਨਾਵਾਂ';
	@override String get myplaylists => 'ਮੇਰੀ ਪਲੇਲਿਸਟ';
	@override String get website => 'ਵੈਬਸਾਈਟ';
	@override String get hymns => 'ਭਜਨ';
	@override String get articles => 'ਲੇਖ';
	@override String get notes => 'ਨੋਟਸ';
	@override String get donate => 'ਦਾਨ ਕਰੋ';
	@override String get offering => 'ਭੇਟ';
	@override String get savenotetitle => 'ਨੋਟਸ ਸਿਰਲੇਖ';
	@override String get nonotesfound => 'ਕੋਈ ਨੋਟਸ ਨਹੀਂ ਮਿਲੇ';
	@override String get newnote => 'ਨਵਾਂ';
	@override String get deletenote => 'ਨੋਟਸ ਮਿਟਾਓ';
	@override String get deletenotehint => 'ਕੀ ਤੁਸੀਂ ਇਹ ਨੋਟਸ ਮਿਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ? ਇਹ ਕਿਰਿਆ ਦੁਬਾਰਾ ਨਹੀਂ ਕੀਤੀ ਜਾ ਸਕਦੀ।';
	@override String get bookmarks => 'ਬੁਕਮਾਰਕਸ';
	@override String get socialplatforms => 'ਸੋਸ਼ਲ ਪਲੇਟਫਾਰਮ';
	@override List<String> get onboardingpagetitles => [
		'ਮੇਰੇ ਚਰਚ ਵਿੱਚ ਸਵਾਗਤ ਹੈ',
		'ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਨਾਲ ਭਰਪੂਰ',
		'ਆਡੀਓ, ਵੀਡੀਓ \n ਅਤੇ ਲਾਈਵ ਸਟਰੀਮਿੰਗ',
		'ਖਾਤਾ ਬਣਾਓ',
	];
	@override List<String> get onboardingpagehints => [
		'ਐਤਵਾਰ ਸਵੇਰਾਂ ਅਤੇ ਤੁਹਾਡੇ ਚਰਚ ਦੀਆਂ ਚਾਰ ਦੀਵਾਰਾਂ ਤੋਂ ਪਰੇ ਵਧੋ। ਤੁਹਾਨੂੰ ਇਕ ਮੋਬਾਈਲ-ਕੇਂਦਰੀਤ ਦੁਨੀਆ ਨਾਲ ਸੰਚਾਰ ਅਤੇ ਭਾਗੀਦਾਰੀ ਕਰਨ ਲਈ ਜੋ ਕੁਝ ਵੀ ਚਾਹੀਦਾ ਹੈ।',
		'ਅਸੀਂ ਤੁਹਾਡੇ ਚਰਚ ਐਪ ਦੇ ਸਾਰੇ ਮੁੱਖ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਨੂੰ ਇਕੱਠਾ ਕੀਤਾ ਹੈ। ਘਟਨਾਵਾਂ, ਭਜਨ, ਨੋਟੀਫਿਕੇਸ਼ਨ, ਨੋਟਸ ਅਤੇ ਬਹੁ-ਸੰਸਕਰਣ ਬਾਈਬਲ।',
		'ਦੁਨੀਆ ਭਰ ਦੇ ਉਪਭੋਗਤਾਵਾਂ ਨੂੰ ਤੁਹਾਡੇ ਚਰਚ ਦੀਆਂ ਸੇਵਾਵਾਂ ਦੀਆਂ ਲਾਈਵ ਸਟਰੀਮਿੰਗ ਦੇਖਣ, ਆਡੀਓ ਸੰਦੇਸ਼ ਸੁਣਨ ਅਤੇ ਵੀਡੀਓ ਦੇਖਣ ਦੀ ਆਗਿਆ ਦਿਓ।',
		'ਇੱਕ ਨਿਰੰਤਰ ਪੂਜਾ ਦੇ ਤਜਰਬੇ ਤੱਕ ਆਪਣੀ ਯਾਤਰਾ ਸ਼ੁਰੂ ਕਰੋ।',
	];
	@override String get next => 'ਅਗਲਾ';
	@override String get done => 'ਸ਼ੁਰੂ ਕਰੋ';
	@override String get quitapp => 'ਐਪ ਬੰਦ ਕਰੋ!';
	@override String get quitappwarning => 'ਕੀ ਤੁਸੀਂ ਐਪ ਬੰਦ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?';
	@override String get quitappaudiowarning => 'ਤੁਸੀਂ ਵਰਤਮਾਨ ਵਿੱਚ ਇਕ ਆਡੀਓ ਚਲਾ ਰਹੇ ਹੋ, ਐਪ ਬੰਦ ਕਰਨ ਨਾਲ ਆਡੀਓ ਪਲੇਬੈਕ ਰੁਕ ਜਾਏਗਾ। ਜੇ ਤੁਸੀਂ ਪਲੇਬੈਕ ਰੁਕਵਾਉਣਾ ਨਹੀਂ ਚਾਹੁੰਦੇ, ਤਾਂ ਕੇਂਦਰ ਬਟਨ ਨਾਲ ਐਪ ਨੂੰ ਘੱਟ ਕਰੋ ਜਾਂ ਹੁਣੇ ਐਪ ਬੰਦ ਕਰਨ ਲਈ ਓਕੇ ਬਟਨ \'ਤੇ ਕਲਿੱਕ ਕਰੋ।';
	@override String get ok => 'ਠੀਕ ਹੈ';
	@override String get retry => 'ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰੋ';
	@override String get oops => 'ਓਹ!';
	@override String get save => 'ਸੰਭਾਲੋ';
	@override String get cancel => 'ਰੱਦ ਕਰੋ';
	@override String get error => 'ਗਲਤੀ';
	@override String get success => 'ਸਫਲਤਾ';
	@override String get skip => 'ਛੱਡੋ';
	@override String get skiplogin => 'ਲਾਗਿਨ ਛੱਡੋ';
	@override String get skipregister => 'ਰਜਿਸਟਰੇਸ਼ਨ ਛੱਡੋ';
	@override String get dataloaderror => 'ਵਰਤਮਾਨ ਸਮੇਂ ਅਨੁਰੋਧ ਕੀਤੇ ਡਾਟਾ ਨੂੰ ਲੋਡ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ, ਆਪਣੇ ਡਾਟਾ ਕਨੈਕਸ਼ਨ ਨੂੰ ਜਾਂਚੋ ਅਤੇ ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰਨ ਲਈ ਕਲਿੱਕ ਕਰੋ।';
	@override String get suggestedforyou => 'ਤੁਹਾਡੇ ਲਈ ਸੁਝਾਏ ਗਏ';
	@override String get videomessages => 'ਵੀਡੀਓ ਸੰਦੇਸ਼';
	@override String get audiomessages => 'ਆਡੀਓ ਸੰਦੇਸ਼';
	@override String get devotionals => 'ਭਗਤੀਗੀਤ';
	@override String get categories => 'ਸ਼੍ਰੇਣੀਆਂ';
	@override String get category => 'ਸ਼੍ਰੇਣੀ';
	@override String get videos => 'ਵੀਡੀਓਜ਼';
	@override String get audios => 'ਆਡੀਓਜ਼';
	@override String get biblebooks => 'ਬਾਈਬਲ';
	@override String get sermons => 'ਪ੍ਰਵਚਨ';
	@override String get tools => 'ਉਪਕਰਣ';
	@override String get profile => 'ਪਰੋਫਾਈਲ';
	@override String get audiobible => 'ਆਡੀਓ ਬਾਈਬਲ';
	@override String get homesentence => 'ਤੁਹਾਨੂੰ ਇੱਕ ਵਿਅਕਤੀ ਬਣਨ ਵਿੱਚ ਮਦਦ ਕਰਨ ਲਈ ਤੁਹਾਡੇ ਪਾਸਟਰ ਵਾਂਗ ਸਾਲ ਲਈ, ਜਿਸ ਨੂੰ ਭਗਵਾਨ ਨੇ ਤੁਹਾਨੂੰ ਕਾਲ ਕੀਤਾ ਹੈ।';
	@override String get livestreams => 'ਲਾਈਵ ਸਟਰੀਮਿੰਗ';
	@override String get radio => 'ਰੇਡੀਓ';
	@override String get allitems => 'ਸਾਰੇ ਆਈਟਮ';
	@override String get emptyplaylist => 'ਕੋਈ ਪਲੇਲਿਸਟ ਨਹੀਂ';
	@override String get notsupported => 'ਸਮਰਥਿਤ ਨਹੀਂ ਹੈ';
	@override String get cleanupresources => 'ਸਰੋਤਾਂ ਨੂੰ ਸਾਫ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ';
	@override String get grantstoragepermission => 'ਅੱਗੇ ਵਧਣ ਲਈ ਕਿਰਪਾ ਕਰਕੇ ਸਟੋਰੇਜ ਪ੍ਰਵਾਨਗੀ ਦਿਓ';
	@override String get sharefiletitle => 'ਵੇਖੋ ਜਾਂ ਸੁਣੋ ';
	@override String get sharefilebody => 'MyVirtualPastor ਐਪ ਦੇ ਰਾਹੀਂ, ਹੁਣੇ ਡਾਊਨਲੋਡ ਕਰੋ ';
	@override String get sharetext => 'ਅਸਮੀਤ ਆਡੀਓ ਅਤੇ ਵੀਡੀਓ ਸਟਰੀਮਿੰਗ ਦਾ ਅਨੰਦ ਮਾਣੋ';
	@override String get sharetexthint => 'ਅਸੀਂ ਤੁਹਾਡੇ ਲਈ ਇੱਕ ਵਿਡੀਓ ਅਤੇ ਆਡੀਓ ਸਟਰੀਮਿੰਗ ਪਲੇਟਫਾਰਮ ਪ੍ਰਦਾਨ ਕਰਦੇ ਹਾਂ ਜਿਸ ਨਾਲ ਤੁਸੀਂ ਦੁਨੀਆ ਭਰ ਤੋਂ ਮਿਲੀਅਨ ਫਾਈਲਾਂ ਦੇਖ ਅਤੇ ਸੁਣ ਸਕਦੇ ਹੋ। ਹੁਣੇ ਡਾਊਨਲੋਡ ਕਰੋ ';
	@override String get download => 'ਡਾਊਨਲੋਡ ਕਰੋ';
	@override String get addplaylist => 'ਪਲੇਲਿਸਟ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ';
	@override String get bookmark => 'ਬੁਕਮਾਰਕ';
	@override String get unbookmark => 'ਬੁਕਮਾਰਕ ਹਟਾਓ';
	@override String get share => 'ਸਾਂਝਾ ਕਰੋ';
	@override String get deletemedia => 'ਫਾਇਲ ਮਿਟਾਓ';
	@override String get deletemediahint => 'ਕੀ ਤੁਸੀਂ ਇਸ ਡਾਊਨਲੋਡ ਕੀਤੀ ਗਈ ਫਾਇਲ ਨੂੰ ਮਿਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ? ਇਹ ਕਿਰਿਆ ਦੁਬਾਰਾ ਨਹੀਂ ਕੀਤੀ ਜਾ ਸਕਦੀ।';
	@override String get searchhint => 'ਆਡੀਓ ਅਤੇ ਵੀਡੀਓ ਸੰਦੇਸ਼ਾਂ ਦੀ ਭਾਲ ਕਰੋ';
	@override String get performingsearch => 'ਆਡੀਓ ਅਤੇ ਵੀਡੀਓ ਭਾਲ ਕਰ ਰਿਹਾ ਹੈ';
	@override String get nosearchresult => 'ਕੋਈ ਨਤੀਜੇ ਨਹੀਂ ਮਿਲੇ';
	@override String get nosearchresulthint => 'ਵਧੇਰੇ ਆਮ ਕੁੰਜੀਸ਼ਬਦ ਪ੍ਰਵਿਸ਼ਟ ਕਰੋ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ';
	@override String get addtoplaylist => 'ਪਲੇਲਿਸਟ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ';
	@override String get newplaylist => 'ਨਵੀਂ ਪਲੇਲਿਸਟ';
	@override String get playlistitm => 'ਪਲੇਲਿਸਟ';
	@override String get mediaaddedtoplaylist => 'ਮੀਡੀਆ ਨੂੰ ਪਲੇਲਿਸਟ ਵਿੱਚ ਸ਼ਾਮਲ ਕੀਤਾ ਗਿਆ ਹੈ।';
	@override String get mediaremovedfromplaylist => 'ਮੀਡੀਆ ਨੂੰ ਪਲੇਲਿਸਟ ਵਿੱਚੋਂ ਹਟਾਇਆ ਗਿਆ ਹੈ';
	@override String get clearplaylistmedias => 'ਸਾਰੇ ਮੀਡੀਆ ਨੂੰ ਸਾਫ ਕਰੋ';
	@override String get deletePlayList => 'ਪਲੇਲਿਸਟ ਮਿਟਾਓ';
	@override String get clearplaylistmediashint => 'ਕੀ ਤੁਸੀਂ ਇਸ ਪਲੇਲਿਸਟ ਤੋਂ ਸਾਰੇ ਮੀਡੀਆ ਨੂੰ ਹਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ?';
	@override String get deletePlayListhint => 'ਕੀ ਤੁਸੀਂ ਇਸ ਪਲੇਲਿਸਟ ਨੂੰ ਮਿਟਾਉਣਾ ਅਤੇ ਸਾਰੇ ਮੀਡੀਆ ਨੂੰ ਸਾਫ਼ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?';
	@override String get comments => 'ਟਿੱਪਣੀਆਂ';
	@override String get replies => 'ਜਵਾਬ';
	@override String get reply => 'ਜਵਾਬ';
	@override String get logintoaddcomment => 'ਟਿੱਪਣੀ ਸ਼ਾਮਲ ਕਰਨ ਲਈ ਲਾਗਿਨ ਕਰੋ';
	@override String get logintoreply => 'ਜਵਾਬ ਦੇਣ ਲਈ ਲਾਗਿਨ ਕਰੋ';
	@override String get writeamessage => 'ਇੱਕ ਸੁਨੇਹਾ ਲਿਖੋ...';
	@override String get nocomments => 'ਕੋਈ ਟਿੱਪਣੀਆਂ ਨਹੀਂ ਮਿਲੀਆਂ \nਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰਨ ਲਈ ਕਲਿੱਕ ਕਰੋ';
	@override String get errormakingcomments => 'ਇਸ ਸਮੇਂ ਟਿੱਪਣੀ ਪ੍ਰਕਿਰਿਆ ਕਰਨਾ ਸਮਭਵ ਨਹੀਂ ਹੈ..';
	@override String get errordeletingcomments => 'ਇਸ ਸਮੇਂ ਇਸ ਟਿੱਪਣੀ ਨੂੰ ਮਿਟਾਉਣਾ ਸਮਭਵ ਨਹੀਂ ਹੈ..';
	@override String get erroreditingcomments => 'ਇਸ ਸਮੇਂ ਇਸ ਟਿੱਪਣੀ ਨੂੰ ਸੰਪਾਦਿਤ ਕਰਨਾ ਸਮਭਵ ਨਹੀਂ ਹੈ..';
	@override String get errorloadingmorecomments => 'ਇਸ ਸਮੇਂ ਹੋਰ ਟਿੱਪਣੀਆਂ ਲੋਡ ਕਰਨਾ ਸਮਭਵ ਨਹੀਂ ਹੈ..';
	@override String get deletingcomment => 'ਟਿੱਪਣੀ ਮਿਟਾਈ ਜਾ ਰਹੀ ਹੈ';
	@override String get editingcomment => 'ਟਿੱਪਣੀ ਸੰਪਾਦਿਤ ਕੀਤੀ ਜਾ ਰਹੀ ਹੈ';
	@override String get deletecommentalert => 'ਟਿੱਪਣੀ ਮਿਟਾਓ';
	@override String get editcommentalert => 'ਟਿੱਪਣੀ ਸੰਪਾਦਿਤ ਕਰੋ';
	@override String get deletecommentalerttext => 'ਕੀ ਤੁਸੀਂ ਇਸ ਟਿੱਪਣੀ ਨੂੰ ਮਿਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ? ਇਹ ਕਿਰਿਆ ਦੁਬਾਰਾ ਨਹੀਂ ਕੀਤੀ ਜਾ ਸਕਦੀ';
	@override String get loadmore => 'ਹੋਰ ਲੋਡ ਕਰੋ';
	@override String get messages => 'ਸੁਨੇਹੇ';
	@override String get guestuser => 'ਮਹਿਮਾਨ ਉਪਭੋਗਤਾ';
	@override String get fullname => 'ਪੂਰਾ ਨਾਮ';
	@override String get emailaddress => 'ਈਮੇਲ ਪਤਾ';
	@override String get password => 'ਪਾਸਵਰਡ';
	@override String get repeatpassword => 'ਪਾਸਵਰਡ ਦੁਬਾਰਾ ਲਿਖੋ';
	@override String get register => 'ਰਜਿਸਟਰ ਕਰੋ';
	@override String get login => 'ਲਾਗਿਨ ਕਰੋ';
	@override String get logout => 'ਲਾਗਆਉਟ ਕਰੋ';
	@override String get logoutfromapp => 'ਐਪ ਤੋਂ ਲਾਗਆਉਟ?';
	@override String get logoutfromapphint => 'ਜੇ ਤੁਸੀਂ ਲਾਗਿਨ ਨਹੀਂ ਹੋਏ ਹੋ ਤਾਂ ਤੁਸੀਂ ਲੇਖਾਂ ਅਤੇ ਵੀਡੀਓਜ਼ \'ਤੇ ਟਿੱਪਣੀ ਕਰਨ ਜਾਂ ਪਸੰਦ ਕਰਨ ਸਮਰਥ ਨਹੀਂ ਹੋਵੋਗੇ।';
	@override String get gotologin => 'ਲਾਗਿਨ ਕਰਨ ਲਈ ਜਾਓ';
	@override String get resetpassword => 'ਪਾਸਵਰਡ ਰੀਸੈਟ ਕਰੋ';
	@override String get logintoaccount => 'ਪਹਿਲਾਂ ਹੀ ਖਾਤਾ ਹੈ? ਲਾਗਿਨ ਕਰੋ';
	@override String get emptyfielderrorhint => 'ਤੁਹਾਨੂੰ ਸਾਰੇ ਖੇਤਰ ਭਰਣੇ ਚਾਹੀਦੇ ਹਨ';
	@override String get invalidemailerrorhint => 'ਤੁਹਾਨੂੰ ਇੱਕ ਮਾਨਯ ਈਮੇਲ ਪਤਾ ਦਰਜ ਕਰਨਾ ਚਾਹੀਦਾ ਹੈ';
	@override String get passwordsdontmatch => 'ਪਾਸਵਰਡ ਮਿਲਦੇ ਨਹੀਂ ਹਨ';
	@override String get processingpleasewait => 'ਪ੍ਰਕਿਰਿਆ ਹੋ ਰਹੀ ਹੈ, ਕਿਰਪਾ ਕਰਕੇ ਉਡੀਕ ਕਰੋ...';
	@override String get createaccount => 'ਖਾਤਾ ਬਣਾਓ';
	@override String get forgotpassword => 'ਪਾਸਵਰਡ ਭੁੱਲ ਗਏ?';
	@override String get orloginwith => 'ਜਾਂ ਨਾਲ ਲਾਗਿਨ ਕਰੋ';
	@override String get facebook => 'ਫੇਸਬੁਕ';
	@override String get google => 'ਗੂਗਲ';
	@override String get moreoptions => 'ਹੋਰ ਵਿਕਲਪ';
	@override String get about => 'ਸਾਡੇ ਬਾਰੇ';
	@override String get privacy => 'ਪਰਾਈਵੇਟ ਨੀਤੀ';
	@override String get terms => 'ਐਪ ਸ਼ਰਤਾਂ';
	@override String get rate => 'ਐਪ ਰੇਟ ਕਰੋ';
	@override String get version => 'ਵਰਜਨ';
	@override String get pulluploadmore => 'ਉਪਰ ਖਿੱਚੋ';
	@override String get loadfailedretry => 'ਲੋਡ ਫੇਲ੍ਹ! ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰੋ!';
	@override String get releaseloadmore => 'ਹੋਰ ਲੋਡ ਕਰਨ ਲਈ ਛੱਡੋ';
	@override String get nomoredata => 'ਹੋਰ ਡਾਟਾ ਨਹੀਂ';
	@override String get errorReportingComment => 'ਟਿੱਪਣੀ ਰਿਪੋਰਟ ਕਰਦੇ ਸਮੇਂ ਗਲਤੀ';
	@override String get reportingComment => 'ਟਿੱਪਣੀ ਰਿਪੋਰਟ ਕੀਤੀ ਜਾ ਰਹੀ ਹੈ';
	@override String get reportcomment => 'ਰਿਪੋਰਟ ਵਿਕਲਪ';
	@override List<String> get reportCommentsList => [
		'ਗੈਰ-ਚਾਹੁਣ ਵਾਲੀ ਵਪਾਰਕ ਸਮੱਗਰੀ ਜਾਂ ਸਪੈਮ',
		'ਅਸ਼ਲੀਲ ਜਾਂ ਯੌਨ ਸਪਸ਼ਟ ਸਮੱਗਰੀ',
		'ਘ੍ਰਿਣਾ ਭਾਸ਼ਣ ਜਾਂ ਗ੍ਰਾਫਿਕ ਹਿੰਸਾ',
		'ਉਤਪੀੜਨ ਜਾਂ ਧੱਕੇਸ਼ਾਹੀ',
	];
	@override String get bookmarksMedia => 'ਮੇਰੇ ਬੁਕਮਾਰਕਸ';
	@override String get noitemstodisplay => 'ਕੋਈ ਆਈਟਮ ਪ੍ਰਦਰਸ਼ਿਤ ਕਰਨ ਲਈ ਨਹੀਂ';
	@override String get loginrequired => 'ਲਾਗਿਨ ਜ਼ਰੂਰੀ ਹੈ';
	@override String get loginrequiredhint => 'ਇਸ ਪਲੇਟਫਾਰਮ \'ਤੇ ਗਾਹਕ ਬਣਨ ਲਈ, ਤੁਹਾਨੂੰ ਲਾਗਿਨ ਕਰਨਾ ਪਵੇਗਾ। ਹੁਣੇ ਮੁਫ਼ਤ ਖਾਤਾ ਬਣਾਓ ਜਾਂ ਮੌਜੂਦਾ ਖਾਤੇ ਵਿੱਚ ਲਾਗਿਨ ਕਰੋ।';
	@override String get subscriptions => 'ਐਪ ਗਾਹਕੀ';
	@override String get subscribe => 'ਗਾਹਕੀ';
	@override String get subscribehint => 'ਗਾਹਕੀ ਜ਼ਰੂਰੀ ਹੈ';
	@override String get playsubscriptionrequiredhint => 'ਇਸ ਮੀਡੀਆ ਨੂੰ ਸੁਣਨ ਜਾਂ ਦੇਖਣ ਲਈ ਤੁਹਾਨੂੰ ਗਾਹਕੀ ਦੀ ਲੋੜ ਹੈ।';
	@override String get previewsubscriptionrequiredhint => 'ਤੁਸੀਂ ਇਸ ਮੀਡੀਆ ਲਈ ਅਨੁਮਤ ਮੁਕਤ ਅਵਧੀ ਪਹੁੰਚ ਹਾਸਲ ਕਰ ਲਈ ਹੈ। ਸੁਣਨ ਜਾਂ ਦੇਖਣ ਲਈ ਤੁਹਾਨੂੰ ਗਾਹਕੀ ਦੀ ਲੋੜ ਹੈ।';
	@override String get copiedtoclipboard => 'ਕਲਿੱਪਬੋਰਡ \'ਤੇ ਨਕਲ ਕੀਤਾ ਗਿਆ';
	@override String get downloadbible => 'ਬਾਈਬਲ ਡਾਊਨਲੋਡ ਕਰੋ';
	@override String get downloadversion => 'ਡਾਊਨਲੋਡ ਕਰੋ';
	@override String get downloading => 'ਡਾਊਨਲੋਡ ਹੋ ਰਿਹਾ ਹੈ';
	@override String get failedtodownload => 'ਡਾਊਨਲੋਡ ਫੇਲ੍ਹ';
	@override String get pleaseclicktoretry => 'ਕਿਰਪਾ ਕਰਕੇ ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰਨ ਲਈ ਕਲਿੱਕ ਕਰੋ।';
	@override String get of => 'ਦੀ';
	@override String get nobibleversionshint => 'ਦਿਖਾਉਣ ਲਈ ਕੋਈ ਬਾਈਬਲ ਡਾਟਾ ਨਹੀਂ ਹੈ, ਘੱਟੋ-ਘੱਟ ਇੱਕ ਬਾਈਬਲ ਵਰਜਨ ਡਾਊਨਲੋਡ ਕਰਨ ਲਈ ਹੇਠਾਂ ਦਿੱਤੇ ਬਟਨ \'ਤੇ ਕਲਿੱਕ ਕਰੋ।';
	@override String get downloaded => 'ਡਾਊਨਲੋਡ ਕੀਤਾ ਗਿਆ';
	@override String get enteremailaddresstoresetpassword => 'ਆਪਣਾ ਪਾਸਵਰਡ ਰੀਸੈਟ ਕਰਨ ਲਈ ਆਪਣਾ ਈਮੇਲ ਪਤਾ ਦਰਜ ਕਰੋ';
	@override String get backtologin => 'ਲਾਗਿਨ \'ਤੇ ਵਾਪਸ';
	@override String get signintocontinue => 'ਜਾਰੀ ਰੱਖਣ ਲਈ ਸਾਇਨ ਇਨ ਕਰੋ';
	@override String get signin => 'ਸਾਇਨ ਇਨ';
	@override String get signinforanaccount => 'ਇਕ ਖਾਤੇ ਲਈ ਸਾਇਨ ਅਪ ਕਰੋ?';
	@override String get alreadyhaveanaccount => 'ਪਹਿਲਾਂ ਹੀ ਇੱਕ ਖਾਤਾ ਹੈ?';
	@override String get updateprofile => 'ਪਰੋਫਾਈਲ ਅੱਪਡੇਟ ਕਰੋ';
	@override String get updateprofilehint => 'ਸ਼ੁਰੂ ਕਰਨ ਲਈ, ਕਿਰਪਾ ਕਰਕੇ ਆਪਣਾ ਪਰੋਫਾਈਲ ਪੰਨਾ ਅੱਪਡੇਟ ਕਰੋ, ਇਹ ਸਾਨੂੰ ਹੋਰ ਲੋਕਾਂ ਨਾਲ ਜੋੜਨ ਵਿੱਚ ਮਦਦ ਕਰੇਗਾ';
	@override String get autoplayvideos => 'ਆਟੋਪਲੇ ਵੀਡੀਓਜ਼';
	@override String get gosocial => 'ਸੋਸ਼ਲ ਤੇ ਜਾਓ';
	@override String get searchbible => 'ਬਾਈਬਲ ਭਾਲ ਕਰੋ';
	@override String get filtersearchoptions => 'ਭਾਲ ਵਿਕਲਪਾਂ ਨੂੰ ਫਿਲਟਰ ਕਰੋ';
	@override String get narrowdownsearch => 'ਇੱਕ ਹੋਰ ਸਹੀ ਨਤੀਜੇ ਲਈ ਹੇਠਾਂ ਦਿੱਤੇ ਫਿਲਟਰ ਬਟਨ ਦਾ ਪ੍ਰਯੋਗ ਕਰੋ।';
	@override String get searchbibleversion => 'ਬਾਈਬਲ ਵਰਜਨ ਭਾਲੋ';
	@override String get searchbiblebook => 'ਬਾਈਬਲ ਪੁਸਤਕ ਭਾਲੋ';
	@override String get search => 'ਭਾਲੋ';
	@override String get setBibleBook => 'ਬਾਈਬਲ ਪੁਸਤਕ ਸੈੱਟ ਕਰੋ';
	@override String get oldtestament => 'ਪੁਰਾਣਾ ਨਿਯਮ';
	@override String get newtestament => 'ਨਵਾਂ ਨਿਯਮ';
	@override String get limitresults => 'ਨਤੀਜੇ ਸੀਮਿਤ ਕਰੋ';
	@override String get setfilters => 'ਫਿਲਟਰ ਸੈੱਟ ਕਰੋ';
	@override String get bibletranslator => 'ਬਾਈਬਲ ਅਨੁਵਾਦਕ';
	@override String get chapter => ' ਅਧਿਆਇ ';
	@override String get verse => ' ਆਇਤ ';
	@override String get translate => 'ਅਨੁਵਾਦ ਕਰੋ';
	@override String get bibledownloadinfo => 'ਬਾਈਬਲ ਡਾਊਨਲੋਡ ਸ਼ੁਰੂ ਹੋ ਗਿਆ ਹੈ, ਕਿਰਪਾ ਕਰਕੇ ਡਾਊਨਲੋਡ ਮੁਕੰਮਲ ਹੋਣ ਤੱਕ ਇਸ ਪੇਜ਼ ਨੂੰ ਬੰਦ ਨਾ ਕਰੋ।';
	@override String get received => 'ਮਿਲਿਆ';
	@override String get outoftotal => 'ਕੁੱਲ ਵਿੱਚੋਂ';
	@override String get set => 'ਸੈੱਟ ਕਰੋ';
	@override String get selectColor => 'ਰੰਗ ਚੁਣੋ';
	@override String get switchbibleversion => 'ਬਾਈਬਲ ਵਰਜਨ ਬਦਲੋ';
	@override String get switchbiblebook => 'ਬਾਈਬਲ ਕਿਤਾਬ ਬਦਲੋ';
	@override String get gotosearch => 'ਅਧਿਆਇ ਤੇ ਜਾਓ';
	@override String get changefontsize => 'ਫੌਂਟ ਸਾਈਜ਼ ਬਦਲੋ';
	@override String get font => 'ਫੌਂਟ';
	@override String get readchapter => 'ਅਧਿਆਇ ਪੜ੍ਹੋ';
	@override String get showhighlightedverse => 'ਹਾਈਲਾਈਟ ਕੀਤੀ ਗਈ ਆਇਤ ਵਿਖਾਓ';
	@override String get downloadmoreversions => 'ਹੋਰ ਵਰਜਨ ਡਾਊਨਲੋਡ ਕਰੋ';
	@override String get suggestedusers => 'ਸਿਫਾਰਸ਼ ਕੀਤੇ ਯੂਜ਼ਰ';
	@override String get unfollow => 'ਅਨਫੌਲੋ ਕਰੋ';
	@override String get follow => 'ਫੌਲੋ ਕਰੋ';
	@override String get searchforpeople => 'ਲੋਕਾਂ ਦੀ ਖੋਜ ਕਰੋ';
	@override String get viewpost => 'ਪੋਸਟ ਵੇਖੋ';
	@override String get viewprofile => 'ਪ੍ਰੋਫਾਈਲ ਵੇਖੋ';
	@override String get mypins => 'ਮੇਰੇ ਪਿਨ';
	@override String get viewpinnedposts => 'ਪਿੰਨ ਕੀਤੀਆਂ ਪੋਸਟਾਂ ਵੇਖੋ';
	@override String get personal => 'ਨਿੱਜੀ';
	@override String get update => 'ਅੱਪਡੇਟ';
	@override String get phonenumber => 'ਫ਼ੋਨ ਨੰਬਰ';
	@override String get showmyphonenumber => 'ਮੇਰਾ ਫ਼ੋਨ ਨੰਬਰ ਯੂਜ਼ਰਾਂ ਨੂੰ ਵਿਖਾਓ';
	@override String get dateofbirth => 'ਜਨਮ ਮਿਤੀ';
	@override String get showmyfulldateofbirth => 'ਮੇਰੀ ਪੂਰੀ ਜਨਮ ਮਿਤੀ ਨੂੰ ਲੋਕਾਂ ਨੂੰ ਵਿਖਾਓ';
	@override String get notifications => 'ਨੋਟਿਸਾਂ';
	@override String get notifywhenuserfollowsme => 'ਜਦੋਂ ਕੋਈ ਯੂਜ਼ਰ ਮੈਨੂੰ ਫੌਲੋ ਕਰੇ ਤਾਂ ਮੈਨੂੰ ਸੂਚਿਤ ਕਰੋ';
	@override String get notifymewhenusercommentsonmypost => 'ਜਦੋਂ ਯੂਜ਼ਰ ਮੇਰੀ ਪੋਸਟ ਤੇ ਟਿੱਪਣੀ ਕਰੇ ਤਾਂ ਮੈਨੂੰ ਸੂਚਿਤ ਕਰੋ';
	@override String get notifymewhenuserlikesmypost => 'ਜਦੋਂ ਯੂਜ਼ਰ ਮੇਰੀ ਪੋਸਟ ਨੂੰ ਲਾਇਕ ਕਰੇ ਤਾਂ ਮੈਨੂੰ ਸੂਚਿਤ ਕਰੋ';
	@override String get churchsocial => 'ਚਰਚ ਸੋਸ਼ਲ';
	@override String get shareyourthoughts => 'ਆਪਣੇ ਵਿਚਾਰ ਸਾਂਝੇ ਕਰੋ';
	@override String get readmore => '...ਹੋਰ ਪੜ੍ਹੋ';
	@override String get less => ' ਘੱਟ';
	@override String get couldnotprocess => 'ਬੇਨਤੀ ਕੀਤੀ ਕਾਰਵਾਈ ਨੂੰ ਪ੍ਰਕਿਰਿਆ ਨਹੀਂ ਕੀਤੀ ਜਾ ਸਕੀ।';
	@override String get pleaseselectprofilephoto => 'ਕਿਰਪਾ ਕਰਕੇ ਅਪਲੋਡ ਕਰਨ ਲਈ ਇੱਕ ਪ੍ਰੋਫਾਈਲ ਫੋਟੋ ਚੁਣੋ';
	@override String get pleaseselectprofilecover => 'ਕਿਰਪਾ ਕਰਕੇ ਅਪਲੋਡ ਕਰਨ ਲਈ ਇੱਕ ਕਵਰ ਫੋਟੋ ਚੁਣੋ';
	@override String get updateprofileerrorhint => 'ਅੱਗੇ ਵਧਣ ਲਈ ਤੁਹਾਨੂੰ ਆਪਣਾ ਨਾਮ, ਜਨਮ ਮਿਤੀ, ਲਿੰਗ, ਫੋਨ ਅਤੇ ਸਥਾਨ ਭਰਨਾ ਹੋਵੇਗਾ।';
	@override String get gender => 'ਲਿੰਗ';
	@override String get male => 'ਮਰਦ';
	@override String get female => 'ਔਰਤ';
	@override String get dob => 'ਜਨਮ ਮਿਤੀ';
	@override String get location => 'ਮੌਜੂਦਾ ਸਥਾਨ';
	@override String get qualification => 'ਯੋਗਤਾ';
	@override String get aboutme => 'ਮੇਰੇ ਬਾਰੇ';
	@override String get facebookprofilelink => 'ਫੇਸਬੁੱਕ ਪ੍ਰੋਫਾਈਲ ਲਿੰਕ';
	@override String get twitterprofilelink => 'ਟਵਿੱਟਰ ਪ੍ਰੋਫਾਈਲ ਲਿੰਕ';
	@override String get linkdln => 'ਲਿੰਕਡਿਨ ਪ੍ਰੋਫਾਈਲ ਲਿੰਕ';
	@override String get likes => 'ਪਸੰਦ';
	@override String get likess => 'ਪਸੰਦਾਂ';
	@override String get pinnedposts => 'ਮੇਰੀਆਂ ਪਿੰਨ ਕੀਤੀਆਂ ਪੋਸਟਾਂ';
	@override String get unpinpost => 'ਪੋਸਟ ਨੂੰ ਅਨਪਿਨ ਕਰੋ';
	@override String get unpinposthint => 'ਕੀ ਤੁਸੀਂ ਇਸ ਪੋਸਟ ਨੂੰ ਆਪਣੇ ਪਿੰਨ ਕੀਤੇ ਪੋਸਟਾਂ ਤੋਂ ਹਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ?';
	@override String get postdetails => 'ਪੋਸਟ ਵੇਰਵੇ';
	@override String get posts => 'ਪੋਸਟਾਂ';
	@override String get followers => 'ਫੌਲੋਅਰਸ';
	@override String get followings => 'ਫੌਲੋਵਿੰਗ';
	@override String get my => 'ਮੇਰਾ';
	@override String get edit => 'ਸੋਧ';
	@override String get delete => 'ਮਿਟਾਓ';
	@override String get deletepost => 'ਪੋਸਟ ਮਿਟਾਓ';
	@override String get deleteposthint => 'ਕੀ ਤੁਸੀਂ ਇਸ ਪੋਸਟ ਨੂੰ ਮਿਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ? ਪੋਸਟਾਂ ਅਜੇ ਵੀ ਕੁਝ ਯੂਜ਼ਰਾਂ ਦੇ ਫੀਡ ਵਿੱਚ ਦਰਸਾਈਆਂ ਜਾ ਸਕਦੀਆਂ ਹਨ।';
	@override String get maximumallowedsizehint => 'ਅਨੁਮਤ ਅਪਲੋਡ ਫਾਈਲ ਆਕਾਰ ਸੀਮਾ ਪਹੁੰਚ ਗਈ ਹੈ';
	@override String get maximumuploadsizehint => 'ਚੁਣੀ ਗਈ ਫਾਈਲ ਅਨੁਮਤ ਅਪਲੋਡ ਫਾਈਲ ਆਕਾਰ ਸੀਮਾ ਨੂੰ ਪਾਰ ਕਰਦੀ ਹੈ।';
	@override String get makeposterror => 'ਇਸ ਸਮੇਂ ਪੋਸਟ ਕਰਨ ਵਿੱਚ ਅਸਫਲ, ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰਨ ਲਈ ਕਲਿਕ ਕਰੋ।';
	@override String get makepost => 'ਪੋਸਟ ਕਰੋ';
	@override String get selectfile => 'ਫਾਈਲ ਚੁਣੋ';
	@override String get images => 'ਤਸਵੀਰਾਂ';
	@override String get shareYourThoughtsNow => 'ਹੁਣ ਆਪਣੇ ਵਿਚਾਰ ਸਾਂਝੇ ਕਰੋ...';
	@override String get photoviewer => 'ਫੋਟੋ ਵੇਖਣ ਵਾਲਾ';
	@override String get nochatsavailable => 'ਕੋਈ ਵੀ ਗੱਲਬਾਤ ਉਪਲਬਧ ਨਹੀਂ ਹੈ \n ਕਿਰਪਾ ਕਰਕੇ ਹੇਠਾਂ ਦੇ ਆਈਕਨ \'ਤੇ ਕਲਿਕ ਕਰੋ \n ਯੂਜ਼ਰਾਂ ਨੂੰ ਚੁਣਨ ਲਈ';
	@override String get typing => 'ਟਾਈਪ ਕਰ ਰਿਹਾ ਹੈ...';
	@override String get photo => 'ਫੋਟੋ';
	@override String get online => 'ਆਨਲਾਈਨ';
	@override String get offline => 'ਆਫਲਾਈਨ';
	@override String get lastseen => 'ਆਖਰੀ ਵਾਰ ਵੇਖਿਆ ਗਿਆ';
	@override String get deleteselectedhint => 'ਇਹ ਕਾਰਵਾਈ ਚੁਣੇ ਗਏ ਸੁਨੇਹੇ ਨੂੰ ਮਿਟਾਉਂਦੀ ਹੈ। ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਇਹ ਕੇਵਲ ਤੁਹਾਡੇ ਪਾਸੇ ਦੀ ਗੱਲਬਾਤ ਨੂੰ ਮਿਟਾਉਂਦੀ ਹੈ,\n ਸੁਨੇਹੇ ਅਜੇ ਵੀ ਤੁਹਾਡੇ ਸਾਥੀ ਦੇ ਡਿਵਾਈਸ ਤੇ ਵੇਖੇ ਜਾਣਗੇ।';
	@override String get deleteselected => 'ਚੁਣੇ ਹੋਏ ਨੂੰ ਮਿਟਾਓ';
	@override String get unabletofetchconversation => 'ਤੁਹਾਡੀ ਗੱਲਬਾਤ ਪ੍ਰਾਪਤ ਕਰਨ ਵਿੱਚ ਅਸਮਰੱਥ \n';
	@override String get loadmoreconversation => 'ਹੋਰ ਗੱਲਬਾਤਾਂ ਨੂੰ ਲੋਡ ਕਰੋ';
	@override String get sendyourfirstmessage => 'ਤੁਹਾਡਾ ਪਹਿਲਾ ਸੁਨੇਹਾ ਭੇਜੋ \n';
	@override String get unblock => 'ਅਨਬਲੌਕ ਕਰੋ ';
	@override String get block => 'ਬਲੌਕ ਕਰੋ';
	@override String get writeyourmessage => 'ਤੁਹਾਡਾ ਸੁਨੇਹਾ ਲਿਖੋ...';
	@override String get clearconversation => 'ਗੱਲਬਾਤ ਸਾਫ਼ ਕਰੋ';
	@override String get clearconversationhintone => 'ਇਹ ਕਾਰਵਾਈ ਤੁਹਾਡੇ ਸਾਰੇ ਗੱਲਬਾਤ ਨੂੰ ਸਾਫ਼ ਕਰੇਗੀ ';
	@override String get clearconversationhinttwo => '.\n ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਇਹ ਕੇਵਲ ਤੁਹਾਡੇ ਪਾਸੇ ਦੀ ਗੱਲਬਾਤ ਨੂੰ ਮਿਟਾਉਂਦੀ ਹੈ, ਸੁਨੇਹੇ ਅਜੇ ਵੀ ਤੁਹਾਡੇ ਸਾਥੀ ਦੇ ਚੈਟ \'ਤੇ ਵੇਖੇ ਜਾਣਗੇ।';
	@override String get facebookloginerror => 'ਲੌਗਇਨ ਪ੍ਰਕਿਰਿਆ ਵਿੱਚ ਕੁਝ ਗਲਤ ਹੋ ਗਿਆ ਹੈ।\n ਇਥੇ ਫੇਸਬੁੱਕ ਨੇ ਸਾਨੂੰ ਦਿੱਤੀ ਗਲਤੀ ਹੈ';
	@override String get selectLanguage => 'ਭਾਸ਼ਾ ਚੁਣੋ';
	@override String get howTo => 'ਕਿਵੇਂ';
	@override String get noBibleTextsAvailable => 'ਕੋਈ ਬਾਈਬਲ ਪਾਠ ਉਪਲਬਧ ਨਹੀਂ ਹੈ';
	@override String get languages => 'ਭਾਸ਼ਾਵਾਂ';
	@override String get searchLanguages => 'ਭਾਸ਼ਾਵਾਂ ਦੀ ਖੋਜ ਕਰੋ...';
	@override String get biblesFilesets => 'ਬਾਈਬਲ: {bibles}, ਫਾਈਲਸੈਟਸ: {filesets}';
	@override String get oldTestament => 'ਪੁਰਾਣਾ ਨਿਯਮ';
	@override String get newTestament => 'ਨਵਾਂ ਨਿਯਮ';
	@override String get play => 'ਚਲਾਓ';
	@override String get no_verse_content => 'ਪ੍ਰਦਰਸ਼ਿਤ ਕਰਨ ਲਈ ਕੋਈ ਬਾਈਬਲ ਅੱਧਿਆਇ ਸਮੱਗਰੀ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';
	@override String get no_audio_content => 'ਪ੍ਰਦਰਸ਼ਿਤ ਕਰਨ ਲਈ ਕੋਈ ਬਾਈਬਲ ਆਡੀਓ ਸਮੱਗਰੀ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';
}

// Path: <root>
class _StringsPt implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsPt.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsPt _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'VirtualPastor';
	@override String get deleteaccount => 'Delete my account';
	@override String get deletemyaccount => 'Delete my account';
	@override String get deleteaccounthint => 'This action will delete your account and remove all your data, once your data is deleted, it cannot be recovered.';
	@override String get deleteaccountsuccess => 'Account deletion was succesful';
	@override String get selectlanguage => 'Selecione o idioma';
	@override String get chooseapplanguage => 'Escolha o idioma do aplicativo';
	@override String get nightmode => 'Modo noturno';
	@override String get initializingapp => 'inicializando...';
	@override String get home => 'Casa';
	@override String get branches => 'Ramos';
	@override String get inbox => 'Caixa de entrada';
	@override String get downloads => 'Transferências';
	@override String get settings => 'Configurações';
	@override String get events => 'Eventos';
	@override String get myplaylists => 'Minhas Playlists';
	@override String get website => 'Local na rede Internet';
	@override String get hymns => 'Hinos';
	@override String get articles => 'Artigos';
	@override String get notes => 'Notas';
	@override String get donate => 'Doar';
	@override String get offering => 'Oferta';
	@override String get bookmarks => 'Favoritos';
	@override String get socialplatforms => 'Plataformas Sociais';
	@override List<String> get onboardingpagetitles => [
		'Bem-vindo ao MyChurch',
		'Repleto de recursos',
		'Áudio, vídeo \n e transmissão ao vivo',
		'Criar Conta',
	];
	@override List<String> get onboardingpagehints => [
		'Vá além das manhãs de domingo e das quatro paredes de sua igreja. Tudo que você precisa para se comunicar e interagir com um mundo focado em dispositivos móveis.',
		'Reunimos todos os principais recursos que seu aplicativo de igreja deve ter. Eventos, devocionais, notificações, notas e bíblia em várias versões.',
		'Permita que usuários de todo o mundo assistam a vídeos, ouçam mensagens de áudio e assistam a transmissões ao vivo de seus serviços religiosos.',
		'Comece sua jornada para uma experiência de adoração sem fim.',
	];
	@override String get next => 'PRÓXIMO';
	@override String get done => 'INICIAR';
	@override String get quitapp => 'Sair do aplicativo!';
	@override String get quitappwarning => 'Você deseja fechar o aplicativo?';
	@override String get quitappaudiowarning => 'No momento, você está reproduzindo um áudio. Sair do aplicativo interromperá a reprodução do áudio. Se você não deseja interromper a reprodução, apenas minimize o aplicativo com o botão central ou clique no botão Ok para encerrar o aplicativo agora.';
	@override String get ok => 'Está bem';
	@override String get retry => 'TENTAR NOVAMENTE';
	@override String get oops => 'Opa!';
	@override String get save => 'Salve ';
	@override String get cancel => 'Cancelar';
	@override String get error => 'Erro';
	@override String get success => 'Sucesso';
	@override String get skip => 'Pular';
	@override String get skiplogin => 'Pular login';
	@override String get skipregister => 'Ignorar registro';
	@override String get dataloaderror => 'Não foi possível carregar os dados solicitados no momento, verifique sua conexão de dados e clique para tentar novamente.';
	@override String get suggestedforyou => 'Sugerido para você';
	@override String get devotionals => 'Devocionais';
	@override String get categories => 'Categorias';
	@override String get category => 'Categoria';
	@override String get videos => 'Vídeos';
	@override String get audios => 'Áudios';
	@override String get biblebooks => 'Bíblia';
	@override String get audiobible => 'Bíblia em Áudio';
	@override String get sermons => 'Sermões';
	@override String get profile => 'Perfil';
	@override String get tools => 'Ferramentas';
	@override String get homesentence => 'Seu pastor por 1 ano, para ajudá-lo a se tornar a pessoa que Deus o chamou para ser.';
	@override String get livestreams => 'Transmissões ao vivo';
	@override String get radio => 'Rádio';
	@override String get allitems => 'Todos os itens';
	@override String get emptyplaylist => 'Sem listas de reprodução';
	@override String get notsupported => 'Não suportado';
	@override String get cleanupresources => 'Limpando recursos';
	@override String get grantstoragepermission => 'Conceda permissão de acesso ao armazenamento para continuar';
	@override String get sharefiletitle => 'Assistir ou ouvir ';
	@override String get sharefilebody => 'Através da MyVirtualPastor App, Baixe agora em ';
	@override String get sharetext => 'Desfrute de streaming ilimitado de áudio e vídeo';
	@override String get sharetexthint => 'Junte-se à plataforma de streaming de vídeo e áudio que permite assistir e ouvir milhões de arquivos de todo o mundo. Baixe agora em';
	@override String get download => 'Baixar';
	@override String get addplaylist => 'Adicionar à Playlist';
	@override String get bookmark => 'marca páginas';
	@override String get unbookmark => 'Desmarcar';
	@override String get share => 'Compartilhar';
	@override String get deletemedia => 'Excluir arquivo';
	@override String get deletemediahint => 'Você deseja excluir este arquivo baixado? Essa ação não pode ser desfeita.';
	@override String get nonotesfound => 'Nenhuma nota encontrada';
	@override String get newnote => 'Novo';
	@override String get savenotetitle => 'Título da Nota';
	@override String get searchhint => 'Pesquisar mensagens de áudio e vídeo';
	@override String get performingsearch => 'Pesquisando áudios e vídeos';
	@override String get nosearchresult => 'Nenhum resultado encontrado';
	@override String get nosearchresulthint => 'Tente inserir palavras-chave mais gerais';
	@override String get deletenote => 'Excluir nota';
	@override String get deletenotehint => 'Você quer deletar esta nota? Esta ação não pode ser revertida.';
	@override String get addtoplaylist => 'Adicionar à Playlist';
	@override String get newplaylist => 'Nova Playlist';
	@override String get playlistitm => 'Lista de reprodução';
	@override String get mediaaddedtoplaylist => 'Mídia adicionada à lista de reprodução.';
	@override String get mediaremovedfromplaylist => 'Mídia removida da lista de reprodução';
	@override String get clearplaylistmedias => 'Limpar todas as mídias';
	@override String get deletePlayList => 'Excluir lista de reprodução';
	@override String get clearplaylistmediashint => 'Vá em frente e remover todas as mídias desta lista de reprodução?';
	@override String get deletePlayListhint => 'Vá em frente e exclua esta lista de reprodução e limpar todas as mídias?';
	@override String get videomessages => 'Mensagens de Vídeo';
	@override String get audiomessages => 'Mensagens de Áudio';
	@override String get comments => 'Comentários';
	@override String get replies => 'Respostas';
	@override String get reply => 'Resposta';
	@override String get logintoaddcomment => 'Faça login para adicionar um comentário';
	@override String get logintoreply => 'Entre para responder';
	@override String get writeamessage => 'Escreve uma mensagem...';
	@override String get nocomments => 'Nenhum comentário encontrado \nclique para tentar novamente';
	@override String get errormakingcomments => 'Não é possível processar comentários no momento..';
	@override String get errordeletingcomments => 'Não é possível excluir este comentário no momento..';
	@override String get erroreditingcomments => 'Não é possível editar este comentário no momento..';
	@override String get errorloadingmorecomments => 'Não é possível carregar mais comentários no momento..';
	@override String get deletingcomment => 'Excluindo comentário';
	@override String get editingcomment => 'Editando comentário';
	@override String get deletecommentalert => 'Apagar Comentário';
	@override String get editcommentalert => 'Editar Comentário';
	@override String get deletecommentalerttext => 'Você deseja deletar este comentário? Essa ação não pode ser desfeita';
	@override String get loadmore => 'Carregue mais';
	@override String get messages => 'Mensagens';
	@override String get guestuser => 'Usuário Convidado';
	@override String get fullname => 'Nome completo';
	@override String get emailaddress => 'Endereço de e-mail';
	@override String get password => 'Senha';
	@override String get repeatpassword => 'Repita a senha';
	@override String get register => 'Registro';
	@override String get login => 'Conecte-se';
	@override String get logout => 'Sair';
	@override String get logoutfromapp => 'Sair do aplicativo?';
	@override String get logoutfromapphint => 'Você não poderá curtir ou comentar em artigos e vídeos se não estiver logado.';
	@override String get gotologin => 'Vá para o Login';
	@override String get resetpassword => 'Redefinir senha';
	@override String get logintoaccount => 'já tem uma conta? Conecte-se';
	@override String get emptyfielderrorhint => 'Você precisa preencher todos os campos';
	@override String get invalidemailerrorhint => 'Você precisa inserir um endereço de e-mail válido';
	@override String get passwordsdontmatch => 'As senhas não conferem';
	@override String get processingpleasewait => 'Processando ... Por favor aguarde';
	@override String get createaccount => 'Crie a sua conta aqui';
	@override String get forgotpassword => 'Esqueceu a senha?';
	@override String get orloginwith => 'Ou faça login com';
	@override String get facebook => 'Facebook';
	@override String get google => 'Google';
	@override String get moreoptions => 'Mais opções';
	@override String get about => 'Sobre nós';
	@override String get privacy => 'Privacidade';
	@override String get terms => 'Termos do aplicativo';
	@override String get rate => 'Avaliar aplicativo';
	@override String get version => 'Versão';
	@override String get pulluploadmore => 'puxar a carga';
	@override String get loadfailedretry => 'Falha ao carregar! Clique em repetir!';
	@override String get releaseloadmore => 'solte para carregar mais';
	@override String get nomoredata => 'Sem mais dados';
	@override String get errorReportingComment => 'Comentário do Error Reporting';
	@override String get reportingComment => 'Comentário de relatório';
	@override String get reportcomment => 'Opções de relatório';
	@override List<String> get reportCommentsList => [
		'Conteúdo comercial indesejado ou spam',
		'Pornografia ou material sexual explícito',
		'Discurso de ódio ou violência gráfica',
		'Assédio ou intimidação',
	];
	@override String get bookmarksMedia => 'Meus marcadores de livro';
	@override String get noitemstodisplay => 'Nenhum item para exibir';
	@override String get loginrequired => 'Login necessário';
	@override String get loginrequiredhint => 'Para se inscrever nesta plataforma, você precisa estar logado. Crie uma conta gratuita agora ou faça login em sua conta existente.';
	@override String get subscriptions => 'Assinaturas de aplicativos';
	@override String get subscribe => 'SE INSCREVER';
	@override String get subscribehint => 'Assinatura necessária';
	@override String get playsubscriptionrequiredhint => 'Você precisa se inscrever antes de ouvir ou assistir a esta mídia.';
	@override String get previewsubscriptionrequiredhint => 'Você atingiu a duração de visualização permitida para esta mídia. Você precisa se inscrever para continuar ouvindo ou assistindo esta mídia.';
	@override String get copiedtoclipboard => 'Copiado para a área de transferência';
	@override String get downloadbible => 'Baixe a Bíblia';
	@override String get downloadversion => 'Baixar';
	@override String get downloading => 'Baixando';
	@override String get failedtodownload => 'Falhou o download';
	@override String get pleaseclicktoretry => 'Clique para tentar novamente.';
	@override String get of => 'Do';
	@override String get nobibleversionshint => 'Não há dados da Bíblia para exibir, clique no botão abaixo para baixar pelo menos uma versão da Bíblia.';
	@override String get downloaded => 'Baixado';
	@override String get enteremailaddresstoresetpassword => 'Insira seu e-mail para redefinir sua senha';
	@override String get backtologin => 'VOLTE AO LOGIN';
	@override String get signintocontinue => 'Faça login para continuar';
	@override String get signin => 'ASSINAR EM';
	@override String get signinforanaccount => 'INSCREVA-SE PRA UMA CONTA?';
	@override String get alreadyhaveanaccount => 'já tem uma conta?';
	@override String get updateprofile => 'Atualizar perfil';
	@override String get updateprofilehint => 'Para começar, atualize sua página de perfil, isso nos ajudará a conectar você com outras pessoas';
	@override String get autoplayvideos => 'Vídeos de reprodução automática';
	@override String get gosocial => 'Social';
	@override String get searchbible => 'Bíblia Pesquisa';
	@override String get filtersearchoptions => 'Opções de pesquisa de filtro';
	@override String get narrowdownsearch => 'Use o botão de filtro abaixo para restringir a busca por um resultado mais preciso.';
	@override String get searchbibleversion => 'Versão da Bíblia de pesquisa';
	@override String get searchbiblebook => 'Pesquisar livro bíblico';
	@override String get search => 'Procurar';
	@override String get setBibleBook => 'Set Bible Book';
	@override String get oldtestament => 'Antigo Testamento';
	@override String get newtestament => 'Novo Testamento';
	@override String get limitresults => 'Limite de resultados';
	@override String get setfilters => 'Definir Filtros';
	@override String get bibletranslator => 'Tradutor da bíblia';
	@override String get chapter => ' Capítulo ';
	@override String get verse => ' Versículo ';
	@override String get translate => 'traduzir';
	@override String get bibledownloadinfo => 'Download da Bíblia iniciado, por favor, não feche esta página até que o download seja concluído.';
	@override String get received => 'recebido';
	@override String get outoftotal => 'fora do total';
	@override String get set => 'CONJUNTO';
	@override String get selectColor => 'Selecione a cor';
	@override String get switchbibleversion => 'Mudar a versão da Bíblia';
	@override String get switchbiblebook => 'Trocar livro bíblico';
	@override String get gotosearch => 'Vá para o Capítulo';
	@override String get changefontsize => 'Mudar TAMANHO DA FONTE';
	@override String get font => 'Fonte';
	@override String get readchapter => 'Leia o capítulo';
	@override String get showhighlightedverse => 'Mostrar versos em destaque';
	@override String get downloadmoreversions => 'Baixe mais versões';
	@override String get suggestedusers => 'Usuários sugeridos para seguir';
	@override String get unfollow => 'Deixar de seguir';
	@override String get follow => 'Segue';
	@override String get searchforpeople => 'Procura por pessoas';
	@override String get viewpost => 'Ver postagem';
	@override String get viewprofile => 'Ver perfil';
	@override String get mypins => 'Meus Pins';
	@override String get viewpinnedposts => 'Ver postagens fixadas';
	@override String get personal => 'Pessoal';
	@override String get update => 'Atualizar';
	@override String get phonenumber => 'Número de telefone';
	@override String get showmyphonenumber => 'Mostrar meu número de telefone aos usuários';
	@override String get dateofbirth => 'Data de nascimento';
	@override String get showmyfulldateofbirth => 'Mostrar minha data de nascimento completa para as pessoas que visualizam meu status';
	@override String get notifications => 'Notificações';
	@override String get notifywhenuserfollowsme => 'Notifique-me quando um usuário me seguir';
	@override String get notifymewhenusercommentsonmypost => 'Notifique-me quando usuários comentarem em minha postagem';
	@override String get notifymewhenuserlikesmypost => 'Notifique-me quando os usuários curtirem minha postagem';
	@override String get churchsocial => 'Igreja Social';
	@override String get shareyourthoughts => 'Compartilhe seus pensamentos';
	@override String get readmore => '...Consulte Mais informação';
	@override String get less => ' Menos';
	@override String get couldnotprocess => 'Não foi possível processar a ação solicitada.';
	@override String get pleaseselectprofilephoto => 'Selecione uma foto de perfil para fazer upload';
	@override String get pleaseselectprofilecover => 'Selecione uma foto de capa para fazer upload';
	@override String get updateprofileerrorhint => 'Você precisa preencher seu nome, data de nascimento, sexo, telefone e localização antes de continuar.';
	@override String get gender => 'Gênero';
	@override String get male => 'Masculino';
	@override String get female => 'Fêmeo';
	@override String get dob => 'Data de nascimento';
	@override String get location => 'Localização atual';
	@override String get qualification => 'Qualificação';
	@override String get aboutme => 'Sobre mim';
	@override String get facebookprofilelink => 'Link do perfil do Facebook';
	@override String get twitterprofilelink => 'Link do perfil do Twitter';
	@override String get linkdln => 'Link do perfil Linkedln';
	@override String get likes => 'Gosta';
	@override String get likess => 'Gosto (s)';
	@override String get pinnedposts => 'Minhas postagens fixadas';
	@override String get unpinpost => 'Liberar postagem';
	@override String get unpinposthint => 'Você deseja remover esta postagem de suas postagens fixadas?';
	@override String get postdetails => 'Detalhes da postagem';
	@override String get posts => 'Postagens';
	@override String get followers => 'Seguidores';
	@override String get followings => 'Seguidores';
	@override String get my => 'Minhas';
	@override String get edit => 'Editar';
	@override String get delete => 'Excluir';
	@override String get deletepost => 'Apague a postagem';
	@override String get deleteposthint => 'Você deseja deletar esta postagem? As postagens ainda podem aparecer nos feeds de alguns usuários.';
	@override String get maximumallowedsizehint => 'Máximo de upload de arquivo permitido atingido';
	@override String get maximumuploadsizehint => 'O arquivo selecionado excede o limite de tamanho de arquivo para upload permitido.';
	@override String get makeposterror => 'Não é possível postar no momento, por favor clique para tentar novamente.';
	@override String get makepost => 'Fazer Postagem';
	@override String get selectfile => 'Selecione o arquivo';
	@override String get images => 'Imagens';
	@override String get shareYourThoughtsNow => 'Share your thoughts ...';
	@override String get photoviewer => 'Visualizador de fotos';
	@override String get nochatsavailable => 'Nenhuma conversa disponível \n Clique no ícone adicionar abaixo \npara selecionar usuários para bater papo';
	@override String get typing => 'Digitando...';
	@override String get photo => 'Foto';
	@override String get online => 'Conectados';
	@override String get offline => 'Desligado';
	@override String get lastseen => 'Visto pela última vez';
	@override String get deleteselectedhint => 'Esta ação excluirá as mensagens selecionadas. Observe que isso exclui apenas o seu lado da conversa, \n as mensagens ainda serão exibidas no dispositivo do seu parceiro';
	@override String get deleteselected => 'Apagar selecionado';
	@override String get unabletofetchconversation => 'Não é possível buscar \n sua conversa com \n';
	@override String get loadmoreconversation => 'Carregar mais conversas';
	@override String get sendyourfirstmessage => 'Envie sua primeira mensagem para \n';
	@override String get unblock => 'Desbloquear ';
	@override String get block => 'Quadra ';
	@override String get writeyourmessage => 'Escreva sua mensagem...';
	@override String get clearconversation => 'Conversa Clara';
	@override String get clearconversationhintone => 'Esta ação irá limpar toda a sua conversa com ';
	@override String get clearconversationhinttwo => '.\n  Observe que isso apenas exclui o seu lado da conversa, as mensagens ainda serão exibidas no bate-papo de seus parceiros.';
	@override String get facebookloginerror => 'Something went wrong with the login process.\n, Here is the error Facebook gave us';
	@override String get selectLanguage => 'Selecione o idioma';
	@override String get howTo => 'Como';
	@override String get noBibleTextsAvailable => 'Nenhum texto bíblico disponível';
	@override String get languages => 'Idiomas';
	@override String get searchLanguages => 'Pesquisar idiomas...';
	@override String get biblesFilesets => 'Bíblias: {bibles}, Conjuntos de arquivos: {filesets}';
	@override String get oldTestament => 'Antigo Testamento';
	@override String get newTestament => 'Novo Testamento';
	@override String get play => 'Tocar';
	@override String get no_verse_content => 'Nenhum conteúdo de versículo da Bíblia disponível para exibição.';
	@override String get no_audio_content => 'Nenhum conteúdo de áudio da Bíblia disponível para exibição.';
}

// Path: <root>
class _StringsTa implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsTa.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsTa _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'VirtualPastor';
	@override String get selectlanguage => 'மொழியைத் தேர்ந்தெடுக்கவும்';
	@override String get deletemyaccount => 'என் கணக்கை நீக்கவும்';
	@override String get deleteaccount => 'கணக்கை நீக்கவும்';
	@override String get deleteaccounthint => 'இந்தச் செயல் உங்கள் கணக்கை நீக்கி உங்கள் அனைத்து தரவுகளையும் அகற்றும், உங்கள் தரவுகள் நீக்கப்பட்ட பிறகு, அதை மீட்க முடியாது.';
	@override String get deleteaccountsuccess => 'கணக்கு நீக்கல் வெற்றிகரமாக முடிந்தது';
	@override String get chooseapplanguage => 'ஆப் மொழியைத் தேர்ந்தெடுக்கவும்';
	@override String get nightmode => 'இரவு முறை';
	@override String get initializingapp => 'தொடங்குகிறது...';
	@override String get home => 'முகப்பு';
	@override String get branches => 'கிளைகள்';
	@override String get inbox => 'இன்பாக்ஸ்';
	@override String get downloads => 'பதிவிறக்கங்கள்';
	@override String get settings => 'அமைப்புகள்';
	@override String get events => 'நிகழ்வுகள்';
	@override String get myplaylists => 'என் பிளேலிஸ்ட்கள்';
	@override String get website => 'இணையதளம்';
	@override String get hymns => 'பாடல்கள்';
	@override String get articles => 'கட்டுரைகள்';
	@override String get notes => 'குறிப்புகள்';
	@override String get donate => 'நன்கொடைகள்';
	@override String get offering => 'வழங்குதல்';
	@override String get savenotetitle => 'குறிப்பு தலைப்பு';
	@override String get nonotesfound => 'எந்தவிதமான குறிப்புகளும் கிடைக்கவில்லை';
	@override String get newnote => 'புதியது';
	@override String get deletenote => 'குறிப்பை நீக்கவும்';
	@override String get deletenotehint => 'இந்த குறிப்பை நீக்க விரும்புகிறீர்களா? இந்தச் செயல் மாற்ற முடியாது.';
	@override String get bookmarks => 'புத்தக குறியிடுதல்';
	@override String get socialplatforms => 'சமூக ஊடகங்கள்';
	@override List<String> get onboardingpagetitles => [
		'எங்கள் சபையில் வருக',
		'விசேஷங்கள் நிறைந்தவை',
		'ஒலி, காணொளி \n மற்றும் நேரடி ஒளிபரப்பு',
		'கணக்கு உருவாக்கு',
	];
	@override List<String> get onboardingpagehints => [
		'ஞாயிற்றுக்கிழமையைக் கடந்தும் உங்கள் சபையின் நான்கு சுவற்றினை கடந்தும். மொபைல் குவியலான உலகத்துடன் தொடர்பு கொள்ளவும் ஈடுபடவும் நீங்கள் தேவையான எல்லாம் உள்ளது.',
		'உங்கள் சபை ஆப்பிற்குத் தேவையான எல்லா முன்னணி அம்சங்களையும் நாங்கள் ஒருங்கிணைத்துள்ளோம். நிகழ்வுகள், பக்தி பாடல்கள், அறிவிப்புகள், குறிப்புகள் மற்றும் பல பதிப்புகளின் பைபிள்.',
		'உலகம் முழுவதிலுமிருந்து பயனர்களுக்கு உங்கள் சபை சேவைகளை நேரடி ஒளிபரப்புகள், ஒலிப் பதிவுகள் மற்றும் காணொளிகளைப் பார்க்க அனுமதிக்கவும்.',
		'நிறைவற்ற வணக்க அனுபவத்திற்கான உங்கள் பயணத்தைத் தொடங்குங்கள்.',
	];
	@override String get next => 'அடுத்து';
	@override String get done => 'தொடங்கு';
	@override String get quitapp => 'ஆப்பை விட்டு வெளியேற!';
	@override String get quitappwarning => 'ஆப்பை மூட விரும்புகிறீர்களா?';
	@override String get quitappaudiowarning => 'நீங்கள் தற்போது ஒலியைப் பிளே செய்துகொண்டிருக்கிறீர்கள், ஆப்பை மூடுவதால் ஒலி பிளேபேக் நிறுத்தப்படும். பிளேபேக் நிறுத்த விரும்பாவிட்டால், மையப் பொத்தானைக் க்கொண்டனர் அல்லது ஆப்பை இப்போது மூட "ஓகே" பட்டனை அழுத்தவும்.';
	@override String get ok => 'சரி';
	@override String get retry => 'மீண்டும் முயற்சிக்கவும்';
	@override String get oops => 'அருகில்!';
	@override String get save => 'சேமிக்கவும்';
	@override String get cancel => 'ரத்து செய்யவும்';
	@override String get error => 'பிழை';
	@override String get success => 'வெற்றி';
	@override String get skip => 'தவிர்க்கவும்';
	@override String get skiplogin => 'உள்நுழைவினை தவிர்க்கவும்';
	@override String get skipregister => 'பதிவைத் தவிர்க்கவும்';
	@override String get dataloaderror => 'தற்போது கேட்டுள்ள தரவினை ஏற்ற முடியவில்லை, உங்கள் தரவுக் குவியலைச் சரி பார்க்கவும் மற்றும் மீண்டும் முயற்சிக்கவும்.';
	@override String get suggestedforyou => 'உங்களுக்கு பரிந்துரைக்கப்பட்டது';
	@override String get videomessages => 'காணொளி செய்திகள்';
	@override String get audiomessages => 'ஒலி செய்திகள்';
	@override String get devotionals => 'பக்தி பாடல்கள்';
	@override String get categories => 'வகைகள்';
	@override String get category => 'வகை';
	@override String get videos => 'காணொளிகள்';
	@override String get audios => 'ஒலிகள்';
	@override String get biblebooks => 'பைபிள்';
	@override String get sermons => 'போதனைகள்';
	@override String get tools => 'கருவிகள்';
	@override String get profile => 'சுயவிவரம்';
	@override String get audiobible => 'ஒலி பைபிள்';
	@override String get homesentence => 'அனைத்து அன்பின் நண்பர்களுக்காக அன்பின் உள்ளத்தில் சிறந்த வழிகாட்டியாக, நம் ஆண்டவர் இயேசுவின் அன்பின் இயேசுவுக்காக வாழ்வோம்.';
	@override String get livestreams => 'நேரடி ஒளிபரப்புகள்';
	@override String get radio => 'வானொலி';
	@override String get allitems => 'அனைத்து உருப்படிகள்';
	@override String get emptyplaylist => 'பிளேலிஸ்ட் இல்லை';
	@override String get notsupported => 'ஆதரிக்கவில்லை';
	@override String get cleanupresources => 'ஆதாரங்களை சுத்தம் செய்யப்படுகிறது';
	@override String get grantstoragepermission => 'தொடர்வதற்கு சேமிப்பு அனுமதியை வழங்கவும்';
	@override String get sharefiletitle => 'காணவும் அல்லது கேளுங்கள் ';
	@override String get sharefilebody => 'MyVirtualPastor ஆப் மூலம், இப்போதே பதிவிறக்கவும் ';
	@override String get sharetext => 'எல்லா விதமான ஒலிகள் மற்றும் காணொளிகளை அனுபவிக்கவும்';
	@override String get sharetexthint => 'உலகெங்கிலும் உள்ள மில்லியன் கணக்கான கோப்புகளைப் பார்ப்பதற்கும் கேட்பதற்கும் உங்களை அனுமதிக்கும் காணொளி மற்றும் ஒலி ஒளிபரப்பு தளத்தில் இணையவும். இப்போதே பதிவிறக்கவும்';
	@override String get download => 'பதிவிறக்கவும்';
	@override String get addplaylist => 'பிளேலிஸ்டில் சேர்';
	@override String get bookmark => 'புத்தக குறியிடுதல்';
	@override String get unbookmark => 'புத்தக குறியிடல் நீக்கவும்';
	@override String get share => 'பகிரவும்';
	@override String get deletemedia => 'கோப்பை நீக்கவும்';
	@override String get deletemediahint => 'இந்த பதிவிறக்கப்பட்ட கோப்பை நீக்க விரும்புகிறீர்களா? இந்தச் செயல் திரும்ப முடியாது.';
	@override String get searchhint => 'ஒலி மற்றும் காணொளி செய்திகளைத் தேடுங்கள்';
	@override String get performingsearch => 'ஒலிகள் மற்றும் காணொளிகளைத் தேடுகிறது';
	@override String get nosearchresult => 'எந்தவிதமான முடிவுகளும் கிடைக்கவில்லை';
	@override String get nosearchresulthint => 'மேலும் பொதுவான முக்கியவார்த்தையை உள்ளிட முயலுங்கள்';
	@override String get addtoplaylist => 'பிளேலிஸ்டில் சேர்';
	@override String get newplaylist => 'புதிய பிளேலிஸ்ட்';
	@override String get playlistitm => 'பிளேலிஸ்ட்';
	@override String get mediaaddedtoplaylist => 'ஊடகம் பிளேலிஸ்டில் சேர்க்கப்பட்டுள்ளது.';
	@override String get mediaremovedfromplaylist => 'ஊடகம் பிளேலிஸ்டில் இருந்து நீக்கப்பட்டுள்ளது';
	@override String get clearplaylistmedias => 'அனைத்து ஊடகங்களைத் துடைக்கவும்';
	@override String get deletePlayList => 'பிளேலிஸ்டை நீக்கவும்';
	@override String get clearplaylistmediashint => 'இந்த பிளேலிஸ்டிலிருந்து அனைத்து ஊடகங்களையும் நீக்க விரும்புகிறீர்களா?';
	@override String get deletePlayListhint => 'இந்த பிளேலிஸ்டை நீக்கி அனைத்து ஊடகங்களையும் துடைக்க விரும்புகிறீர்களா?';
	@override String get comments => 'கருத்துகள்';
	@override String get replies => 'பதில்';
	@override String get reply => 'பதில்';
	@override String get logintoaddcomment => 'கருத்து சேர்க்க உள்நுழைக';
	@override String get logintoreply => 'பதிலளிக்க உள்நுழைக';
	@override String get writeamessage => 'ஒரு செய்தியை எழுதவும்...';
	@override String get nocomments => 'எந்தவிதமான கருத்துகளும் இல்லை \n மீண்டும் முயற்சிக்க கிளிக் செய்யவும்';
	@override String get errormakingcomments => 'தற்போது கருத்துகளை செயலாக்க முடியவில்லை..';
	@override String get errordeletingcomments => 'தற்போது இந்த கருத்தை நீக்க முடியவில்லை..';
	@override String get erroreditingcomments => 'தற்போது இந்த கருத்தைத் திருத்த முடியவில்லை..';
	@override String get errorloadingmorecomments => 'தற்போது மேலும் கருத்துகளை ஏற்ற முடியவில்லை..';
	@override String get deletingcomment => 'கருத்து நீக்கப்படுகிறது';
	@override String get editingcomment => 'கருத்து திருத்தப்படுகிறது';
	@override String get deletecommentalert => 'கருத்து நீக்கவும்';
	@override String get editcommentalert => 'கருத்து திருத்தவும்';
	@override String get deletecommentalerttext => 'இந்த கருத்தை நீக்க விரும்புகிறீர்களா? இந்தச் செயல் திரும்ப முடியாது';
	@override String get loadmore => 'மேலும் ஏற்றுக';
	@override String get messages => 'செய்திகள்';
	@override String get guestuser => 'விருந்தினர் பயனர்';
	@override String get fullname => 'முழு பெயர்';
	@override String get emailaddress => 'மின்னஞ்சல் முகவரி';
	@override String get password => 'கடவுச்சொல்';
	@override String get repeatpassword => 'கடவுச்சொல்லை மீண்டும் உள்ளிடவும்';
	@override String get register => 'பதிவு செய்க';
	@override String get login => 'உள்நுழைய';
	@override String get logout => 'வெளியேறு';
	@override String get logoutfromapp => 'ஆப்பிலிருந்து வெளியேறவா?';
	@override String get logoutfromapphint => 'நீங்கள் உள்நுழையாவிட்டால் கட்டுரைகள் மற்றும் காணொளிகளில் நீங்கள் பிடிக்கவோ அல்லது கருத்துரையிடவோ முடியாது.';
	@override String get gotologin => 'உள்நுழைய செல்லவும்';
	@override String get resetpassword => 'கடவுச்சொல்லை மீட்டமை';
	@override String get logintoaccount => 'ஏற்கனவே கணக்கு உள்ளதா? உள்நுழைய';
	@override String get emptyfielderrorhint => 'நீங்கள் அனைத்து புலங்களையும் நிரப்ப வேண்டும்';
	@override String get invalidemailerrorhint => 'நீங்கள் செல்லுபடியாகும் மின்னஞ்சல் முகவரியை உள்ளிட வேண்டும்';
	@override String get passwordsdontmatch => 'கடவுச்சொற்கள் பொருந்தவில்லை';
	@override String get processingpleasewait => 'செயலாக்குகிறது, காத்திருங்கள்...';
	@override String get createaccount => 'ஒரு கணக்கை உருவாக்கு';
	@override String get forgotpassword => 'கடவுச்சொல்லை மறந்துவிட்டீர்களா?';
	@override String get orloginwith => 'அல்லது உள்நுழையவும்';
	@override String get facebook => 'பேஸ்புக்';
	@override String get google => 'கூகுள்';
	@override String get moreoptions => 'மேலும் விருப்பங்கள்';
	@override String get about => 'எங்களைப் பற்றி';
	@override String get privacy => 'தனியுரிமைக் கொள்கை';
	@override String get terms => 'ஆப் நிபந்தனைகள்';
	@override String get rate => 'ஆப்பை மதிப்பீடு செய்க';
	@override String get version => 'பதிப்பு';
	@override String get pulluploadmore => 'மேலே இழுத்து ஏற்றவும்';
	@override String get loadfailedretry => 'ஏற்றுதல் தோல்வி! மீண்டும் முயற்சிக்க கிளிக் செய்க!';
	@override String get releaseloadmore => 'மேலும் ஏற்ற இழுத்து விடு';
	@override String get nomoredata => 'மேலும் தரவுகள் இல்லை';
	@override String get errorReportingComment => 'கருத்து அறிக்கை பிழை';
	@override String get reportingComment => 'கருத்து அறிக்கை செய்யப்படுகிறது';
	@override String get reportcomment => 'அறிக்கை விருப்பங்கள்';
	@override List<String> get reportCommentsList => [
		'தேவையற்ற வாணிப உள்ளடக்கம் அல்லது ஸ்பாம்',
		'அசிங்கமான அல்லது பாலியல் தெளிவான உள்ளடக்கம்',
		'வெறுக்கத்தக்க பேச்சு அல்லது கிராபிக் வன்முறை',
		'துன்புறுத்தல் அல்லது மிரட்டல்',
	];
	@override String get bookmarksMedia => 'எனது புத்தக குறியீடுகள்';
	@override String get noitemstodisplay => 'காண்பிக்க உருப்படிகள் இல்லை';
	@override String get loginrequired => 'உள்நுழைவு தேவையானது';
	@override String get loginrequiredhint => 'இந்த தளத்தில் சந்தா செலுத்த, உள்நுழைய வேண்டும். இப்போது இலவச கணக்கை உருவாக்குங்கள் அல்லது உங்கள் ஏற்கனவே உள்ள கணக்கில் உள்நுழையுங்கள்.';
	@override String get subscriptions => 'ஆப் சந்தாக்கள்';
	@override String get subscribe => 'சந்தா';
	@override String get subscribehint => 'சந்தா தேவையானது';
	@override String get playsubscriptionrequiredhint => 'இந்த ஊடகத்தை கேட்க அல்லது பார்க்க, நீங்கள் சந்தா செலுத்த வேண்டும்.';
	@override String get previewsubscriptionrequiredhint => 'இந்த ஊடகத்திற்கு அனுமதிக்கப்பட்ட முன்னோட்ட காலத்தை நீங்கள் முடித்து விட்டீர்கள். கேட்க அல்லது பார்க்க, நீங்கள் சந்தா செலுத்த வேண்டும்.';
	@override String get copiedtoclipboard => 'கிளிப்போர்டுக்கு நகலெடுக்கப்பட்டது';
	@override String get downloadbible => 'பைபிளை பதிவிறக்கவும்';
	@override String get downloadversion => 'பதிவு';
	@override String get downloading => 'பதிவிறக்கப்படுகிறது';
	@override String get failedtodownload => 'பதிவிறக்கம் தோல்வி';
	@override String get pleaseclicktoretry => 'மீண்டும் முயற்சிக்க தயவுசெய்து கிளிக் செய்யவும்.';
	@override String get of => 'இல்';
	@override String get nobibleversionshint => 'காண்பிக்க பைபிள் தரவுகள் இல்லை, குறைந்தது ஒரு பைபிள் பதிப்பை பதிவிறக்க, கீழே உள்ள பொத்தானை கிளிக் செய்க.';
	@override String get downloaded => 'பதிவிறக்கம் முடிந்தது';
	@override String get enteremailaddresstoresetpassword => 'உங்கள் கடவுச்சொல்லை மீட்டமை செய்ய உங்கள் மின்னஞ்சல் முகவரியை உள்ளிடுங்கள்';
	@override String get backtologin => 'உள்நுழைய திரும்பவும்';
	@override String get signintocontinue => 'தொடர உள்நுழைக';
	@override String get signin => 'உள்நுழைய';
	@override String get signinforanaccount => 'ஒரு கணக்கை உருவாக்க உள்நுழைக?';
	@override String get alreadyhaveanaccount => 'ஏற்கனவே ஒரு கணக்கு உள்ளதா?';
	@override String get updateprofile => 'சுயவிவரத்தைப் புதுப்பிக்கவும்';
	@override String get updateprofilehint => 'தொடங்க, தயவுசெய்து உங்கள் சுயவிவர பக்கத்தை புதுப்பிக்கவும், இது மற்றவர்களுடன் நீங்கள் தொடர்பு கொள்ள உதவும்';
	@override String get autoplayvideos => 'தானியங்கி விளையாட்டு வீடியோக்கள்';
	@override String get gosocial => 'சமூகத்திற்கு செல்லவும்';
	@override String get searchbible => 'பைபிள் தேடல்';
	@override String get filtersearchoptions => 'தேடல் விருப்பங்களை வடிகட்டி';
	@override String get narrowdownsearch => 'மேலும் துல்லியமான முடிவுக்கு தேடலை குறைக்க கீழே உள்ள வடிகட்டி பொத்தானை பயன்படுத்தவும்.';
	@override String get searchbibleversion => 'பைபிள் பதிப்பு தேடல்';
	@override String get searchbiblebook => 'பைபிள் புத்தகம் தேடல்';
	@override String get search => 'தேடல்';
	@override String get setBibleBook => 'பைபிள் புத்தகம் அமைக்கவும்';
	@override String get oldtestament => 'பழைய ஏற்பாடு';
	@override String get newtestament => 'புதிய ஏற்பாடு';
	@override String get limitresults => 'முடிவுகளை மட்டுப்படுத்தவும்';
	@override String get setfilters => 'வடிகட்டிகளை அமைக்கவும்';
	@override String get bibletranslator => 'பைபிள் மொழிபெயர்ப்பாளர்';
	@override String get chapter => ' அதிகாரம் ';
	@override String get verse => ' வசனம் ';
	@override String get translate => 'மொழிபெயர்க்கவும்';
	@override String get bibledownloadinfo => 'பைபிள் பதிவிறக்கம் தொடங்கியது, பதிவிறக்கம் முடியும் வரை இந்த பக்கத்தை மூடாதீர்கள்.';
	@override String get received => 'பெறப்பட்டது';
	@override String get outoftotal => 'மொத்தத்தில் இருந்து';
	@override String get set => 'அமைக்கவும்';
	@override String get selectColor => 'நிறத்தைத் தேர்ந்தெடுக்கவும்';
	@override String get switchbibleversion => 'பைபிள் பதிப்பை மாற்றவும்';
	@override String get switchbiblebook => 'பைபிள் புத்தகத்தை மாற்றவும்';
	@override String get gotosearch => 'அதிகாரத்திற்கு செல்';
	@override String get changefontsize => 'எழுத்துரு அளவை மாற்றவும்';
	@override String get font => 'எழுத்துரு';
	@override String get readchapter => 'அதிகாரம் படிக்கவும்';
	@override String get showhighlightedverse => 'முக்கிய வசனங்களை காட்டு';
	@override String get downloadmoreversions => 'மேலும் பதிப்புகளை பதிவிறக்கவும்';
	@override String get suggestedusers => 'பின்பற்ற பரிந்துரைக்கப்பட்ட பயனர்கள்';
	@override String get unfollow => 'பின்தொடர வேண்டாம்';
	@override String get follow => 'பின்தொடரவும்';
	@override String get searchforpeople => 'மக்களைத் தேடுங்கள்';
	@override String get viewpost => 'பதிவைப் பார்க்கவும்';
	@override String get viewprofile => 'சுயவிவரத்தைப் பார்க்கவும்';
	@override String get mypins => 'எனது பின்கள்';
	@override String get viewpinnedposts => 'பின்னப்பட்ட பதிவுகளைப் பார்க்கவும்';
	@override String get personal => 'தனிப்பட்ட';
	@override String get update => 'புதுப்பிக்கவும்';
	@override String get phonenumber => 'தொலைபேசி எண்';
	@override String get showmyphonenumber => 'பயனர்களுக்கு என்னுடைய தொலைபேசி எண்ணை காட்டவும்';
	@override String get dateofbirth => 'பிறந்த தேதி';
	@override String get showmyfulldateofbirth => 'என்னுடைய நிலையைப் பார்ப்பவர்களுக்கு என்னுடைய முழு பிறந்த தேதியை காட்டவும்';
	@override String get notifications => 'அறிவிப்புகள்';
	@override String get notifywhenuserfollowsme => 'யாரேனும் பயனர் என்னை பின்தொடரும்போது என்னை அறிவிக்கவும்';
	@override String get notifymewhenusercommentsonmypost => 'பயனர்கள் என்னுடைய பதிவுகளில் கருத்துரைக்கும்போது என்னை அறிவிக்கவும்';
	@override String get notifymewhenuserlikesmypost => 'பயனர்கள் என்னுடைய பதிவுகளை விரும்பினால் என்னை அறிவிக்கவும்';
	@override String get churchsocial => 'சர்ச் சோஷியல்';
	@override String get shareyourthoughts => 'உங்கள் கருத்துகளைப் பகிரவும்';
	@override String get readmore => '...மேலும் படிக்கவும்';
	@override String get less => ' குறைவாக';
	@override String get couldnotprocess => 'கோரிய செயல்முறையை செயலாக்க முடியவில்லை.';
	@override String get pleaseselectprofilephoto => 'பதிவேற்ற ஒன்றைத் தேர்வுசெய்யவும்';
	@override String get pleaseselectprofilecover => 'தயவுசெய்து ஒரு கவர் புகைப்படத்தைத் தேர்வுசெய்யவும்';
	@override String get updateprofileerrorhint => 'தொடர்வதற்கு உங்கள் பெயர், பிறந்த தேதி, பாலினம், தொலைபேசி மற்றும் இருப்பிடம் ஆகியவற்றை நிரப்ப வேண்டும்.';
	@override String get gender => 'பாலினம்';
	@override String get male => 'ஆண்';
	@override String get female => 'பெண்';
	@override String get dob => 'பிறந்த தேதி';
	@override String get location => 'தற்போதைய இருப்பிடம்';
	@override String get qualification => 'தகுதி';
	@override String get aboutme => 'என்னை பற்றி';
	@override String get facebookprofilelink => 'பேஸ்புக் ப்ரொஃபைல் லிங்க்';
	@override String get twitterprofilelink => 'ட்விட்டர் ப்ரொஃபைல் லிங்க்';
	@override String get linkdln => 'லிங்க்டின் ப்ரொஃபைல் லிங்க்';
	@override String get likes => 'விருப்பம்';
	@override String get likess => 'விருப்பங்கள்';
	@override String get pinnedposts => 'பின் செய்யப்பட்ட பதிவுகள்';
	@override String get unpinpost => 'பின்னப்பட்ட பதிவை அகற்றுங்கள்';
	@override String get unpinposthint => 'இந்த பதிவை உங்கள் பின்னப்பட்ட பதிவுகளில் இருந்து அகற்ற விரும்புகிறீர்களா?';
	@override String get postdetails => 'பதிவு விவரங்கள்';
	@override String get posts => 'பதிவுகள்';
	@override String get followers => 'பின்தொடர்பவர்கள்';
	@override String get followings => 'பின்தொடர்பவர்கள்';
	@override String get my => 'எனது';
	@override String get edit => 'தொகு';
	@override String get delete => 'நீக்கு';
	@override String get deletepost => 'பதிவை நீக்கு';
	@override String get deleteposthint => 'இந்த பதிவை நீக்க விரும்புகிறீர்களா? பதிவுகள் இன்னும் சில பயனர்களின் பிணைகளில் தோன்றலாம்.';
	@override String get maximumallowedsizehint => 'அனுமதிக்கப்பட்ட பதிவேற்ற கோப்பு அளவு எல்லையை எட்டியது';
	@override String get maximumuploadsizehint => 'தேர்ந்தெடுக்கப்பட்ட கோப்பு அனுமதிக்கப்பட்ட பதிவேற்ற கோப்பு அளவுக்குச் சற்று அதிகமாக உள்ளது.';
	@override String get makeposterror => 'இந்த நேரத்தில் பதிவிட முடியவில்லை, மீண்டும் முயற்சிக்க கிளிக் செய்யவும்.';
	@override String get makepost => 'பதிவிடு';
	@override String get selectfile => 'கோப்பைத் தேர்ந்தெடுக்கவும்';
	@override String get images => 'படங்கள்';
	@override String get shareYourThoughtsNow => 'உங்கள் கருத்துகளை இப்போதே பகிரவும்...';
	@override String get photoviewer => 'புகைப்பட பார்வையாளர்';
	@override String get nochatsavailable => 'கிடைக்கக்கூடிய உரையாடல்கள் இல்லை \n சேர்க்க பைசன் ஆல் உரையாடலைத் தேர்வு செய்ய \n கீழே உள்ள ஐகானை கிளிக் செய்யவும்';
	@override String get typing => 'தட்டச்சு செய்கிறது...';
	@override String get photo => 'புகைப்படம்';
	@override String get online => 'நிகழ்நிலை';
	@override String get offline => 'ஆஃப்லைன்';
	@override String get lastseen => 'கடைசியாக காணப்பட்டது';
	@override String get deleteselectedhint => 'இந்த செயல் தேர்ந்தெடுக்கப்பட்ட செய்திகளை நீக்கிவிடும். தயவுசெய்து கவனிக்கவும், இது உங்கள் பக்கத்தின் உரையாடலை மட்டுமே நீக்கிவிடும்,\n செய்திகள் இன்னும் உங்கள் நண்பரின் சாதனத்தில் தோன்றும்.';
	@override String get deleteselected => 'தேர்ந்தெடுக்கப்பட்டதை நீக்கவும்';
	@override String get unabletofetchconversation => 'உங்களின் உரையாடலை பெற முடியவில்லை \n';
	@override String get loadmoreconversation => 'மேலும் உரையாடலை ஏற்றவும்';
	@override String get sendyourfirstmessage => 'உங்கள் முதல் செய்தியை அனுப்புங்கள் \n';
	@override String get unblock => 'தடையை நீக்கு ';
	@override String get block => 'தடை செய்';
	@override String get writeyourmessage => 'உங்கள் செய்தியை எழுதுங்கள்...';
	@override String get clearconversation => 'உரையாடலைத் தூக்கு';
	@override String get clearconversationhintone => 'இந்த செயல் உங்களின் அனைத்து உரையாடல்களையும் தூக்கிவிடும் ';
	@override String get clearconversationhinttwo => '.\n தயவுசெய்து கவனிக்கவும், இது உங்கள் பக்கத்தின் உரையாடலை மட்டுமே நீக்கிவிடும், செய்திகள் இன்னும் உங்கள் நண்பரின் சாதனத்தில் தோன்றும்.';
	@override String get facebookloginerror => 'உள்நுழைவு செயல்முறையில் ஏதோ தவறாகிவிட்டது.\n இதோ இங்கே பேஸ்புக் நமக்கு கொடுத்த பிழை';
	@override String get selectLanguage => 'மொழியைத் தேர்ந்தெடுக்கவும்';
	@override String get howTo => 'எப்படி';
	@override String get noBibleTextsAvailable => 'யாதொரு பைபிள் உரைகளும் கிடைக்கவில்லை';
	@override String get languages => 'மொழிகள்';
	@override String get searchLanguages => 'மொழிகளைத் தேடுங்கள்...';
	@override String get biblesFilesets => 'பைபிள்கள்: {bibles}, கோப்புகளின் தொகுப்புகள்: {filesets}';
	@override String get oldTestament => 'பழைய ஏற்பாடு';
	@override String get newTestament => 'புதிய ஏற்பாடு';
	@override String get play => 'விளையாடு';
	@override String get no_verse_content => 'காட்ட Bible வசன உள்ளடக்கம் கிடைக்கவில்லை.';
	@override String get no_audio_content => 'காட்ட Bible ஆடியோ உள்ளடக்கம் கிடைக்கவில்லை.';
}

// Path: <root>
class _StringsTe implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsTe.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsTe _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'VirtualPastor';
	@override String get selectlanguage => 'భాషను ఎంచుకోండి';
	@override String get deletemyaccount => 'నా ఖాతాను తొలగించండి';
	@override String get deleteaccount => 'ఖాతాను తొలగించండి';
	@override String get deleteaccounthint => 'ఈ చర్య మీ ఖాతాను తొలగించి మీ అన్ని డేటాను తొలగిస్తుంది, ఒకసారి మీ డేటా తొలగించబడితే, అది తిరిగి పొందబడదు.';
	@override String get deleteaccountsuccess => 'ఖాతా తొలగించడం విజయవంతమైంది';
	@override String get chooseapplanguage => 'యాప్ భాషను ఎంచుకోండి';
	@override String get nightmode => 'రాత్రి మోడ్';
	@override String get initializingapp => 'ఆరంభిస్తుంది...';
	@override String get home => 'హోమ్';
	@override String get branches => 'శాఖలు';
	@override String get inbox => 'ఇన్బాక్స్';
	@override String get downloads => 'డౌన్లోడ్లు';
	@override String get settings => 'సెట్టింగ్‌లు';
	@override String get events => 'ఈవెంట్‌లు';
	@override String get myplaylists => 'నా ప్లేలిస్ట్‌లు';
	@override String get website => 'వెబ్‌సైట్';
	@override String get hymns => 'హిమ్స్';
	@override String get articles => 'ఆర్టికల్‌లు';
	@override String get notes => 'నోట్‌లు';
	@override String get donate => 'దానం చేయండి';
	@override String get offering => 'అర్పణ';
	@override String get savenotetitle => 'నోట్ టైటిల్';
	@override String get nonotesfound => 'నోట్‌లు కనుగొనబడలేదు';
	@override String get newnote => 'కొత్తది';
	@override String get deletenote => 'నోట్ తొలగించండి';
	@override String get deletenotehint => 'మీరు ఈ నోట్‌ను తొలగించాలనుకుంటున్నారా? ఈ చర్యను తిరిగి చేయడం సాధ్యంకాదు.';
	@override String get bookmarks => 'బుక్మార్క్‌లు';
	@override String get socialplatforms => 'సోషల్ ప్లాట్‌ఫారమ్‌లు';
	@override List<String> get onboardingpagetitles => [
		'మన చర్చిలోకి స్వాగతం',
		'ఫీచర్‌లతో నిండినవి',
		'ఆడియో, వీడియో \n మరియు లైవ్ స్ట్రీమింగ్',
		'ఖాతాను సృష్టించండి',
	];
	@override List<String> get onboardingpagehints => [
		'ఆదివారం ఉదయాలు మరియు మీ చర్చి యొక్క నాలుగు గోడలపైకి వ్యాపించండి. మొబైల్-కేంద్రిత ప్రపంచంతో సంభాషించడానికి మరియు నిమగ్నం చేయడానికి మీకు అవసరమైన అన్ని ఉన్నవి.',
		'మీ చర్చి యాప్‌లో ఉండవలసిన టాప్ ఫీచర్‌లన్నింటినీ మేము కలిపి తీసుకొచ్చాము. ఈవెంట్‌లు, భక్తిగీతాలు, నోటిఫికేషన్‌లు, నోట్‌లు మరియు మల్టీ-వర్షన్ బైబిల్.',
		'ప్రపంచవ్యాప్తంగా ఉన్న వినియోగదారులు మీ చర్చి సేవల లైవ్ స్ట్రీమింగ్‌లను చూడటానికి, ఆడియో సందేశాలను వినటానికి మరియు వీడియోలను చూడటానికి అనుమతించండి.',
		'ఎంతైనా ఆరాధన అనుభవం ప్రారంభించండి.',
	];
	@override String get next => 'తరువాత';
	@override String get done => 'ప్రారంభించు';
	@override String get quitapp => 'యాప్ క్విట్ చేయండి!';
	@override String get quitappwarning => 'మీరు యాప్ క్విట్ చేయాలనుకుంటున్నారా?';
	@override String get quitappaudiowarning => 'మీరు ప్రస్తుతం ఒక ఆడియోని ప్లే చేస్తున్నారు, యాప్ క్విట్ చేయడం ఆడియో ప్లేబ్యాక్‌ను నిలిపివేస్తుంది. ప్లేబ్యాక్‌ను నిలిపివేయకూడదని భావిస్తే, కేవలం యాప్‌ను సెంటర్ బటన్‌తో మినిమైజ్ చేయండి లేదా యాప్‌ను ఇప్పుడు క్విట్ చేయడానికి ఓకే బటన్ క్లిక్ చేయండి.';
	@override String get ok => 'సరే';
	@override String get retry => 'మళ్లీ ప్రయత్నించండి';
	@override String get oops => 'ఓహ్!';
	@override String get save => 'సేవ్ చేయండి';
	@override String get cancel => 'రద్దు చేయండి';
	@override String get error => 'లోపం';
	@override String get success => 'విజయం';
	@override String get skip => 'దాటండి';
	@override String get skiplogin => 'లాగిన్‌ను దాటండి';
	@override String get skipregister => 'నమోదును దాటండి';
	@override String get dataloaderror => 'ప్రస్తుత సమయంలో అభ్యర్థించిన డేటాను లోడ్ చేయలేము, మీ డేటా కనెక్షన్‌ను తనిఖీ చేసి మళ్లీ ప్రయత్నించడానికి క్లిక్ చేయండి.';
	@override String get suggestedforyou => 'మీ కోసం సిఫార్సు చేయబడింది';
	@override String get videomessages => 'వీడియో సందేశాలు';
	@override String get audiomessages => 'ఆడియో సందేశాలు';
	@override String get devotionals => 'భక్తిగీతాలు';
	@override String get categories => 'వర్గాలు';
	@override String get category => 'వర్గం';
	@override String get videos => 'వీడియోలు';
	@override String get audios => 'ఆడియోలు';
	@override String get biblebooks => 'బైబిల్';
	@override String get sermons => 'ప్రవచనలు';
	@override String get tools => 'ఉపకరణాలు';
	@override String get profile => 'ప్రొఫైల్';
	@override String get audiobible => 'ఆడియో బైబిల్';
	@override String get homesentence => 'మీరు దేవుని పిలుపు పొందిన వ్యక్తిగా మారటానికి మీ పాస్టర్ కోసం 1 సంవత్సరం.';
	@override String get livestreams => 'లైవ్ స్ట్రీమ్స్';
	@override String get radio => 'రేడియో';
	@override String get allitems => 'అన్ని అంశాలు';
	@override String get emptyplaylist => 'ప్లేలిస్ట్‌లు లేవు';
	@override String get notsupported => 'మద్దతు ఇవ్వబడలేదు';
	@override String get cleanupresources => 'వనరులను శుభ్రపరుస్తున్నారు';
	@override String get grantstoragepermission => 'కొనసాగించడానికి దయచేసి స్టోరేజ్ అనుమతిని అనుమతించండి';
	@override String get sharefiletitle => 'చూడండి లేదా వినండి ';
	@override String get sharefilebody => 'MyVirtualPastor యాప్ ద్వారా, ఇప్పుడు డౌన్లోడ్ చేయండి ';
	@override String get sharetext => 'అనంతమైన ఆడియో & వీడియో స్ట్రీమింగ్‌ను ఆనందించండి';
	@override String get sharetexthint => 'ప్రపంచవ్యాప్తంగా ఉన్న లక్షల సంఖ్యలో ఫైళ్లను చూడటానికి మరియు వినడానికి మీకు అనుమతించే వీడియో మరియు ఆడియో స్ట్రీమింగ్ ప్లాట్‌ఫారమ్‌లో చేరండి. ఇప్పుడు డౌన్లోడ్ చేయండి ';
	@override String get download => 'డౌన్లోడ్ చేయండి';
	@override String get addplaylist => 'ప్లేలిస్ట్‌లో జోడించండి';
	@override String get bookmark => 'బుక్‌మార్క్';
	@override String get unbookmark => 'బుక్‌మార్క్ తొలగించండి';
	@override String get share => 'పంచుకోండి';
	@override String get deletemedia => 'ఫైల్ తొలగించండి';
	@override String get deletemediahint => 'ఈ డౌన్లోడ్ చేసిన ఫైల్‌ని మీరు తొలగించాలనుకుంటున్నారా? ఈ చర్య తిరిగి చేయలేము.';
	@override String get searchhint => 'ఆడియో & వీడియో సందేశాలను వెతకండి';
	@override String get performingsearch => 'ఆడియోలను మరియు వీడియోలను వెతుకుతున్నాము';
	@override String get nosearchresult => 'ఫలితాలు లభించలేదు';
	@override String get nosearchresulthint => 'సాధారణ కీవర్డ్‌ని నమోదు చేయడానికి ప్రయత్నించండి';
	@override String get addtoplaylist => 'ప్లేలిస్ట్‌లో చేర్చు';
	@override String get newplaylist => 'కొత్త ప్లేలిస్ట్';
	@override String get playlistitm => 'ప్లేలిస్ట్';
	@override String get mediaaddedtoplaylist => 'మీడియాను ప్లేలిస్ట్‌లో చేర్చారు.';
	@override String get mediaremovedfromplaylist => 'మీడియాను ప్లేలిస్ట్ నుండి తొలగించారు';
	@override String get clearplaylistmedias => 'అన్ని మీడియాను క్లియర్ చేయండి';
	@override String get deletePlayList => 'ప్లేలిస్ట్ తొలగించండి';
	@override String get clearplaylistmediashint => 'ఈ ప్లేలిస్ట్ నుండి అన్ని మీడియాను తొలగించాలనుకుంటున్నారా?';
	@override String get deletePlayListhint => 'ఈ ప్లేలిస్ట్‌ను తొలగించి అన్ని మీడియాను క్లియర్ చేయాలనుకుంటున్నారా?';
	@override String get comments => 'కామెంట్స్';
	@override String get replies => 'ప్రత్యుత్తరాలు';
	@override String get reply => 'ప్రత్యుత్తరం';
	@override String get logintoaddcomment => 'కామెంట్ చేయడానికి లాగిన్ చేయండి';
	@override String get logintoreply => 'ప్రత్యుత్తరం ఇవ్వడానికి లాగిన్ చేయండి';
	@override String get writeamessage => 'ఒక సందేశం రాయండి...';
	@override String get nocomments => 'కామెంట్స్ కనుగొనబడలేదు \nమళ్ళీ ప్రయత్నించడానికి క్లిక్ చేయండి';
	@override String get errormakingcomments => 'ప్రస్తుతం కామెంట్ చేయడం సాధ్యం కాదు..';
	@override String get errordeletingcomments => 'ప్రస్తుతం ఈ కామెంట్‌ని తొలగించడం సాధ్యం కాదు..';
	@override String get erroreditingcomments => 'ప్రస్తుతం ఈ కామెంట్‌ని సవరించడం సాధ్యం కాదు..';
	@override String get errorloadingmorecomments => 'ప్రస్తుతం మరిన్ని కామెంట్‌లను లోడ్ చేయడం సాధ్యం కాదు..';
	@override String get deletingcomment => 'కామెంట్ తొలగించబడుతోంది';
	@override String get editingcomment => 'కామెంట్ సవరించబడుతోంది';
	@override String get deletecommentalert => 'కామెంట్ తొలగించు';
	@override String get editcommentalert => 'కామెంట్ సవరించు';
	@override String get deletecommentalerttext => 'మీరు ఈ కామెంట్‌ను తొలగించాలనుకుంటున్నారా? ఈ చర్యను తిరిగి చేయడం సాధ్యంకాదు';
	@override String get loadmore => 'మరిన్ని లోడ్ చేయండి';
	@override String get messages => 'సందేశాలు';
	@override String get guestuser => 'అతిథి యూజర్';
	@override String get fullname => 'పూర్తి పేరు';
	@override String get emailaddress => 'ఈమెయిల్ చిరునామా';
	@override String get password => 'పాస్వర్డ్';
	@override String get repeatpassword => 'పాస్వర్డ్ మళ్లీ ఎంటర్ చేయండి';
	@override String get register => 'నమోదు చేయండి';
	@override String get login => 'లాగిన్ చేయండి';
	@override String get logout => 'లాగ్ అవుట్ చేయండి';
	@override String get logoutfromapp => 'యాప్ నుండి లాగ్ అవుట్?';
	@override String get logoutfromapphint => 'మీరు లాగిన్ చేయకపోతే మీరు వ్యాసాలు మరియు వీడియోలపై లైక్ చేయడం లేదా కామెంట్ చేయడం సాధ్యం కాదు.';
	@override String get gotologin => 'లాగిన్ చేయడానికి వెళ్ళండి';
	@override String get resetpassword => 'పాస్వర్డ్ రీసెట్ చేయండి';
	@override String get logintoaccount => 'ఇప్పటికే ఖాతా ఉందా? లాగిన్ చేయండి';
	@override String get emptyfielderrorhint => 'మీరు అన్ని ఫీల్డ్‌లను నింపాలి';
	@override String get invalidemailerrorhint => 'మీరు చెల్లుబాటు అయ్యే ఇమెయిల్ చిరునామాను ఎంటర్ చేయాలి';
	@override String get passwordsdontmatch => 'పాస్వర్డ్‌లు సరిపోలడం లేదు';
	@override String get processingpleasewait => 'ప్రాసెసింగ్, దయచేసి వేచి ఉండండి...';
	@override String get createaccount => 'ఖాతాను సృష్టించు';
	@override String get forgotpassword => 'పాస్వర్డ్ మర్చిపోయారా?';
	@override String get orloginwith => 'లేదా తో లాగిన్ చేయండి';
	@override String get facebook => 'ఫేస్‌బుక్';
	@override String get google => 'గూగుల్';
	@override String get moreoptions => 'మరిన్ని ఎంపికలు';
	@override String get about => 'మా గురించి';
	@override String get privacy => 'ప్రైవసీ పాలసీ';
	@override String get terms => 'యాప్ షరతులు';
	@override String get rate => 'యాప్ రేట్ చేయండి';
	@override String get version => 'వర్షన్';
	@override String get pulluploadmore => 'పైకి లాగి లోడ్ చేయండి';
	@override String get loadfailedretry => 'లోడ్ విఫలమైంది! మళ్ళీ ప్రయత్నించండి!';
	@override String get releaseloadmore => 'మరిన్ని లోడ్ చేయడానికి విడుదల చేయండి';
	@override String get nomoredata => 'ఇంకా డేటా లేదు';
	@override String get errorReportingComment => 'కామెంట్ రిపోర్ట్ లోపం';
	@override String get reportingComment => 'కామెంట్ రిపోర్ట్ చేయబడుతోంది';
	@override String get reportcomment => 'రిపోర్ట్ ఎంపికలు';
	@override List<String> get reportCommentsList => [
		'అవాంఛిత వాణిజ్య కంటెంట్ లేదా స్పామ్',
		'అశ్లీల లేదా లైంగిక స్పష్టత కలిగిన కంటెంట్',
		'పగతో కూడిన ప్రసంగం లేదా గ్రాఫిక్ హింస',
		'హింస లేదా దౌర్జన్యం',
	];
	@override String get bookmarksMedia => 'నా బుక్మార్క్‌లు';
	@override String get noitemstodisplay => 'చూపించడానికి అంశాలు లేవు';
	@override String get loginrequired => 'లాగిన్ అవసరం';
	@override String get loginrequiredhint => 'ఈ ప్లాట్‌ఫారమ్‌లో చందా సబ్స్క్రైబ్ చేయడానికి, మీరు లాగిన్ చేయాలి. ఉచిత ఖాతాను సృష్టించండి లేదా మీ ప్రస్తుత ఖాతాలో లాగిన్ చేయండి.';
	@override String get subscriptions => 'యాప్ సబ్‌స్క్రిప్షన్‌లు';
	@override String get subscribe => 'చందా';
	@override String get subscribehint => 'చందా అవసరం';
	@override String get playsubscriptionrequiredhint => 'ఈ మీడియాను వినడానికి లేదా చూడడానికి మీరు చందా అవసరం.';
	@override String get previewsubscriptionrequiredhint => 'మీరు ఈ మీడియా కోసం అనుమతించిన ప్రివ్యూ వ్యవధికి చేరుకున్నారు. వినడానికి లేదా చూడడానికి మీరు చందా అవసరం.';
	@override String get copiedtoclipboard => 'క్లిప్‌బోర్డ్‌కి కాపీ చేయబడింది';
	@override String get downloadbible => 'బైబిల్ డౌన్లోడ్ చేయండి';
	@override String get downloadversion => 'డౌన్లోడ్ చేయండి';
	@override String get downloading => 'డౌన్లోడ్ అవుతోంది';
	@override String get failedtodownload => 'డౌన్లోడ్ విఫలమైంది';
	@override String get pleaseclicktoretry => 'దయచేసి మళ్ళీ ప్రయత్నించడానికి క్లిక్ చేయండి.';
	@override String get of => 'యొక్క';
	@override String get nobibleversionshint => 'చూపించడానికి బైబిల్ డేటా లేదు, కనీసం ఒక బైబిల్ వెర్షన్‌ని డౌన్‌లోడ్ చేయడానికి క్రింది బటన్‌ని క్లిక్ చేయండి.';
	@override String get downloaded => 'డౌన్లోడ్ చేయబడింది';
	@override String get enteremailaddresstoresetpassword => 'మీ పాస్‌వర్డ్‌ని రీసెట్ చేయడానికి మీ ఇమెయిల్ చిరునామాను నమోదు చేయండి';
	@override String get backtologin => 'లాగిన్‌కు తిరిగి వెళ్ళండి';
	@override String get signintocontinue => 'కొనసాగించడానికి సైన్ ఇన్ చేయండి';
	@override String get signin => 'సైన్ ఇన్';
	@override String get signinforanaccount => 'ఒక ఖాతాకు సైన్ అప్ చేయండి?';
	@override String get alreadyhaveanaccount => 'ఇప్పటికే ఒక ఖాతా ఉందా?';
	@override String get updateprofile => 'ప్రొఫైల్‌ను నవీకరించండి';
	@override String get updateprofilehint => 'ప్రారంభించడానికి, దయచేసి మీ ప్రొఫైల్ పేజీని నవీకరించండి, ఇది మమ్మల్ని ఇతరులతో కనెక్ట్ చేయడానికి సహాయపడుతుంది';
	@override String get autoplayvideos => 'ఆటోప్లే వీడియోలు';
	@override String get gosocial => 'సోషియల్‌కి వెళ్ళండి';
	@override String get searchbible => 'బైబిల్‌ని శోధించండి';
	@override String get filtersearchoptions => 'శోధన ఎంపికలను ఫిల్టర్ చేయండి';
	@override String get narrowdownsearch => 'ప్రమాణవంతమైన ఫలితానికి కింది ఫిల్టర్ బటన్‌ను ఉపయోగించి శోధనను కుదించండి.';
	@override String get searchbibleversion => 'బైబిల్ వెర్షన్ శోధించండి';
	@override String get searchbiblebook => 'బైబిల్ పుస్తకం శోధించండి';
	@override String get search => 'శోధన';
	@override String get setBibleBook => 'బైబిల్ పుస్తకాన్ని సెట్ చేయండి';
	@override String get oldtestament => 'పాత నిబంధన';
	@override String get newtestament => 'క్రొత్త నిబంధన';
	@override String get limitresults => 'ఫలితాలను పరిమితం చేయండి';
	@override String get setfilters => 'ఫిల్టర్‌లను సెట్ చేయండి';
	@override String get bibletranslator => 'బైబిల్ అనువాదకుడు';
	@override String get chapter => ' అధ్యాయం ';
	@override String get verse => ' వచనం ';
	@override String get translate => 'అనువదించు';
	@override String get bibledownloadinfo => 'బైబిల్ డౌన్‌లోడ్ ప్రారంభమైంది, డౌన్‌లోడ్ పూర్తయ్యే వరకు ఈ పేజీని మూసివేయవద్దు.';
	@override String get received => 'ప్రాప్తి';
	@override String get outoftotal => 'మొత్తం నుండి';
	@override String get set => 'సెట్';
	@override String get selectColor => 'రంగును ఎంచుకోండి';
	@override String get switchbibleversion => 'బైబిల్ వెర్షన్ మార్చండి';
	@override String get switchbiblebook => 'బైబిల్ పుస్తకాన్ని మార్చండి';
	@override String get gotosearch => 'అధ్యాయానికి వెళ్ళండి';
	@override String get changefontsize => 'అక్షరరూప పరిమాణాన్ని మార్చండి';
	@override String get font => 'అక్షరరూపం';
	@override String get readchapter => 'అధ్యాయం చదవండి';
	@override String get showhighlightedverse => 'హైలైట్ చేసిన వచనాలను చూపించు';
	@override String get downloadmoreversions => 'మరిన్ని వెర్షన్‌లను డౌన్‌లోడ్ చేయండి';
	@override String get suggestedusers => 'అనుసరించడానికి సూచించిన వినియోగదారులు';
	@override String get unfollow => 'అనుసరించవద్దు';
	@override String get follow => 'అనుసరించండి';
	@override String get searchforpeople => 'వ్యక్తులను శోధించండి';
	@override String get viewpost => 'పోస్ట్‌ని చూడండి';
	@override String get viewprofile => 'ప్రొఫైల్‌ని చూడండి';
	@override String get mypins => 'నా పిన్స్';
	@override String get viewpinnedposts => 'పిన్న్ చేసిన పోస్ట్‌లను చూడండి';
	@override String get personal => 'వ్యక్తిగత';
	@override String get update => 'నవీకరించు';
	@override String get phonenumber => 'ఫోన్ నంబర్';
	@override String get showmyphonenumber => 'వినియోగదారులకు నా ఫోన్ నంబర్ చూపించు';
	@override String get dateofbirth => 'పుట్టిన తేది';
	@override String get showmyfulldateofbirth => 'నా స్థితిని వీక్షిస్తున్న వ్యక్తులకు నా పూర్తి పుట్టిన తేది చూపించు';
	@override String get notifications => 'నోటిఫికేషన్లు';
	@override String get notifywhenuserfollowsme => 'వినియోగదారుడు నన్ను అనుసరించినప్పుడు నన్ను తెలియజేయండి';
	@override String get notifymewhenusercommentsonmypost => 'వినియోగదారులు నా పోస్ట్‌లపై కామెంట్ చేసినప్పుడు నన్ను తెలియజేయండి';
	@override String get notifymewhenuserlikesmypost => 'వినియోగదారులు నా పోస్ట్‌లను లైక్ చేసినప్పుడు నన్ను తెలియజేయండి';
	@override String get churchsocial => 'చర్చ్ సోషల్';
	@override String get shareyourthoughts => 'మీ ఆలోచనలను పంచుకోండి';
	@override String get readmore => '...మరింత చదవండి';
	@override String get less => ' తక్కువ';
	@override String get couldnotprocess => 'అభ్యర్థనను ప్రాసెస్ చేయడం సాధ్యంకాలేదు.';
	@override String get pleaseselectprofilephoto => 'అప్‌లోడ్ చేయడానికి ప్రొఫైల్ ఫోటోను ఎంచుకోండి';
	@override String get pleaseselectprofilecover => 'దయచేసి కవర్ ఫోటోను ఎంచుకోండి';
	@override String get updateprofileerrorhint => 'కొనసాగించడానికి మీ పేరు, పుట్టిన తేది, లింగం, ఫోన్ మరియు ప్రదేశాన్ని పూర్తి చేయాలి.';
	@override String get gender => 'లింగం';
	@override String get male => 'పురుషుడు';
	@override String get female => 'స్త్రీ';
	@override String get dob => 'పుట్టిన తేదీ';
	@override String get location => 'ప్రస్తుత స్థానం';
	@override String get qualification => 'అర్హత';
	@override String get aboutme => 'నా గురించి';
	@override String get facebookprofilelink => 'ఫేస్బుక్ ప్రొఫైల్ లింక్';
	@override String get twitterprofilelink => 'ట్విట్టర్ ప్రొఫైల్ లింక్';
	@override String get linkdln => 'లింక్డిన్ ప్రొఫైల్ లింక్';
	@override String get likes => 'ఇష్టాలు';
	@override String get likess => 'ఇష్టాలు';
	@override String get pinnedposts => 'పిన్నెడ్ పోస్ట్‌లు';
	@override String get unpinpost => 'పిన్నెడ్ పోస్ట్‌ని తీసివేయి';
	@override String get unpinposthint => 'ఈ పోస్ట్‌ని మీ పిన్నెడ్ పోస్ట్‌ల నుండి తీసివేయాలనుకుంటున్నారా?';
	@override String get postdetails => 'పోస్ట్ వివరాలు';
	@override String get posts => 'పోస్ట్‌లు';
	@override String get followers => 'అనుచరులు';
	@override String get followings => 'అనుసరణలు';
	@override String get my => 'నా';
	@override String get edit => 'మార్చు';
	@override String get delete => 'తొలగించు';
	@override String get deletepost => 'పోస్ట్‌ని తొలగించు';
	@override String get deleteposthint => 'మీరు ఈ పోస్ట్‌ని తొలగించాలనుకుంటున్నారా? కొన్ని వినియోగదారుల ఫీడ్స్‌లో పోస్ట్‌లు ఇంకా కనిపించవచ్చు.';
	@override String get maximumallowedsizehint => 'అనుమతించిన అప్‌లోడ్ ఫైల్ పరిమితిని చేరుకుంది';
	@override String get maximumuploadsizehint => 'ఎంపిక చేసిన ఫైల్ అనుమతించిన అప్‌లోడ్ ఫైల్ పరిమితికి కాస్త ఎక్కువ.';
	@override String get makeposterror => 'ప్రస్తుతం పోస్ట్ చేయడం సాధ్యం కాదు, మళ్లీ ప్రయత్నించడానికి క్లిక్ చేయండి.';
	@override String get makepost => 'పోస్ట్ చేయండి';
	@override String get selectfile => 'ఫైల్‌ని ఎంచుకోండి';
	@override String get images => 'చిత్రాలు';
	@override String get shareYourThoughtsNow => 'మీ ఆలోచనలను ఇప్పుడు పంచుకోండి...';
	@override String get photoviewer => 'ఫోటో వీయర్';
	@override String get nochatsavailable => 'ముట్టడి చేయడానికి సంభాషణలు లేవు \nకింద ఉన్న చిహ్నాన్ని క్లిక్ చేసి చాట్‌కి స్నేహితులను ఎంచుకోండి';
	@override String get typing => 'టైపింగ్...';
	@override String get photo => 'ఫోటో';
	@override String get online => 'ఆన్లైన్';
	@override String get offline => 'ఆఫ్లైన్';
	@override String get lastseen => 'చివరిసారిగా చూసింది';
	@override String get deleteselectedhint => 'ఈ చర్య ఎంపిక చేసిన సందేశాలను తొలగిస్తుంది. దయచేసి గమనించండి, ఇది మీ భాగంలో ఉన్న సంభాషణని మాత్రమే తొలగిస్తుంది,\n సందేశాలు ఇంకా మీ భాగస్వామి యొక్క పరికరంలో కనిపిస్తాయి.';
	@override String get deleteselected => 'ఎంపిక చేసిన వాటిని తొలగించండి';
	@override String get unabletofetchconversation => 'మీ సంభాషణని పొందలేకపోయాం \n';
	@override String get loadmoreconversation => 'మరింత సంభాషణని లోడ్ చేయండి';
	@override String get sendyourfirstmessage => 'మీ మొదటి సందేశాన్ని పంపండి \n';
	@override String get unblock => 'అన్‌బ్లాక్ చేయండి ';
	@override String get block => 'బ్లాక్ చేయండి';
	@override String get writeyourmessage => 'మీ సందేశాన్ని రాయండి...';
	@override String get clearconversation => 'సంభాషణని తొలగించండి';
	@override String get clearconversationhintone => 'ఈ చర్య మీ అన్ని సంభాషణలను తొలగిస్తుంది ';
	@override String get clearconversationhinttwo => '.\n దయచేసి గమనించండి, ఇది మీ భాగంలో ఉన్న సంభాషణని మాత్రమే తొలగిస్తుంది, సందేశాలు ఇంకా మీ భాగస్వామి యొక్క పరికరంలో కనిపిస్తాయి.';
	@override String get facebookloginerror => 'లాగిన్ ప్రక్రియలో ఏదో తేడా జరిగింది.\n ఇది ఫేస్‌బుక్ మాకు ఇచ్చిన లోపం';
	@override String get selectLanguage => 'భాషను ఎంచుకోండి';
	@override String get howTo => 'ఎలా';
	@override String get noBibleTextsAvailable => 'ఎటువంటి బైబిల్ గ్రంథాలు అందుబాటులో లేవు';
	@override String get languages => 'భాషలు';
	@override String get searchLanguages => 'భాషలు శోధించండి...';
	@override String get biblesFilesets => 'బైబిల్స్: {bibles}, ఫైల్సెట్లను: {filesets}';
	@override String get oldTestament => 'పాత నిబంధన';
	@override String get newTestament => 'కొత్త నిబంధన';
	@override String get play => 'ఆడించు';
	@override String get no_verse_content => 'ప్రదర్శించడానికి బైబిల్ వాక్య కంటెంట్ అందుబాటులో లేదు.';
	@override String get no_audio_content => 'ప్రదర్శించడానికి బైబిల్ ఆడియో కంటెంట్ అందుబాటులో లేదు.';
}

// Path: <root>
class _StringsUr implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsUr.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsUr _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'میرا ورچوئل پادری';
	@override String get selectlanguage => 'زبان منتخب کریں';
	@override String get deletemyaccount => 'میرا اکاؤنٹ حذف کریں';
	@override String get deleteaccount => 'اکاؤنٹ حذف کریں';
	@override String get deleteaccounthint => 'یہ عمل آپ کے اکاؤنٹ اور آپ کے تمام ڈیٹا کو حذف کر دے گا، ایک بار حذف کیا گیا ڈیٹا بازیافت نہیں کیا جا سکتا۔';
	@override String get deleteaccountsuccess => 'اکاؤنٹ حذف کرنا کامیاب رہا';
	@override String get chooseapplanguage => 'ایپ کی زبان منتخب کریں';
	@override String get nightmode => 'نائٹ موڈ';
	@override String get initializingapp => 'شروع کیا جا رہا ہے...';
	@override String get home => 'ہوم';
	@override String get branches => 'برانچز';
	@override String get inbox => 'ان باکس';
	@override String get downloads => 'ڈاؤن لوڈز';
	@override String get settings => 'سیٹنگز';
	@override String get events => 'ایونٹس';
	@override String get myplaylists => 'میری پلے لسٹ';
	@override String get website => 'ویب سائٹ';
	@override String get hymns => 'حمد';
	@override String get articles => 'مضامین';
	@override String get notes => 'نوٹس';
	@override String get donate => 'عطیہ کریں';
	@override String get offering => 'نذرانہ';
	@override String get savenotetitle => 'نوٹ کا عنوان محفوظ کریں';
	@override String get nonotesfound => 'کوئی نوٹس نہیں ملے';
	@override String get newnote => 'نیا';
	@override String get deletenote => 'نوٹ حذف کریں';
	@override String get deletenotehint => 'کیا آپ یہ نوٹ حذف کرنا چاہتے ہیں؟ اس عمل کو واپس نہیں کیا جا سکتا۔';
	@override String get bookmarks => 'بک مارکس';
	@override String get socialplatforms => 'سوشل پلیٹ فارمز';
	@override List<String> get onboardingpagetitles => [
		'میرے چرچ میں خوش آمدید',
		'خصوصیات سے بھرپور',
		'آڈیو، ویڈیو \n اور لائیو اسٹریم',
		'اکاؤنٹ بنائیں',
	];
	@override List<String> get onboardingpagehints => [
		'اتوار کی صبح اور آپ کے چرچ کی چار دیواری سے آگے جائیں۔ موبائل پر مبنی دنیا کے ساتھ بات چیت اور مشغول ہونے کے لیے آپ کو جو کچھ بھی درکار ہے۔',
		'ہم نے آپ کے چرچ ایپ کے لیے تمام اعلیٰ خصوصیات کو اکٹھا کیا ہے۔ واقعات، حمد، نوٹیفیکیشنز، نوٹس اور ملٹی ورژن بائبل۔',
		'دنیا بھر کے صارفین کو آپ کی چرچ کی خدمات کی لائیو اسٹریم دیکھنے، آڈیو پیغامات سننے اور ویڈیوز دیکھنے کی اجازت دیں۔',
		'ایک نہ ختم ہونے والے عبادت کے تجربے کا آغاز کریں۔',
	];
	@override String get next => 'اگلا';
	@override String get done => 'شروع کریں';
	@override String get quitapp => 'ایپ بند کریں!';
	@override String get quitappwarning => 'کیا آپ ایپ بند کرنا چاہتے ہیں؟';
	@override String get quitappaudiowarning => 'آپ اس وقت ایک آڈیو چلا رہے ہیں، ایپ بند کرنے سے آڈیو پلے بیک رک جائے گا۔ اگر آپ پلے بیک کو روکنا نہیں چاہتے ہیں تو بس ایپ کو سنٹر بٹن سے کم سے کم کریں یا ایپ کو ابھی بند کرنے کے لیے اوکے بٹن پر کلک کریں۔';
	@override String get ok => 'ٹھیک ہے';
	@override String get retry => 'دوبارہ کوشش کریں';
	@override String get oops => 'اوہ!';
	@override String get save => 'محفوظ کریں';
	@override String get cancel => 'منسوخ کریں';
	@override String get error => 'خرابی';
	@override String get success => 'کامیابی';
	@override String get skip => 'چھوڑ دیں';
	@override String get skiplogin => 'لاگ ان چھوڑ دیں';
	@override String get skipregister => 'رجسٹریشن چھوڑ دیں';
	@override String get dataloaderror => 'فی الحال درخواست کردہ ڈیٹا لوڈ نہیں کیا جا سکتا، اپنے ڈیٹا کنکشن کو چیک کریں اور دوبارہ کوشش کرنے کے لیے کلک کریں۔';
	@override String get suggestedforyou => 'آپ کے لیے تجویز کردہ';
	@override String get videomessages => 'ویڈیو پیغامات';
	@override String get audiomessages => 'آڈیو پیغامات';
	@override String get devotionals => 'عبادت';
	@override String get categories => 'زمرے';
	@override String get category => 'زمرہ';
	@override String get videos => 'ویڈیوز';
	@override String get audios => 'آڈیوز';
	@override String get biblebooks => 'بائبل';
	@override String get sermons => 'خطبات';
	@override String get tools => 'اوزار';
	@override String get profile => 'پروفائل';
	@override String get audiobible => 'آڈیو بائبل';
	@override String get homesentence => 'آپ کے پادری کے لیے 1 سال، آپ کو اس شخص میں بڑھنے میں مدد کرنے کے لیے جس کے لیے خدا نے آپ کو بلایا ہے۔';
	@override String get livestreams => 'لائیو اسٹریم';
	@override String get radio => 'ریڈیو';
	@override String get allitems => 'تمام آئٹمز';
	@override String get emptyplaylist => 'کوئی پلے لسٹ نہیں';
	@override String get notsupported => 'مدد نہیں دی گئی';
	@override String get cleanupresources => 'وسائل کو صاف کیا جا رہا ہے';
	@override String get grantstoragepermission => 'جاری رکھنے کے لیے براہ کرم اسٹوریج تک رسائی کی اجازت دیں';
	@override String get sharefiletitle => 'دیکھیں یا سنیں ';
	@override String get sharefilebody => 'MyVirtualPastor ایپ کے ذریعے، ابھی ڈاؤن لوڈ کریں ';
	@override String get sharetext => 'لامحدود آڈیو اور ویڈیو سٹریمنگ کا لطف اٹھائیں';
	@override String get sharetexthint => 'ہم آپ کے لیے ایک ویڈیو اور آڈیو سٹریمنگ پلیٹ فارم فراہم کرتے ہیں جس سے آپ دنیا بھر سے لاکھوں فائلیں دیکھ اور سن سکتے ہیں۔ ابھی ڈاؤن لوڈ کریں ';
	@override String get download => 'ڈاؤن لوڈ کریں';
	@override String get addplaylist => 'پلے لسٹ میں شامل کریں';
	@override String get bookmark => 'بک مارک';
	@override String get unbookmark => 'بک مارک ہٹائیں';
	@override String get share => 'شیئر کریں';
	@override String get deletemedia => 'فائل حذف کریں';
	@override String get deletemediahint => 'کیا آپ اس ڈاؤن لوڈ کردہ فائل کو حذف کرنا چاہتے ہیں؟ اس عمل کو واپس نہیں کیا جا سکتا۔';
	@override String get searchhint => 'آڈیو اور ویڈیو پیغامات تلاش کریں';
	@override String get performingsearch => 'آڈیوز اور ویڈیوز تلاش کر رہے ہیں';
	@override String get nosearchresult => 'کوئی نتیجہ نہیں ملا';
	@override String get nosearchresulthint => 'زیادہ عام کلیدی لفظ درج کرنے کی کوشش کریں';
	@override String get addtoplaylist => 'پلے لسٹ میں شامل کریں';
	@override String get newplaylist => 'نئی پلے لسٹ';
	@override String get playlistitm => 'پلے لسٹ';
	@override String get mediaaddedtoplaylist => 'میڈیا کو پلے لسٹ میں شامل کیا گیا ہے۔';
	@override String get mediaremovedfromplaylist => 'میڈیا کو پلے لسٹ سے ہٹا دیا گیا ہے';
	@override String get clearplaylistmedias => 'تمام میڈیا کو صاف کریں';
	@override String get deletePlayList => 'پلے لسٹ حذف کریں';
	@override String get clearplaylistmediashint => 'کیا آپ اس پلے لسٹ سے تمام میڈیا کو ہٹانا چاہتے ہیں؟';
	@override String get deletePlayListhint => 'کیا آپ اس پلے لسٹ کو حذف کرنا اور تمام میڈیا کو صاف کرنا چاہتے ہیں؟';
	@override String get comments => 'تبصرے';
	@override String get replies => 'جوابات';
	@override String get reply => 'جواب';
	@override String get logintoaddcomment => 'تبصرہ شامل کرنے کے لیے لاگ ان کریں';
	@override String get logintoreply => 'جواب دینے کے لیے لاگ ان کریں';
	@override String get writeamessage => 'ایک پیغام لکھیں...';
	@override String get nocomments => 'کوئی تبصرے نہیں ملے \nدوبارہ کوشش کرنے کے لیے کلک کریں';
	@override String get errormakingcomments => 'اس وقت تبصرہ کرنا ممکن نہیں ہے..';
	@override String get errordeletingcomments => 'اس وقت اس تبصرے کو حذف کرنا ممکن نہیں ہے..';
	@override String get erroreditingcomments => 'اس وقت اس تبصرے کو ترمیم کرنا ممکن نہیں ہے..';
	@override String get errorloadingmorecomments => 'اس وقت مزید تبصرے لوڈ کرنا ممکن نہیں ہے..';
	@override String get deletingcomment => 'تبصرہ حذف کیا جا رہا ہے';
	@override String get editingcomment => 'تبصرہ ترمیم کیا جا رہا ہے';
	@override String get deletecommentalert => 'تبصرہ حذف کریں';
	@override String get editcommentalert => 'تبصرہ ترمیم کریں';
	@override String get deletecommentalerttext => 'کیا آپ اس تبصرے کو حذف کرنا چاہتے ہیں؟ اس عمل کو واپس نہیں کیا جا سکتا';
	@override String get loadmore => 'مزید لوڈ کریں';
	@override String get messages => 'پیغامات';
	@override String get guestuser => 'مہمان صارف';
	@override String get fullname => 'پورا نام';
	@override String get emailaddress => 'ای میل پتہ';
	@override String get password => 'پاس ورڈ';
	@override String get repeatpassword => 'پاس ورڈ دوبارہ درج کریں';
	@override String get register => 'رجسٹر کریں';
	@override String get login => 'لاگ ان کریں';
	@override String get logout => 'لاگ آؤٹ کریں';
	@override String get logoutfromapp => 'ایپ سے لاگ آؤٹ کریں؟';
	@override String get logoutfromapphint => 'اگر آپ لاگ ان نہیں کرتے ہیں تو آپ مضامین اور ویڈیوز کو پسند یا تبصرہ نہیں کر سکیں گے۔';
	@override String get gotologin => 'لاگ ان کرنے کے لیے جائیں';
	@override String get resetpassword => 'پاس ورڈ ری سیٹ کریں';
	@override String get logintoaccount => 'پہلے سے ہی ایک اکاؤنٹ ہے؟ لاگ ان کریں';
	@override String get emptyfielderrorhint => 'آپ کو تمام فیلڈز کو بھرنا ہے';
	@override String get invalidemailerrorhint => 'آپ کو ایک صحیح ای میل پتہ درج کرنا ہوگا';
	@override String get passwordsdontmatch => 'پاس ورڈز مطابقت نہیں رکھتے';
	@override String get processingpleasewait => 'پروسیسنگ ہو رہی ہے، براہ کرم انتظار کریں...';
	@override String get createaccount => 'اکاؤنٹ بنائیں';
	@override String get forgotpassword => 'پاس ورڈ بھول گئے؟';
	@override String get orloginwith => 'یا لاگ ان کریں';
	@override String get facebook => 'فیس بک';
	@override String get google => 'گوگل';
	@override String get moreoptions => 'مزید اختیارات';
	@override String get about => 'ہمارے بارے میں';
	@override String get privacy => 'رازداری کی پالیسی';
	@override String get terms => 'ایپ کی شرائط';
	@override String get rate => 'ایپ کی درجہ بندی کریں';
	@override String get version => 'ورژن';
	@override String get pulluploadmore => 'اوپر کھینچیں اور لوڈ کریں';
	@override String get loadfailedretry => 'لوڈ ناکام! دوبارہ کوشش کریں!';
	@override String get releaseloadmore => 'مزید لوڈ کرنے کے لیے ریلیز کریں';
	@override String get nomoredata => 'مزید ڈیٹا نہیں';
	@override String get errorReportingComment => 'تبصرہ رپورٹ کرنے میں خرابی';
	@override String get reportingComment => 'تبصرہ رپورٹ کیا جا رہا ہے';
	@override String get reportcomment => 'رپورٹ اختیارات';
	@override List<String> get reportCommentsList => [
		'ناپسندیدہ تجارتی مواد یا سپیم',
		'فحش یا جنسی واضح مواد',
		'نفرت انگیز تقریر یا گرافک تشدد',
		'ہراساں کرنا یا دھونس',
	];
	@override String get bookmarksMedia => 'میرے بک مارکس';
	@override String get noitemstodisplay => 'دکھانے کے لیے کوئی آئٹمز نہیں ہیں';
	@override String get loginrequired => 'لاگ ان ضروری ہے';
	@override String get loginrequiredhint => 'اس پلیٹ فارم پر سبسکرائب کرنے کے لیے، آپ کو لاگ ان کرنا ہوگا۔ ابھی مفت اکاؤنٹ بنائیں یا اپنے موجودہ اکاؤنٹ میں لاگ ان کریں۔';
	@override String get subscriptions => 'ایپ سبسکرپشنز';
	@override String get subscribe => 'سبسکرائب کریں';
	@override String get subscribehint => 'سبسکرپشن ضروری ہے';
	@override String get playsubscriptionrequiredhint => 'اس میڈیا کو سننے یا دیکھنے کے لیے آپ کو سبسکرپشن کی ضرورت ہے۔';
	@override String get previewsubscriptionrequiredhint => 'آپ اس میڈیا کے لیے اجازت شدہ پیش نظارہ مدت تک پہنچ چکے ہیں۔ سننے یا دیکھنے کے لیے آپ کو سبسکرپشن کی ضرورت ہے۔';
	@override String get copiedtoclipboard => 'کلپ بورڈ پر کاپی کیا گیا';
	@override String get downloadbible => 'بائبل ڈاؤن لوڈ کریں';
	@override String get downloadversion => 'ڈاؤن لوڈ کریں';
	@override String get downloading => 'ڈاؤن لوڈ ہو رہا ہے';
	@override String get failedtodownload => 'ڈاؤن لوڈ ناکام';
	@override String get pleaseclicktoretry => 'دوبارہ کوشش کرنے کے لیے کلک کریں۔';
	@override String get of => 'کا';
	@override String get nobibleversionshint => 'دکھانے کے لیے کوئی بائبل ڈیٹا نہیں ہے، کم از کم ایک بائبل ورژن ڈاؤن لوڈ کرنے کے لیے نیچے دیے گئے بٹن پر کلک کریں۔';
	@override String get downloaded => 'ڈاؤن لوڈ کیا گیا';
	@override String get enteremailaddresstoresetpassword => 'اپنا پاس ورڈ ری سیٹ کرنے کے لیے اپنا ای میل پتہ درج کریں';
	@override String get backtologin => 'لاگ ان پر واپس جائیں';
	@override String get signintocontinue => 'جاری رکھنے کے لیے سائن ان کریں';
	@override String get signin => 'سائن ان';
	@override String get signinforanaccount => 'ایک اکاؤنٹ کے لیے سائن اپ کریں؟';
	@override String get alreadyhaveanaccount => 'پہلے سے ہی ایک اکاؤنٹ ہے؟';
	@override String get updateprofile => 'پروفائل کو اپ ڈیٹ کریں';
	@override String get updateprofilehint => 'شروع کرنے کے لیے، براہ کرم اپنا پروفائل پیج اپ ڈیٹ کریں، اس سے ہمیں دوسرے لوگوں سے جڑنے میں مدد ملے گی';
	@override String get autoplayvideos => 'آٹو پلے ویڈیوز';
	@override String get gosocial => 'سوشل پر جائیں';
	@override String get searchbible => 'بائبل تلاش کریں';
	@override String get filtersearchoptions => 'تلاش کے اختیارات کو فلٹر کریں';
	@override String get narrowdownsearch => 'زیادہ درست نتیجہ کے لئے نیچے دیے گئے فلٹر بٹن کو استعمال کر کے تلاش کو کم کریں۔';
	@override String get searchbibleversion => 'بائبل کا ورژن تلاش کریں';
	@override String get searchbiblebook => 'بائبل کی کتاب تلاش کریں';
	@override String get search => 'تلاش';
	@override String get setBibleBook => 'بائبل کی کتاب سیٹ کریں';
	@override String get oldtestament => 'پرانا عہد نامہ';
	@override String get newtestament => 'نیا عہد نامہ';
	@override String get limitresults => 'نتائج کو محدود کریں';
	@override String get setfilters => 'فلٹرز سیٹ کریں';
	@override String get bibletranslator => 'بائبل مترجم';
	@override String get chapter => ' باب ';
	@override String get verse => ' آیت ';
	@override String get translate => 'ترجمہ کریں';
	@override String get bibledownloadinfo => 'بائبل ڈاؤن لوڈ شروع ہو چکی ہے، ڈاؤن لوڈ مکمل ہونے تک اس صفحہ کو بند نہ کریں۔';
	@override String get received => 'موصول';
	@override String get outoftotal => 'کل میں سے';
	@override String get set => 'سیٹ';
	@override String get selectColor => 'رنگ منتخب کریں';
	@override String get switchbibleversion => 'بائبل کا ورژن تبدیل کریں';
	@override String get switchbiblebook => 'بائبل کی کتاب تبدیل کریں';
	@override String get gotosearch => 'باب پر جائیں';
	@override String get changefontsize => 'فونٹ سائز تبدیل کریں';
	@override String get font => 'فونٹ';
	@override String get readchapter => 'باب پڑھیں';
	@override String get showhighlightedverse => 'ہائیلائٹ کی گئی آیت دکھائیں';
	@override String get downloadmoreversions => 'مزید ورژن ڈاؤن لوڈ کریں';
	@override String get suggestedusers => 'تجویز کردہ صارفین';
	@override String get unfollow => 'فالو نہ کریں';
	@override String get follow => 'فالو کریں';
	@override String get searchforpeople => 'لوگوں کو تلاش کریں';
	@override String get viewpost => 'پوسٹ دیکھیں';
	@override String get viewprofile => 'پروفائل دیکھیں';
	@override String get mypins => 'میری پنز';
	@override String get viewpinnedposts => 'پین کی گئی پوسٹس دیکھیں';
	@override String get personal => 'ذاتی';
	@override String get update => 'اپ ڈیٹ';
	@override String get phonenumber => 'فون نمبر';
	@override String get showmyphonenumber => 'میرا فون نمبر دکھائیں';
	@override String get dateofbirth => 'تاریخ پیدائش';
	@override String get showmyfulldateofbirth => 'میری اسٹیٹس دیکھنے والوں کو میری مکمل تاریخ پیدائش دکھائیں';
	@override String get notifications => 'اطلاعات';
	@override String get notifywhenuserfollowsme => 'جب کوئی صارف مجھے فالو کرے تو مطلع کریں';
	@override String get notifymewhenusercommentsonmypost => 'جب صارف میری پوسٹ پر تبصرہ کریں تو مطلع کریں';
	@override String get notifymewhenuserlikesmypost => 'جب صارف میری پوسٹ کو پسند کریں تو مطلع کریں';
	@override String get churchsocial => 'چرچ سوشل';
	@override String get shareyourthoughts => 'اپنے خیالات کا اشتراک کریں';
	@override String get readmore => '...مزید پڑھیں';
	@override String get less => ' کم';
	@override String get couldnotprocess => 'درخواست پر عمل نہیں ہو سکا۔';
	@override String get pleaseselectprofilephoto => 'پروفائل فوٹو اپ لوڈ کرنے کے لیے منتخب کریں';
	@override String get pleaseselectprofilecover => 'براہ کرم کور فوٹو منتخب کریں';
	@override String get updateprofileerrorhint => 'جاری رکھنے کے لئے اپنا نام، تاریخ پیدائش، جنس، فون اور مقام کو پُر کریں۔';
	@override String get gender => 'جنس';
	@override String get male => 'مرد';
	@override String get female => 'عورت';
	@override String get dob => 'تاریخ پیدائش';
	@override String get location => 'موجودہ مقام';
	@override String get qualification => 'قابلیت';
	@override String get aboutme => 'میرے بارے میں';
	@override String get facebookprofilelink => 'فیس بک پروفائل لنک';
	@override String get twitterprofilelink => 'ٹوئٹر پروفائل لنک';
	@override String get linkdln => 'لنکڈن پروفائل لنک';
	@override String get likes => 'پسند';
	@override String get likess => 'پسندیدگیاں';
	@override String get pinnedposts => 'پن کی گئی پوسٹس';
	@override String get unpinpost => 'پن ہٹائیں';
	@override String get unpinposthint => 'کیا آپ اس پوسٹ کو اپنے پن کی گئی پوسٹس سے ہٹانا چاہتے ہیں؟';
	@override String get postdetails => 'پوسٹ کی تفصیلات';
	@override String get posts => 'پوسٹس';
	@override String get followers => 'فالوورز';
	@override String get followings => 'فالووِنگ';
	@override String get my => 'میرا';
	@override String get edit => 'ترمیم';
	@override String get delete => 'حذف کریں';
	@override String get deletepost => 'پوسٹ حذف کریں';
	@override String get deleteposthint => 'کیا آپ اس پوسٹ کو حذف کرنا چاہتے ہیں؟ پوسٹس ابھی بھی کچھ صارفین کی فیڈز میں دکھائی دے سکتی ہیں۔';
	@override String get maximumallowedsizehint => 'اجازت شدہ اپلوڈ فائل سائز کی حد تک پہنچ گئی';
	@override String get maximumuploadsizehint => 'منتخب کردہ فائل اجازت شدہ اپلوڈ فائل سائز کی حد سے بڑی ہے۔';
	@override String get makeposterror => 'اس وقت پوسٹ نہیں کر سکتے، دوبارہ کوشش کرنے کے لئے کلک کریں۔';
	@override String get makepost => 'پوسٹ کریں';
	@override String get selectfile => 'فائل منتخب کریں';
	@override String get images => 'تصاویر';
	@override String get shareYourThoughtsNow => 'ابھی اپنے خیالات کا اشتراک کریں...';
	@override String get photoviewer => 'فوٹو ویوئر';
	@override String get nochatsavailable => 'کوئی دستیاب گفتگو نہیں ہے \n گفتگو منتخب کرنے کے لئے نیچے دیے گئے آئیکن پر کلک کریں';
	@override String get typing => 'ٹائپنگ...';
	@override String get photo => 'تصویر';
	@override String get online => 'آن لائن';
	@override String get offline => 'آف لائن';
	@override String get lastseen => 'آخری بار دیکھا گیا';
	@override String get deleteselectedhint => 'یہ عمل منتخب کردہ پیغامات کو حذف کر دے گا۔ براہ کرم نوٹ کریں کہ یہ آپ کی طرف کی گفتگو کو ہی حذف کرے گا، \n پیغامات ابھی بھی آپ کے پارٹنر کے آلہ پر دکھائی دیں گے۔';
	@override String get deleteselected => 'منتخب کردہ حذف کریں';
	@override String get unabletofetchconversation => 'آپ کی گفتگو حاصل کرنے میں ناکام \n';
	@override String get loadmoreconversation => 'مزید گفتگو لوڈ کریں';
	@override String get sendyourfirstmessage => 'اپنا پہلا پیغام بھیجیں \n';
	@override String get unblock => 'ان بلاک کریں ';
	@override String get block => 'بلاک کریں';
	@override String get writeyourmessage => 'اپنا پیغام لکھیں...';
	@override String get clearconversation => 'گفتگو صاف کریں';
	@override String get clearconversationhintone => 'یہ عمل آپ کی تمام گفتگو صاف کر دے گا ';
	@override String get clearconversationhinttwo => '.\n براہ کرم نوٹ کریں کہ یہ آپ کی طرف کی گفتگو کو ہی صاف کرے گا، پیغامات ابھی بھی آپ کے پارٹنر کے چیٹ میں دکھائی دیں گے۔';
	@override String get facebookloginerror => 'لاگ ان عمل میں کچھ غلط ہو گیا ہے۔\n یہاں فیس بک نے ہمیں دی ہوئی خرابی ہے';
	@override String get selectLanguage => 'زبان منتخب کریں';
	@override String get howTo => 'کیسے';
	@override String get noBibleTextsAvailable => 'کوئی بائبل کے متن دستیاب نہیں ہیں';
	@override String get languages => 'زبانیں';
	@override String get searchLanguages => 'زبانیں تلاش کریں...';
	@override String get biblesFilesets => 'بائبل: {bibles}, فائلسیٹ: {filesets}';
	@override String get oldTestament => 'پرانا عہد نامہ';
	@override String get newTestament => 'نیا عہد نامہ';
	@override String get play => 'چلائیں';
	@override String get no_verse_content => 'دکھانے کے لئے کوئی بائبل کی آیت کا مواد دستیاب نہیں ہے۔';
	@override String get no_audio_content => 'دکھانے کے لئے کوئی بائبل کی آڈیو مواد دستیاب نہیں ہے۔';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'VirtualPastor',
			'selectlanguage': 'selectLanguage',
			'deletemyaccount': 'Delete my account',
			'deleteaccount': 'Delete my account',
			'deleteaccounthint': 'This action will delete your account and remove all your data, once your data is deleted, it cannot be recovered.',
			'deleteaccountsuccess': 'Account deletion was succesful',
			'chooseapplanguage': 'Choose App Language',
			'nightmode': 'Night Mode',
			'initializingapp': 'initializing...',
			'home': 'Home',
			'branches': 'Branches',
			'inbox': 'Inbox',
			'downloads': 'Downloads',
			'settings': 'Settings',
			'events': 'Events',
			'myplaylists': 'My Playlists',
			'website': 'Website',
			'hymns': 'Hymns',
			'articles': 'Articles',
			'notes': 'Notes',
			'donate': 'Donate',
			'offering': 'Offering',
			'savenotetitle': 'Note Title',
			'nonotesfound': 'No notes found',
			'newnote': 'New',
			'deletenote': 'Delete Note',
			'deletenotehint': 'Do you want to delete this note? This action cannot be reversed.',
			'bookmarks': 'Bookmarks',
			'socialplatforms': 'Social Platforms',
			'onboardingpagetitles.0': 'Welcome to MyChurch',
			'onboardingpagetitles.1': 'Packed with Features',
			'onboardingpagetitles.2': 'Audio, Video \n and Live Streaming',
			'onboardingpagetitles.3': 'Create Account',
			'onboardingpagehints.0': 'Extend beyond the Sunday mornings &amp; the four walls of your church. Everything you need to communicate and engage with a mobile-focused world.',
			'onboardingpagehints.1': 'We have brought together all of the top features that your church app must have. Events, Devotionals, Notifications, Notes and multi-version bible.',
			'onboardingpagehints.2': 'Allow users across the globe watch videos, listen to audio messages and watch live streams of your church services.',
			'onboardingpagehints.3': 'Start your journey to a never-ending worship experience.',
			'next': 'NEXT',
			'done': 'Get Started',
			'quitapp': 'Quit App!',
			'quitappwarning': 'Do you wish to close the app?',
			'quitappaudiowarning': 'You are currently playing an audio, quitting the app will stop the audio playback. If you do not wish to stop playback, just minimize the app with the center button or click the Ok button to quit app now.',
			'ok': 'Ok',
			'retry': 'RETRY',
			'oops': 'Ooops!',
			'save': 'Save',
			'cancel': 'Cancel',
			'error': 'Error',
			'success': 'Success',
			'skip': 'Skip',
			'skiplogin': 'Skip Login',
			'skipregister': 'Skip Registration',
			'dataloaderror': 'Could not load requested data at the moment, check your data connection and click to retry.',
			'suggestedforyou': 'Suggested for you',
			'videomessages': 'Video Messages',
			'audiomessages': 'Audio Messages',
			'devotionals': 'Devotionals',
			'categories': 'Categories',
			'category': 'Category',
			'videos': 'Videos',
			'audios': 'Audios',
			'biblebooks': 'Bible',
			'sermons': 'Sermons',
			'tools': 'Tools',
			'profile': 'Profile',
			'audiobible': 'Audio Bible',
			'homesentence': 'Your Pastor for a Year: Helping You Grow into Your Calling',
			'livestreams': 'Livestreams',
			'radio': 'Radio',
			'allitems': 'All Items',
			'emptyplaylist': 'No Playlists',
			'notsupported': 'Not Supported',
			'cleanupresources': 'Cleaning up resources',
			'grantstoragepermission': 'Please grant accessing storage permission to continue',
			'sharefiletitle': 'Watch or Listen to ',
			'sharefilebody': 'Via MyVirtualPastor App, Download now at ',
			'sharetext': 'Enjoy unlimited Audio & Video streaming',
			'sharetexthint': 'Join the Video and Audio streaming platform that lets you watch and listen to millions of files from around the world. Download now at',
			'download': 'Download',
			'addplaylist': 'Add to playlist',
			'bookmark': 'Bookmark',
			'unbookmark': 'UnBookmark',
			'share': 'Share',
			'deletemedia': 'Delete File',
			'deletemediahint': 'Do you wish to delete this downloaded file? This action cannot be undone.',
			'searchhint': 'Search Audio & Video Messages',
			'performingsearch': 'Searching Audios and Videos',
			'nosearchresult': 'No results Found',
			'nosearchresulthint': 'Try input more general keyword',
			'addtoplaylist': 'Add to playlist',
			'newplaylist': 'New playlist',
			'playlistitm': 'Playlist',
			'mediaaddedtoplaylist': 'Media added to playlist.',
			'mediaremovedfromplaylist': 'Media removed from playlist',
			'clearplaylistmedias': 'Clear All Media',
			'deletePlayList': 'Delete Playlist',
			'clearplaylistmediashint': 'Go ahead and remove all media from this playlist?',
			'deletePlayListhint': 'Go ahead and delete this playlist and clear all media?',
			'comments': 'Comments',
			'replies': 'Replies',
			'reply': 'Reply',
			'logintoaddcomment': 'Login to add a comment',
			'logintoreply': 'Login to reply',
			'writeamessage': 'Write a message...',
			'nocomments': 'No Comments found \nclick to retry',
			'errormakingcomments': 'Cannot process commenting at the moment..',
			'errordeletingcomments': 'Cannot delete this comment at the moment..',
			'erroreditingcomments': 'Cannot edit this comment at the moment..',
			'errorloadingmorecomments': 'Cannot load more comments at the moment..',
			'deletingcomment': 'Deleting comment',
			'editingcomment': 'Editing comment',
			'deletecommentalert': 'Delete Comment',
			'editcommentalert': 'Edit Comment',
			'deletecommentalerttext': 'Do you wish to delete this comment? This action cannot be undone',
			'loadmore': 'load more',
			'messages': 'Messages',
			'guestuser': 'Guest User',
			'fullname': 'Full Name',
			'emailaddress': 'Email Address',
			'password': 'Password',
			'repeatpassword': 'Repeat Password',
			'register': 'Register',
			'login': 'Login',
			'logout': 'Logout',
			'logoutfromapp': 'Logout from app?',
			'logoutfromapphint': 'You wont be able to like or comment on articles and videos if you are not logged in.',
			'gotologin': 'Go to Login',
			'resetpassword': 'Reset Password',
			'logintoaccount': 'Already have an account? Login',
			'emptyfielderrorhint': 'You need to fill all the fields',
			'invalidemailerrorhint': 'You need to enter a valid email address',
			'passwordsdontmatch': 'Passwords dont match',
			'processingpleasewait': 'Processing, Please wait...',
			'createaccount': 'Create an account',
			'forgotpassword': 'Forgot Password?',
			'orloginwith': 'Or Login With',
			'facebook': 'Facebook',
			'google': 'Google',
			'moreoptions': 'More Options',
			'about': 'About Us',
			'privacy': 'Privacy Policy',
			'terms': 'App Terms',
			'rate': 'Rate App',
			'version': 'Version',
			'pulluploadmore': 'pull up load',
			'loadfailedretry': 'Load Failed!Click retry!',
			'releaseloadmore': 'release to load more',
			'nomoredata': 'No more Data',
			'errorReportingComment': 'Error Reporting Comment',
			'reportingComment': 'Reporting Comment',
			'reportcomment': 'Report Options',
			'reportCommentsList.0': 'Unwanted commercial content or spam',
			'reportCommentsList.1': 'Pornography or sexual explicit material',
			'reportCommentsList.2': 'Hate speech or graphic violence',
			'reportCommentsList.3': 'Harassment or bullying',
			'bookmarksMedia': 'My Bookmarks',
			'noitemstodisplay': 'No Items To Display',
			'loginrequired': 'Login Required',
			'loginrequiredhint': 'To subscribe on this platform, you need to be logged in. Create a free account now or log in to your existing account.',
			'subscriptions': 'App Subscriptions',
			'subscribe': 'SUBSCRIBE',
			'subscribehint': 'Subscription Required',
			'playsubscriptionrequiredhint': 'You need to subscribe before you can listen to or watch this media.',
			'previewsubscriptionrequiredhint': 'You have reached the allowed preview duration for this media. You need to subscribe to continue listening or watching this media.',
			'copiedtoclipboard': 'Copied to clipboard',
			'downloadbible': 'Download Bible',
			'downloadversion': 'Download',
			'downloading': 'Downloading',
			'failedtodownload': 'Failed to download',
			'pleaseclicktoretry': 'Please click to retry.',
			'of': 'Of',
			'nobibleversionshint': 'There is no bible data to display, click on the button below to download atleast one bible version.',
			'downloaded': 'Downloaded',
			'enteremailaddresstoresetpassword': 'Enter your email to reset your password',
			'backtologin': 'BACK TO LOGIN',
			'signintocontinue': 'Sign in to continue',
			'signin': 'S I G N  I N',
			'signinforanaccount': 'SIGN UP FOR AN ACCOUNT?',
			'alreadyhaveanaccount': 'Already have an account?',
			'updateprofile': 'Update Profile',
			'updateprofilehint': 'To get started, please update your profile page, this will help us in connecting you with other people',
			'autoplayvideos': 'AutoPlay Videos',
			'gosocial': 'Go Social',
			'searchbible': 'Search Bible',
			'filtersearchoptions': 'Filter Search Options',
			'narrowdownsearch': 'Use the filter button below to narrow down search for a more precise result.',
			'searchbibleversion': 'Search Bible Version',
			'searchbiblebook': 'Search Bible Book',
			'search': 'Search',
			'setBibleBook': 'Set Bible Book',
			'oldtestament': 'Old Testament',
			'newtestament': 'New Testament',
			'limitresults': 'Limit Results',
			'setfilters': 'Set Filters',
			'bibletranslator': 'Bible Translator',
			'chapter': ' Chapter ',
			'verse': ' Verse ',
			'translate': 'translate',
			'bibledownloadinfo': 'Bible Download started, Please do not close this page until the download is done.',
			'received': 'received',
			'outoftotal': 'out of total',
			'set': 'SET',
			'selectColor': 'Select Color',
			'switchbibleversion': 'Switch Bible Version',
			'switchbiblebook': 'Switch Bible Book',
			'gotosearch': 'Go to Chapter',
			'changefontsize': 'Change Font Size',
			'font': 'Font',
			'readchapter': 'Read Chapter',
			'showhighlightedverse': 'Show Highlighted Verses',
			'downloadmoreversions': 'Download more versions',
			'suggestedusers': 'Suggested users to follow',
			'unfollow': 'UnFollow',
			'follow': 'Follow',
			'searchforpeople': 'Search for people',
			'viewpost': 'View Post',
			'viewprofile': 'View Profile',
			'mypins': 'My Pins',
			'viewpinnedposts': 'View Pinned Posts',
			'personal': 'Personal',
			'update': 'Update',
			'phonenumber': 'Phone Number',
			'showmyphonenumber': 'Show my phone number to users',
			'dateofbirth': 'Date of Birth',
			'showmyfulldateofbirth': 'Show my full date of birth to people viewing my status',
			'notifications': 'Notifications',
			'notifywhenuserfollowsme': 'Notify me when a user follows me',
			'notifymewhenusercommentsonmypost': 'Notify me when users comment on my post',
			'notifymewhenuserlikesmypost': 'Notify me when users like my post',
			'churchsocial': 'Church Social',
			'shareyourthoughts': 'Share your thoughts',
			'readmore': '...Read more',
			'less': ' Less',
			'couldnotprocess': 'Could not process requested action.',
			'pleaseselectprofilephoto': 'Please select a profile photo to upload',
			'pleaseselectprofilecover': 'Please select a cover photo to upload',
			'updateprofileerrorhint': 'You need to fill your name, date of birth, gender, phone and location before you can proceed.',
			'gender': 'Gender',
			'male': 'Male',
			'female': 'Female',
			'dob': 'Date Of Birth',
			'location': 'Current Location',
			'qualification': 'Qualification',
			'aboutme': 'About Me',
			'facebookprofilelink': 'Facebook Profile Link',
			'twitterprofilelink': 'Twitter Profile Link',
			'linkdln': 'Linkedln Profile Link',
			'likes': 'Likes',
			'likess': 'Like(s)',
			'pinnedposts': 'My Pinned Posts',
			'unpinpost': 'Unpin Post',
			'unpinposthint': 'Do you wish to remove this post from your pinned posts?',
			'postdetails': 'Post Details',
			'posts': 'Posts',
			'followers': 'Followers',
			'followings': 'Followings',
			'my': 'My',
			'edit': 'Edit',
			'delete': 'Delete',
			'deletepost': 'Delete Post',
			'deleteposthint': 'Do you wish to delete this post? Posts can still appear on some users feeds.',
			'maximumallowedsizehint': 'Maximum allowed file upload reached',
			'maximumuploadsizehint': 'The selected file exceeds the allowed upload file size limit.',
			'makeposterror': 'Unable to make post at the moment, please click to retry.',
			'makepost': 'Make Post',
			'selectfile': 'Select File',
			'images': 'Images',
			'shareYourThoughtsNow': 'Share your thoughts ...',
			'photoviewer': 'Photo Viewer',
			'nochatsavailable': 'No Conversations available \n Click the add icon below \nto select users to chat with',
			'typing': 'Typing...',
			'photo': 'Photo',
			'online': 'Online',
			'offline': 'Offline',
			'lastseen': 'Last Seen',
			'deleteselectedhint': 'This action will delete the selected messages.  Please note that this only deletes your side of the conversation, \n the messages will still show on your partners device.',
			'deleteselected': 'Delete selected',
			'unabletofetchconversation': 'Unable to Fetch \nyour conversation with \n',
			'loadmoreconversation': 'Load more conversations',
			'sendyourfirstmessage': 'Send your first message to \n',
			'unblock': 'Unblock ',
			'block': 'Block',
			'writeyourmessage': 'Write your message...',
			'clearconversation': 'Clear Conversation',
			'clearconversationhintone': 'This action will clear all your conversation with ',
			'clearconversationhinttwo': '.\n  Please note that this only deletes your side of the conversation, the messages will still show on your partners chat.',
			'facebookloginerror': 'Something went wrong with the login process.\n, Here is the error Facebook gave us',
			'selectLanguage': 'Select Language',
			'howTo': 'How To',
			'noBibleTextsAvailable': 'No Bible texts available',
			'languages': 'Languages',
			'searchLanguages': 'Search languages...',
			'biblesFilesets': 'Bibles: {bibles}, Filesets: {filesets}',
			'oldTestament': 'Old Testament',
			'newTestament': 'New Testament',
			'play': 'play',
			'no_verse_content': 'No Bible verse content available to display.',
			'no_audio_content': 'No Bible Audio content available to display.',
		};
	}
}

extension on _StringsBn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'মাই ভার্চুয়াল পাস্টর',
			'selectlanguage': 'ভাষা নির্বাচন করুন',
			'deletemyaccount': 'আমার অ্যাকাউন্ট মুছুন',
			'deleteaccount': 'আমার অ্যাকাউন্ট মুছুন',
			'deleteaccounthint': 'এই পদক্ষেপটি আপনার অ্যাকাউন্ট মুছে ফেলবে এবং আপনার সমস্ত ডেটা সরিয়ে দেবে, একবার আপনার ডেটা মুছে ফেলা হলে, এটি পুনরুদ্ধার করা যাবে না।',
			'deleteaccountsuccess': 'অ্যাকাউন্ট মুছে ফেলা সফল হয়েছে',
			'chooseapplanguage': 'অ্যাপ ভাষা নির্বাচন করুন',
			'nightmode': 'নাইট মোড',
			'initializingapp': 'প্রারম্ভিক করা হচ্ছে...',
			'home': 'বাড়ি',
			'branches': 'শাখা',
			'inbox': 'ইনবক্স',
			'downloads': 'ডাউনলোড',
			'settings': 'সেটিংস',
			'events': 'ইভেন্টস',
			'myplaylists': 'আমার প্লেলিস্ট',
			'website': 'ওয়েবসাইট',
			'hymns': 'ভজন',
			'articles': 'প্রবন্ধ',
			'notes': 'নোট',
			'donate': 'দান করুন',
			'offering': 'অফারিং',
			'savenotetitle': 'নোট শিরোনাম সংরক্ষণ করুন',
			'nonotesfound': 'কোন নোট পাওয়া যায়নি',
			'newnote': 'নতুন',
			'deletenote': 'নোট মুছুন',
			'deletenotehint': 'আপনি কি এই নোটটি মুছতে চান? এই পদক্ষেপটি উল্টানো যাবে না।',
			'bookmarks': 'বুকমার্কস',
			'socialplatforms': 'সামাজিক প্ল্যাটফর্ম',
			'onboardingpagetitles.0': 'আমাদের চার্চে স্বাগতম',
			'onboardingpagetitles.1': 'বৈশিষ্ট্য সমৃদ্ধ',
			'onboardingpagetitles.2': 'অডিও, ভিডিও \n এবং লাইভ স্ট্রিমিং',
			'onboardingpagetitles.3': 'অ্যাকাউন্ট তৈরি করুন',
			'onboardingpagehints.0': 'রবিবারের সকালে এবং আপনার চার্চের চার দেয়ালের বাইরেও প্রসারিত করুন। একটি মোবাইল-কেন্দ্রিক বিশ্বে যোগাযোগ ও সম্পৃক্ততা বজায় রাখতে যা কিছু দরকার তা সবই এখানে।',
			'onboardingpagehints.1': 'আমরা সব শীর্ষ বৈশিষ্ট্যগুলি একত্রিত করেছি যা আপনার চার্চ অ্যাপে থাকা উচিত। ইভেন্টস, ডিভোশনালস, নোটিফিকেশনস, নোট এবং বহু সংস্করণ বাইবেল।',
			'onboardingpagehints.2': 'ব্যবহারকারীরা সারা বিশ্ব থেকে ভিডিও দেখুন, অডিও বার্তা শুনুন এবং আপনার চার্চ পরিষেবার লাইভ স্ট্রিম দেখুন।',
			'onboardingpagehints.3': 'একটি অন্তহীন উপাসনা অভিজ্ঞতার পথে আপনার যাত্রা শুরু করুন।',
			'next': 'পরবর্তী',
			'done': 'শুরু করুন',
			'quitapp': 'অ্যাপ বন্ধ করুন!',
			'quitappwarning': 'আপনি কি অ্যাপ বন্ধ করতে চান?',
			'quitappaudiowarning': 'আপনি বর্তমানে একটি অডিও প্লে করছেন, অ্যাপ বন্ধ করলে অডিও প্লেব্যাক বন্ধ হবে। যদি আপনি প্লেব্যাক বন্ধ করতে না চান, তবে কেন্দ্রীয় বোতাম দিয়ে অ্যাপটি মিনিমাইজ করুন বা এখন অ্যাপ বন্ধ করতে ঠিক বোতামটি ক্লিক করুন।',
			'ok': 'ঠিক আছে',
			'retry': 'পুনরায় চেষ্টা করুন',
			'oops': 'ওপ্স!',
			'save': 'সংরক্ষণ করুন',
			'cancel': 'বাতিল করুন',
			'error': 'ত্রুটি',
			'success': 'সাফল্য',
			'skip': 'এড়িয়ে যান',
			'skiplogin': 'লগইন এড়িয়ে যান',
			'skipregister': 'নিবন্ধন এড়িয়ে যান',
			'dataloaderror': 'এই মুহূর্তে অনুরোধকৃত ডেটা লোড করতে পারিনি, আপনার ডেটা সংযোগ পরীক্ষা করুন এবং পুনরায় চেষ্টা করতে ক্লিক করুন।',
			'suggestedforyou': 'আপনার জন্য সুপারিশকৃত',
			'videomessages': 'ভিডিও বার্তা',
			'audiomessages': 'অডিও বার্তা',
			'devotionals': 'ভক্তিমূলক',
			'categories': 'বিভাগ',
			'category': 'বিভাগ',
			'videos': 'ভিডিও',
			'audios': 'অডিও',
			'biblebooks': 'বাইবেল',
			'sermons': 'ধর্মোপদেশ',
			'tools': 'সরঞ্জাম',
			'profile': 'প্রোফাইল',
			'audiobible': 'অডিও বাইবেল',
			'homesentence': 'আপনার পাস্টর 1 বছরের জন্য, আপনাকে এমন একজন ব্যক্তিতে পরিণত করতে সাহায্য করবে যাকে ঈশ্বর আপনাকে ডাক দিয়েছেন।',
			'livestreams': 'লাইভ স্ট্রিম',
			'radio': 'রেডিও',
			'allitems': 'সব আইটেম',
			'emptyplaylist': 'কোন প্লেলিস্ট নেই',
			'notsupported': 'সমর্থিত নয়',
			'cleanupresources': 'সম্পদগুলি পরিস্কার করা হচ্ছে',
			'grantstoragepermission': 'চালিয়ে যেতে দয়া করে সংরক্ষণ অনুমতি দিন',
			'sharefiletitle': 'দেখুন বা শুনুন ',
			'sharefilebody': 'মাই ভার্চুয়াল পাস্টর অ্যাপ দ্বারা, এখন ডাউনলোড করুন ',
			'sharetext': 'সীমাহীন অডিও ও ভিডিও স্ট্রিমিং উপভোগ করুন',
			'sharetexthint': 'ভিডিও এবং অডিও স্ট্রিমিং প্ল্যাটফর্মে যোগদান করুন যা আপনাকে সারা বিশ্বের লক্ষ লক্ষ ফাইল দেখতে এবং শুনতে দেয়। এখন ডাউনলোড করুন',
			'download': 'ডাউনলোড',
			'addplaylist': 'প্লেলিস্টে যোগ করুন',
			'bookmark': 'বুকমার্ক',
			'unbookmark': 'আনবুকমার্ক',
			'share': 'শেয়ার করুন',
			'deletemedia': 'ফাইল মুছুন',
			'deletemediahint': 'আপনি কি এই ডাউনলোড করা ফাইলটি মুছতে চান? এই পদক্ষেপটি উল্টানো যাবে না।',
			'searchhint': 'অডিও ও ভিডিও বার্তা অনুসন্ধান করুন',
			'performingsearch': 'অডিও এবং ভিডিও অনুসন্ধান করা হচ্ছে',
			'nosearchresult': 'কোন ফলাফল পাওয়া যায়নি',
			'nosearchresulthint': 'আরও সাধারণ কীওয়ার্ড প্রবেশ করার চেষ্টা করুন',
			'addtoplaylist': 'প্লেলিস্টে যোগ করুন',
			'newplaylist': 'নতুন প্লেলিস্ট',
			'playlistitm': 'প্লেলিস্ট',
			'mediaaddedtoplaylist': 'প্লেলিস্টে মিডিয়া যোগ করা হয়েছে।',
			'mediaremovedfromplaylist': 'প্লেলিস্ট থেকে মিডিয়া সরানো হয়েছে',
			'clearplaylistmedias': 'সব মিডিয়া পরিষ্কার করুন',
			'deletePlayList': 'প্লেলিস্ট মুছুন',
			'clearplaylistmediashint': 'এই প্লেলিস্ট থেকে সমস্ত মিডিয়া সরিয়ে ফেলার জন্য এগিয়ে যান?',
			'deletePlayListhint': 'এই প্লেলিস্টটি মুছতে এবং সমস্ত মিডিয়া পরিষ্কার করতে এগিয়ে যান?',
			'comments': 'মন্তব্য',
			'replies': 'প্রতিউত্তর',
			'reply': 'প্রতিউত্তর দিন',
			'logintoaddcomment': 'মন্তব্য যোগ করতে লগইন করুন',
			'logintoreply': 'প্রতিউত্তর দিতে লগইন করুন',
			'writeamessage': 'একটি বার্তা লিখুন...',
			'nocomments': 'কোন মন্তব্য পাওয়া যায়নি \nপুনরায় চেষ্টা করতে ক্লিক করুন',
			'errormakingcomments': 'এই মুহূর্তে মন্তব্য প্রক্রিয়া করতে পারছি না..',
			'errordeletingcomments': 'এই মুহূর্তে এই মন্তব্যটি মুছে ফেলতে পারছি না..',
			'erroreditingcomments': 'এই মুহূর্তে এই মন্তব্যটি সম্পাদনা করতে পারছি না..',
			'errorloadingmorecomments': 'এই মুহূর্তে আরও মন্তব্য লোড করতে পারছি না..',
			'deletingcomment': 'মন্তব্য মুছে ফেলা হচ্ছে',
			'editingcomment': 'মন্তব্য সম্পাদনা করা হচ্ছে',
			'deletecommentalert': 'মন্তব্য মুছুন',
			'editcommentalert': 'মন্তব্য সম্পাদনা করুন',
			'deletecommentalerttext': 'আপনি কি এই মন্তব্যটি মুছতে চান? এই পদক্ষেপটি উল্টানো যাবে না',
			'loadmore': 'আরও লোড করুন',
			'messages': 'বার্তা',
			'guestuser': 'অতিথি ব্যবহারকারী',
			'fullname': 'পূর্ণ নাম',
			'emailaddress': 'ইমেল ঠিকানা',
			'password': 'পাসওয়ার্ড',
			'repeatpassword': 'পাসওয়ার্ড পুনরাবৃত্তি করুন',
			'register': 'নিবন্ধন করুন',
			'login': 'লগইন',
			'logout': 'লগআউট',
			'logoutfromapp': 'অ্যাপ থেকে লগআউট করুন?',
			'logoutfromapphint': 'আপনি যদি লগ ইন না করেন তবে আপনি নিবন্ধ বা ভিডিওতে পছন্দ বা মন্তব্য করতে পারবেন না।',
			'gotologin': 'লগইনে যান',
			'resetpassword': 'পাসওয়ার্ড রিসেট করুন',
			'logintoaccount': 'ইতিমধ্যে একটি অ্যাকাউন্ট আছে? লগইন করুন',
			'emptyfielderrorhint': 'আপনাকে সমস্ত ক্ষেত্র পূরণ করতে হবে',
			'invalidemailerrorhint': 'আপনাকে একটি বৈধ ইমেল ঠিকানা প্রবেশ করতে হবে',
			'passwordsdontmatch': 'পাসওয়ার্ডগুলি মেলে না',
			'processingpleasewait': 'প্রক্রিয়া করা হচ্ছে, অনুগ্রহ করে অপেক্ষা করুন...',
			'createaccount': 'একটি অ্যাকাউন্ট তৈরি করুন',
			'forgotpassword': 'পাসওয়ার্ড ভুলে গেছেন?',
			'orloginwith': 'অথবা লগইন করুন',
			'facebook': 'ফেসবুক',
			'google': 'গুগল',
			'moreoptions': 'আরও বিকল্প',
			'about': 'আমাদের সম্পর্কে',
			'privacy': 'গোপনীয়তা নীতি',
			'terms': 'অ্যাপ শর্তাবলী',
			'rate': 'অ্যাপ রেট করুন',
			'version': 'সংস্করণ',
			'pulluploadmore': 'উপরে টেনে লোড করুন',
			'loadfailedretry': 'লোড ব্যর্থ হয়েছে! পুনরায় চেষ্টা করতে ক্লিক করুন!',
			'releaseloadmore': 'আরও লোড করতে মুক্ত করুন',
			'nomoredata': 'আর কোন ডেটা নেই',
			'errorReportingComment': 'মন্তব্য রিপোর্ট করার ত্রুটি',
			'reportingComment': 'মন্তব্য রিপোর্ট করা হচ্ছে',
			'reportcomment': 'রিপোর্ট বিকল্প',
			'reportCommentsList.0': 'অযাচিত বাণিজ্যিক সামগ্রী বা স্প্যাম',
			'reportCommentsList.1': 'অশ্লীলতা বা যৌন স্পষ্ট সামগ্রী',
			'reportCommentsList.2': 'ঘৃণামূলক বক্তব্য বা গ্রাফিক সহিংসতা',
			'reportCommentsList.3': 'হয়রানি বা বুলিং',
			'bookmarksMedia': 'আমার বুকমার্কস',
			'noitemstodisplay': 'প্রদর্শন করার জন্য কোন আইটেম নেই',
			'loginrequired': 'লগইন প্রয়োজন',
			'loginrequiredhint': 'এই প্ল্যাটফর্মে সদস্যতা নিতে, আপনাকে লগ ইন করতে হবে। এখন একটি বিনামূল্যের অ্যাকাউন্ট তৈরি করুন বা আপনার বিদ্যমান অ্যাকাউন্টে লগ ইন করুন।',
			'subscriptions': 'অ্যাপ সদস্যতা',
			'subscribe': 'সদস্যতা নিন',
			'subscribehint': 'সদস্যতা প্রয়োজন',
			'playsubscriptionrequiredhint': 'এই মিডিয়া শুনতে বা দেখতে হলে আপনাকে সদস্যতা নিতে হবে।',
			'previewsubscriptionrequiredhint': 'এই মিডিয়ার জন্য অনুমোদিত প্রিভিউ সময়সীমা অতিক্রম করেছে। চালিয়ে যেতে আপনাকে সদস্যতা নিতে হবে।',
			'copiedtoclipboard': 'ক্লিপবোর্ডে কপি করা হয়েছে',
			'downloadbible': 'বাইবেল ডাউনলোড করুন',
			'downloadversion': 'ডাউনলোড করুন',
			'downloading': 'ডাউনলোড করা হচ্ছে',
			'failedtodownload': 'ডাউনলোড ব্যর্থ হয়েছে',
			'pleaseclicktoretry': 'পুনরায় চেষ্টা করতে ক্লিক করুন।',
			'of': 'এর',
			'nobibleversionshint': 'প্রদর্শন করার জন্য কোন বাইবেল ডেটা নেই, অন্তত একটি বাইবেল সংস্করণ ডাউনলোড করতে নিচের বোতামে ক্লিক করুন।',
			'downloaded': 'ডাউনলোড করা হয়েছে',
			'enteremailaddresstoresetpassword': 'আপনার পাসওয়ার্ড রিসেট করতে আপনার ইমেল প্রবেশ করুন',
			'backtologin': 'লগইনে ফিরে যান',
			'signintocontinue': 'চালিয়ে যেতে সাইন ইন করুন',
			'signin': 'সাইন ইন করুন',
			'signinforanaccount': 'একটি অ্যাকাউন্টের জন্য সাইন আপ?',
			'alreadyhaveanaccount': 'ইতিমধ্যে একটি অ্যাকাউন্ট আছে?',
			'updateprofile': 'প্রোফাইল আপডেট করুন',
			'updateprofilehint': 'শুরু করতে, অনুগ্রহ করে আপনার প্রোফাইল পৃষ্ঠা আপডেট করুন, এটি আমাদেরকে অন্য লোকেদের সাথে আপনাকে সংযুক্ত করতে সাহায্য করবে',
			'autoplayvideos': 'ভিডিও স্বয়ংক্রিয়ভাবে চালান',
			'gosocial': 'সামাজিক হোন',
			'searchbible': 'বাইবেল অনুসন্ধান করুন',
			'filtersearchoptions': 'অনুসন্ধান বিকল্পগুলি ফিল্টার করুন',
			'narrowdownsearch': 'আরও নির্দিষ্ট ফলাফলের জন্য অনুসন্ধান সংকুচিত করতে নিচের ফিল্টার বোতামটি ব্যবহার করুন।',
			'searchbibleversion': 'বাইবেল সংস্করণ অনুসন্ধান করুন',
			'searchbiblebook': 'বাইবেল বই অনুসন্ধান করুন',
			'search': 'অনুসন্ধান করুন',
			'setBibleBook': 'বাইবেল বই সেট করুন',
			'oldtestament': 'পুরাতন নিয়ম',
			'newtestament': 'নতুন নিয়ম',
			'limitresults': 'ফলাফল সীমাবদ্ধ করুন',
			'setfilters': 'ফিল্টার সেট করুন',
			'bibletranslator': 'বাইবেল অনুবাদক',
			'chapter': ' অধ্যায় ',
			'verse': ' পদ ',
			'translate': 'অনুবাদ',
			'bibledownloadinfo': 'বাইবেল ডাউনলোড শুরু হয়েছে, ডাউনলোড সম্পন্ন না হওয়া পর্যন্ত এই পৃষ্ঠাটি বন্ধ করবেন না।',
			'received': 'প্রাপ্ত',
			'outoftotal': 'মোট থেকে',
			'set': 'সেট',
			'selectColor': 'রং নির্বাচন করুন',
			'switchbibleversion': 'বাইবেল সংস্করণ পরিবর্তন করুন',
			'switchbiblebook': 'বাইবেল বই পরিবর্তন করুন',
			'gotosearch': 'অধ্যায়ে যান',
			'changefontsize': 'ফন্টের আকার পরিবর্তন করুন',
			'font': 'ফন্ট',
			'readchapter': 'অধ্যায় পড়ুন',
			'showhighlightedverse': 'হাইলাইট করা পদগুলি দেখান',
			'downloadmoreversions': 'আরও সংস্করণ ডাউনলোড করুন',
			'suggestedusers': 'অনুসরণ করার জন্য প্রস্তাবিত ব্যবহারকারীরা',
			'unfollow': 'অনুসরণ বন্ধ করুন',
			'follow': 'অনুসরণ করুন',
			'searchforpeople': 'মানুষের জন্য অনুসন্ধান করুন',
			'viewpost': 'পোস্ট দেখুন',
			'viewprofile': 'প্রোফাইল দেখুন',
			'mypins': 'আমার পিন',
			'viewpinnedposts': 'পিন করা পোস্টগুলি দেখুন',
			'personal': 'ব্যক্তিগত',
			'update': 'আপডেট',
			'phonenumber': 'ফোন নম্বর',
			'showmyphonenumber': 'ব্যবহারকারীদের কাছে আমার ফোন নম্বর দেখান',
			'dateofbirth': 'জন্ম তারিখ',
			'showmyfulldateofbirth': 'আমার স্থিতি দেখার জন্য আমার পূর্ণ জন্ম তারিখ দেখান',
			'notifications': 'বিজ্ঞপ্তি',
			'notifywhenuserfollowsme': 'যখন একজন ব্যবহারকারী আমাকে অনুসরণ করে তখন আমাকে জানাতে দিন',
			'notifymewhenusercommentsonmypost': 'যখন ব্যবহারকারীরা আমার পোস্টে মন্তব্য করে তখন আমাকে জানাতে দিন',
			'notifymewhenuserlikesmypost': 'যখন ব্যবহারকারীরা আমার পোস্টে লাইক দেয় তখন আমাকে জানাতে দিন',
			'churchsocial': 'চার্চ সোশ্যাল',
			'shareyourthoughts': 'আপনার চিন্তা শেয়ার করুন',
			'readmore': '...আরও পড়ুন',
			'less': ' কম',
			'couldnotprocess': 'অনুরোধকৃত পদক্ষেপ প্রক্রিয়া করতে পারিনি।',
			'pleaseselectprofilephoto': 'আপলোড করার জন্য একটি প্রোফাইল ফটো নির্বাচন করুন',
			'pleaseselectprofilecover': 'আপলোড করার জন্য একটি কভার ফটো নির্বাচন করুন',
			'updateprofileerrorhint': 'আপনার নাম, জন্ম তারিখ, লিঙ্গ, ফোন এবং অবস্থান পূরণ করতে হবে আগে আপনি এগিয়ে যেতে পারেন।',
			'gender': 'লিঙ্গ',
			'male': 'পুরুষ',
			'female': 'মহিলা',
			'dob': 'জন্ম তারিখ',
			'location': 'বর্তমান অবস্থান',
			'qualification': 'যোগ্যতা',
			'aboutme': 'আমার সম্পর্কে',
			'facebookprofilelink': 'ফেসবুক প্রোফাইল লিঙ্ক',
			'twitterprofilelink': 'টুইটার প্রোফাইল লিঙ্ক',
			'linkdln': 'লিংকডইন প্রোফাইল লিঙ্ক',
			'likes': 'লাইক',
			'likess': 'লাইক(গুলি)',
			'pinnedposts': 'আমার পিন করা পোস্টগুলি',
			'unpinpost': 'পোস্ট আনপিন করুন',
			'unpinposthint': 'আপনি কি এই পোস্টটি আপনার পিন করা পোস্টগুলি থেকে সরাতে চান?',
			'postdetails': 'পোস্ট বিবরণ',
			'posts': 'পোস্ট',
			'followers': 'অনুসরণকারীরা',
			'followings': 'অনুসরণকারী',
			'my': 'আমার',
			'edit': 'সম্পাদনা করুন',
			'delete': 'মুছুন',
			'deletepost': 'পোস্ট মুছুন',
			'deleteposthint': 'আপনি কি এই পোস্টটি মুছতে চান? পোস্টগুলি এখনও কিছু ব্যবহারকারীর ফিডে উপস্থিত হতে পারে।',
			'maximumallowedsizehint': 'সর্বাধিক অনুমোদিত ফাইল আপলোডের আকার পৌঁছেছে',
			'maximumuploadsizehint': 'নির্বাচিত ফাইলটি অনুমোদিত আপলোড ফাইলের আকার সীমা অতিক্রম করেছে।',
			'makeposterror': 'এই মুহূর্তে পোস্ট করতে পারছি না, পুনরায় চেষ্টা করতে ক্লিক করুন।',
			'makepost': 'পোস্ট তৈরি করুন',
			'selectfile': 'ফাইল নির্বাচন করুন',
			'images': 'চিত্রগুলি',
			'shareYourThoughtsNow': 'আপনার চিন্তা শেয়ার করুন ...',
			'photoviewer': 'ফটো ভিউয়ার',
			'nochatsavailable': 'কোনও কথোপকথন উপলব্ধ নেই \nনিচের যোগ বোতামটি ক্লিক করুন \nব্যবহারকারীদের সাথে চ্যাট করার জন্য নির্বাচন করতে',
			'typing': 'টাইপ করা হচ্ছে...',
			'photo': 'ফটো',
			'online': 'অনলাইন',
			'offline': 'অফলাইন',
			'lastseen': 'শেষ দেখা',
			'deleteselectedhint': 'এই পদক্ষেপটি নির্বাচিত বার্তাগুলি মুছে ফেলবে। অনুগ্রহ করে লক্ষ্য করুন যে এটি কেবল আপনার কথোপকথনটি মুছে দেয়, \n বার্তাগুলি এখনও আপনার অংশীদারের ডিভাইসে প্রদর্শিত হবে।',
			'deleteselected': 'নির্বাচিত মুছুন',
			'unabletofetchconversation': 'আপনার কথোপকথন আনতে অক্ষম \n',
			'loadmoreconversation': 'আরও কথোপকথন লোড করুন',
			'sendyourfirstmessage': 'আপনার প্রথম বার্তাটি পাঠান \n',
			'unblock': 'আনব্লক ',
			'block': 'ব্লক করুন',
			'writeyourmessage': 'আপনার বার্তা লিখুন...',
			'clearconversation': 'কথোপকথন মুছুন',
			'clearconversationhintone': 'এই পদক্ষেপটি আপনার সাথে সমস্ত কথোপকথন পরিষ্কার করবে ',
			'clearconversationhinttwo': '.\n দয়া করে লক্ষ্য করুন যে এটি কেবল আপনার কথোপকথনটি মুছে দেয়, বার্তাগুলি এখনও আপনার অংশীদারের চ্যাটে প্রদর্শিত হবে।',
			'facebookloginerror': 'লগইন প্রক্রিয়ায় কিছু ভুল হয়েছে।\n, এখানে ফেসবুক আমাদের যা ত্রুটি দিয়েছে',
			'selectLanguage': 'ভাষা নির্বাচন করুন',
			'howTo': 'কিভাবে',
			'noBibleTextsAvailable': 'কোন বাইবেল পাঠ্য উপলব্ধ নয়',
			'languages': 'ভাষাসমূহ',
			'searchLanguages': 'ভাষা অনুসন্ধান করুন...',
			'biblesFilesets': 'বাইবেল: {bibles}, ফাইলসেট: {filesets}',
			'oldTestament': 'পুরাতন নিয়ম',
			'newTestament': 'নতুন নিয়ম',
			'play': 'বাজান',
			'no_verse_content': 'প্রদর্শনের জন্য কোনও বাইবেলের আয়াতের সামগ্রী নেই।',
			'no_audio_content': 'প্রদর্শনের জন্য কোনও বাইবেলের অডিও সামগ্রী নেই।',
		};
	}
}

extension on _StringsDz {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'ངེད་རིགས་དབང་ཕྱུག་',
			'selectlanguage': 'དྲུང་ལེགས་སྐད་ཡིག་འདེམས་འཐུ་',
			'deletemyaccount': 'ངེད་དངུལ་རྫས་གཏོང་བ་',
			'deleteaccount': 'ངེད་དངུལ་རྫས་གཏོང་བ་',
			'deleteaccounthint': 'འདི་གནོན་བཅུག་བཞག་ནས་རྫས་འཛིན་དངུལ་གཏོང་བ་དང་གཏོང་བའི་དངུལ་རྫས་མཐར་བསྐྲུན་ཡོད་འདུག དེ་རུ་མི་དགོས་པ་བསམ་གཏོང་མེད་མི་རིམ་པ་གི་སྡུད་མཐུན་བཅད་སྒོ་',
			'deleteaccountsuccess': 'དངུལ་རྫས་གཏོང་བ་རོལ་བཞག་',
			'chooseapplanguage': 'དངུལ་རྫས་གཏོང་བའི་སྐད་ཡིག་འདེམས་འཐུ་',
			'nightmode': 'མགུར་འགྱུར་བསྒྱུར་བ་',
			'initializingapp': 'བརྟེན་བཟུང་འབྱོད་འདི་...',
			'home': 'མཚམས་དབྱིབས་',
			'branches': 'ཚགས་གཅིག་',
			'inbox': 'ནང་མངོན་ཐོན་',
			'downloads': 'འབབ་ཡོན་གཏོང་བ་',
			'settings': 'སྒྲིག་བརྡར་',
			'events': 'བརྡ་འཛུགས་',
			'myplaylists': 'ངེད་སྣང་དུས་རིམ་',
			'website': 'དྲི་བཟུང་སྒྲོག་ཚུ་',
			'hymns': 'མུ་གཞས་',
			'articles': 'བྱང་རྩོམ་',
			'notes': 'དྲི་བཟུང་སྒྲོག་ཚུ་',
			'donate': 'དངུལ་རྫས་གཏོང་བ་',
			'offering': 'ཕྱིར་དངུལ་རྫས་གཏོང་བ་',
			'savenotetitle': 'དྲི་བཟུང་གནོད་དེ་གསར་བཟོ་བའི་མགུལ་དོན་',
			'nonotesfound': 'དྲི་བཟུང་མ་རིགས་འཛིན་',
			'newnote': 'གསར་པ་',
			'deletenote': 'དྲི་བཟུང་གཏོང་བ་',
			'deletenotehint': 'དྲི་བཟུང་གཏོང་དགོས་འདུག་ འདི་མ་གནོད་འཛིན་འདེད་སྒྲོག་',
			'bookmarks': 'མིག་ཆུང་',
			'socialplatforms': 'སྤྱིར་བཤད་གཏོང་ཚོད་མེད་',
			'onboardingpagetitles.0': 'ངེད་དབང་ཕྱུག་ལ་དོ་གསར་དོ་',
			'onboardingpagetitles.1': 'ལེགས་བཅུད་མང་ཚུ་གཏོང་ཚུ་',
			'onboardingpagetitles.2': 'ཡིན་ལག་རྩོལ་བ་དང་སྒྲོག་ཚུ་ \n དང་མཚམས་དབྱིབས་གཏོང་ཚུ་',
			'onboardingpagetitles.3': 'ངེད་རྣམས་ལ་བོད་ལྗང་ཁག་སྟེར་བ་',
			'onboardingpagehints.0': 'དོ་གསར་མི་ཚུ་རྣམས་ལ་དྲང་རྒྱན་གསལ་བསྟན་',
			'onboardingpagehints.1': 'བརྡ་འཛུགས་དང་བསྟེན་གྲུབ་པ་དང་དྲི་བཟུང་སྒྲོག་དང་བསྟེན་གྲུབ་དང་དུས་རིམ་དང་དུས་རིམ་སྒྲིག་འབེབས་',
			'onboardingpagehints.2': 'ཡིན་ལག་རྩོལ་དང་རྒྱུན་བཅངས་གཏོང་གི་དེ་བསྟེན་གྲུབ་',
			'onboardingpagehints.3': 'ངེད་རྣམས་གནོན་རྣམ་གསལ་བཟུང་བཞག་མི་ཚུ་གཏོང་ཚུ་',
			'next': 'དུས་གཉིས་མ་',
			'done': 'འབོད་བསྐྲུན་གཏོང་',
			'quitapp': 'བརྡ་འཛུགས་མགུར་འགྱུར་བསྒྱུར་བ་',
			'quitappwarning': 'དྲི་བཟུང་བརྡ་འཛུགས་ནང་མགུར་འགྱུར་བསྒྱུར་བ་སྟེར་བའི་རྣམ་བསྟན་རོལ་བཞག་',
			'quitappaudiowarning': 'དྲི་བཟུང་བརྡ་འཛུགས་བརྟེན་མགུར་འགྱུར་བསྒྱུར་བ་སྟེར་བའི་རྣམ་བསྟན་རོལ་བཞག་',
			'ok': 'ངེད་',
			'retry': 'བསྒྲུབས་བཀོད་',
			'oops': 'འབད་གཏོང་བའི་དྲི་བཟུང་སྒྲོག་སྒྲིག་',
			'save': 'གསར་བཟོ་',
			'cancel': 'འབད་མི་བཏུབ་',
			'error': 'དགག་བསྒྲུབས་སྟེར་',
			'success': 'བརྡ་འཛུགས་སྟེར་',
			'skip': 'མཐུད་འཁོར་འབད་དགོས་',
			'skiplogin': 'དྲི་བཟུང་བརྡ་འཛུགས་འཁོར་འབད་དགོས་',
			'skipregister': 'དྲི་བཟུང་བརྡ་འཛུགས་འཁོར་འབད་དགོས་',
			'dataloaderror': 'འབད་བཏུབ་མ་ཚུ་དྲི་བཟུང་རོལ་བཞག་དུས་རིམ་བཀོད་དང་རྣམ་དགག་བཅད་སྒྲོག་',
			'suggestedforyou': 'མཐུད་བསྟེན་རོལ་བཞག་',
			'videomessages': 'ཡིན་ལག་རྩོལ་བ་གཏོང་',
			'audiomessages': 'དྲི་བཟུང་གཏོང་',
			'devotionals': 'བསྟེན་འབད་དེ་གསར་དུས་རིམ་བཏོན་མཁན་',
			'categories': 'དངུལ་རྫས་',
			'category': 'དངུལ་རྫས་',
			'videos': 'ཡིན་ལག་རྩོལ་',
			'audios': 'ཡིན་ལག་རྩོལ་',
			'biblebooks': 'དངུལ་རྫས་སྟེང་གི་གཏོང་',
			'sermons': 'དངུལ་རྫས་སྟེང་གི་གཏོང་',
			'tools': 'འབད་འགུལ་བསྒྲུབས་སྟེར་',
			'profile': 'རྒྱས་ཚད་',
			'audiobible': 'དངུལ་རྫས་སྟེང་གཏོང་',
			'homesentence': 'ངེད་བཞུགས་འདི་གིས་ཁོམ་དགོན་གཟུང་',
			'livestreams': 'ཡིན་ལག་རྩོལ་གྱི་བསྒྲུབས་',
			'radio': 'རོལ་བཞག་',
			'allitems': 'མང་སྣང་',
			'emptyplaylist': 'དངུལ་རྫས་སྟེང་མཐུད་སྒྲིག་གཏོང་',
			'notsupported': 'དགག་བསྒྲུབས་སྟེར་',
			'cleanupresources': 'འབད་མི་བཏུབ་དྲི་བཟུང་དྲི་བཟུང་གཏོང་',
			'grantstoragepermission': 'དྲི་བཟུང་གཏོང་སྒྲིག་རིམ་བཟུགས་',
			'sharefiletitle': 'ཡིན་ལག་རྩོལ་གཏོང་ ',
			'sharefilebody': 'དངུལ་རྫས་སྟེང་གི་གཏོང་ ',
			'sharetext': 'འབད་མི་བཏུབ་དྲི་བཟུང་གཏོང་',
			'sharetexthint': 'དྲི་བཟུང་རྒྱུན་འབད་དྲི་བཟུང་གཏོང་',
			'download': 'དངུལ་རྫས་སྟེང་གཏོང་',
			'addplaylist': 'དངུལ་རྫས་སྟེང་གཏོང་',
			'bookmark': 'དངུལ་རྫས་སྟེང་གཏོང་',
			'unbookmark': 'དངུལ་རྫས་སྟེང་གཏོང་',
			'share': 'དངུལ་རྫས་སྟེང་གཏོང་',
			'deletemedia': 'དངུལ་རྫས་སྟེང་གཏོང་',
			'deletemediahint': 'དངུལ་རྫས་སྟེང་གཏོང་གནོན་བཅུག་',
			'searchhint': 'དངུལ་རྫས་སྟེང་གཏོང་',
			'performingsearch': 'དངུལ་རྫས་སྟེང་གཏོང་སྒྲིག་དྲི་བཟུང་',
			'nosearchresult': 'དངུལ་རྫས་མ་རིགས་སྒྲིག་གཏོང་',
			'nosearchresulthint': 'དངུལ་རྫས་སྒྲིག་གཏོང་དྲི་བཟུང་',
			'addtoplaylist': 'དངུལ་རྫས་སྟེང་གཏོང་བསྒྲུབས་',
			'newplaylist': 'དངུལ་རྫས་སྒྲིག་',
			'playlistitm': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་',
			'mediaaddedtoplaylist': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་',
			'mediaremovedfromplaylist': 'དངུལ་རྫས་སྒྲིག་གཏོང་',
			'clearplaylistmedias': 'དངུལ་རྫས་སྒྲིག་གཏོང་',
			'deletePlayList': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་',
			'clearplaylistmediashint': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་སྒྲིག་',
			'deletePlayListhint': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་གཏོང་',
			'comments': 'དངུལ་རྫས་སྒྲིག་བསྒྲུབས་',
			'replies': 'དངུལ་རྫས་སྒྲིག་བསྒྲུབས་',
			'reply': 'དངུལ་རྫས་སྒྲིག་བསྒྲུབས་',
			'logintoaddcomment': 'དངུལ་རྫས་སྒྲིག་བསྒྲུབས་',
			'logintoreply': 'དངུལ་རྫས་སྒྲིག་བསྒྲུབས་',
			'writeamessage': 'དངུལ་རྫས་སྒྲིག་བསྒྲུབས་',
			'nocomments': 'དངུལ་རྫས་སྒྲིག་བསྒྲུབས་ \nབཏུབ་མ་ཚུ་',
			'errormakingcomments': 'དངུལ་རྫས་སྒྲིག་བསྒྲུབས་',
			'errordeletingcomments': 'དངུལ་རྫས་སྒྲིག་གཏོང་',
			'erroreditingcomments': 'དངུལ་རྫས་སྒྲིག་བསྒྲུབས་',
			'errorloadingmorecomments': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་',
			'deletingcomment': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་',
			'editingcomment': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་',
			'deletecommentalert': 'དངུལ་རྫས་སྒྲིག་བསྒྲུབས་',
			'editcommentalert': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་',
			'deletecommentalerttext': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་གཏོང་',
			'loadmore': 'དངུལ་རྫས་དྲི་བཟུང་',
			'messages': 'དངུལ་རྫས་སྟེང་གཏོང་',
			'guestuser': 'མཁན་གྱིས་བསྟེན་གྲུབ་',
			'fullname': 'དངུལ་རྫས་དྲི་བཟུང་',
			'emailaddress': 'དངུལ་རྫས་དྲི་བཟུང་',
			'password': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་',
			'repeatpassword': 'དངུལ་རྫས་དྲི་བཟུང་སྒྲིག་',
			'register': 'དངུལ་རྫས་དྲི་བཟུང་',
			'login': 'དངུལ་རྫས་དྲི་བཟུང་',
			'logout': 'དངུལ་རྫས་སྒྲིག་',
			'logoutfromapp': 'དངུལ་རྫས་སྒྲིག་གཏོང་?',
			'logoutfromapphint': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་དང་བསྟེན་གྲུབ་མ་ཚུ་སྒྲིག་',
			'gotologin': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་',
			'resetpassword': 'དངུལ་རྫས་གཏོང་སྒྲིག་',
			'logintoaccount': 'མི་དྲི་བཟུང་སྒྲིག་དྲི་བཟུང་? བསྟེན་གྲུབ་སྒྲིག་',
			'emptyfielderrorhint': 'དངུལ་རྫས་དྲི་བཟུང་སྒྲིག་',
			'invalidemailerrorhint': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་',
			'passwordsdontmatch': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་',
			'processingpleasewait': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་རྣམ་བཞིན་...',
			'createaccount': 'དངུལ་རྫས་སྒྲིག་གཏོང་',
			'forgotpassword': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་?',
			'orloginwith': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་གཏོང་',
			'facebook': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་',
			'google': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་',
			'moreoptions': 'དངུལ་རྫས་སྒྲིག་',
			'about': 'ངེད་དངུལ་རྫས་དྲི་བཟུང་',
			'privacy': 'དངུལ་རྫས་སྒྲིག་',
			'terms': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་',
			'rate': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་',
			'version': 'དངུལ་རྫས་སྒྲིག་',
			'pulluploadmore': 'དངུལ་རྫས་སྒྲིག་གཏོང་',
			'loadfailedretry': 'དངུལ་རྫས་གཏོང་བསྒྲུབས་! གཏོང་རྣམ་རོལ་བཞག་!',
			'releaseloadmore': 'དངུལ་རྫས་སྒྲིག་',
			'nomoredata': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་',
			'errorReportingComment': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་',
			'reportingComment': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་',
			'reportcomment': 'དངུལ་རྫས་སྒྲིག་',
			'reportCommentsList.0': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་དྲི་བཟུང་',
			'reportCommentsList.1': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་',
			'reportCommentsList.2': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་',
			'reportCommentsList.3': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་',
			'bookmarksMedia': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་',
			'noitemstodisplay': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་སྒྲིག་',
			'loginrequired': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་',
			'loginrequiredhint': 'དངུལ་རྫས་དྲི་བཟུང་སྒྲིག་དྲི་བཟུང་',
			'subscriptions': 'དངུལ་རྫས་སྒྲིག་',
			'subscribe': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་',
			'subscribehint': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་དྲི་བཟུང་',
			'playsubscriptionrequiredhint': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་',
			'previewsubscriptionrequiredhint': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་སྒྲིག་',
			'copiedtoclipboard': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་',
			'downloadbible': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་དྲི་བཟུང་',
			'downloadversion': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་གཏོང་',
			'downloading': 'དངུལ་རྫས་གཏོང་སྒྲིག་དྲི་བཟུང་',
			'failedtodownload': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་',
			'pleaseclicktoretry': 'དངུལ་རྫས་གཏོང་བསྒྲུབས་སྟེར་བའི་རྣམ་བསྟན་དང་རིགས་འཛིན་གནོད་དེ་དྲི་བཟུང་གཏོང་',
			'of': 'དངུལ་རྫས་དྲི་བཟུང་',
			'nobibleversionshint': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་སྒྲིག་དྲི་བཟུང་',
			'downloaded': 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་གཏོང་གནོད་',
			'enteremailaddresstoresetpassword': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་སྒྲིག་',
			'backtologin': 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་གཏོང་',
			'signintocontinue': 'དངུལ་རྫས་སྒྲིག་གཏོང་',
			'signin': 'དངུལ་རྫས་སྒྲིག་གཏོང་',
			'signinforanaccount': 'དངུལ་རྫས་སྒྲིག་གཏོང་བསྒྲུབས་?',
			'alreadyhaveanaccount': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་?',
			'updateprofile': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་',
			'updateprofilehint': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་',
			'autoplayvideos': 'དངུལ་རྫས་གཏོང་བསྒྲུབས་',
			'gosocial': 'དངུལ་རྫས་སྒྲིག་',
			'searchbible': 'དངུལ་རྫས་སྒྲིག་གཏོང་དྲི་བཟུང་',
			'filtersearchoptions': 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་དྲི་བཟུང་',
			'narrowdownsearch': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་',
			'searchbibleversion': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་བསྒྲུབས་',
			'searchbiblebook': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་',
			'search': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་',
			'setBibleBook': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་སྒྲིག་',
			'oldtestament': 'དངུལ་རྫས་གཏོང་བསྒྲུབས་',
			'newtestament': 'དངུལ་རྫས་སྒྲིག་',
			'limitresults': 'དངུལ་རྫས་དྲི་བཟུང་',
			'setfilters': 'དངུལ་རྫས་དྲི་བཟུང་',
			'bibletranslator': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་',
			'chapter': ' དངུལ་རྫས་ ',
			'verse': ' དངུལ་རྫས་ ',
			'translate': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་',
			'bibledownloadinfo': 'དངུལ་རྫས་གཏོང་སྒྲིག་གཏོང་དང་དངུལ་རྫས་སྒྲིག་',
			'received': 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་',
			'outoftotal': 'དངུལ་རྫས་གཏོང་གཏོང་དྲི་བཟུང་',
			'set': 'དངུལ་རྫས་དྲི་བཟུང་',
			'selectColor': 'དངུལ་རྫས་དྲི་བཟུང་',
			'switchbibleversion': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་',
			'switchbiblebook': 'དངུལ་རྫས་སྒྲིག་གཏོང་དྲི་བཟུང་',
			'gotosearch': 'དངུལ་རྫས་སྒྲིག་གཏོང་དྲི་བཟུང་',
			'changefontsize': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་',
			'font': 'དངུལ་རྫས་',
			'readchapter': 'དངུལ་རྫས་གཏོང་གཏོང་དྲི་བཟུང་',
			'showhighlightedverse': 'དངུལ་རྫས་གཏོང་གཏོང་དྲི་བཟུང་སྒྲིག་',
			'downloadmoreversions': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་གཏོང་',
			'suggestedusers': 'དངུལ་རྫས་གཏོང་སྒྲིག་དྲི་བཟུང་',
			'unfollow': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་',
			'follow': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་',
			'searchforpeople': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་སྒྲིག་',
			'viewpost': 'དངུལ་རྫས་སྒྲིག་གཏོང་',
			'viewprofile': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་',
			'mypins': 'དངུལ་རྫས་གཏོང་གཏོང་དྲི་བཟུང་',
			'viewpinnedposts': 'དངུལ་རྫས་གཏོང་གཏོང་གཏོང་གཏོང་གཏོང་གཏོང་',
			'personal': 'དངུལ་རྫས་སྒྲིག་',
			'update': 'དངུལ་རྫས་སྒྲིག་',
			'phonenumber': 'དངུལ་རྫས་དྲི་བཟུང་',
			'showmyphonenumber': 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་',
			'dateofbirth': 'དངུལ་རྫས་གཏོང་གཏོང་དྲི་བཟུང་',
			'showmyfulldateofbirth': 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་',
			'notifications': 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་དྲི་བཟུང་',
			'notifywhenuserfollowsme': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་གཏོང་སྒྲིག་སྒྲིག་གཏོང་སྒྲིག་གཏོང་',
			'notifymewhenusercommentsonmypost': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་དྲི་བཟུང་གཏོང་སྒྲིག་དྲི་བཟུང་',
			'notifymewhenuserlikesmypost': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་སྒྲིག་གཏོང་སྒྲིག་',
			'churchsocial': 'དངུལ་རྫས་དྲི་བཟུང་སྒྲིག་',
			'shareyourthoughts': 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་གཏོང་གཏོང་དྲི་བཟུང་དྲི་བཟུང་',
			'readmore': '...དངུལ་རྫས་སྒྲིག་',
			'less': ' དངུལ་རྫས་སྒྲིག་',
			'couldnotprocess': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་',
			'pleaseselectprofilephoto': 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་སྒྲིག་',
			'pleaseselectprofilecover': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་གཏོང་དྲི་བཟུང་གཏོང་དྲི་བཟུང་',
			'updateprofileerrorhint': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་སྒྲིག་དྲི་བཟུང་དྲི་བཟུང་གཏོང་གཏོང་སྒྲིག་དྲི་བཟུང་དྲི་བཟུང་',
			'gender': 'དངུལ་རྫས་དྲི་བཟུང་',
			'male': 'དངུལ་རྫས་སྒྲིག་',
			'female': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་',
			'dob': 'དངུལ་རྫས་གཏོང་',
			'location': 'དངུལ་རྫས་གཏོང་གཏོང་དྲི་བཟུང་',
			'qualification': 'དངུལ་རྫས་གཏོང་གཏོང་དྲི་བཟུང་',
			'aboutme': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་གཏོང་',
			'facebookprofilelink': 'དངུལ་རྫས་སྒྲིག་གཏོང་གཏོང་གཏོང་སྒྲིག་',
			'twitterprofilelink': 'དངུལ་རྫས་གཏོང་གཏོང་གཏོང་དྲི་བཟུང་',
			'linkdln': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་གཏོང་གཏོང་གཏོང་གཏོང་',
			'likes': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་གཏོང་',
			'likess': 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་གཏོང་དྲི་བཟུང་གཏོང་',
			'pinnedposts': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་',
			'unpinpost': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་',
			'unpinposthint': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་སྒྲིག་དྲི་བཟུང་དྲི་བཟུང་གཏོང་སྒྲིག་',
			'postdetails': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་གཏོང་',
			'posts': 'དངུལ་རྫས་དྲི་བཟུང་',
			'followers': 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་',
			'followings': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་གཏོང་སྒྲིག་',
			'my': 'དངུལ་རྫས་གཏོང་',
			'edit': 'དངུལ་རྫས་གཏོང་',
			'delete': 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་',
			'deletepost': 'དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་གཏོང་',
			'deleteposthint': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་སྒྲིག་དྲི་བཟུང་',
			'maximumallowedsizehint': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་གཏོང་སྒྲིག་གཏོང་དྲི་བཟུང་གཏོང་གཏོང་དྲི་བཟུང་',
			'maximumuploadsizehint': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་གཏོང་དྲི་བཟུང་སྒྲིག་',
			'makeposterror': 'དངུལ་རྫས་གཏོང་དྲི་བཟུང་སྒྲིག་སྒྲིག་དྲི་བཟུང་',
			'makepost': 'དངུལ་རྫས་དྲི་བཟུང་སྒྲིག་གཏོང་',
			'selectfile': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་',
			'images': 'དངུལ་རྫས་སྒྲིག་',
			'shareYourThoughtsNow': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་...',
			'photoviewer': 'དངུལ་རྫས་དྲི་བཟུང་སྒྲིག་གཏོང་',
			'nochatsavailable': 'དངུལ་རྫས་གཏོང་སྒྲིག་སྒྲིག་དྲི་བཟུང་ \nདྲི་བཟུང་གཏོང་སྒྲིག་ \nདྲི་བཟུང་གཏོང་གཏོང་གཏོང་སྒྲིག་དྲི་བཟུང་',
			'typing': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་གཏོང་དྲི་བཟུང་...',
			'photo': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་སྒྲིག་',
			'online': 'དངུལ་རྫས་སྒྲིག་',
			'offline': 'དངུལ་རྫས་སྒྲིག་',
			'lastseen': 'དངུལ་རྫས་གཏོང་',
			'deleteselectedhint': 'དངུལ་རྫས་གཏོང་གཏོང་གཏོང་དྲི་བཟུང་གཏོང་གཏོང་གཏོང་དྲི་བཟུང་ \n དངུལ་རྫས་སྒྲིག་གཏོང་དྲི་བཟུང་གཏོང་གཏོང་སྒྲིག་གཏོང་དྲི་བཟུང་སྒྲིག་',
			'deleteselected': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་གཏོང་',
			'unabletofetchconversation': 'དངུལ་རྫས་དྲི་བཟུང་སྒྲིག་དྲི་བཟུང་ \n',
			'loadmoreconversation': 'དངུལ་རྫས་སྒྲིག་གཏོང་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་',
			'sendyourfirstmessage': 'དངུལ་རྫས་གཏོང་སྒྲིག་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་ \n',
			'unblock': 'དངུལ་རྫས་གཏོང་ ',
			'block': 'དངུལ་རྫས་དྲི་བཟུང་གཏོང་',
			'writeyourmessage': 'དངུལ་རྫས་གཏོང་གཏོང་དྲི་བཟུང་...',
			'clearconversation': 'དངུལ་རྫས་གཏོང་གཏོང་གཏོང་གཏོང་གཏོང་',
			'clearconversationhintone': 'དངུལ་རྫས་དྲི་བཟུང་དྲི་བཟུང་སྒྲིག་གཏོང་དྲི་བཟུང་གཏོང་སྒྲིག་དྲི་བཟུང་ ',
			'clearconversationhinttwo': '.\n  དངུལ་རྫས་སྒྲིག་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་གཏོང་དྲི་བཟུང་སྒྲིག་',
			'facebookloginerror': 'དངུལ་རྫས་གཏོང་སྒྲིག་གཏོང་དྲི་བཟུང་སྒྲིག་སྒྲིག་。\n, དངུལ་རྫས་གཏོང་དྲི་བཟུང་དྲི་བཟུང་དྲི་བཟུང་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་སྒྲིག་',
			'selectLanguage': 'དབྱིན་རྒྱུད་སྐད་འབྱུང་།',
			'howTo': 'ག་འདྲ་བྱས།',
			'noBibleTextsAvailable': 'བཀོལ་སྟོན་ནང་མིན་འདུག',
			'languages': 'སྐད་ཡིག',
			'searchLanguages': 'སྐད་ཡིག་འཚོལ་སྐབས...',
			'biblesFilesets': 'བཀོལ་སྟོན: {bibles}, ཡིག་སྒེའི་མིང་།: {filesets}',
			'oldTestament': 'རྒྱལ་མཚན་རྒྱུད་རྙིང་པ།',
			'newTestament': 'རྒྱལ་མཚན་རྒྱུད་གསར་པ།',
			'play': 'གཏོང་',
			'no_verse_content': 'གསལ་སྟོན་གྱི་དོན་ལུ་དངོས་གྲངས་མེད།',
			'no_audio_content': 'གསལ་སྟོན་གྱི་དོན་ལུ་དངོས་གྲངས་མེད།',
		};
	}
}

extension on _StringsEs {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'VirtualPastor',
			'deleteaccount': 'Delete my account',
			'deletemyaccount': 'Delete my account',
			'deleteaccounthint': 'This action will delete your account and remove all your data, once your data is deleted, it cannot be recovered.',
			'deleteaccountsuccess': 'Account deletion was succesful',
			'selectlanguage': 'Seleccione el idioma',
			'chooseapplanguage': 'Elija el idioma de la aplicación',
			'nightmode': 'Modo nocturno',
			'initializingapp': 'inicializando...',
			'home': 'Hogar',
			'branches': 'Ramas',
			'inbox': 'Bandeja de entrada',
			'downloads': 'Descargas',
			'settings': 'Configuraciones',
			'events': 'Eventos',
			'myplaylists': 'Mis listas de reproducción',
			'website': 'Sitio web',
			'hymns': 'Himnos',
			'articles': 'Artículos',
			'notes': 'Notas',
			'donate': 'Donar',
			'offering': 'Oferta',
			'savenotetitle': 'Título de la nota',
			'bookmarks': 'Marcadores',
			'socialplatforms': 'Plataformas sociales',
			'onboardingpagetitles.0': 'Bienvenido a mychurch',
			'onboardingpagetitles.1': 'Repleto de características',
			'onboardingpagetitles.2': 'Audio, Video \n and Live Streaming',
			'onboardingpagetitles.3': 'Crear una cuenta',
			'onboardingpagehints.0': 'Extienda más allá de las mañanas de los domingos y las cuatro paredes de su iglesia. Todo lo que necesita para comunicarse e interactuar con un mundo centrado en dispositivos móviles.',
			'onboardingpagehints.1': 'Hemos reunido todas las funciones principales que debe tener la aplicación de su iglesia. Eventos, devocionales, notificaciones, notas y biblia de múltiples versiones.',
			'onboardingpagehints.2': 'Permita que los usuarios de todo el mundo vean videos, escuchen mensajes de audio y vean transmisiones en vivo de los servicios de su iglesia.',
			'onboardingpagehints.3': 'Comience su viaje hacia una experiencia de adoración sin fin.',
			'next': 'SIGUIENTE',
			'done': 'EMPEZAR',
			'quitapp': 'Salir de la aplicación!',
			'quitappwarning': '¿Deseas cerrar la aplicación?',
			'quitappaudiowarning': 'Actualmente está reproduciendo un audio, al salir de la aplicación se detendrá la reproducción del audio. Si no desea detener la reproducción, simplemente minimice la aplicación con el botón central o haga clic en el botón Aceptar para salir de la aplicación ahora.',
			'deletenote': 'Borrar nota',
			'deletenotehint': '¿Quieres borrar esta nota? Esta acción no se puede revertir.',
			'nonotesfound': 'No se encontraron notas',
			'newnote': 'Nuevo',
			'ok': 'Okay',
			'retry': 'REVER',
			'oops': 'Vaya!',
			'save': 'Salvar',
			'cancel': 'Cancelar',
			'error': 'Error',
			'success': 'éxito',
			'skip': 'Omitir',
			'skiplogin': 'Omitir inicio de sesión',
			'skipregister': 'Evitar el registro',
			'dataloaderror': 'No se pudieron cargar los datos solicitados en este momento, verifique su conexión de datos y haga clic para volver a intentarlo.',
			'suggestedforyou': 'Sugerido para ti',
			'devotionals': 'Devocionales',
			'categories': 'Categorías',
			'category': 'Categoría',
			'videos': 'Videos',
			'audios': 'Audios',
			'biblebooks': 'Biblia',
			'audiobible': 'Biblia en audio',
			'sermons': 'Sermones',
			'profile': 'Perfil',
			'tools': 'Herramientas',
			'homesentence': 'Tu pastor durante 1 año, para ayudarte a convertirte en la persona que Dios te llamó a ser.',
			'livestreams': 'Transmisiones en vivo',
			'radio': 'Radio',
			'allitems': 'Todos los artículos',
			'emptyplaylist': 'Sin listas de reproducción',
			'notsupported': 'No soportado',
			'cleanupresources': 'Limpieza de recursos',
			'grantstoragepermission': 'Otorgue permiso de acceso al almacenamiento para continuar',
			'sharefiletitle': 'Mira o escucha ',
			'sharefilebody': 'Vía MyVirtualPastor App, Descarga ahora en ',
			'sharetext': 'Disfrute de transmisión ilimitada de audio y video',
			'sharetexthint': 'Únase a la plataforma de transmisión de video y audio que le permite ver y escuchar millones de archivos de todo el mundo. Descarga ahora en',
			'download': 'Descargar',
			'addplaylist': 'Agregar a la lista de reproducción',
			'bookmark': 'Marcador',
			'unbookmark': 'Desmarcar',
			'share': 'Compartir',
			'deletemedia': 'Borrar archivo',
			'deletemediahint': '¿Desea eliminar este archivo descargado? Esta acción no se puede deshacer.',
			'searchhint': 'Buscar mensajes de audio y video',
			'performingsearch': 'Búsqueda de audios y videos',
			'nosearchresult': 'No se han encontrado resultados',
			'nosearchresulthint': 'Intente ingresar una palabra clave más general',
			'addtoplaylist': 'Agregar a la lista de reproducción',
			'newplaylist': 'Nueva lista de reproducción',
			'playlistitm': 'Lista de reproducción',
			'mediaaddedtoplaylist': 'Medios agregados a la lista de reproducción.',
			'mediaremovedfromplaylist': 'Medios eliminados de la lista de reproducción',
			'clearplaylistmedias': 'Borrar todos los medios',
			'deletePlayList': 'Eliminar lista de reproducción',
			'clearplaylistmediashint': '¿Continuar y eliminar todos los medios de esta lista de reproducción?',
			'deletePlayListhint': '¿Continuar y eliminar esta lista de reproducción y borrar todos los medios?',
			'videomessages': 'Mensajes de video',
			'audiomessages': 'Mensajes de audio',
			'comments': 'Comentarios',
			'replies': 'Respuestas',
			'reply': 'Respuesta',
			'logintoaddcomment': 'Inicia sesión para añadir un comentario',
			'logintoreply': 'Inicia sesión para responder',
			'writeamessage': 'Escribe un mensaje...',
			'nocomments': 'No se encontraron comentarios \nhaga clic para reintentar',
			'errormakingcomments': 'No se pueden procesar los comentarios en este momento..',
			'errordeletingcomments': 'No se puede eliminar este comentario en este momento..',
			'erroreditingcomments': 'No se puede editar este comentario en este momento..',
			'errorloadingmorecomments': 'No se pueden cargar más comentarios en este momento..',
			'deletingcomment': 'Eliminando comentario',
			'editingcomment': 'Editando comentario',
			'deletecommentalert': 'Eliminar comentario',
			'editcommentalert': 'Editar comentario',
			'deletecommentalerttext': '¿Deseas borrar este comentario? Esta acción no se puede deshacer',
			'loadmore': 'carga más',
			'messages': 'Mensajes',
			'guestuser': 'Usuario invitado',
			'fullname': 'Nombre completo',
			'emailaddress': 'Dirección de correo electrónico',
			'password': 'Contraseña',
			'repeatpassword': 'Repite la contraseña',
			'register': 'Registrarse',
			'login': 'Iniciar sesión',
			'logout': 'Cerrar sesión',
			'logoutfromapp': '¿Salir de la aplicación?',
			'logoutfromapphint': 'No podrá dar me gusta o comentar artículos y videos si no ha iniciado sesión.',
			'gotologin': 'Ir a Iniciar sesión',
			'resetpassword': 'Restablecer la contraseña',
			'logintoaccount': '¿Ya tienes una cuenta? Iniciar sesión',
			'emptyfielderrorhint': 'Necesitas llenar todos los campos',
			'invalidemailerrorhint': 'Debes ingresar una dirección de correo electrónico válida',
			'passwordsdontmatch': 'Las contraseñas no coinciden',
			'processingpleasewait': 'Procesando .. por favor espere...',
			'createaccount': 'Crea una cuenta',
			'forgotpassword': '¿Se te olvidó tu contraseña?',
			'orloginwith': 'O inicie sesión con',
			'facebook': 'Facebook',
			'google': 'Google',
			'moreoptions': 'Mas opciones',
			'about': 'Sobre nosotros',
			'privacy': 'Privacidad',
			'terms': 'Términos de la aplicación',
			'rate': 'Calificar aplicacion',
			'version': 'Versión',
			'pulluploadmore': 'levantar la carga',
			'loadfailedretry': 'Error de carga. Haga clic en reintentar!',
			'releaseloadmore': 'suelte para cargar más',
			'nomoredata': 'No más datos',
			'errorReportingComment': 'Comentario de informe de error',
			'reportingComment': 'Informe de comentario',
			'reportcomment': 'Opciones de informe',
			'reportCommentsList.0': 'Contenido comercial no deseado o spam',
			'reportCommentsList.1': 'Pornografía o material sexual explícito',
			'reportCommentsList.2': 'Discurso de odio o violencia gráfica',
			'reportCommentsList.3': 'Acoso o intimidación',
			'bookmarksMedia': 'Mis marcadores',
			'noitemstodisplay': 'No hay elementos para mostrar',
			'loginrequired': 'Necesario iniciar sesión',
			'loginrequiredhint': 'Para suscribirse en esta plataforma, debe iniciar sesión. Cree una cuenta gratuita ahora o inicie sesión en su cuenta existente.',
			'subscriptions': 'Suscripciones de aplicaciones',
			'subscribe': 'SUSCRIBIR',
			'subscribehint': 'Se requiere suscripción',
			'playsubscriptionrequiredhint': 'Debe suscribirse antes de poder escuchar o ver este medio.',
			'previewsubscriptionrequiredhint': 'Ha alcanzado la duración de vista previa permitida para este medio. Debes suscribirte para seguir escuchando o viendo este medio.',
			'copiedtoclipboard': 'Copiado al portapapeles',
			'downloadbible': 'Descargar Biblia',
			'downloadversion': 'Descargar',
			'downloading': 'Descargando',
			'failedtodownload': 'Error al descargar',
			'pleaseclicktoretry': 'Haga clic para volver a intentarlo.',
			'of': 'De',
			'nobibleversionshint': 'No hay datos bíblicos para mostrar, haga clic en el botón de abajo para descargar al menos una versión bíblica.',
			'downloaded': 'Descargado',
			'enteremailaddresstoresetpassword': 'Ingrese su correo electrónico para restablecer su contraseña',
			'backtologin': 'ATRÁS PARA INICIAR SESIÓN',
			'signintocontinue': 'Regístrate para continuar',
			'signin': 'REGISTRARSE',
			'signinforanaccount': '¿REGÍSTRESE PARA OBTENER UNA CUENTA?',
			'alreadyhaveanaccount': '¿Ya tienes una cuenta?',
			'updateprofile': 'Actualización del perfil',
			'updateprofilehint': 'Para comenzar, actualice su página de perfil, esto nos ayudará a conectarlo con otras personas',
			'autoplayvideos': 'Reproducción automática de vídeos',
			'gosocial': 'Vuélvete social',
			'searchbible': 'Buscar Biblia',
			'filtersearchoptions': 'Opciones de búsqueda de filtros',
			'narrowdownsearch': 'Utilice el botón de filtro a continuación para reducir la búsqueda y obtener un resultado más preciso.',
			'searchbibleversion': 'Buscar la versión de la Biblia',
			'searchbiblebook': 'Buscar libro de la Biblia',
			'search': 'Buscar',
			'setBibleBook': 'Establecer libro de la Biblia',
			'oldtestament': 'Viejo Testamento',
			'newtestament': 'Nuevo Testamento',
			'limitresults': 'Establecer filtros',
			'setfilters': 'Establecer filtros',
			'bibletranslator': 'Traductor de la Biblia',
			'chapter': ' Capítulo ',
			'verse': ' Verso ',
			'translate': 'traducir',
			'bibledownloadinfo': 'Se inició la descarga de la Biblia. No cierre esta página hasta que se haya realizado la descarga.',
			'received': 'recibido',
			'outoftotal': 'fuera del total',
			'set': 'CONJUNTO',
			'selectColor': 'Seleccionar el color',
			'switchbibleversion': 'Cambiar versión de la Biblia',
			'switchbiblebook': 'Cambiar libro de la Biblia',
			'gotosearch': 'Ir al capítulo',
			'changefontsize': 'Cambia tamaño de fuente',
			'font': 'Font',
			'readchapter': 'Leer capítulo',
			'showhighlightedverse': 'Mostrar versículos destacados',
			'downloadmoreversions': 'Descarga más versiones',
			'suggestedusers': 'Usuarios sugeridos para seguir',
			'unfollow': 'Dejar de seguir',
			'follow': 'Seguir',
			'searchforpeople': 'Búsqueda de personas',
			'viewpost': 'Ver publicacion',
			'viewprofile': 'Ver perfil',
			'mypins': 'Mis Pines',
			'viewpinnedposts': 'Ver publicaciones fijadas',
			'personal': 'Personal',
			'update': 'Actualizar',
			'phonenumber': 'Número de teléfono',
			'showmyphonenumber': 'Mostrar mi número de teléfono a los usuarios',
			'dateofbirth': 'Fecha de nacimiento',
			'showmyfulldateofbirth': 'Mostrar mi fecha de nacimiento completa a las personas que ven mi estado',
			'notifications': 'Notificaciones',
			'notifywhenuserfollowsme': 'Notificarme cuando un usuario me siga',
			'notifymewhenusercommentsonmypost': 'Notificarme cuando los usuarios comenten en mi publicación',
			'notifymewhenuserlikesmypost': 'Notificarme cuando a los usuarios les guste mi publicación',
			'churchsocial': 'Iglesia Social',
			'shareyourthoughts': 'Comparte tus pensamientos',
			'readmore': '...Lee mas',
			'less': ' Menos',
			'couldnotprocess': 'No se pudo procesar la acción solicitada.',
			'pleaseselectprofilephoto': 'Seleccione una foto de perfil para cargar',
			'pleaseselectprofilecover': 'Seleccione una foto de portada para cargar',
			'updateprofileerrorhint': 'Debe ingresar su nombre, fecha de nacimiento, sexo, teléfono y ubicación antes de poder continuar.',
			'gender': 'Género',
			'male': 'Masculino',
			'female': 'Hembra',
			'dob': 'Fecha de nacimiento',
			'location': 'Ubicación actual',
			'qualification': 'Calificación',
			'aboutme': 'Sobre mí',
			'facebookprofilelink': 'Facebook Enlace de perfil',
			'twitterprofilelink': 'Twitter Enlace de perfil',
			'linkdln': 'Linkedln Enlace de perfil',
			'likes': 'Gustos',
			'likess': 'Me gusta(s)',
			'pinnedposts': 'Mis publicaciones fijadas',
			'unpinpost': 'Desanclar publicación',
			'unpinposthint': '¿Deseas eliminar esta publicación de tus publicaciones fijadas?',
			'postdetails': 'Detalles de la publicación',
			'posts': 'Publicaciones',
			'followers': 'Seguidores',
			'followings': 'Siguientes',
			'my': 'Mi',
			'edit': 'Editar',
			'delete': 'Eliminar',
			'deletepost': 'Eliminar mensaje',
			'deleteposthint': '¿Deseas eliminar esta publicación? Las publicaciones aún pueden aparecer en los feeds de algunos usuarios.',
			'maximumallowedsizehint': 'Se alcanzó la carga máxima de archivos permitida',
			'maximumuploadsizehint': 'El archivo seleccionado supera el límite de tamaño de archivo de carga permitido.',
			'makeposterror': 'No se puede publicar en este momento, haga clic para volver a intentarlo.',
			'makepost': 'Hacer publicación',
			'selectfile': 'Seleccione Archivo',
			'images': 'Imagenes',
			'shareYourThoughtsNow': 'Share your thoughts ...',
			'photoviewer': 'Visionneuse de photos',
			'nochatsavailable': 'No hay conversaciones disponibles \n Haga clic en el icono de agregar a continuación \n para seleccionar los usuarios con los que chatear',
			'typing': 'Mecanografía...',
			'photo': 'Photo',
			'online': 'En línea',
			'offline': 'Desconectado',
			'lastseen': 'Ultima vez visto',
			'deleteselectedhint': 'Esta acción eliminará los mensajes seleccionados. Tenga en cuenta que esto solo elimina su lado de la conversación, \n los mensajes seguirán apareciendo en el dispositivo de su socio.',
			'deleteselected': 'Eliminar seleccionado',
			'unabletofetchconversation': 'No se pudo recuperar \ntu conversación con \n',
			'loadmoreconversation': 'Cargar más conversaciones',
			'sendyourfirstmessage': 'Envía tu primer mensaje a \n',
			'unblock': 'Desatascar ',
			'block': 'Bloquear ',
			'writeyourmessage': 'escribe tu mensaje...',
			'clearconversation': 'Conversación clara',
			'clearconversationhintone': 'Esta acción borrará toda su conversación con ',
			'clearconversationhinttwo': '.\n  Tenga en cuenta que esto solo elimina su lado de la conversación, los mensajes aún se mostrarán en el chat de sus socios.',
			'facebookloginerror': 'Something went wrong with the login process.\n, Here is the error Facebook gave us',
			'selectLanguage': 'Seleccionar idioma',
			'howTo': 'Cómo',
			'noBibleTextsAvailable': 'No hay textos bíblicos disponibles',
			'languages': 'Idiomas',
			'searchLanguages': 'Buscar idiomas...',
			'biblesFilesets': 'Biblias: {bibles}, Conjuntos de archivos: {filesets}',
			'oldTestament': 'Antiguo Testamento',
			'newTestament': 'Nuevo Testamento',
			'play': 'Reproducir',
			'no_verse_content': 'No hay contenido de versículos bíblicos disponible para mostrar.',
			'no_audio_content': 'No hay contenido de audio de la Biblia disponible para mostrar.',
		};
	}
}

extension on _StringsFr {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'VirtualPastor',
			'deleteaccount': 'Delete my account',
			'deletemyaccount': 'Delete my account',
			'deleteaccounthint': 'This action will delete your account and remove all your data, once your data is deleted, it cannot be recovered.',
			'deleteaccountsuccess': 'Account deletion was succesful',
			'selectlanguage': 'Choisir la langue',
			'chooseapplanguage': 'Choisissez la langue de l\'application',
			'nightmode': 'Mode nuit',
			'initializingapp': 'initialisation...',
			'home': 'Accueil',
			'branches': 'Branches',
			'inbox': 'Boîte de réception',
			'downloads': 'Téléchargements',
			'settings': 'Paramètres',
			'events': 'Événements',
			'myplaylists': 'Mes listes de lecture',
			'nonotesfound': 'Aucune note trouvée',
			'newnote': 'Nouveau',
			'website': 'Site Internet',
			'hymns': 'Hymnes',
			'articles': 'Des articles',
			'notes': 'Remarques',
			'donate': 'Faire un don',
			'offering': 'Offre',
			'deletenote': 'Supprimer la note',
			'deletenotehint': 'Voulez-vous supprimer cette note? Cette action ne peut pas être annulée.',
			'savenotetitle': 'Titre de la note',
			'bookmarks': 'Favoris',
			'socialplatforms': 'Plateformes sociales',
			'onboardingpagetitles.0': 'Bienvenue à MyChurch',
			'onboardingpagetitles.1': 'Plein de fonctionnalités',
			'onboardingpagetitles.2': 'Audio, Video \n et diffusion en direct',
			'onboardingpagetitles.3': 'Créer un compte',
			'onboardingpagehints.0': 'Prolongez-vous au-delà des dimanches matins et des quatre murs de votre église. Tout ce dont vous avez besoin pour communiquer et interagir avec un monde axé sur le mobile.',
			'onboardingpagehints.1': 'Nous avons rassemblé toutes les fonctionnalités principales que votre application d\'église doit avoir. Événements, dévotions, notifications, notes et bible multi-version.',
			'onboardingpagehints.2': 'Permettez aux utilisateurs du monde entier de regarder des vidéos, d\'écouter des messages audio et de regarder des flux en direct de vos services religieux.',
			'onboardingpagehints.3': 'Commencez votre voyage vers une expérience de culte sans fin.',
			'next': 'SUIVANT',
			'done': 'COMMENCER',
			'quitapp': 'Quitter l\'application!',
			'quitappwarning': 'Souhaitez-vous fermer l\'application?',
			'quitappaudiowarning': 'Vous êtes en train de lire un fichier audio, quitter l\'application arrêtera la lecture audio. Si vous ne souhaitez pas arrêter la lecture, réduisez simplement l\'application avec le bouton central ou cliquez sur le bouton OK pour quitter l\'application maintenant.',
			'ok': 'D\'accord',
			'retry': 'RECOMMENCEZ',
			'oops': 'Oups!',
			'save': 'sauver',
			'cancel': 'Annuler',
			'error': 'Erreur',
			'success': 'Succès',
			'skip': 'Sauter',
			'skiplogin': 'Passer l\'identification',
			'skipregister': 'Sauter l\'inscription',
			'dataloaderror': 'Impossible de charger les données demandées pour le moment, vérifiez votre connexion de données et cliquez pour réessayer.',
			'suggestedforyou': 'Suggéré pour vous',
			'devotionals': 'Dévotion',
			'categories': 'Catégories',
			'category': 'Catégorie',
			'videos': 'Vidéos',
			'audios': 'Audios',
			'biblebooks': 'Bible',
			'sermons': 'Sermons',
			'profile': 'Profil',
			'tools': 'Outils',
			'audiobible': 'Bible audio',
			'homesentence': 'Votre pasteur pour 1 an, pour vous aider à devenir la personne que Dieu vous a appelé à être.',
			'livestreams': 'Livestreams',
			'radio': 'Radio',
			'allitems': 'Tous les articles',
			'emptyplaylist': 'Aucune liste de lecture',
			'notsupported': 'Non supporté',
			'cleanupresources': 'Nettoyage des ressources',
			'grantstoragepermission': 'Veuillez accorder l\'autorisation d\'accès au stockage pour continuer',
			'sharefiletitle': 'Regarder ou écouter ',
			'sharefilebody': 'Via MyVirtualPastor App, Téléchargez maintenant sur ',
			'sharetext': 'Profitez d\'un streaming audio et vidéo illimité',
			'sharetexthint': 'Rejoignez la plateforme de streaming vidéo et audio qui vous permet de regarder et d\'écouter des millions de fichiers du monde entier. Téléchargez maintenant sur',
			'download': 'Télécharger',
			'addplaylist': 'Ajouter à la playlist',
			'bookmark': 'Signet',
			'unbookmark': 'Supprimer les favoris',
			'share': 'Partager',
			'deletemedia': 'Supprimer le fichier',
			'deletemediahint': 'Souhaitez-vous supprimer ce fichier téléchargé? Cette action ne peut pas être annulée.',
			'searchhint': 'Rechercher des messages audio et vidéo',
			'performingsearch': 'Recherche d\'audio et de vidéos',
			'nosearchresult': 'Aucun résultat trouvé',
			'nosearchresulthint': 'Essayez de saisir un mot clé plus général',
			'addtoplaylist': 'Ajouter à la playlist',
			'newplaylist': 'Nouvelle playlist',
			'playlistitm': 'Playlist',
			'mediaaddedtoplaylist': 'Média ajouté à la playlist.',
			'mediaremovedfromplaylist': 'Média supprimé de la playlist',
			'clearplaylistmedias': 'Effacer tous les médias',
			'deletePlayList': 'Supprimer la playlist',
			'clearplaylistmediashint': 'Voulez-vous supprimer tous les médias de cette liste de lecture?',
			'deletePlayListhint': 'Voulez-vous supprimer cette liste de lecture et effacer tous les médias?',
			'videomessages': 'Messages vidéo',
			'audiomessages': 'Messages audio',
			'comments': 'commentaires',
			'replies': 'réponses',
			'reply': 'Répondre',
			'logintoaddcomment': 'Connectez-vous pour ajouter un commentaire',
			'logintoreply': 'Connectez-vous pour répondre',
			'writeamessage': 'Écrire un message...',
			'nocomments': 'Aucun commentaire trouvé \ncliquez pour réessayer',
			'errormakingcomments': 'Impossible de traiter les commentaires pour le moment..',
			'errordeletingcomments': 'Impossible de supprimer ce commentaire pour le moment..',
			'erroreditingcomments': 'Impossible de modifier ce commentaire pour le moment..',
			'errorloadingmorecomments': 'Impossible de charger plus de commentaires pour le moment..',
			'deletingcomment': 'Suppression du commentaire',
			'editingcomment': 'Modification du commentaire',
			'deletecommentalert': 'Supprimer le commentaire',
			'editcommentalert': 'Modifier le commentaire',
			'deletecommentalerttext': 'Souhaitez-vous supprimer ce commentaire? Cette action ne peut pas être annulée',
			'loadmore': 'charger plus',
			'messages': 'Messages',
			'guestuser': 'Utilisateur invité',
			'fullname': 'Nom complet',
			'emailaddress': 'Adresse électronique',
			'password': 'Mot de passe',
			'repeatpassword': 'Répéter le mot de passe',
			'register': 'S\'inscrire',
			'login': 'S\'identifier',
			'logout': 'Se déconnecter',
			'logoutfromapp': 'Déconnexion de l\'application?',
			'logoutfromapphint': 'Vous ne pourrez pas aimer ou commenter des articles et des vidéos si vous n\'êtes pas connecté.',
			'gotologin': 'Aller à la connexion',
			'resetpassword': 'réinitialiser le mot de passe',
			'logintoaccount': 'Vous avez déjà un compte? S\'identifier',
			'emptyfielderrorhint': 'Vous devez remplir tous les champs',
			'invalidemailerrorhint': 'Vous devez saisir une adresse e-mail valide',
			'passwordsdontmatch': 'Les mots de passe ne correspondent pas',
			'processingpleasewait': 'Traitement, veuillez patienter...',
			'createaccount': 'Créer un compte',
			'forgotpassword': 'Mot de passe oublié?',
			'orloginwith': 'Ou connectez-vous avec',
			'facebook': 'Facebook',
			'google': 'Google',
			'moreoptions': 'Plus d\'options',
			'about': 'À propos de nous',
			'privacy': 'confidentialité',
			'terms': 'Termes de l\'application',
			'rate': 'Application de taux',
			'version': 'Version',
			'pulluploadmore': 'tirer la charge',
			'loadfailedretry': 'Échec du chargement! Cliquez sur Réessayer!',
			'releaseloadmore': 'relâchez pour charger plus',
			'nomoredata': 'Plus de données',
			'errorReportingComment': 'Commentaire de rapport d\'erreur',
			'reportingComment': 'Signaler un commentaire',
			'reportcomment': 'Options de rapport',
			'reportCommentsList.0': 'Contenu commercial indésirable ou spam',
			'reportCommentsList.1': 'Pornographie ou matériel sexuel explicite',
			'reportCommentsList.2': 'Discours haineux ou violence graphique',
			'reportCommentsList.3': 'Harcèlement ou intimidation',
			'bookmarksMedia': 'Mes marque-pages',
			'noitemstodisplay': 'Aucun élément à afficher',
			'loginrequired': 'Connexion requise',
			'loginrequiredhint': 'Pour vous abonner à cette plateforme, vous devez être connecté. Créez un compte gratuit maintenant ou connectez-vous à votre compte existant.',
			'subscriptions': 'Abonnements aux applications',
			'subscribe': 'SOUSCRIRE',
			'subscribehint': 'Abonnement requis',
			'playsubscriptionrequiredhint': 'Vous devez vous abonner avant de pouvoir écouter ou regarder ce média.',
			'previewsubscriptionrequiredhint': 'Vous avez atteint la durée de prévisualisation autorisée pour ce média. Vous devez vous abonner pour continuer à écouter ou à regarder ce média.',
			'copiedtoclipboard': 'Copié dans le presse-papier',
			'downloadbible': 'Télécharger la Bible',
			'downloadversion': 'Télécharger',
			'downloading': 'Téléchargement',
			'failedtodownload': 'Échec du téléchargement',
			'pleaseclicktoretry': 'Veuillez cliquer pour réessayer.',
			'of': 'De',
			'nobibleversionshint': 'Il n\'y a pas de données bibliques à afficher, cliquez sur le bouton ci-dessous pour télécharger au moins une version biblique.',
			'downloaded': 'Téléchargé',
			'enteremailaddresstoresetpassword': 'Entrez votre e-mail pour réinitialiser votre mot de passe',
			'backtologin': 'RETOUR CONNEXION',
			'signintocontinue': 'Connectez-vous pour continuer',
			'signin': 'SE CONNECTER',
			'signinforanaccount': 'INSCRIVEZ-VOUS POUR UN COMPTE?',
			'alreadyhaveanaccount': 'Vous avez déjà un compte?',
			'updateprofile': 'Mettre à jour le profil',
			'updateprofilehint': 'Pour commencer, veuillez mettre à jour votre page de profil, cela nous aidera à vous connecter avec d\'autres personnes',
			'autoplayvideos': 'Vidéos de lecture automatique',
			'gosocial': 'Passez aux réseaux sociaux',
			'searchbible': 'Rechercher dans la Bible',
			'filtersearchoptions': 'Filtrer les options de recherche',
			'narrowdownsearch': 'Utilisez le bouton de filtrage ci-dessous pour affiner la recherche pour un résultat plus précis.',
			'searchbibleversion': 'Rechercher la version de la Bible',
			'searchbiblebook': 'Rechercher un livre biblique',
			'search': 'Chercher',
			'setBibleBook': 'Définir le livre de la Bible',
			'oldtestament': 'L\'Ancien Testament',
			'newtestament': 'Nouveau Testament',
			'limitresults': 'Limiter les résultats',
			'setfilters': 'Définir les filtres',
			'bibletranslator': 'Traducteur de la Bible',
			'chapter': ' Chapitre ',
			'verse': ' Verset ',
			'translate': 'traduire',
			'bibledownloadinfo': 'Le téléchargement de la Bible a commencé, veuillez ne pas fermer cette page tant que le téléchargement n\'est pas terminé.',
			'received': 'reçu',
			'outoftotal': 'sur le total',
			'set': 'ENSEMBLE',
			'selectColor': 'Select Color',
			'switchbibleversion': 'Changer de version de la Bible',
			'switchbiblebook': 'Changer de livre biblique',
			'gotosearch': 'Aller au chapitre',
			'changefontsize': 'Changer la taille de la police',
			'font': 'Police de caractère',
			'readchapter': 'Lire le chapitre',
			'showhighlightedverse': 'Afficher les versets en surbrillance',
			'downloadmoreversions': 'Télécharger plus de versions',
			'suggestedusers': 'Utilisateurs suggérés à suivre',
			'unfollow': 'Ne pas suivre',
			'follow': 'Suivre',
			'searchforpeople': 'Recherche de personnes',
			'viewpost': 'Voir l\'article',
			'viewprofile': 'Voir le profil',
			'mypins': 'Mes épingles',
			'viewpinnedposts': 'Afficher les messages épinglés',
			'personal': 'Personnel',
			'update': 'Mettre à jour',
			'phonenumber': 'Numéro de téléphone',
			'showmyphonenumber': 'Afficher mon numéro de téléphone aux utilisateurs',
			'dateofbirth': 'Date de naissance',
			'showmyfulldateofbirth': 'Afficher ma date de naissance complète aux personnes qui consultent mon statut',
			'notifications': 'Notifications',
			'notifywhenuserfollowsme': 'M\'avertir lorsqu\'un utilisateur me suit',
			'notifymewhenusercommentsonmypost': 'M\'avertir lorsque les utilisateurs commentent mon message',
			'notifymewhenuserlikesmypost': 'M\'avertir lorsque les utilisateurs aiment mon message',
			'churchsocial': 'Église sociale',
			'shareyourthoughts': 'Partage tes pensées',
			'readmore': '...Lire la suite',
			'less': ' Moins',
			'couldnotprocess': 'Impossible de traiter l\'action demandée.',
			'pleaseselectprofilephoto': 'Veuillez sélectionner une photo de profil à télécharger',
			'pleaseselectprofilecover': 'Veuillez sélectionner une photo de couverture à télécharger',
			'updateprofileerrorhint': 'Vous devez renseigner votre nom, date de naissance, sexe, téléphone et lieu avant de pouvoir continuer.',
			'gender': 'Le sexe',
			'male': 'Mâle',
			'female': 'Femme',
			'dob': 'Date de naissance',
			'location': 'Localisation actuelle',
			'qualification': 'Qualification',
			'aboutme': 'À propos de moi',
			'facebookprofilelink': 'Lien de profil Facebook',
			'twitterprofilelink': 'Lien de profil Twitter',
			'linkdln': 'Lien de profil Linkedln',
			'likes': 'Aime',
			'likess': 'Comme',
			'pinnedposts': 'Mes messages épinglés',
			'unpinpost': 'Détacher le message',
			'unpinposthint': 'Souhaitez-vous supprimer ce message de vos messages épinglés?',
			'postdetails': 'Détails de l\'article',
			'posts': 'Des postes',
			'followers': 'Suiveurs',
			'followings': 'Suivi',
			'my': 'Mon',
			'edit': 'Éditer',
			'delete': 'Supprimer',
			'deletepost': 'Supprimer le message',
			'deleteposthint': 'Souhaitez-vous supprimer ce message? Les publications peuvent toujours apparaître sur les flux de certains utilisateurs.',
			'maximumallowedsizehint': 'Téléchargement de fichier maximum autorisé atteint',
			'maximumuploadsizehint': 'Le fichier sélectionné dépasse la limite de taille de fichier de téléchargement autorisée.',
			'makeposterror': 'Impossible de publier un message pour le moment, veuillez cliquer pour réessayer.',
			'makepost': 'Faire un message',
			'selectfile': 'Choisir le dossier',
			'images': 'Images',
			'shareYourThoughtsNow': 'Share your thoughts ...',
			'photoviewer': 'Visor de fotos',
			'nochatsavailable': 'Aucune conversation disponible \n Cliquez sur l\'icône d\'ajout ci-dessous \n pour sélectionner les utilisateurs avec lesquels discuter',
			'typing': 'Dactylographie...',
			'photo': 'Foto',
			'online': 'En ligne',
			'offline': 'Hors ligne',
			'lastseen': 'Dernière vue',
			'deleteselectedhint': 'Cette action supprimera les messages sélectionnés. Veuillez noter que cela ne supprime que votre côté de la conversation, \n les messages s\'afficheront toujours sur votre appareil partenaire.',
			'deleteselected': 'Supprimer sélectionnée',
			'unabletofetchconversation': 'Impossible de récupérer \n votre conversation avec \n',
			'loadmoreconversation': 'Charger plus de conversations',
			'sendyourfirstmessage': 'Envoyez votre premier message à \n',
			'unblock': 'Débloquer ',
			'block': 'Bloquer ',
			'writeyourmessage': 'Rédigez votre message...',
			'clearconversation': 'Conversation claire',
			'clearconversationhintone': 'Cette action effacera toute votre conversation avec ',
			'clearconversationhinttwo': '.\n  Veuillez noter que cela ne supprime que votre côté de la conversation, les messages seront toujours affichés sur le chat de votre partenaire.',
			'facebookloginerror': 'Something went wrong with the login process.\n, Here is the error Facebook gave us',
			'selectLanguage': 'Choisir la langue',
			'howTo': 'Comment',
			'noBibleTextsAvailable': 'Aucun texte biblique disponible',
			'languages': 'Langues',
			'searchLanguages': 'Rechercher des langues...',
			'biblesFilesets': 'Bibles: {bibles}, Jeux de fichiers: {filesets}',
			'oldTestament': 'Ancien Testament',
			'newTestament': 'Nouveau Testament',
			'play': 'Reproducir',
			'no_verse_content': 'Aucun contenu de verset biblique disponible à afficher.',
			'no_audio_content': 'Aucun contenu audio de la Bible disponible à afficher.',
		};
	}
}

extension on _StringsHi {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'मेरा वर्चुअल पास्टर',
			'selectlanguage': 'भाषा चुनें',
			'deletemyaccount': 'मेरा खाता हटाएं',
			'deleteaccount': 'खाता हटाएं',
			'deleteaccounthint': 'यह कार्रवाई आपके खाते को हटा देगी और आपके सभी डेटा को निकाल देगी। एक बार डेटा हटा दिया गया, तो इसे पुनः प्राप्त नहीं किया जा सकता।',
			'deleteaccountsuccess': 'खाता हटाने में सफल रहा',
			'chooseapplanguage': 'ऐप भाषा चुनें',
			'nightmode': 'रात मोड',
			'initializingapp': 'प्रारंभ हो रहा है...',
			'home': 'होम',
			'branches': 'शाखाएँ',
			'inbox': 'इनबॉक्स',
			'downloads': 'डाउनलोड्स',
			'settings': 'सेटिंग्स',
			'events': 'घटनाएँ',
			'myplaylists': 'मेरी प्लेलिस्ट्स',
			'website': 'वेबसाइट',
			'hymns': 'भजन',
			'articles': 'लेख',
			'notes': 'टिप्पणियाँ',
			'donate': 'दान',
			'offering': 'प्रस्ताव',
			'savenotetitle': 'टिप्पणी शीर्षक',
			'nonotesfound': 'कोई टिप्पणियाँ नहीं मिलीं',
			'newnote': 'नया',
			'deletenote': 'टिप्पणी हटाएं',
			'deletenotehint': 'क्या आप इस टिप्पणी को हटाना चाहते हैं? इस कार्रवाई को वापस नहीं किया जा सकता।',
			'bookmarks': 'बुकमार्क्स',
			'socialplatforms': 'सामाजिक प्लेटफ़ॉर्म्स',
			'onboardingpagetitles.0': 'मेरे चर्च में स्वागत है',
			'onboardingpagetitles.1': 'विशेषताओं से भरपूर',
			'onboardingpagetitles.2': 'ऑडियो, वीडियो \n और लाइव स्ट्रीमिंग',
			'onboardingpagetitles.3': 'खाता बनाएं',
			'onboardingpagehints.0': 'रविवार की सुबहों और आपके गिरजाघर की चार दीवारों से आगे बढ़ें। एक मोबाइल-मुख्य की दुनिया के साथ संवाद करने और जुड़ने के लिए सब कुछ।',
			'onboardingpagehints.1': 'हमने आपके चर्च ऐप में होने वाले सभी शीर्ष सुविधाओं को एक साथ लाया है। घटनाएँ, भक्तिगान, सूचनाएं, टिप्पणियाँ और बहु-संस्करणीय बाइबल।',
			'onboardingpagehints.2': 'यह उपयोगकर्ताओं को पूरे विश्व में आपकी चर्च सेवाओं की वीडियो देखने, ऑडियो संदेश सुनने और लाइव स्ट्रीमिंग करने की स्वीकृति देता है।',
			'onboardingpagehints.3': 'अनंत आराधना अनुभव के लिए अपनी यात्रा शुरू करें।',
			'next': 'आगे',
			'done': 'शुरू करें',
			'quitapp': 'ऐप छोड़ें!',
			'quitappwarning': 'क्या आप ऐप को बंद करना चाहते हैं?',
			'quitappaudiowarning': 'आप वर्तमान में ऑडियो चला रहे हैं। ऐप बंद करने से ऑडियो प्लेबैक रुक जाएगा। यदि आप प्लेबैक रोकना नहीं चाहते हैं, तो केंद्रीय बटन के साथ ऐप को मिनिमाइज करें या ठीक बटन पर क्लिक करें।',
			'ok': 'ठीक है',
			'retry': 'पुनः प्रयास करें',
			'oops': 'ऊप्स!',
			'save': 'सहेजें',
			'cancel': 'रद्द करें',
			'error': 'त्रुटि',
			'success': 'सफलता',
			'skip': 'छोड़ें',
			'skiplogin': 'लॉगिन छोड़ें',
			'skipregister': 'रजिस्ट्रेशन छोड़ें',
			'dataloaderror': 'वर्तमान में अनुरोधित डेटा लोड नहीं किया जा सका। अपना डेटा कनेक्शन जांचें और पुनः प्रयास करें।',
			'suggestedforyou': 'आपके लिए सुझावित',
			'videomessages': 'वीडियो संदेश',
			'audiomessages': 'ऑडियो संदेश',
			'devotionals': 'ध्यान',
			'categories': 'श्रेणियाँ',
			'category': 'श्रेणी',
			'videos': 'वीडियो',
			'audios': 'ऑडियो',
			'biblebooks': 'बाइबल',
			'sermons': 'उपदेश',
			'tools': 'उपकरण',
			'profile': 'प्रोफ़ाइल',
			'audiobible': 'ऑडियो बाइबल',
			'homesentence': 'आपके पास्टर के रूप में 1 वर्ष के लिए, आपको उस व्यक्ति में बढ़ने में मदद करने के लिए जो भगवान ने आपको बुलाया है।',
			'livestreams': 'लाइव स्ट्रीम्स',
			'radio': 'रेडियो',
			'allitems': 'सभी आइटम्स',
			'emptyplaylist': 'कोई प्लेलिस्ट नहीं',
			'notsupported': 'समर्थित नहीं है',
			'cleanupresources': 'संसाधन साफ़ करें',
			'grantstoragepermission': 'कृपया जारी रखने के लिए भंडारण अनुमति प्रदान करें',
			'sharefiletitle': 'देखें या सुनें ',
			'sharefilebody': 'मेरा वर्चुअल पास्टर ऐप के माध्यम से, अभी डाउनलोड करें ',
			'sharetext': 'असीमित ऑडियो और वीडियो स्ट्रीमिंग का आनंद लें',
			'sharetexthint': 'वीडियो और ऑडियो स्ट्रीमिंग प्लेटफ़ॉर्म से जुड़ें जो आपको दुनिया भर से लाखों फ़ाइलें देखने और सुनने देता है। अभी डाउनलोड करें ',
			'download': 'डाउनलोड',
			'addplaylist': 'प्लेलिस्ट में जोड़ें',
			'bookmark': 'बुकमार्क',
			'unbookmark': 'बुकमार्क हटाएं',
			'share': 'शेयर करें',
			'deletemedia': 'फ़ाइल हटाएं',
			'deletemediahint': 'क्या आप इस डाउनलोड की गई फ़ाइल को हटाना चाहते हैं? यह कार्रवाई पूर्ववत नहीं की जा सकती।',
			'searchhint': 'ऑडियो और वीडियो संदेश खोजें',
			'performingsearch': 'ऑडियो और वीडियो खोज रहे हैं',
			'nosearchresult': 'कोई परिणाम नहीं मिला',
			'nosearchresulthint': 'अधिक सामान्य कीवर्ड दर्ज करने का प्रयास करें',
			'addtoplaylist': 'प्लेलिस्ट में जोड़ें',
			'newplaylist': 'नई प्लेलिस्ट',
			'playlistitm': 'प्लेलिस्ट',
			'mediaaddedtoplaylist': 'मीडिया प्लेलिस्ट में जोड़ा गया।',
			'mediaremovedfromplaylist': 'मीडिया प्लेलिस्ट से हटाया गया',
			'clearplaylistmedias': 'सभी मीडिया साफ़ करें',
			'deletePlayList': 'प्लेलिस्ट हटाएं',
			'clearplaylistmediashint': 'क्या आप इस प्लेलिस्ट से सभी मीडिया हटाना चाहते हैं?',
			'deletePlayListhint': 'क्या आप इस प्लेलिस्ट को हटाना चाहते हैं और सभी मीडिया को साफ़ करना चाहते हैं?',
			'comments': 'टिप्पणियाँ',
			'replies': 'उत्तर',
			'reply': 'उत्तर दें',
			'logintoaddcomment': 'टिप्पणी जोड़ने के लिए लॉगिन करें',
			'logintoreply': 'उत्तर देने के लिए लॉगिन करें',
			'writeamessage': 'संदेश लिखें...',
			'nocomments': 'कोई टिप्पणियाँ नहीं मिलीं \nकृपया पुनः प्रयास करें',
			'errormakingcomments': 'वर्तमान में टिप्पणी करने में असमर्थ।',
			'errordeletingcomments': 'वर्तमान में इस टिप्पणी को हटाने में असमर्थ।',
			'erroreditingcomments': 'वर्तमान में इस टिप्पणी को संपादित करने में असमर्थ।',
			'errorloadingmorecomments': 'वर्तमान में अधिक टिप्पणियाँ लोड करने में असमर्थ।',
			'deletingcomment': 'टिप्पणी हटा रहे हैं',
			'editingcomment': 'टिप्पणी संपादित कर रहे हैं',
			'deletecommentalert': 'टिप्पणी हटाएं',
			'editcommentalert': 'टिप्पणी संपादित करें',
			'deletecommentalerttext': 'क्या आप इस टिप्पणी को हटाना चाहते हैं? यह कार्रवाई पूर्ववत नहीं की जा सकती',
			'loadmore': 'अधिक लोड करें',
			'messages': 'संदेश',
			'guestuser': 'अतिथि उपयोगकर्ता',
			'fullname': 'पूरा नाम',
			'emailaddress': 'ईमेल पता',
			'password': 'पासवर्ड',
			'repeatpassword': 'पासवर्ड दोहराएं',
			'register': 'रजिस्टर करें',
			'login': 'लॉगिन',
			'logout': 'लॉगआउट',
			'logoutfromapp': 'ऐप से लॉगआउट करें?',
			'logoutfromapphint': 'यदि आप लॉगिन नहीं हैं तो आप लेख और वीडियो पर टिप्पणी या पसंद नहीं कर पाएंगे।',
			'gotologin': 'लॉगिन पर जाएं',
			'resetpassword': 'पासवर्ड रीसेट करें',
			'logintoaccount': 'पहले से ही एक खाता है? लॉगिन करें',
			'emptyfielderrorhint': 'आपको सभी फ़ील्ड भरने की आवश्यकता है',
			'invalidemailerrorhint': 'आपको एक वैध ईमेल पता दर्ज करना होगा',
			'passwordsdontmatch': 'पासवर्ड मेल नहीं खाते',
			'processingpleasewait': 'प्रसंस्करण हो रहा है, कृपया प्रतीक्षा करें...',
			'createaccount': 'खाता बनाएं',
			'forgotpassword': 'पासवर्ड भूल गए?',
			'orloginwith': 'या लॉगिन करें',
			'facebook': 'फेसबुक',
			'google': 'गूगल',
			'moreoptions': 'अधिक विकल्प',
			'about': 'हमारे बारे में',
			'privacy': 'गोपनीयता नीति',
			'terms': 'ऐप की शर्तें',
			'rate': 'ऐप को रेट करें',
			'version': 'संस्करण',
			'pulluploadmore': 'लोड करने के लिए ऊपर खींचें',
			'loadfailedretry': 'लोड असफल! पुनः प्रयास के लिए क्लिक करें!',
			'releaseloadmore': 'लोड करने के लिए जारी करें',
			'nomoredata': 'और डेटा नहीं',
			'errorReportingComment': 'टिप्पणी की रिपोर्टिंग त्रुटि',
			'reportingComment': 'टिप्पणी की रिपोर्टिंग',
			'reportcomment': 'रिपोर्ट विकल्प',
			'reportCommentsList.0': 'अनचाहा व्यावसायिक सामग्री या स्पैम',
			'reportCommentsList.1': 'अश्लीलता या यौन स्पष्ट सामग्री',
			'reportCommentsList.2': 'घृणा भाषण या ग्राफिक हिंसा',
			'reportCommentsList.3': 'उत्पीड़न या धमकाना',
			'bookmarksMedia': 'मेरे बुकमार्क्स',
			'noitemstodisplay': 'प्रदर्शित करने के लिए कोई आइटम नहीं',
			'loginrequired': 'लॉगिन आवश्यक',
			'loginrequiredhint': 'इस प्लेटफ़ॉर्म पर सदस्यता लेने के लिए, आपको लॉगिन करना होगा। अभी एक मुफ्त खाता बनाएं या अपने मौजूदा खाते में लॉगिन करें।',
			'subscriptions': 'ऐप सब्स्क्रिप्शन',
			'subscribe': 'सदस्यता लें',
			'subscribehint': 'सदस्यता आवश्यक',
			'playsubscriptionrequiredhint': 'इस मीडिया को सुनने या देखने से पहले आपको सदस्यता लेनी होगी।',
			'previewsubscriptionrequiredhint': 'आपने इस मीडिया के लिए अनुमत पूर्वावलोकन अवधि पूरी कर ली है। सुनने या देखने के लिए आपको सदस्यता लेनी होगी।',
			'copiedtoclipboard': 'क्लिपबोर्ड में कॉपी किया गया',
			'downloadbible': 'बाइबल डाउनलोड करें',
			'downloadversion': 'डाउनलोड करें',
			'downloading': 'डाउनलोड हो रहा है',
			'failedtodownload': 'डाउनलोड करने में विफल',
			'pleaseclicktoretry': 'कृपया पुनः प्रयास के लिए क्लिक करें।',
			'of': 'का',
			'nobibleversionshint': 'प्रदर्शित करने के लिए कोई बाइबल डेटा नहीं है, कम से कम एक बाइबल संस्करण डाउनलोड करने के लिए नीचे दिए गए बटन पर क्लिक करें।',
			'downloaded': 'डाउनलोड किया गया',
			'enteremailaddresstoresetpassword': 'अपना पासवर्ड रीसेट करने के लिए अपना ईमेल दर्ज करें',
			'backtologin': 'लॉगिन पर वापस जाएं',
			'signintocontinue': 'जारी रखने के लिए साइन इन करें',
			'signin': 'साइन इन',
			'signinforanaccount': 'खाता बनाने के लिए साइन अप करें?',
			'alreadyhaveanaccount': 'पहले से ही खाता है?',
			'updateprofile': 'प्रोफ़ाइल अपडेट करें',
			'updateprofilehint': 'शुरू करने के लिए, कृपया अपनी प्रोफ़ाइल पृष्ठ को अपडेट करें, यह हमें अन्य लोगों के साथ जोड़ने में मदद करेगा',
			'autoplayvideos': 'वीडियो ऑटोप्ले',
			'gosocial': 'सोशल पर जाएं',
			'searchbible': 'बाइबल खोजें',
			'filtersearchoptions': 'खोज विकल्पों को फ़िल्टर करें',
			'narrowdownsearch': 'अधिक सटीक परिणाम के लिए नीचे दिए गए फ़िल्टर बटन का उपयोग करें।',
			'searchbibleversion': 'बाइबल संस्करण खोजें',
			'searchbiblebook': 'बाइबल पुस्तक खोजें',
			'search': 'खोजें',
			'setBibleBook': 'बाइबल पुस्तक सेट करें',
			'oldtestament': 'पुराना नियम',
			'newtestament': 'नया नियम',
			'limitresults': 'परिणाम सीमित करें',
			'setfilters': 'फ़िल्टर सेट करें',
			'bibletranslator': 'बाइबल अनुवादक',
			'chapter': ' अध्याय ',
			'verse': ' पद ',
			'translate': 'अनुवाद करें',
			'bibledownloadinfo': 'बाइबल डाउनलोड शुरू हो गया है, कृपया डाउनलोड पूरा होने तक इस पृष्ठ को बंद न करें।',
			'received': 'प्राप्त',
			'outoftotal': 'कुल में से',
			'set': 'सेट करें',
			'selectColor': 'रंग चुनें',
			'switchbibleversion': 'बाइबल संस्करण बदलें',
			'switchbiblebook': 'बाइबल पुस्तक बदलें',
			'gotosearch': 'अध्याय पर जाएं',
			'changefontsize': 'फ़ॉन्ट आकार बदलें',
			'font': 'फ़ॉन्ट',
			'readchapter': 'अध्याय पढ़ें',
			'showhighlightedverse': 'हाइलाइट किए गए पद दिखाएं',
			'downloadmoreversions': 'अधिक संस्करण डाउनलोड करें',
			'suggestedusers': 'अनुशंसित उपयोगकर्ता',
			'unfollow': 'अनफॉलो',
			'follow': 'फॉलो करें',
			'searchforpeople': 'लोगों को खोजें',
			'viewpost': 'पोस्ट देखें',
			'viewprofile': 'प्रोफ़ाइल देखें',
			'mypins': 'मेरे पिन्स',
			'viewpinnedposts': 'पिन किए गए पोस्ट देखें',
			'personal': 'व्यक्तिगत',
			'update': 'अपडेट करें',
			'phonenumber': 'फ़ोन नंबर',
			'showmyphonenumber': 'मेरा फ़ोन नंबर उपयोगकर्ताओं को दिखाएं',
			'dateofbirth': 'जन्म तिथि',
			'showmyfulldateofbirth': 'मेरा पूरा जन्मदिन देखने वाले लोगों को दिखाएं',
			'notifications': 'सूचनाएं',
			'notifywhenuserfollowsme': 'जब कोई उपयोगकर्ता मुझे फॉलो करे तो सूचित करें',
			'notifymewhenusercommentsonmypost': 'जब उपयोगकर्ता मेरी पोस्ट पर टिप्पणी करें तो सूचित करें',
			'notifymewhenuserlikesmypost': 'जब उपयोगकर्ता मेरी पोस्ट को पसंद करें तो सूचित करें',
			'churchsocial': 'चर्च सोशल',
			'shareyourthoughts': 'अपने विचार साझा करें',
			'readmore': '...और पढ़ें',
			'less': ' कम',
			'couldnotprocess': 'अनुरोधित कार्रवाई को संसाधित नहीं कर सका।',
			'pleaseselectprofilephoto': 'कृपया अपलोड करने के लिए एक प्रोफ़ाइल फोटो चुनें',
			'pleaseselectprofilecover': 'कृपया अपलोड करने के लिए एक कवर फोटो चुनें',
			'updateprofileerrorhint': 'आगे बढ़ने से पहले आपको अपना नाम, जन्म तिथि, लिंग, फोन और स्थान भरना होगा।',
			'gender': 'लिंग',
			'male': 'पुरुष',
			'female': 'महिला',
			'dob': 'जन्म तिथि',
			'location': 'वर्तमान स्थान',
			'qualification': 'योग्यता',
			'aboutme': 'मेरे बारे में',
			'facebookprofilelink': 'फेसबुक प्रोफ़ाइल लिंक',
			'twitterprofilelink': 'ट्विटर प्रोफ़ाइल लिंक',
			'linkdln': 'लिंक्डइन प्रोफ़ाइल लिंक',
			'likes': 'पसंद',
			'likess': 'पसंद',
			'pinnedposts': 'मेरे पिन किए गए पोस्ट',
			'unpinpost': 'पोस्ट को अनपिन करें',
			'unpinposthint': 'क्या आप इस पोस्ट को अपने पिन किए गए पोस्ट से हटाना चाहते हैं?',
			'postdetails': 'पोस्ट विवरण',
			'posts': 'पोस्ट',
			'followers': 'अनुयायी',
			'followings': 'अनुसरण',
			'my': 'मेरा',
			'edit': 'संपादित करें',
			'delete': 'हटाएं',
			'deletepost': 'पोस्ट हटाएं',
			'deleteposthint': 'क्या आप इस पोस्ट को हटाना चाहते हैं? पोस्ट अभी भी कुछ उपयोगकर्ताओं की फीड पर दिखाई दे सकती है।',
			'maximumallowedsizehint': 'अधिकतम अनुमत फ़ाइल अपलोड आकार पहुँच गया',
			'maximumuploadsizehint': 'चयनित फ़ाइल अनुमत अपलोड फ़ाइल आकार सीमा से अधिक है।',
			'makeposterror': 'वर्तमान में पोस्ट बनाने में असमर्थ, कृपया पुनः प्रयास करने के लिए क्लिक करें।',
			'makepost': 'पोस्ट बनाएं',
			'selectfile': 'फ़ाइल चुनें',
			'images': 'छवियाँ',
			'shareYourThoughtsNow': 'अपने विचार साझा करें...',
			'photoviewer': 'फोटो व्यूअर',
			'nochatsavailable': 'कोई वार्तालाप उपलब्ध नहीं \nनीचे दिए गए आइकन पर क्लिक करें \nउपयोगकर्ताओं का चयन करने के लिए',
			'typing': 'टाइप कर रहे हैं...',
			'photo': 'फोटो',
			'online': 'ऑनलाइन',
			'offline': 'ऑफ़लाइन',
			'lastseen': 'अंतिम बार देखा गया',
			'deleteselectedhint': 'यह कार्रवाई चयनित संदेशों को हटा देगी। कृपया ध्यान दें कि यह केवल आपकी बातचीत का भाग हटाता है, \n संदेश अभी भी आपके साथी के डिवाइस पर दिखाए जाएंगे।',
			'deleteselected': 'चयनित हटाएं',
			'unabletofetchconversation': 'आपकी बातचीत नहीं लोड कर सका \n',
			'loadmoreconversation': 'अधिक वार्तालाप लोड करें',
			'sendyourfirstmessage': 'अपना पहला संदेश भेजें \n',
			'unblock': 'अनब्लॉक ',
			'block': 'ब्लॉक',
			'writeyourmessage': 'अपना संदेश लिखें...',
			'clearconversation': 'वार्तालाप साफ़ करें',
			'clearconversationhintone': 'यह कार्रवाई आपकी पूरी बातचीत को साफ़ कर देगी ',
			'clearconversationhinttwo': '.\n कृपया ध्यान दें कि यह केवल आपकी बातचीत का भाग हटाता है, संदेश अभी भी आपके साथी के चैट में दिखाए जाएंगे।',
			'facebookloginerror': 'लॉगिन प्रक्रिया के साथ कुछ गलत हो गया।\n, यहाँ फेसबुक ने हमें त्रुटि दी है',
			'selectLanguage': 'भाषा चुनें',
			'howTo': 'कैसे',
			'noBibleTextsAvailable': 'कोई बाइबल पाठ उपलब्ध नहीं है',
			'languages': 'भाषाएँ',
			'searchLanguages': 'भाषाओं की खोज करें...',
			'biblesFilesets': 'बाइबल: {bibles}, फाइलसेट्स: {filesets}',
			'oldTestament': 'पुराना नियम',
			'newTestament': 'नया नियम',
			'play': 'चलाएं',
			'no_verse_content': 'प्रदर्शित करने के लिए कोई बाइबिल पद्य सामग्री उपलब्ध नहीं है।',
			'no_audio_content': 'प्रदर्शित करने के लिए कोई बाइबिल ऑडियो सामग्री उपलब्ध नहीं है।',
		};
	}
}

extension on _StringsId {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'Pastor Virtual',
			'selectlanguage': 'Pilih Bahasa',
			'deletemyaccount': 'Hapus akun saya',
			'deleteaccount': 'Hapus akun saya',
			'deleteaccounthint': 'Tindakan ini akan menghapus akun Anda dan menghapus semua data Anda. Setelah data Anda dihapus, data tersebut tidak dapat dipulihkan.',
			'deleteaccountsuccess': 'Penghapusan akun berhasil',
			'chooseapplanguage': 'Pilih Bahasa Aplikasi',
			'nightmode': 'Mode Malam',
			'initializingapp': 'Memulai...',
			'home': 'Beranda',
			'branches': 'Cabang',
			'inbox': 'Kotak Masuk',
			'downloads': 'Unduhan',
			'settings': 'Pengaturan',
			'events': 'Acara',
			'myplaylists': 'Playlist Saya',
			'website': 'Situs Web',
			'hymns': 'Himne',
			'articles': 'Artikel',
			'notes': 'Catatan',
			'donate': 'Donasi',
			'offering': 'Persembahan',
			'savenotetitle': 'Judul Catatan',
			'nonotesfound': 'Tidak ada catatan ditemukan',
			'newnote': 'Baru',
			'deletenote': 'Hapus Catatan',
			'deletenotehint': 'Apakah Anda ingin menghapus catatan ini? Tindakan ini tidak dapat dibatalkan.',
			'bookmarks': 'Penanda',
			'socialplatforms': 'Platform Sosial',
			'onboardingpagetitles.0': 'Selamat Datang di Gereja Saya',
			'onboardingpagetitles.1': 'Penuh dengan Fitur',
			'onboardingpagetitles.2': 'Audio, Video \n dan Streaming Langsung',
			'onboardingpagetitles.3': 'Buat Akun',
			'onboardingpagehints.0': 'Lebih jauh dari pagi Minggu & empat dinding gereja Anda. Semua yang Anda butuhkan untuk berkomunikasi dan terhubung dengan dunia yang berfokus pada seluler.',
			'onboardingpagehints.1': 'Kami telah mengumpulkan semua fitur utama yang harus dimiliki aplikasi gereja Anda. Acara, Devosi, Notifikasi, Catatan, dan Alkitab multi-versi.',
			'onboardingpagehints.2': 'Izinkan pengguna di seluruh dunia menonton video, mendengarkan pesan audio, dan menonton streaming langsung layanan gereja Anda.',
			'onboardingpagehints.3': 'Mulailah perjalanan Anda menuju pengalaman penyembahan yang tak berujung.',
			'next': 'BERIKUTNYA',
			'done': 'Mulai',
			'quitapp': 'Keluar Aplikasi!',
			'quitappwarning': 'Apakah Anda ingin menutup aplikasi?',
			'quitappaudiowarning': 'Anda sedang memutar audio, keluar dari aplikasi akan menghentikan pemutaran audio. Jika Anda tidak ingin menghentikan pemutaran, cukup minimalkan aplikasi dengan tombol tengah atau klik tombol Oke untuk keluar dari aplikasi sekarang.',
			'ok': 'Oke',
			'retry': 'COBA LAGI',
			'oops': 'Ups!',
			'save': 'Simpan',
			'cancel': 'Batal',
			'error': 'Kesalahan',
			'success': 'Sukses',
			'skip': 'Lewati',
			'skiplogin': 'Lewati Login',
			'skipregister': 'Lewati Pendaftaran',
			'dataloaderror': 'Tidak dapat memuat data yang diminta saat ini, periksa koneksi data Anda dan klik untuk mencoba lagi.',
			'suggestedforyou': 'Disarankan untuk Anda',
			'videomessages': 'Pesan Video',
			'audiomessages': 'Pesan Audio',
			'devotionals': 'Devosi',
			'categories': 'Kategori',
			'category': 'Kategori',
			'videos': 'Video',
			'audios': 'Audio',
			'biblebooks': 'Alkitab',
			'sermons': 'Khotbah',
			'tools': 'Alat',
			'profile': 'Profil',
			'audiobible': 'Alkitab Audio',
			'homesentence': 'Pastor Anda selama 1 tahun, untuk membantu Anda tumbuh menjadi orang yang Tuhan panggil untuk menjadi.',
			'livestreams': 'Streaming Langsung',
			'radio': 'Radio',
			'allitems': 'Semua Item',
			'emptyplaylist': 'Tidak ada Playlist',
			'notsupported': 'Tidak Didukung',
			'cleanupresources': 'Membersihkan sumber daya',
			'grantstoragepermission': 'Harap berikan izin akses penyimpanan untuk melanjutkan',
			'sharefiletitle': 'Tonton atau Dengarkan ',
			'sharefilebody': 'Melalui Aplikasi Pastor Virtual Saya, Unduh sekarang di ',
			'sharetext': 'Nikmati streaming Audio & Video tanpa batas',
			'sharetexthint': 'Bergabunglah dengan platform streaming Video dan Audio yang memungkinkan Anda menonton dan mendengarkan jutaan file dari seluruh dunia. Unduh sekarang di',
			'download': 'Unduh',
			'addplaylist': 'Tambahkan ke playlist',
			'bookmark': 'Penanda',
			'unbookmark': 'Batalkan Penanda',
			'share': 'Bagikan',
			'deletemedia': 'Hapus File',
			'deletemediahint': 'Apakah Anda ingin menghapus file yang diunduh ini? Tindakan ini tidak dapat dibatalkan.',
			'searchhint': 'Cari Pesan Audio & Video',
			'performingsearch': 'Mencari Audio dan Video',
			'nosearchresult': 'Tidak ada hasil yang ditemukan',
			'nosearchresulthint': 'Coba masukkan kata kunci yang lebih umum',
			'addtoplaylist': 'Tambahkan ke playlist',
			'newplaylist': 'Playlist baru',
			'playlistitm': 'Playlist',
			'mediaaddedtoplaylist': 'Media ditambahkan ke playlist.',
			'mediaremovedfromplaylist': 'Media dihapus dari playlist',
			'clearplaylistmedias': 'Bersihkan Semua Media',
			'deletePlayList': 'Hapus Playlist',
			'clearplaylistmediashint': 'Apakah Anda ingin menghapus semua media dari playlist ini?',
			'deletePlayListhint': 'Apakah Anda ingin menghapus playlist ini dan membersihkan semua media?',
			'comments': 'Komentar',
			'replies': 'Balasan',
			'reply': 'Balas',
			'logintoaddcomment': 'Login untuk menambahkan komentar',
			'logintoreply': 'Login untuk membalas',
			'writeamessage': 'Tulis pesan...',
			'nocomments': 'Tidak ada komentar ditemukan \nklik untuk mencoba lagi',
			'errormakingcomments': 'Tidak dapat memproses komentar saat ini..',
			'errordeletingcomments': 'Tidak dapat menghapus komentar ini saat ini..',
			'erroreditingcomments': 'Tidak dapat mengedit komentar ini saat ini..',
			'errorloadingmorecomments': 'Tidak dapat memuat lebih banyak komentar saat ini..',
			'deletingcomment': 'Menghapus komentar',
			'editingcomment': 'Mengedit komentar',
			'deletecommentalert': 'Hapus Komentar',
			'editcommentalert': 'Edit Komentar',
			'deletecommentalerttext': 'Apakah Anda ingin menghapus komentar ini? Tindakan ini tidak dapat dibatalkan',
			'loadmore': 'muat lebih banyak',
			'messages': 'Pesan',
			'guestuser': 'Pengguna Tamu',
			'fullname': 'Nama Lengkap',
			'emailaddress': 'Alamat Email',
			'password': 'Kata Sandi',
			'repeatpassword': 'Ulangi Kata Sandi',
			'register': 'Daftar',
			'login': 'Login',
			'logout': 'Logout',
			'logoutfromapp': 'Logout dari aplikasi?',
			'logoutfromapphint': 'Anda tidak akan dapat menyukai atau berkomentar pada artikel dan video jika Anda tidak masuk.',
			'gotologin': 'Pergi ke Login',
			'resetpassword': 'Atur Ulang Kata Sandi',
			'logintoaccount': 'Sudah punya akun? Login',
			'emptyfielderrorhint': 'Anda harus mengisi semua kolom',
			'invalidemailerrorhint': 'Anda harus memasukkan alamat email yang valid',
			'passwordsdontmatch': 'Kata sandi tidak cocok',
			'processingpleasewait': 'Memproses, Harap tunggu...',
			'createaccount': 'Buat akun',
			'forgotpassword': 'Lupa Kata Sandi?',
			'orloginwith': 'Atau Login Dengan',
			'facebook': 'Facebook',
			'google': 'Google',
			'moreoptions': 'Lebih Banyak Opsi',
			'about': 'Tentang Kami',
			'privacy': 'Kebijakan Privasi',
			'terms': 'Ketentuan Aplikasi',
			'rate': 'Beri Peringkat Aplikasi',
			'version': 'Versi',
			'pulluploadmore': 'tarik ke atas untuk memuat',
			'loadfailedretry': 'Gagal Memuat! Klik untuk mencoba lagi!',
			'releaseloadmore': 'lepaskan untuk memuat lebih banyak',
			'nomoredata': 'Tidak ada Data lagi',
			'errorReportingComment': 'Kesalahan Pelaporan Komentar',
			'reportingComment': 'Pelaporan Komentar',
			'reportcomment': 'Opsi Pelaporan',
			'reportCommentsList.0': 'Konten komersial yang tidak diinginkan atau spam',
			'reportCommentsList.1': 'Pornografi atau materi seksual eksplisit',
			'reportCommentsList.2': 'Pidato kebencian atau kekerasan grafis',
			'reportCommentsList.3': 'Pelecehan atau penindasan',
			'bookmarksMedia': 'Penanda Saya',
			'noitemstodisplay': 'Tidak Ada Item Untuk Ditampilkan',
			'loginrequired': 'Login Diperlukan',
			'loginrequiredhint': 'Untuk berlangganan di platform ini, Anda harus masuk. Buat akun gratis sekarang atau masuk ke akun Anda yang sudah ada.',
			'subscriptions': 'Langganan Aplikasi',
			'subscribe': 'BERLANGGANAN',
			'subscribehint': 'Langganan Diperlukan',
			'playsubscriptionrequiredhint': 'Anda harus berlangganan sebelum dapat mendengarkan atau menonton media ini.',
			'previewsubscriptionrequiredhint': 'Anda telah mencapai durasi pratinjau yang diperbolehkan untuk media ini. Anda harus berlangganan untuk melanjutkan mendengarkan atau menonton media ini.',
			'copiedtoclipboard': 'Disalin ke papan klip',
			'downloadbible': 'Unduh Alkitab',
			'downloadversion': 'Unduh',
			'downloading': 'Mengunduh',
			'failedtodownload': 'Gagal mengunduh',
			'pleaseclicktoretry': 'Silakan klik untuk mencoba lagi.',
			'of': 'Dari',
			'nobibleversionshint': 'Tidak ada data Alkitab yang ditampilkan, klik tombol di bawah untuk mengunduh setidaknya satu versi Alkitab.',
			'downloaded': 'Diunduh',
			'enteremailaddresstoresetpassword': 'Masukkan email Anda untuk mengatur ulang kata sandi Anda',
			'backtologin': 'KEMBALI KE LOGIN',
			'signintocontinue': 'Masuk untuk melanjutkan',
			'signin': 'M A S U K',
			'signinforanaccount': 'DAFTAR UNTUK AKUN?',
			'alreadyhaveanaccount': 'Sudah punya akun?',
			'updateprofile': 'Perbarui Profil',
			'updateprofilehint': 'Untuk memulai, perbarui halaman profil Anda, ini akan membantu kami menghubungkan Anda dengan orang lain',
			'autoplayvideos': 'Video Putar Otomatis',
			'gosocial': 'Masuk Sosial',
			'searchbible': 'Cari Alkitab',
			'filtersearchoptions': 'Filter Opsi Pencarian',
			'narrowdownsearch': 'Gunakan tombol filter di bawah untuk mempersempit pencarian agar hasil lebih akurat.',
			'searchbibleversion': 'Cari Versi Alkitab',
			'searchbiblebook': 'Cari Kitab Alkitab',
			'search': 'Cari',
			'setBibleBook': 'Atur Kitab Alkitab',
			'oldtestament': 'Perjanjian Lama',
			'newtestament': 'Perjanjian Baru',
			'limitresults': 'Batasi Hasil',
			'setfilters': 'Atur Filter',
			'bibletranslator': 'Penerjemah Alkitab',
			'chapter': ' Bab ',
			'verse': ' Ayat ',
			'translate': 'terjemahkan',
			'bibledownloadinfo': 'Unduhan Alkitab dimulai, Jangan tutup halaman ini sampai unduhan selesai.',
			'received': 'diterima',
			'outoftotal': 'dari total',
			'set': 'ATUR',
			'selectColor': 'Pilih Warna',
			'switchbibleversion': 'Ganti Versi Alkitab',
			'switchbiblebook': 'Ganti Kitab Alkitab',
			'gotosearch': 'Pergi ke Bab',
			'changefontsize': 'Ubah Ukuran Font',
			'font': 'Font',
			'readchapter': 'Baca Bab',
			'showhighlightedverse': 'Tampilkan Ayat yang Disorot',
			'downloadmoreversions': 'Unduh lebih banyak versi',
			'suggestedusers': 'Pengguna yang disarankan',
			'unfollow': 'Berhenti Mengikuti',
			'follow': 'Ikuti',
			'searchforpeople': 'Cari orang',
			'viewpost': 'Lihat Postingan',
			'viewprofile': 'Lihat Profil',
			'mypins': 'Pin Saya',
			'viewpinnedposts': 'Lihat Postingan yang Dipin',
			'personal': 'Pribadi',
			'update': 'Perbarui',
			'phonenumber': 'Nomor Telepon',
			'showmyphonenumber': 'Tampilkan nomor telepon saya kepada pengguna',
			'dateofbirth': 'Tanggal Lahir',
			'showmyfulldateofbirth': 'Tampilkan tanggal lahir lengkap saya kepada orang yang melihat status saya',
			'notifications': 'Notifikasi',
			'notifywhenuserfollowsme': 'Beritahu saya ketika pengguna mengikuti saya',
			'notifymewhenusercommentsonmypost': 'Beritahu saya ketika pengguna berkomentar pada postingan saya',
			'notifymewhenuserlikesmypost': 'Beritahu saya ketika pengguna menyukai postingan saya',
			'churchsocial': 'Sosial Gereja',
			'shareyourthoughts': 'Bagikan pikiran Anda',
			'readmore': '...Baca lebih lanjut',
			'less': ' Kurang',
			'couldnotprocess': 'Tidak dapat memproses tindakan yang diminta.',
			'pleaseselectprofilephoto': 'Harap pilih foto profil untuk diunggah',
			'pleaseselectprofilecover': 'Harap pilih foto sampul untuk diunggah',
			'updateprofileerrorhint': 'Anda perlu mengisi nama, tanggal lahir, jenis kelamin, telepon, dan lokasi Anda sebelum dapat melanjutkan.',
			'gender': 'Jenis Kelamin',
			'male': 'Laki-laki',
			'female': 'Perempuan',
			'dob': 'Tanggal Lahir',
			'location': 'Lokasi Saat Ini',
			'qualification': 'Kualifikasi',
			'aboutme': 'Tentang Saya',
			'facebookprofilelink': 'Tautan Profil Facebook',
			'twitterprofilelink': 'Tautan Profil Twitter',
			'linkdln': 'Tautan Profil LinkedIn',
			'likes': 'Suka',
			'likess': 'Suka',
			'pinnedposts': 'Postingan yang Dipin',
			'unpinpost': 'Lepaskan Pin Postingan',
			'unpinposthint': 'Apakah Anda ingin menghapus postingan ini dari postingan yang dipin?',
			'postdetails': 'Detail Postingan',
			'posts': 'Postingan',
			'followers': 'Pengikut',
			'followings': 'Mengikuti',
			'my': 'Saya',
			'edit': 'Edit',
			'delete': 'Hapus',
			'deletepost': 'Hapus Postingan',
			'deleteposthint': 'Apakah Anda ingin menghapus postingan ini? Postingan masih bisa muncul di feed beberapa pengguna.',
			'maximumallowedsizehint': 'Ukuran unggahan file maksimal tercapai',
			'maximumuploadsizehint': 'File yang dipilih melebihi batas ukuran unggahan file yang diizinkan.',
			'makeposterror': 'Tidak dapat membuat postingan saat ini, klik untuk mencoba lagi.',
			'makepost': 'Buat Postingan',
			'selectfile': 'Pilih File',
			'images': 'Gambar',
			'shareYourThoughtsNow': 'Bagikan pikiran Anda...',
			'photoviewer': 'Penampil Foto',
			'nochatsavailable': 'Tidak ada percakapan tersedia \n Klik ikon tambah di bawah \n untuk memilih pengguna untuk mengobrol dengan',
			'typing': 'Mengetik...',
			'photo': 'Foto',
			'online': 'Online',
			'offline': 'Offline',
			'lastseen': 'Terakhir Dilihat',
			'deleteselectedhint': 'Tindakan ini akan menghapus pesan yang dipilih. Harap dicatat bahwa ini hanya menghapus sisi percakapan Anda, \n pesan masih akan terlihat di perangkat pasangan Anda.',
			'deleteselected': 'Hapus yang dipilih',
			'unabletofetchconversation': 'Tidak dapat mengambil \npercakapan Anda dengan \n',
			'loadmoreconversation': 'Muat lebih banyak percakapan',
			'sendyourfirstmessage': 'Kirim pesan pertama Anda ke \n',
			'unblock': 'Buka Blokir ',
			'block': 'Blokir',
			'writeyourmessage': 'Tulis pesan Anda...',
			'clearconversation': 'Bersihkan Percakapan',
			'clearconversationhintone': 'Tindakan ini akan membersihkan semua percakapan Anda dengan ',
			'clearconversationhinttwo': '.\n Harap dicatat bahwa ini hanya menghapus sisi percakapan Anda, pesan masih akan terlihat di chat pasangan Anda.',
			'facebookloginerror': 'Ada yang salah dengan proses login.\n, Ini kesalahan yang diberikan Facebook kepada kami',
			'selectLanguage': 'Pilih Bahasa',
			'howTo': 'Cara',
			'noBibleTextsAvailable': 'Tidak ada teks Alkitab yang tersedia',
			'languages': 'Bahasa',
			'searchLanguages': 'Cari bahasa...',
			'biblesFilesets': 'Alkitab: {bibles}, Set berkas: {filesets}',
			'oldTestament': 'Perjanjian Lama',
			'newTestament': 'Perjanjian Baru',
			'play': 'Putar',
			'no_verse_content': 'Tidak ada konten ayat Alkitab yang tersedia untuk ditampilkan.',
			'no_audio_content': 'Tidak ada konten audio Alkitab yang tersedia untuk ditampilkan.',
		};
	}
}

extension on _StringsKn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'ನನ್ನ ವರ್ಚುವಲ್ ಪಾಸ್ಟರ್',
			'selectlanguage': 'ಭಾಷೆ ಆಯ್ಕೆಮಾಡಿ',
			'deletemyaccount': 'ನನ್ನ ಖಾತೆಯನ್ನು ಅಳಿಸಿ',
			'deleteaccount': 'ಖಾತೆ ಅಳಿಸಿ',
			'deleteaccounthint': 'ಈ ಕ್ರಿಯೆಯಿಂದ ನಿಮ್ಮ ಖಾತೆ ಮತ್ತು ಎಲ್ಲಾ ಡೇಟಾವನ್ನು ಅಳಿಸಲಾಗುತ್ತದೆ. ನಿಮ್ಮ ಡೇಟಾ ಅಳಿಸಿದ ನಂತರ, ಅದನ್ನು ಪುನಃ ಪಡೆಯಲು ಸಾಧ್ಯವಿಲ್ಲ.',
			'deleteaccountsuccess': 'ಖಾತೆ ಅಳಿಸುವಿಕೆಯಲ್ಲಿ ಯಶಸ್ವಿಯಾಯಿತು',
			'chooseapplanguage': 'ಅಪ್ಲಿಕೇಶನ್ ಭಾಷೆ ಆಯ್ಕೆಮಾಡಿ',
			'nightmode': 'ರಾತ್ರಿ ಮೋಡ್',
			'initializingapp': 'ಆರಂಭಿಸುತ್ತಿದೆ...',
			'home': 'ಮನೆ',
			'branches': 'ಶಾಖೆಗಳು',
			'inbox': 'ಇನ್‌ಬಾಕ್ಸ್',
			'downloads': 'ಡೌನ್‌ಲೋಡ್‌ಗಳು',
			'settings': 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು',
			'events': 'ಈವೆಂಟ್‌ಗಳು',
			'myplaylists': 'ನನ್ನ ಪ್ಲೇಲಿಸ್ಟ್‌ಗಳು',
			'website': 'ವೆಬ್‌ಸೈಟ್',
			'hymns': 'ಹಾಡುಗಳು',
			'articles': 'ಲೆಖನಗಳು',
			'notes': 'ಕಾತ್ರಿಕೆಗಳು',
			'donate': 'ದಾನ',
			'offering': 'ಮೂಲೆಮಾಡು',
			'savenotetitle': 'ಕಾತ್ರಿಕೆ ಶೀರ್ಷಿಕೆ',
			'nonotesfound': 'ಯಾವುದೇ ಕಾತ್ರಿಕೆಗಳಿಲ್ಲ',
			'newnote': 'ಹೊಸದು',
			'deletenote': 'ಕಾತ್ರಿಕೆ ಅಳಿಸಿ',
			'deletenotehint': 'ಈ ಕಾತ್ರಿಕೆಯನ್ನು ಅಳಿಸಲು ಬಯಸುತ್ತೀರಾ? ಈ ಕ್ರಿಯೆಯನ್ನು ಮರುಕಳಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ.',
			'bookmarks': 'ಬುಕ್‌ಮಾರ್ಕ್‌ಗಳು',
			'socialplatforms': 'ಸಾಮಾಜಿಕ ವೇದಿಕೆಗಳು',
			'onboardingpagetitles.0': 'ನನ್ನ ಚರ್ಚ್‌ಗೆ ಸ್ವಾಗತ',
			'onboardingpagetitles.1': 'ಲಕ್ಷಣಗಳಿಂದ ತುಂಬಿದೆ',
			'onboardingpagetitles.2': 'ಆಡಿಯೋ, ವಿಡಿಯೋ \n ಮತ್ತು ಲೈವ್ ಸ್ಟ್ರೀಮಿಂಗ್',
			'onboardingpagetitles.3': 'ಖಾತೆ ರಚಿಸಿ',
			'onboardingpagehints.0': 'ಭಾನುವಾರ ಬೆಳಗ್ಗಿನ ಬಡ್ತಿ ಮತ್ತು ನಿಮ್ಮ ಚರ್ಚ್‌ನ ನಾಲ್ಕು ಗೋಡೆಗಳಿಗಿಂತ ಮುಂದೆ ಹೋಗಿ. ಮೊಬೈಲ್‌ಗೂ ಸಂಬಂಧಪಟ್ಟ ವಿಶ್ವದೊಂದಿಗೆ ಸಂಪರ್ಕಿಸಲು ಮತ್ತು ಸಂವಹನ ಮಾಡಲು ನೀವು ಬೇಕಾದ ಎಲ್ಲವನ್ನೂ.',
			'onboardingpagehints.1': 'ನೀವು ನಿಮ್ಮ ಚರ್ಚ್ ಆಪ್‌ಗುರ್ತಿಸುವ ಎಲ್ಲಾ ಪ್ರಮುಖ ಲಕ್ಷಣಗಳನ್ನು ಒಟ್ಟುಗೂಡಿಸಿದ್ದೇವೆ. ಈವೆಂಟ್‌ಗಳು, ಭಕ್ತಿಗೀತೆಗಳು, ಅಧಿಸೂಚನೆಗಳು, ಕಾತ್ರಿಕೆಗಳು ಮತ್ತು ಬಹು-ಪಠಣ ಬೈಬಲ್.',
			'onboardingpagehints.2': 'ಪರಿಷರಕ್ಕೆ ನಿಮ್ಮ ಚರ್ಚ್ ಸೇವೆಗಳನ್ನು ವೀಕ್ಷಿಸಲು, ಆಡಿಯೋ ಸಂದೇಶಗಳನ್ನು ಕೇಳಲು ಮತ್ತು ಲೈವ್ ಸ್ಟ್ರೀಮ್ ನೋಡಲು ಅನುಮತಿ ನೀಡಿ.',
			'onboardingpagehints.3': 'ಒಂದು ನಿರಂತರ ಪ್ರಾರ್ಥನಾ ಅನುಭವಕ್ಕೆ ನಿಮ್ಮ ಪ್ರಯಾಣವನ್ನು ಪ್ರಾರಂಭಿಸಿ.',
			'next': 'ಮುಂದೆ',
			'done': 'ಪ್ರಾರಂಭಿಸಿ',
			'quitapp': 'ಅಪ್ಲಿಕೇಶನ್ ಬಿಡಿ!',
			'quitappwarning': 'ನೀವು ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಮುಚ್ಚಲು ಬಯಸುವಿರಾ?',
			'quitappaudiowarning': 'ನೀವು ಪ್ರಸ್ತುತ ಆಡಿಯೋ ಪ್ಲೇ ಮಾಡುತ್ತಿದ್ದೀರಿ, ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಬಿಡುವುದು ಆಡಿಯೋ ಪ್ಲೇಬ್ಯಾಕ್ ಅನ್ನು ನಿಲ್ಲಿಸುತ್ತದೆ. ಪ್ಲೇಬ್ಯಾಕ್ ನಿಲ್ಲಿಸಲು ಬಯಸದಿದ್ದರೆ, ಕೇಂದ್ರ ಬಟನ್ ಮೂಲಕ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಕಡಿಮೆಮಾಡಿ ಅಥವಾ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಈಗ ಬಿಡಲು ಓಕೆ ಬಟನ್ ಕ್ಲಿಕ್ ಮಾಡಿ.',
			'ok': 'ಓಕೆ',
			'retry': 'ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ',
			'oops': 'ಊಪ್!',
			'save': 'ಉಳಿಸಿ',
			'cancel': 'ರದ್ದುಮಾಡಿ',
			'error': 'ದೋಷ',
			'success': 'ಯಶಸ್ಸು',
			'skip': 'ಬಿಟ್ಟುಬಿಡಿ',
			'skiplogin': 'ಲಾಗಿನ್ ಬಿಟ್ಟುಬಿಡಿ',
			'skipregister': 'ನೋಂದಣಿ ಬಿಟ್ಟುಬಿಡಿ',
			'dataloaderror': 'ಈಗ ಪ್ರಸ್ತುತ ಡೇಟಾವನ್ನು ಲೋಡ್ ಮಾಡಲಾಗುವುದಿಲ್ಲ, ನಿಮ್ಮ ಡೇಟಾ ಸಂಪರ್ಕವನ್ನು ಪರಿಶೀಲಿಸಿ ಮತ್ತು ಪುನಃ ಪ್ರಯತ್ನಿಸಲು ಕ್ಲಿಕ್ ಮಾಡಿ.',
			'suggestedforyou': 'ನಿಮಗಾಗಿ ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ',
			'videomessages': 'ವೀಡಿಯೋ ಸಂದೇಶಗಳು',
			'audiomessages': 'ಆಡಿಯೋ ಸಂದೇಶಗಳು',
			'devotionals': 'ಭಕ್ತಿಗೀತೆಗಳು',
			'categories': 'ವರ್ಗಗಳು',
			'category': 'ವರ್ಗ',
			'videos': 'ವೀಡಿಯೊಗಳು',
			'audios': 'ಆಡಿಯೊಗಳು',
			'biblebooks': 'ಬೈಬಲ್',
			'sermons': 'ಪ್ರವಚನೆಗಳು',
			'tools': 'ಆಯುಧಗಳು',
			'profile': 'ಪ್ರೊಫೈಲ್',
			'audiobible': 'ಆಡಿಯೋ ಬೈಬಲ್',
			'homesentence': 'ಭಗವಂತನ ಕರೆಯಲಾದ ವ್ಯಕ್ತಿಯಾಗಿ ಬೆಳೆಯಲು ನಿಮ್ಮ ಪಾಸ್ಟರ್ 1 ವರ್ಷಕ್ಕೆ ಸಹಾಯಮಾಡಲು.',
			'livestreams': 'ಲೈವ್ ಸ್ಟ್ರೀಮ್‌ಗಳು',
			'radio': 'ರೆಡಿಯೋ',
			'allitems': 'ಎಲ್ಲಾ ಐಟಂಗಳು',
			'emptyplaylist': 'ಯಾವುದೇ ಪ್ಲೇಲಿಸ್ಟ್ ಇಲ್ಲ',
			'notsupported': 'ಸಮರ್ಥಿಸಲಾಗುವುದಿಲ್ಲ',
			'cleanupresources': 'ಸಂಪತ್ತುಗಳನ್ನು ಶುದ್ಧಗೊಳಿಸಲಾಗುತ್ತಿದೆ',
			'grantstoragepermission': 'ಮುಂದುವರಿಯಲು ದಯವಿಟ್ಟು ಸಂಗ್ರಹಣೆ ಅನುಮತಿಯನ್ನು ನೀಡಿರಿ',
			'sharefiletitle': 'ನೋಡಿ ಅಥವಾ ಕೇಳಿ ',
			'sharefilebody': 'ನನ್ನ ವರ್ಚುವಲ್ ಪಾಸ್ಟರ್ ಅಪ್ಲಿಕೇಶನ್ ಮೂಲಕ, ಈಗ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ ',
			'sharetext': 'ಅಸೀಮಿತ ಆಡಿಯೋ ಮತ್ತು ವೀಡಿಯೋ ಸ್ಟ್ರೀಮಿಂಗ್ ಅನ್ನು ಆನಂದಿಸಿ',
			'sharetexthint': 'ನೋಡುವ ಮತ್ತು ಕೇಳುವ ವಿಶ್ವದಾದ್ಯಂತದ ಮಿಲಿಯನ್‌ಗಳ ಫೈಲ್‌ಗಳನ್ನು ಒದಗಿಸುವ ವೀಡಿಯೋ ಮತ್ತು ಆಡಿಯೋ ಸ್ಟ್ರೀಮಿಂಗ್ ವೇದಿಕೆಗೆ ಸೇರಿ. ಈಗ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ ',
			'download': 'ಡೌನ್‌ಲೋಡ್',
			'addplaylist': 'ಪ್ಲೇಲಿಸ್ಟ್‌ಗೆ ಸೇರಿಸಿ',
			'bookmark': 'ಪುಟಗುಡುಸು',
			'unbookmark': 'ಪುಟಗುಡಿಸುವಿಕೆಯನ್ನು ರದ್ದುಮಾಡಿ',
			'share': 'ಹಂಚಿಕೊಳ್ಳಿ',
			'deletemedia': 'ಫೈಲ್ ಅಳಿಸಿ',
			'deletemediahint': 'ನೀವು ಈ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಫೈಲ್ ಅನ್ನು ಅಳಿಸಲು ಬಯಸುತ್ತೀರಾ? ಈ ಕ್ರಿಯೆಯನ್ನು ಮರುಕಳಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ.',
			'searchhint': 'ಆಡಿಯೋ ಮತ್ತು ವೀಡಿಯೋ ಸಂದೇಶಗಳನ್ನು ಹುಡುಕಿ',
			'performingsearch': 'ಆಡಿಯೋಗಳು ಮತ್ತು ವೀಡಿಯೊಗಳನ್ನು ಹುಡುಕುತ್ತಿದೆ',
			'nosearchresult': 'ಯಾವುದೇ ಫಲಿತಾಂಶ ಕಂಡುಬಂದಿಲ್ಲ',
			'nosearchresulthint': 'ಹೆಚ್ಚು ಸಾಮಾನ್ಯ ಕೀವರ್ಡ್ ಅನ್ನು ನಮೂದಿಸಲು ಪ್ರಯತ್ನಿಸಿ',
			'addtoplaylist': 'ಪ್ಲೇಲಿಸ್ಟ್‌ಗೆ ಸೇರಿಸಿ',
			'newplaylist': 'ಹೊಸ ಪ್ಲೇಲಿಸ್ಟ್',
			'playlistitm': 'ಪ್ಲೇಲಿಸ್ಟ್',
			'mediaaddedtoplaylist': 'ಮೀಡಿಯಾ ಪ್ಲೇಲಿಸ್ಟ್‌ಗೆ ಸೇರಿಸಲಾಗಿದೆ.',
			'mediaremovedfromplaylist': 'ಮೀಡಿಯಾ ಪ್ಲೇಲಿಸ್ಟ್‌ನಿಂದ ತೆಗೆದುಹಾಕಲಾಗಿದೆ',
			'clearplaylistmedias': 'ಎಲ್ಲಾ ಮೀಡಿಯಾವನ್ನು ಶುದ್ಧಗೊಳಿಸಿ',
			'deletePlayList': 'ಪ್ಲೇಲಿಸ್ಟ್ ಅಳಿಸಿ',
			'clearplaylistmediashint': 'ನೀವು ಈ ಪ್ಲೇಲಿಸ್ಟ್‌ನಿಂದ ಎಲ್ಲಾ ಮೀಡಿಯಾವನ್ನು ತೆಗೆದುಹಾಕಲು ಬಯಸುತ್ತೀರಾ?',
			'deletePlayListhint': 'ನೀವು ಈ ಪ್ಲೇಲಿಸ್ಟ್ ಅನ್ನು ಅಳಿಸಲು ಮತ್ತು ಎಲ್ಲಾ ಮೀಡಿಯಾವನ್ನು ಶುದ್ಧಗೊಳಿಸಲು ಬಯಸುತ್ತೀರಾ?',
			'comments': 'ಕಾಮೆಂಟ್‌ಗಳು',
			'replies': 'ಪ್ರತಿಕ್ರಿಯೆಗಳು',
			'reply': 'ಪ್ರತಿಕ್ರಿಯೆ',
			'logintoaddcomment': 'ಕಾಮೆಂಟ್ ಸೇರಿಸಲು ಲಾಗಿನ್ ಮಾಡಿ',
			'logintoreply': 'ಪ್ರತಿಕ್ರಿಯಿಸಲು ಲಾಗಿನ್ ಮಾಡಿ',
			'writeamessage': 'ಸಂದೇಶವನ್ನು ಬರೆಯಿರಿ...',
			'nocomments': 'ಯಾವುದೇ ಕಾಮೆಂಟ್‌ಗಳಿಲ್ಲ \nಮತ್ತೆ ಪ್ರಯತ್ನಿಸಲು ಕ್ಲಿಕ್ ಮಾಡಿ',
			'errormakingcomments': 'ಪ್ರಸ್ತುತ ಕಾಮೆಂಟ್ ಮಾಡುವಲ್ಲಿ ವಿಫಲವಾಗಿದೆ.',
			'errordeletingcomments': 'ಪ್ರಸ್ತುತ ಈ ಕಾಮೆಂಟ್ ಅಳಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ.',
			'erroreditingcomments': 'ಪ್ರಸ್ತುತ ಈ ಕಾಮೆಂಟ್ ಅನ್ನು ಸಂಪಾದಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ.',
			'errorloadingmorecomments': 'ಪ್ರಸ್ತುತ ಹೆಚ್ಚು ಕಾಮೆಂಟ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಿಲ್ಲ.',
			'deletingcomment': 'ಕಾಮೆಂಟ್ ಅನ್ನು ಅಳಿಸಲಾಗುತ್ತಿದೆ',
			'editingcomment': 'ಕಾಮೆಂಟ್ ಸಂಪಾದಿಸಲಾಗುತ್ತಿದೆ',
			'deletecommentalert': 'ಕಾಮೆಂಟ್ ಅಳಿಸಿ',
			'editcommentalert': 'ಕಾಮೆಂಟ್ ಸಂಪಾದಿಸಿ',
			'deletecommentalerttext': 'ನೀವು ಈ ಕಾಮೆಂಟ್ ಅನ್ನು ಅಳಿಸಲು ಬಯಸುತ್ತೀರಾ? ಈ ಕ್ರಿಯೆಯನ್ನು ಮರುಕಳಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ',
			'loadmore': 'ಹೆಚ್ಚು ಲೋಡ್ ಮಾಡಿ',
			'messages': 'ಸಂದೇಶಗಳು',
			'guestuser': 'ಅತಿಥಿ ಬಳಕೆದಾರ',
			'fullname': 'ಪೂರ್ಣ ಹೆಸರು',
			'emailaddress': 'ಇಮೇಲ್ ವಿಳಾಸ',
			'password': 'ಪಾಸ್ವರ್ಡ್',
			'repeatpassword': 'ಪಾಸ್ವರ್ಡ್ ಅನ್ನು ಪುನಃ ನಮೂದಿಸಿ',
			'register': 'ನೋಂದಣಿ',
			'login': 'ಲಾಗಿನ್',
			'logout': 'ಲಾಗ್ಔಟ್',
			'logoutfromapp': 'ಅಪ್ಲಿಕೇಶನ್‌ನಿಂದ ಲಾಗ್ಔಟ್ ಮಾಡುತ್ತೀರಾ?',
			'logoutfromapphint': 'ನೀವು ಲಾಗಿನ್ ಆಗಿಲ್ಲದಿದ್ದರೆ ನೀವು ಲೇಖನಗಳು ಮತ್ತು ವೀಡಿಯೊಗಳ ಮೇಲೆ ಕಾಮೆಂಟ್ ಮಾಡಲು ಅಥವಾ ಇಷ್ಟಪಡಲು ಸಾಧ್ಯವಿಲ್ಲ.',
			'gotologin': 'ಲಾಗಿನ್ ಗೆ ಹೋಗಿ',
			'resetpassword': 'ಪಾಸ್ವರ್ಡ್ ಮರುಹೊಂದಿಸಿ',
			'logintoaccount': 'ಈಗಾಗಲೇ ಖಾತೆ ಇದ್ದೇ? ಲಾಗಿನ್',
			'emptyfielderrorhint': 'ನೀವು ಎಲ್ಲಾ ಕ್ಷೇತ್ರಗಳನ್ನು ತುಂಬಬೇಕಾಗಿದೆ',
			'invalidemailerrorhint': 'ನೀವು ಮಾನ್ಯವಾದ ಇಮೇಲ್ ವಿಳಾಸವನ್ನು ನಮೂದಿಸಬೇಕಾಗಿದೆ',
			'passwordsdontmatch': 'ಪಾಸ್ವರ್ಡ್‌ಗಳು ಹೊಂದುತ್ತಿಲ್ಲ',
			'processingpleasewait': 'ಪ್ರಕ್ರಿಯೆ ನಡೆಯುತ್ತಿದೆ, ದಯವಿಟ್ಟು ನಿರೀಕ್ಷಿಸಿ...',
			'createaccount': 'ಖಾತೆ ರಚಿಸಿ',
			'forgotpassword': 'ಪಾಸ್ವರ್ಡ್ ಮರೆತಿದ್ದೀರಾ?',
			'orloginwith': 'ಅಥವಾ ಲಾಗಿನ್ ಮಾಡಿ',
			'facebook': 'ಫೇಸ್ಬುಕ್',
			'google': 'ಗೂಗಲ್',
			'moreoptions': 'ಹೆಚ್ಚು ಆಯ್ಕೆಗಳು',
			'about': 'ನಮ್ಮ ಬಗ್ಗೆ',
			'privacy': 'ಗೋಪ್ಯತಾ ನೀತಿ',
			'terms': 'ಅಪ್ಲಿಕೇಶನ್ ಷರತ್ತುಗಳು',
			'rate': 'ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಮೌಲ್ಯಮಾಪನ ಮಾಡಿ',
			'version': 'ಆವೃತ್ತಿ',
			'pulluploadmore': 'ಲೋಡ್ ಮಾಡಲು ಮೇಲಕ್ಕೆ ತಳ್ಳಿ',
			'loadfailedretry': 'ಲೋಡ್ ವಿಫಲವಾಯಿತು! ಪುನಃ ಪ್ರಯತ್ನಿಸಲು ಕ್ಲಿಕ್ ಮಾಡಿ!',
			'releaseloadmore': 'ಹೆಚ್ಚು ಲೋಡ್ ಮಾಡಲು ಬಿಡುಗಡೆ ಮಾಡಿ',
			'nomoredata': 'ಹೆಚ್ಚು ಡೇಟಾ ಇಲ್ಲ',
			'errorReportingComment': 'ಕಾಮೆಂಟ್ ವರದಿ ದೋಷ',
			'reportingComment': 'ಕಾಮೆಂಟ್ ವರದಿ ಮಾಡಲಾಗುತ್ತಿದೆ',
			'reportcomment': 'ವರದಿ ಆಯ್ಕೆಗಳು',
			'reportCommentsList.0': 'ಅನಗತ್ಯ ವ್ಯಾಪಾರ ವಿಷಯ ಅಥವಾ ಸ್ಪ್ಯಾಮ್',
			'reportCommentsList.1': 'ಅಶ್ಲೀಲತೆ ಅಥವಾ ಲೈಂಗಿಕ ಸ್ಪಷ್ಟವಾದ ವಿಷಯ',
			'reportCommentsList.2': 'ದ್ವೇಷ ಭಾಷಣ ಅಥವಾ ಗ್ರಾಫಿಕ್ ಹಿಂಸೆ',
			'reportCommentsList.3': 'ತೊಂದರೆ ಅಥವಾ ಧೈರ್ಯವಿಲ್ಲ',
			'bookmarksMedia': 'ನನ್ನ ಬುಕ್‌ಮಾರ್ಕ್‌ಗಳು',
			'noitemstodisplay': 'ಪ್ರದರ್ಶಿಸಲು ಯಾವುದೇ ಐಟಂ ಇಲ್ಲ',
			'loginrequired': 'ಲಾಗಿನ್ ಅಗತ್ಯವಿದೆ',
			'loginrequiredhint': 'ಈ ವೇದಿಕೆಯಲ್ಲಿ ಚಂದಾ ಪಡೆಯಲು, ನೀವು ಲಾಗಿನ್ ಆಗಬೇಕಾಗಿದೆ. ಉಚಿತ ಖಾತೆಯನ್ನು ಈಗ ರಚಿಸಿ ಅಥವಾ ನಿಮ್ಮ ಈಗಿರುವ ಖಾತೆಗೆ ಲಾಗಿನ್ ಮಾಡಿ.',
			'subscriptions': 'ಅಪ್ಲಿಕೇಶನ್ ಚಂದಾ',
			'subscribe': 'ಚಂದಾದಾರರಾಗಿ',
			'subscribehint': 'ಚಂದಾದಾರಿಕೆ ಅಗತ್ಯವಿದೆ',
			'playsubscriptionrequiredhint': 'ಈ ಮೀಡಿಯಾವನ್ನು ಕೇಳಲು ಅಥವಾ ವೀಕ್ಷಿಸಲು ಮೊದಲು ನೀವು ಚಂದಾದಾರರಾಗಬೇಕು.',
			'previewsubscriptionrequiredhint': 'ಈ ಮೀಡಿಯಾ ಆಲಿಸಲು ಅಥವಾ ವೀಕ್ಷಿಸಲು ನಿಮಗೆ ಅನುಮತಿಸಲಾದ ಪೂರ್ವಾವಲೋಕನ ಅವಧಿಯನ್ನು ನೀವು ತಲುಪಿದ್ದೀರಿ. ಆಲಿಸಲು ಅಥವಾ ವೀಕ್ಷಿಸಲು ನೀವು ಚಂದಾದಾರರಾಗಬೇಕಾಗಿದೆ.',
			'copiedtoclipboard': 'ಕ್ಲಿಪ್‌ಬೋರ್ಡ್‌ಗೆ ನಕಲಿಸಲಾಗಿದೆ',
			'downloadbible': 'ಬೈಬಲ್ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ',
			'downloadversion': 'ಡೌನ್‌ಲೋಡ್',
			'downloading': 'ಡೌನ್‌ಲೋಡ್ ಮಾಡುತ್ತಿದೆ',
			'failedtodownload': 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ',
			'pleaseclicktoretry': 'ದಯವಿಟ್ಟು ಪುನಃ ಪ್ರಯತ್ನಿಸಲು ಕ್ಲಿಕ್ ಮಾಡಿ.',
			'of': 'ನ',
			'nobibleversionshint': 'ಪ್ರದರ್ಶಿಸಲು ಯಾವುದೇ ಬೈಬಲ್ ಡೇಟಾ ಇಲ್ಲ, ಕನಿಷ್ಟ ಒಂದು ಬೈಬಲ್ ಆವೃತ್ತಿಯನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಲು ಕೆಳಗಿನ ಬಟನ್ ಅನ್ನು ಕ್ಲಿಕ್ ಮಾಡಿ.',
			'downloaded': 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಲಾಗಿದೆ',
			'enteremailaddresstoresetpassword': 'ನಿಮ್ಮ ಪಾಸ್ವರ್ಡ್ ಅನ್ನು ಮರುಹೊಂದಿಸಲು ನಿಮ್ಮ ಇಮೇಲ್ ಅನ್ನು ನಮೂದಿಸಿ',
			'backtologin': 'ಲಾಗಿನ್ ಗೆ ಹಿಂದಿರುಗಿ',
			'signintocontinue': 'ಮುಂದುವರಿಸಲು ಸೈನ್ ಇನ್ ಮಾಡಿ',
			'signin': 'ಸೈನ್ ಇನ್',
			'signinforanaccount': 'ಖಾತೆಗೆ ಸೈನ್ ಅಪ್ ಮಾಡಿ?',
			'alreadyhaveanaccount': 'ಈಗಾಗಲೇ ಖಾತೆ ಇದೆ?',
			'updateprofile': 'ಪ್ರೊಫೈಲ್ ನವೀಕರಿಸಿ',
			'updateprofilehint': 'ಪ್ರಾರಂಭಿಸಲು, ದಯವಿಟ್ಟು ನಿಮ್ಮ ಪ್ರೊಫೈಲ್ ಪುಟವನ್ನು ನವೀಕರಿಸಿ, ಇದು ನಮಗೆ ಇತರ ಜನರೊಂದಿಗೆ ಸಂಪರ್ಕಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ',
			'autoplayvideos': 'ವೀಡಿಯೊಗಳನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ವೀಕ್ಷಿಸಿ',
			'gosocial': 'ಸಾಮಾಜಿಕ ಗೆ ಹೋಗಿ',
			'searchbible': 'ಬೈಬಲ್ ಅನ್ನು ಹುಡುಕಿ',
			'filtersearchoptions': 'ಹುಡುಕಾಟ ಆಯ್ಕೆಗಳನ್ನು ಫಿಲ್ಟರ್ ಮಾಡಿ',
			'narrowdownsearch': 'ಹೆಚ್ಚು ನಿಖರವಾದ ಫಲಿತಾಂಶಕ್ಕಾಗಿ ಹುಡುಕಾಟವನ್ನು ನಾರು ಮಾಡಲು ಕೆಳಗಿನ ಫಿಲ್ಟರ್ ಬಟನ್ ಅನ್ನು ಬಳಸಿ.',
			'searchbibleversion': 'ಬೈಬಲ್ ಆವೃತ್ತಿಯನ್ನು ಹುಡುಕಿ',
			'searchbiblebook': 'ಬೈಬಲ್ ಪುಸ್ತಕವನ್ನು ಹುಡುಕಿ',
			'search': 'ಹುಡುಕಿ',
			'setBibleBook': 'ಬೈಬಲ್ ಪುಸ್ತಕವನ್ನು ಸೆಟ್ ಮಾಡಿ',
			'oldtestament': 'ಹಳೆಯ ಒಪ್ಪಂದ',
			'newtestament': 'ಹೊಸ ಒಪ್ಪಂದ',
			'limitresults': 'ಫಲಿತಾಂಶಗಳನ್ನು ಮಿತಿ',
			'setfilters': 'ಫಿಲ್ಟರ್‌ಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ',
			'bibletranslator': 'ಬೈಬಲ್ ಅನುವಾದಕ',
			'chapter': ' ಅಧ್ಯಾಯ ',
			'verse': ' ಪದ್ಯ ',
			'translate': 'ಅನುವಾದಿಸಿ',
			'bibledownloadinfo': 'ಬೈಬಲ್ ಡೌನ್‌ಲೋಡ್ ಪ್ರಾರಂಭವಾಗಿದೆ, ಡೌನ್‌ಲೋಡ್ ಮುಗಿಯುವವರೆಗೆ ಈ ಪುಟವನ್ನು ಮುಚ್ಚಬೇಡಿ.',
			'received': 'ಸ್ವೀಕರಿಸಲಾಗಿದೆ',
			'outoftotal': 'ಒಟ್ಟು',
			'set': 'ಸೆಟ್',
			'selectColor': 'ಬಣ್ಣವನ್ನು ಆಯ್ಕೆಮಾಡಿ',
			'switchbibleversion': 'ಬೈಬಲ್ ಆವೃತ್ತಿಯನ್ನು ಬದಲಿಸಿ',
			'switchbiblebook': 'ಬೈಬಲ್ ಪುಸ್ತಕವನ್ನು ಬದಲಿಸಿ',
			'gotosearch': 'ಅಧ್ಯಾಯಕ್ಕೆ ಹೋಗಿ',
			'changefontsize': 'ಅಕ್ಷರದ ಗಾತ್ರವನ್ನು ಬದಲಿಸಿ',
			'font': 'ಅಕ್ಷರ',
			'readchapter': 'ಅಧ್ಯಾಯವನ್ನು ಓದಿ',
			'showhighlightedverse': 'ಪ್ರಮುಖ ಪದ್ಯಗಳನ್ನು ತೋರಿಸಿ',
			'downloadmoreversions': 'ಹೆಚ್ಚು ಆವೃತ್ತಿಗಳನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ',
			'suggestedusers': 'ಹೆಚ್ಚು ಆವೃತ್ತಿಗಳನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ',
			'unfollow': 'ಅನುಸರಿಸದಿರಿ',
			'follow': 'ಅನುಸರಿಸು',
			'searchforpeople': 'ಜನರನ್ನು ಹುಡುಕಿ',
			'viewpost': 'ಪೋಸ್ಟ್ ವೀಕ್ಷಿಸಿ',
			'viewprofile': 'ಪ್ರೊಫೈಲ್ ವೀಕ್ಷಿಸಿ',
			'mypins': 'ನನ್ನ ಪಿನ್‌ಗಳು',
			'viewpinnedposts': 'ಪಿನ್ ಮಾಡಿದ ಪೋಸ್ಟ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ',
			'personal': 'ವೈಯಕ್ತಿಕ',
			'update': 'ನವೀಕರಿಸಿ',
			'phonenumber': 'ಫೋನ್ ಸಂಖ್ಯೆ',
			'showmyphonenumber': 'ನನ್ನ ಫೋನ್ ಸಂಖ್ಯೆಯನ್ನು ಬಳಕೆದಾರರಿಗೆ ತೋರಿಸಿ',
			'dateofbirth': 'ಜನ್ಮ ದಿನಾಂಕ',
			'showmyfulldateofbirth': 'ನನ್ನ ಸ್ಥಿತಿಯನ್ನು ವೀಕ್ಷಿಸುವವರಿಗೆ ನನ್ನ ಸಂಪೂರ್ಣ ಜನ್ಮ ದಿನಾಂಕವನ್ನು ತೋರಿಸಿ',
			'notifications': 'ಅಧಿಸೂಚನೆಗಳು',
			'notifywhenuserfollowsme': 'ಬಳಕೆದಾರರು ನನ್ನನ್ನು ಅನುಸರಿಸಿದಾಗ ನನಗೆ ಸೂಚಿಸಿ',
			'notifymewhenusercommentsonmypost': 'ಬಳಕೆದಾರರು ನನ್ನ ಪೋಸ್ಟ್‌ಗಳ ಮೇಲೆ ಕಾಮೆಂಟ್ ಮಾಡಿದಾಗ ನನಗೆ ಸೂಚಿಸಿ',
			'notifymewhenuserlikesmypost': 'ಬಳಕೆದಾರರು ನನ್ನ ಪೋಸ್ಟ್ ಅನ್ನು ಇಷ್ಟಪಟ್ಟಾಗ ನನಗೆ ಸೂಚಿಸಿ',
			'churchsocial': 'ಚರ್ಚ್ ಸಾಮಾಜಿಕ',
			'shareyourthoughts': 'ನಿಮ್ಮ ಆಲೋಚನೆಗಳನ್ನು ಹಂಚಿಕೊಳ್ಳಿ',
			'readmore': '...ಇನ್ನಷ್ಟು ಓದಿ',
			'less': ' ಕಡಿಮೆ',
			'couldnotprocess': 'ಕೋರಿದ ಕ್ರಿಯೆಯನ್ನು ಪ್ರಕ್ರಿಯೆ ಮಾಡಲು ಸಾಧ್ಯವಿಲ್ಲ.',
			'pleaseselectprofilephoto': 'ದಯವಿಟ್ಟು ಅಪ್‌ಲೋಡ್ ಮಾಡಲು ಪ್ರೊಫೈಲ್ ಫೋಟೋ ಆಯ್ಕೆಮಾಡಿ',
			'pleaseselectprofilecover': 'ದಯವಿಟ್ಟು ಅಪ್‌ಲೋಡ್ ಮಾಡಲು ಕವರ್ ಫೋಟೋ ಆಯ್ಕೆಮಾಡಿ',
			'updateprofileerrorhint': 'ಮುಂದುವರೆಯಲು ನಿಮ್ಮ ಹೆಸರು, ಜನ್ಮದಿನಾಂಕ, ಲಿಂಗ, ಫೋನ್ ಮತ್ತು ಸ್ಥಳವನ್ನು ತುಂಬಬೇಕು.',
			'gender': 'ಲಿಂಗ',
			'male': 'ಪುರುಷ',
			'female': 'ಮಹಿಳೆ',
			'dob': 'ಜನ್ಮದಿನಾಂಕ',
			'location': 'ಪ್ರಸ್ತುತ ಸ್ಥಳ',
			'qualification': 'ಯೋಗ್ಯತೆ',
			'aboutme': 'ನನ್ನ ಬಗ್ಗೆ',
			'facebookprofilelink': 'ಫೇಸ್ಬುಕ್ ಪ್ರೊಫೈಲ್ ಲಿಂಕ್',
			'twitterprofilelink': 'ಟ್ವಿಟ್ಟರ್ ಪ್ರೊಫೈಲ್ ಲಿಂಕ್',
			'linkdln': 'ಲಿಂಕ್ಡಿನ್ ಪ್ರೊಫೈಲ್ ಲಿಂಕ್',
			'likes': 'ಇಷ್ಟಗಳು',
			'likess': 'ಇಷ್ಟಗಳು',
			'pinnedposts': 'ನನ್ನ ಪಿನ್ ಮಾಡಿದ ಪೋಸ್ಟ್‌ಗಳು',
			'unpinpost': 'ಪೋಸ್ಟ್ ಅನ್ನು ಅನ್ಪಿನ್ ಮಾಡಿ',
			'unpinposthint': 'ನೀವು ಈ ಪೋಸ್ಟ್ ಅನ್ನು ನಿಮ್ಮ ಪಿನ್ ಮಾಡಿದ ಪೋಸ್ಟ್‌ಗಳಿಂದ ತೆಗೆದುಹಾಕಲು ಬಯಸುತ್ತೀರಾ?',
			'postdetails': 'ಪೋಸ್ಟ್ ವಿವರಗಳು',
			'posts': 'ಪೋಸ್ಟ್‌ಗಳು',
			'followers': 'ಅನುಯಾಯಿಗಳು',
			'followings': 'ಅನುಸರಿಸುತ್ತಿದ್ದಾರೆ',
			'my': 'ನನ್ನ',
			'edit': 'ಸಂಪಾದಿಸಿ',
			'delete': 'ಅಳಿಸಿ',
			'deletepost': 'ಪೋಸ್ಟ್ ಅಳಿಸಿ',
			'deleteposthint': 'ನೀವು ಈ ಪೋಸ್ಟ್ ಅನ್ನು ಅಳಿಸಲು ಬಯಸುತ್ತೀರಾ? ಪೋಸ್ಟ್‌ಗಳು ಇನ್ನೂ ಕೆಲವು ಬಳಕೆದಾರರ ಫೀಡ್‌ಗಳಲ್ಲಿ ಕಾಣಿಸಬಹುದು.',
			'maximumallowedsizehint': 'ಅನುಮತಿಸಲಾದ ಫೈಲ್ ಅಪ್ಲೋಡ್ ಗಾತ್ರವನ್ನು ತಲುಪಿದೆ',
			'maximumuploadsizehint': 'ಆಯ್ಕೆ ಮಾಡಿದ ಫೈಲ್ ಅನುಮತಿಸಲಾದ ಅಪ್ಲೋಡ್ ಫೈಲ್ ಗಾತ್ರ ಮಿತಿಯನ್ನು ಮೀರಿಸುತ್ತದೆ.',
			'makeposterror': 'ಈಗಾಗಲೇ ಪೋಸ್ಟ್ ಮಾಡಲು ಸಾಧ್ಯವಿಲ್ಲ, ಪುನಃ ಪ್ರಯತ್ನಿಸಲು ಕ್ಲಿಕ್ ಮಾಡಿ.',
			'makepost': 'ಪೋಸ್ಟ್ ಮಾಡಿ',
			'selectfile': 'ಫೈಲ್ ಆಯ್ಕೆ ಮಾಡಿ',
			'images': 'ಚಿತ್ರಗಳು',
			'shareYourThoughtsNow': 'ನಿಮ್ಮ ಆಲೋಚನೆಗಳನ್ನು ಹಂಚಿಕೊಳ್ಳಿ...',
			'photoviewer': 'ಫೋಟೋ ವೀಕ್ಷಕ',
			'nochatsavailable': 'ಯಾವುದೇ ಸಂವಾದಗಳು ಲಭ್ಯವಿಲ್ಲ \n ಕೆಳಗಿನ ಚಿಹ್ನೆ ಮೇಲೆ ಕ್ಲಿಕ್ ಮಾಡಿ \n ಬಳಕೆದಾರರನ್ನು ಆಯ್ಕೆಮಾಡಿ',
			'typing': 'ಟೈಪಿಂಗ್...',
			'photo': 'ಫೋಟೋ',
			'online': 'ಆನ್‌ಲೈನ್',
			'offline': 'ಆಫ್‌ಲೈನ್',
			'lastseen': 'ಕೊನೆಯದು',
			'deleteselectedhint': 'ಈ ಕ್ರಿಯೆಯಿಂದ ಆಯ್ಕೆಮಾಡಿದ ಸಂದೇಶಗಳನ್ನು ಅಳಿಸಲಾಗುತ್ತದೆ. ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಇದು ನಿಮ್ಮ ಪಾರ್ಟ್ನರ್‌ಗಾಗಿ ಮೆಸೇಜ್‌ಗಳನ್ನು ಇನ್ನೂ ತೋರಿಸುತ್ತದೆ.',
			'deleteselected': 'ಆಯ್ಕೆಮಾಡಿದನ್ನು ಅಳಿಸಿ',
			'unabletofetchconversation': 'ನಿಮ್ಮ ಸಂವಾದವನ್ನು ತೆಗೆದುಕೊಳ್ಳಲು ಸಾಧ್ಯವಿಲ್ಲ \n',
			'loadmoreconversation': 'ಹೆಚ್ಚು ಸಂವಾದಗಳನ್ನು ಲೋಡ್ ಮಾಡಿ',
			'sendyourfirstmessage': 'ನಿಮ್ಮ ಮೊದಲ ಸಂದೇಶವನ್ನು ಕಳುಹಿಸಿ \n',
			'unblock': 'ಅನ್ಬ್ಲಾಕ್ ',
			'block': 'ಬ್ಲಾಕ್',
			'writeyourmessage': 'ನಿಮ್ಮ ಸಂದೇಶವನ್ನು ಬರೆಯಿರಿ...',
			'clearconversation': 'ಸಂಭಾಷಣೆಗಳನ್ನು ಶುದ್ಧಗೊಳಿಸಿ',
			'clearconversationhintone': 'ಈ ಕ್ರಿಯೆಯಿಂದ ನಿಮ್ಮ ಸಂಪೂರ್ಣ ಸಂಭಾಷಣೆ ಶುದ್ಧಗೊಳಿಸಲಾಗುತ್ತದೆ ',
			'clearconversationhinttwo': '.\n ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಇದು ನಿಮ್ಮ ಪಾರ್ಟ್ನರ್‌ಗಾಗಿ ಮೆಸೇಜ್‌ಗಳನ್ನು ಇನ್ನೂ ತೋರಿಸುತ್ತದೆ.',
			'facebookloginerror': 'ಲಾಗಿನ್ ಪ್ರಕ್ರಿಯೆಯಲ್ಲಿ ಏನೋ ತಪ್ಪಾಗಿದೆ.\n, ಫೇಸ್ಬುಕ್ ನಮಗೆ ನೀಡಿದ ದೋಷ ಇಲ್ಲಿದೆ',
			'selectLanguage': 'ಭಾಷೆ ಆಯ್ಕೆಮಾಡಿ',
			'howTo': 'ಹೇಗೆ',
			'noBibleTextsAvailable': 'ಯಾವುದೇ ಬೈಬಲ್ ಪಾಠಗಳೂ ಲಭ್ಯವಿಲ್ಲ',
			'languages': 'ಭಾಷೆಗಳು',
			'searchLanguages': 'ಭಾಷೆಗಳನ್ನು ಹುಡುಕಿ...',
			'biblesFilesets': 'ಬೈಬಲ್ಗಳು: {bibles}, ಕಡತಗಳ ಸೆಟ್‌ಗಳು: {filesets}',
			'oldTestament': 'ಹಳೆಯ ಒಡಂಬಡಿಕೆ',
			'newTestament': 'ಹೊಸ ಒಡಂಬಡಿಕೆ',
			'play': 'ಆಡಲು',
			'no_verse_content': 'ಪ್ರದರ್ಶಿಸಲು ಯಾವುದೇ ಬೈಬಲ್ ಪದ್ಯದ ವಿಷಯವಿಲ್ಲ.',
			'no_audio_content': 'ಪ್ರದರ್ಶಿಸಲು ಯಾವುದೇ ಬೈಬಲ್ ಆಡಿಯೋ ವಿಷಯವಿಲ್ಲ.',
		};
	}
}

extension on _StringsMr {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'माझा वर्च्युअल पाद्री',
			'selectlanguage': 'भाषा निवडा',
			'deletemyaccount': 'माझे खाते हटवा',
			'deleteaccount': 'माझे खाते हटवा',
			'deleteaccounthint': 'ही क्रिया तुमचे खाते हटवेल आणि तुमचा सर्व डेटा काढेल. एकदा डेटा हटवल्यानंतर, तो पुन्हा प्राप्त केला जाऊ शकत नाही.',
			'deleteaccountsuccess': 'खाते हटवण्यात यशस्वी',
			'chooseapplanguage': 'अ‍ॅप भाषा निवडा',
			'nightmode': 'रात्र मोड',
			'initializingapp': 'प्रारंभ करीत आहे...',
			'home': 'मुख्यपृष्ठ',
			'branches': 'शाखा',
			'inbox': 'इनबॉक्स',
			'downloads': 'डाउनलोड',
			'settings': 'सेटिंग्ज',
			'events': 'कार्यक्रम',
			'myplaylists': 'माझ्या प्लेलिस्ट',
			'website': 'वेबसाइट',
			'hymns': 'भजने',
			'articles': 'लेख',
			'notes': 'टिप्पण्या',
			'donate': 'देणगी',
			'offering': 'अर्पण',
			'savenotetitle': 'टिप्पणी शीर्षक',
			'nonotesfound': 'कोणत्याही टिप्पणी आढळल्या नाहीत',
			'newnote': 'नवीन',
			'deletenote': 'टिप्पणी हटवा',
			'deletenotehint': 'तुम्हाला ही टिप्पणी हटवायची आहे का? ही क्रिया परत केली जाऊ शकत नाही.',
			'bookmarks': 'बुकमार्क्स',
			'socialplatforms': 'सामाजिक प्लॅटफॉर्म',
			'onboardingpagetitles.0': 'माझ्या चर्चमध्ये स्वागत आहे',
			'onboardingpagetitles.1': 'वैशिष्ट्यांनी भरलेले',
			'onboardingpagetitles.2': 'ऑडिओ, व्हिडिओ \n आणि थेट प्रसारण',
			'onboardingpagetitles.3': 'खाते तयार करा',
			'onboardingpagehints.0': 'रविवारी सकाळी आणि आपल्या चर्चच्या चार भिंतींवरून पुढे जा. मोबाईल-केंद्रित जगाशी संवाद साधण्यासाठी आणि संवाद साधण्यासाठी तुम्हाला जे काही आवश्यक आहे ते सर्व काही.',
			'onboardingpagehints.1': 'आपल्या चर्च अ‍ॅपमध्ये असणे आवश्यक असलेल्या सर्व शीर्ष वैशिष्ट्यांना एकत्र आणले आहे. कार्यक्रम, भक्तिगीते, सूचना, टिप्पणी आणि बहु-आवृत्ती बायबल.',
			'onboardingpagehints.2': 'जगभरातील वापरकर्त्यांना तुमच्या चर्च सेवांचे व्हिडिओ पाहण्याची, ऑडिओ संदेश ऐकण्याची आणि थेट प्रसारण पाहण्याची परवानगी द्या.',
			'onboardingpagehints.3': 'कधीही न संपणाऱ्या उपासनेच्या अनुभवासाठी तुमचा प्रवास सुरू करा.',
			'next': 'पुढे',
			'done': 'प्रारंभ करा',
			'quitapp': 'अ‍ॅप सोडा!',
			'quitappwarning': 'आपण अ‍ॅप बंद करू इच्छिता?',
			'quitappaudiowarning': 'आपण सध्या ऑडिओ प्ले करत आहात, अ‍ॅप बंद केल्याने ऑडिओ प्लेबॅक थांबेल. आपण प्लेबॅक थांबवू इच्छित नसल्यास, फक्त मध्य बटणासह अ‍ॅप कमी करा किंवा अ‍ॅप सोडण्यासाठी ओके बटणावर क्लिक करा.',
			'ok': 'ठीक आहे',
			'retry': 'पुन्हा प्रयत्न करा',
			'oops': 'अरेरे!',
			'save': 'जतन करा',
			'cancel': 'रद्द करा',
			'error': 'त्रुटी',
			'success': 'यश',
			'skip': 'वगळा',
			'skiplogin': 'लॉगिन वगळा',
			'skipregister': 'नोंदणी वगळा',
			'dataloaderror': 'सध्या विनंती केलेला डेटा लोड करू शकत नाही, आपला डेटा कनेक्शन तपासा आणि पुन्हा प्रयत्न करण्यासाठी क्लिक करा.',
			'suggestedforyou': 'तुमच्यासाठी सुचवलेले',
			'videomessages': 'व्हिडिओ संदेश',
			'audiomessages': 'ऑडिओ संदेश',
			'devotionals': 'भक्तिगीते',
			'categories': 'श्रेण्या',
			'category': 'श्रेणी',
			'videos': 'व्हिडिओ',
			'audios': 'ऑडिओ',
			'biblebooks': 'बायबल',
			'sermons': 'प्रवचने',
			'tools': 'साधने',
			'profile': 'प्रोफाइल',
			'audiobible': 'ऑडिओ बायबल',
			'homesentence': 'तुमचा पाद्री 1 वर्षासाठी, तुम्हाला देवाने बोलावलेल्या व्यक्तीमध्ये वाढण्यास मदत करण्यासाठी.',
			'livestreams': 'थेट प्रसारण',
			'radio': 'रेडिओ',
			'allitems': 'सर्व आयटम',
			'emptyplaylist': 'प्लेलिस्ट नाहीत',
			'notsupported': 'समर्थित नाही',
			'cleanupresources': 'साधने स्वच्छ करत आहे',
			'grantstoragepermission': 'कृपया पुढे जाण्यासाठी संग्रहण परवानगी प्रदान करा',
			'sharefiletitle': 'पहा किंवा ऐका ',
			'sharefilebody': 'माझ्या वर्च्युअल पाद्री अ‍ॅपच्या माध्यमातून, आता डाउनलोड करा ',
			'sharetext': 'असीमित ऑडिओ आणि व्हिडिओ प्रवाहाचा आनंद घ्या',
			'sharetexthint': 'तुम्हाला जगभरातील लाखो फाईल्स पाहू आणि ऐकू देणाऱ्या व्हिडिओ आणि ऑडिओ प्रवाहित प्लॅटफॉर्ममध्ये सामील व्हा. आता डाउनलोड करा ',
			'download': 'डाउनलोड',
			'addplaylist': 'प्लेलिस्टमध्ये जोडा',
			'bookmark': 'बुकमार्क',
			'unbookmark': 'बुकमार्क काढा',
			'share': 'शेअर करा',
			'deletemedia': 'फाइल हटवा',
			'deletemediahint': 'आपण हे डाउनलोड केलेले फाइल हटवू इच्छिता? ही क्रिया पूर्ववत केली जाऊ शकत नाही.',
			'searchhint': 'ऑडिओ आणि व्हिडिओ संदेश शोधा',
			'performingsearch': 'ऑडिओ आणि व्हिडिओ शोधत आहे',
			'nosearchresult': 'कोणतेही निकाल सापडले नाहीत',
			'nosearchresulthint': 'अधिक सामान्य कीवर्ड प्रविष्ट करण्याचा प्रयत्न करा',
			'addtoplaylist': 'प्लेलिस्टमध्ये जोडा',
			'newplaylist': 'नवीन प्लेलिस्ट',
			'playlistitm': 'प्लेलिस्ट',
			'mediaaddedtoplaylist': 'मीडिया प्लेलिस्टमध्ये जोडले.',
			'mediaremovedfromplaylist': 'मीडिया प्लेलिस्टमधून काढले',
			'clearplaylistmedias': 'सर्व मीडिया स्वच्छ करा',
			'deletePlayList': 'प्लेलिस्ट हटवा',
			'clearplaylistmediashint': 'आपण या प्लेलिस्टमधून सर्व मीडिया काढू इच्छिता?',
			'deletePlayListhint': 'आपण ही प्लेलिस्ट हटवू आणि सर्व मीडिया स्वच्छ करू इच्छिता?',
			'comments': 'टिप्पण्या',
			'replies': 'प्रत्युत्तरे',
			'reply': 'प्रत्युत्तर द्या',
			'logintoaddcomment': 'टिप्पणी जोडण्यासाठी लॉगिन करा',
			'logintoreply': 'प्रत्युत्तर देण्यासाठी लॉगिन करा',
			'writeamessage': 'संदेश लिहा...',
			'nocomments': 'कोणत्याही टिप्पणी आढळल्या नाहीत \nपुन्हा प्रयत्न करण्यासाठी क्लिक करा',
			'errormakingcomments': 'सध्या टिप्पणी करू शकत नाही.',
			'errordeletingcomments': 'सध्या ही टिप्पणी हटवू शकत नाही.',
			'erroreditingcomments': 'सध्या ही टिप्पणी संपादित करू शकत नाही.',
			'errorloadingmorecomments': 'सध्या अधिक टिप्पण्या लोड करू शकत नाही.',
			'deletingcomment': 'टिप्पणी हटवत आहे',
			'editingcomment': 'टिप्पणी संपादित करत आहे',
			'deletecommentalert': 'टिप्पणी हटवा',
			'editcommentalert': 'टिप्पणी संपादित करा',
			'deletecommentalerttext': 'आपण ही टिप्पणी हटवू इच्छिता? ही क्रिया पूर्ववत केली जाऊ शकत नाही',
			'loadmore': 'अधिक लोड करा',
			'messages': 'संदेश',
			'guestuser': 'अतिथी वापरकर्ता',
			'fullname': 'पूर्ण नाव',
			'emailaddress': 'ईमेल पत्ता',
			'password': 'पासवर्ड',
			'repeatpassword': 'पासवर्ड पुन्हा प्रविष्ट करा',
			'register': 'नोंदणी करा',
			'login': 'लॉगिन',
			'logout': 'लॉगआउट',
			'logoutfromapp': 'अ‍ॅपमधून लॉगआउट करायचे?',
			'logoutfromapphint': 'आपण लॉगिन नसल्यास आपल्याला लेख आणि व्हिडिओवर टिप्पणी करण्यासाठी किंवा आवडण्यासाठी सक्षम होणार नाही.',
			'gotologin': 'लॉगिन वर जा',
			'resetpassword': 'पासवर्ड रीसेट करा',
			'logintoaccount': 'आधीच खाते आहे? लॉगिन',
			'emptyfielderrorhint': 'आपण सर्व फील्ड भरणे आवश्यक आहे',
			'invalidemailerrorhint': 'आपल्याला वैध ईमेल पत्ता प्रविष्ट करणे आवश्यक आहे',
			'passwordsdontmatch': 'पासवर्ड जुळत नाहीत',
			'processingpleasewait': 'प्रक्रिया करत आहे, कृपया प्रतीक्षा करा...',
			'createaccount': 'खाते तयार करा',
			'forgotpassword': 'पासवर्ड विसरलात?',
			'orloginwith': 'किंवा लॉगिन करा',
			'facebook': 'फेसबुक',
			'google': 'गूगल',
			'moreoptions': 'अधिक पर्याय',
			'about': 'आमच्याबद्दल',
			'privacy': 'गोपनीयता धोरण',
			'terms': 'अ‍ॅपची अटी',
			'rate': 'अ‍ॅपला रेट करा',
			'version': 'आवृत्ती',
			'pulluploadmore': 'लोड करण्यासाठी वर ओढा',
			'loadfailedretry': 'लोड करण्यात अयशस्वी! पुन्हा प्रयत्न करण्यासाठी क्लिक करा!',
			'releaseloadmore': 'अधिक लोड करण्यासाठी सोडा',
			'nomoredata': 'आणखी डेटा नाही',
			'errorReportingComment': 'टिप्पणी अहवाल त्रुटी',
			'reportingComment': 'टिप्पणी अहवाल',
			'reportcomment': 'अहवाल पर्याय',
			'reportCommentsList.0': 'अनावश्यक व्यावसायिक सामग्री किंवा स्पॅम',
			'reportCommentsList.1': 'अश्लीलता किंवा लैंगिक स्पष्ट सामग्री',
			'reportCommentsList.2': 'द्वेष भाषण किंवा ग्राफिक हिंसा',
			'reportCommentsList.3': 'छळ किंवा धमकावणे',
			'bookmarksMedia': 'माझे बुकमार्क्स',
			'noitemstodisplay': 'प्रदर्शित करण्यासाठी कोणतीही वस्तू नाहीत',
			'loginrequired': 'लॉगिन आवश्यक आहे',
			'loginrequiredhint': 'या प्लॅटफॉर्मवर सदस्यता घेण्यासाठी, आपल्याला लॉगिन करणे आवश्यक आहे. आता एक विनामूल्य खाते तयार करा किंवा आपल्या विद्यमान खात्यात लॉगिन करा.',
			'subscriptions': 'अ‍ॅप सदस्यता',
			'subscribe': 'सदस्यता घ्या',
			'subscribehint': 'सदस्यता आवश्यक आहे',
			'playsubscriptionrequiredhint': 'हे मीडिया ऐकण्यासाठी किंवा पाहण्यासाठी आपल्याला सदस्यता घ्यावी लागेल.',
			'previewsubscriptionrequiredhint': 'आपण या मीडियासाठी अनुमत पूर्वावलोकन कालावधी पूर्ण केला आहे. ऐकणे किंवा पाहण्यासाठी आपण सदस्यता घ्यावी लागेल.',
			'copiedtoclipboard': 'क्लिपबोर्डवर कॉपी केले',
			'downloadbible': 'बायबल डाउनलोड करा',
			'downloadversion': 'डाउनलोड',
			'downloading': 'डाउनलोड करत आहे',
			'failedtodownload': 'डाउनलोड करण्यात अयशस्वी',
			'pleaseclicktoretry': 'कृपया पुन्हा प्रयत्न करण्यासाठी क्लिक करा.',
			'of': 'पैकी',
			'nobibleversionshint': 'प्रदर्शित करण्यासाठी कोणतेही बायबल डेटा नाहीत, कमीत कमी एक बायबल आवृत्ती डाउनलोड करण्यासाठी खालील बटणावर क्लिक करा.',
			'downloaded': 'डाउनलोड केले',
			'enteremailaddresstoresetpassword': 'आपला पासवर्ड रीसेट करण्यासाठी आपला ईमेल प्रविष्ट करा',
			'backtologin': 'लॉगिन वर परत जा',
			'signintocontinue': 'पुढे जाण्यासाठी साइन इन करा',
			'signin': 'साइन इन',
			'signinforanaccount': 'खात्यासाठी साइन अप करा?',
			'alreadyhaveanaccount': 'आधीपासूनच खाते आहे?',
			'updateprofile': 'प्रोफाइल अद्यतनित करा',
			'updateprofilehint': 'प्रारंभ करण्यासाठी, कृपया आपले प्रोफाइल पृष्ठ अद्यतनित करा, हे आम्हाला इतर लोकांशी जोडण्यास मदत करेल',
			'autoplayvideos': 'व्हिडिओ स्वयंचलित प्ले',
			'gosocial': 'सोशल वर जा',
			'searchbible': 'बायबल शोधा',
			'filtersearchoptions': 'शोध पर्याय फिल्टर करा',
			'narrowdownsearch': 'अधिक अचूक परिणामांसाठी शोध कमी करण्यासाठी खालील फिल्टर बटण वापरा.',
			'searchbibleversion': 'बायबल आवृत्ती शोधा',
			'searchbiblebook': 'बायबल पुस्तक शोधा',
			'search': 'शोधा',
			'setBibleBook': 'बायबल पुस्तक सेट करा',
			'oldtestament': 'जुना करार',
			'newtestament': 'नवीन करार',
			'limitresults': 'परिणाम मर्यादित करा',
			'setfilters': 'फिल्टर सेट करा',
			'bibletranslator': 'बायबल अनुवादक',
			'chapter': ' अध्याय ',
			'verse': ' श्लोक ',
			'translate': 'अनुवाद करा',
			'bibledownloadinfo': 'बायबल डाउनलोड प्रारंभ झाला आहे, डाउनलोड पूर्ण होईपर्यंत कृपया हे पृष्ठ बंद करू नका.',
			'received': 'प्राप्त झाले',
			'outoftotal': 'एकूण',
			'set': 'सेट करा',
			'selectColor': 'रंग निवडा',
			'switchbibleversion': 'बायबल आवृत्ती बदला',
			'switchbiblebook': 'बायबल पुस्तक बदला',
			'gotosearch': 'अध्यायावर जा',
			'changefontsize': 'फॉन्ट आकार बदला',
			'font': 'फॉन्ट',
			'readchapter': 'अध्याय वाचा',
			'showhighlightedverse': 'हायलाइट केलेले श्लोक दाखवा',
			'downloadmoreversions': 'अधिक आवृत्त्या डाउनलोड करा',
			'suggestedusers': 'शिफारस केलेले वापरकर्ते',
			'unfollow': 'अनफॉलो करा',
			'follow': 'फॉलो करा',
			'searchforpeople': 'लोकांना शोधा',
			'viewpost': 'पोस्ट पहा',
			'viewprofile': 'प्रोफाइल पहा',
			'mypins': 'माझे पिन्स',
			'viewpinnedposts': 'पिन केलेले पोस्ट पहा',
			'personal': 'वैयक्तिक',
			'update': 'अद्यतनित करा',
			'phonenumber': 'फोन नंबर',
			'showmyphonenumber': 'माझा फोन नंबर वापरकर्त्यांना दाखवा',
			'dateofbirth': 'जन्मतारीख',
			'showmyfulldateofbirth': 'माझी स्थिती पाहणाऱ्या लोकांना माझी पूर्ण जन्मतारीख दाखवा',
			'notifications': 'सूचना',
			'notifywhenuserfollowsme': 'जेव्हा एखादा वापरकर्ता मला फॉलो करतो तेव्हा मला सूचित करा',
			'notifymewhenusercommentsonmypost': 'जेव्हा वापरकर्ते माझ्या पोस्टवर टिप्पणी करतात तेव्हा मला सूचित करा',
			'notifymewhenuserlikesmypost': 'जेव्हा वापरकर्ते माझ्या पोस्टला आवडतात तेव्हा मला सूचित करा',
			'churchsocial': 'चर्च सोशल',
			'shareyourthoughts': 'तुमचे विचार शेअर करा',
			'readmore': '...अधिक वाचा',
			'less': ' कमी',
			'couldnotprocess': 'विनंती केलेली कृती प्रक्रिया करू शकली नाही.',
			'pleaseselectprofilephoto': 'कृपया अपलोड करण्यासाठी प्रोफाइल फोटो निवडा',
			'pleaseselectprofilecover': 'कृपया अपलोड करण्यासाठी कव्हर फोटो निवडा',
			'updateprofileerrorhint': 'आपण पुढे जाण्यापूर्वी आपले नाव, जन्मतारीख, लिंग, फोन आणि स्थान भरावे लागेल.',
			'gender': 'लिंग',
			'male': 'पुरुष',
			'female': 'महिला',
			'dob': 'जन्मतारीख',
			'location': 'सध्याचे स्थान',
			'qualification': 'पात्रता',
			'aboutme': 'माझ्याबद्दल',
			'facebookprofilelink': 'फेसबुक प्रोफाइल लिंक',
			'twitterprofilelink': 'ट्विटर प्रोफाइल लिंक',
			'linkdln': 'लिंक्डइन प्रोफाइल लिंक',
			'likes': 'आवडते',
			'likess': 'आवडले',
			'pinnedposts': 'माझ्या पिन केलेल्या पोस्ट',
			'unpinpost': 'पोस्ट अनपिन करा',
			'unpinposthint': 'आपण हे पोस्ट आपल्या पिन केलेल्या पोस्टमधून काढू इच्छिता?',
			'postdetails': 'पोस्ट तपशील',
			'posts': 'पोस्ट',
			'followers': 'अनुयायी',
			'followings': 'अनुसरण करीत आहे',
			'my': 'माझे',
			'edit': 'संपादित करा',
			'delete': 'हटवा',
			'deletepost': 'पोस्ट हटवा',
			'deleteposthint': 'आपण हे पोस्ट हटवू इच्छिता? पोस्ट्स काही वापरकर्त्यांच्या फीडवर दिसू शकतात.',
			'maximumallowedsizehint': 'अनुमत अपलोड फाइल आकार मर्यादेपर्यंत पोहोचले',
			'maximumuploadsizehint': 'निवडलेले फाइल अनुमत अपलोड फाइल आकार मर्यादेपेक्षा जास्त आहे.',
			'makeposterror': 'सध्या पोस्ट बनवू शकत नाही, पुन्हा प्रयत्न करण्यासाठी क्लिक करा.',
			'makepost': 'पोस्ट बनवा',
			'selectfile': 'फाइल निवडा',
			'images': 'प्रतिमा',
			'shareYourThoughtsNow': 'तुमचे विचार शेअर करा...',
			'photoviewer': 'फोटो दर्शक',
			'nochatsavailable': 'कोणत्याही संभाषणे उपलब्ध नाहीत \n खालील चिन्हावर क्लिक करा \n वापरकर्त्यांची निवड करण्यासाठी',
			'typing': 'टायपिंग...',
			'photo': 'फोटो',
			'online': 'ऑनलाइन',
			'offline': 'ऑफलाइन',
			'lastseen': 'शेवटचे दिसले',
			'deleteselectedhint': 'ही क्रिया निवडलेल्या संदेशांना हटवेल. कृपया लक्षात ठेवा की हे केवळ आपली बाजूची संभाषणे हटवते, \n संदेश अजूनही आपल्या पार्टनरच्या डिव्हाइसवर दिसतील.',
			'deleteselected': 'निवडलेले हटवा',
			'unabletofetchconversation': 'आपले संभाषण आणू शकले नाही \n',
			'loadmoreconversation': 'अधिक संभाषणे लोड करा',
			'sendyourfirstmessage': 'आपला पहिला संदेश पाठवा \n',
			'unblock': 'अनब्लॉक ',
			'block': 'ब्लॉक',
			'writeyourmessage': 'आपला संदेश लिहा...',
			'clearconversation': 'संभाषण स्वच्छ करा',
			'clearconversationhintone': 'ही क्रिया आपले सर्व संभाषण स्वच्छ करेल ',
			'clearconversationhinttwo': '.\n कृपया लक्षात ठेवा की हे केवळ आपली बाजूची संभाषणे हटवते, संदेश अजूनही आपल्या पार्टनरच्या चॅटवर दिसतील.',
			'facebookloginerror': 'लॉगिन प्रक्रियेत काहीतरी चुकीचे झाले.\n, येथे फेसबुकने आम्हाला दिलेली त्रुटी आहे',
			'selectLanguage': 'भाषा निवडा',
			'howTo': 'कसे',
			'noBibleTextsAvailable': 'कोणतेही बायबल मजकूर उपलब्ध नाहीत',
			'languages': 'भाषा',
			'searchLanguages': 'भाषा शोधा...',
			'biblesFilesets': 'बायबल: {bibles}, फाईलसेट: {filesets}',
			'oldTestament': 'जुना करार',
			'newTestament': 'नवीन करार',
			'play': 'वाजवा',
			'no_verse_content': 'प्रदर्शित करण्यासाठी कोणतीही बायबल श्लोक सामग्री उपलब्ध नाही.',
			'no_audio_content': 'प्रदर्शित करण्यासाठी कोणतीही बायबल ऑडिओ सामग्री उपलब्ध नाही.',
		};
	}
}

extension on _StringsNe {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'मेरो भर्चुअल पास्टर',
			'selectlanguage': 'भाषा चयन गर्नुहोस्',
			'deletemyaccount': 'मेरो खाता मेटाउनुहोस्',
			'deleteaccount': 'खाता मेटाउनुहोस्',
			'deleteaccounthint': 'यस कार्यले तपाईंको खाता मेट्छ र सबै डाटा हटाउँछ। एक पटक तपाईंको डाटा मेटिएको छ भने, यसलाई पुन: प्राप्त गर्न सकिँदैन।',
			'deleteaccountsuccess': 'खाता मेटाउने कार्य सफल भयो',
			'chooseapplanguage': 'एप भाषा चयन गर्नुहोस्',
			'nightmode': 'रात मोड',
			'initializingapp': 'आरम्भ गर्दैछ...',
			'home': 'गृहपृष्ठ',
			'branches': 'शाखाहरू',
			'inbox': 'इनबक्स',
			'downloads': 'डाउनलोडहरू',
			'settings': 'सेटिङहरू',
			'events': 'घटनाहरू',
			'myplaylists': 'मेरो प्ले सूचीहरू',
			'website': 'वेबसाइट',
			'hymns': 'भजनहरू',
			'articles': 'लेखहरू',
			'notes': 'टिप्पणीहरू',
			'donate': 'दान',
			'offering': 'अर्पण',
			'savenotetitle': 'टिप्पणी शीर्षक',
			'nonotesfound': 'कुनै टिप्पणी भेटिएन',
			'newnote': 'नयाँ',
			'deletenote': 'टिप्पणी मेटाउनुहोस्',
			'deletenotehint': 'के तपाईं यो टिप्पणी मेटाउन चाहनुहुन्छ? यस कार्यलाई उल्टाउन सकिँदैन।',
			'bookmarks': 'बुकमार्कहरू',
			'socialplatforms': 'सामाजिक प्लेटफार्महरू',
			'onboardingpagetitles.0': 'मेरो चर्चमा स्वागत छ',
			'onboardingpagetitles.1': 'विशेषताहरूले भरिएको',
			'onboardingpagetitles.2': 'अडियो, भिडियो \n र लाइभ स्ट्रिमिङ',
			'onboardingpagetitles.3': 'खाता सिर्जना गर्नुहोस्',
			'onboardingpagehints.0': 'आइतबार बिहान र तपाईंको चर्चका चार पर्खालहरू भन्दा बाहिर फैलिनुहोस्। मोबाइल-केन्द्रित विश्वसँग संवाद गर्न र संलग्न हुन तपाईंलाई चाहिने सबै कुरा।',
			'onboardingpagehints.1': 'हामीले तपाईंको चर्च एपले आवश्यक पर्ने सबै शीर्ष सुविधाहरूलाई एकत्र गरेका छौं। घटनाहरू, भक्तिगीतहरू, सूचनाहरू, टिप्पणीहरू र बहु-संस्करण बाइबल।',
			'onboardingpagehints.2': 'प्रयोगकर्ताहरूलाई विश्वभरि भिडियोहरू हेर्न, अडियो सन्देशहरू सुन्न र तपाईंको चर्च सेवाहरूको लाइभ स्ट्रिम हेर्न अनुमति दिनुहोस्।',
			'onboardingpagehints.3': 'कहिल्यै नसकिने उपासना अनुभवतर्फ तपाईंको यात्रा सुरु गर्नुहोस्।',
			'next': 'अर्को',
			'done': 'सुरु गर्नुहोस्',
			'quitapp': 'एप बन्द गर्नुहोस्!',
			'quitappwarning': 'के तपाईं एप बन्द गर्न चाहनुहुन्छ?',
			'quitappaudiowarning': 'तपाईं हाल अडियो प्ले गर्दै हुनुहुन्छ, एप बन्द गर्दा अडियो प्लेब्याक बन्द हुन्छ। यदि तपाईं प्लेब्याक रोक्न चाहनुहुन्न भने, केवल केन्द्र बटन प्रयोग गरेर एपलाई मिनिमाइज गर्नुहोस् वा एप बन्द गर्न ठिक बटन क्लिक गर्नुहोस्।',
			'ok': 'ठिक',
			'retry': 'पुन: प्रयास गर्नुहोस्',
			'oops': 'अरे!',
			'save': 'सेभ गर्नुहोस्',
			'cancel': 'रद्द गर्नुहोस्',
			'error': 'त्रुटि',
			'success': 'सफलता',
			'skip': 'छोड्नुहोस्',
			'skiplogin': 'लगइन छोड्नुहोस्',
			'skipregister': 'दर्ता छोड्नुहोस्',
			'dataloaderror': 'हाल अनुरोध गरिएको डाटा लोड गर्न सकिएन, कृपया तपाईंको डाटा कनेक्शन जाँच गर्नुहोस् र पुन: प्रयास गर्न क्लिक गर्नुहोस्।',
			'suggestedforyou': 'तपाईंको लागि सिफारिस गरिएको',
			'videomessages': 'भिडियो सन्देशहरू',
			'audiomessages': 'अडियो सन्देशहरू',
			'devotionals': 'भक्तिगीतहरू',
			'categories': 'श्रेणीहरू',
			'category': 'श्रेणी',
			'videos': 'भिडियोहरू',
			'audios': 'अडियोहरू',
			'biblebooks': 'बाइबल',
			'sermons': 'प्रवचनहरू',
			'tools': 'उपकरणहरू',
			'profile': 'प्रोफाइल',
			'audiobible': 'अडियो बाइबल',
			'homesentence': 'तपाईंलाई भगवानले बोलाएको व्यक्तिमा हुर्काउन मद्दत गर्न १ वर्षको लागि तपाईंको पादरी।',
			'livestreams': 'लाइभ स्ट्रिमहरू',
			'radio': 'रेडियो',
			'allitems': 'सबै वस्तुहरू',
			'emptyplaylist': 'कुनै प्ले सूचीहरू छैनन्',
			'notsupported': 'समर्थन छैन',
			'cleanupresources': 'स्रोतहरू सफा गर्दै',
			'grantstoragepermission': 'कृपया अगाडि बढ्न संग्रहण अनुमति प्रदान गर्नुहोस्',
			'sharefiletitle': 'हेर्नुहोस् वा सुन्नुहोस् ',
			'sharefilebody': 'मेरो भर्चुअल पास्टर एपमार्फत, अहिले डाउनलोड गर्नुहोस् ',
			'sharetext': 'असीमित अडियो र भिडियो स्ट्रिमिङको आनन्द लिनुहोस्',
			'sharetexthint': 'तपाईंलाई विश्वभरका लाखौं फाइलहरू हेर्न र सुन्न दिने भिडियो र अडियो स्ट्रिमिङ प्लेटफर्ममा सामेल हुनुहोस्। अहिले डाउनलोड गर्नुहोस् ',
			'download': 'डाउनलोड गर्नुहोस्',
			'addplaylist': 'प्ले सूचीमा थप्नुहोस्',
			'bookmark': 'बुकमार्क',
			'unbookmark': 'बुकमार्क हटाउनुहोस्',
			'share': 'सेयर गर्नुहोस्',
			'deletemedia': 'फाइल मेटाउनुहोस्',
			'deletemediahint': 'के तपाईं यो डाउनलोड गरिएको फाइल मेटाउन चाहनुहुन्छ? यस कार्यलाई उल्टाउन सकिँदैन।',
			'searchhint': 'अडियो र भिडियो सन्देशहरू खोज्नुहोस्',
			'performingsearch': 'अडियो र भिडियो खोज्दैछ',
			'nosearchresult': 'कुनै नतिजा भेटिएन',
			'nosearchresulthint': 'अधिक सामान्य कुञ्जीशब्द प्रविष्ट गर्ने प्रयास गर्नुहोस्',
			'addtoplaylist': 'प्ले सूचीमा थप्नुहोस्',
			'newplaylist': 'नयाँ प्ले सूची',
			'playlistitm': 'प्ले सूची',
			'mediaaddedtoplaylist': 'मीडिया प्ले सूचीमा थपियो।',
			'mediaremovedfromplaylist': 'मीडिया प्ले सूचीबाट हटाइयो',
			'clearplaylistmedias': 'सबै मिडिया सफा गर्नुहोस्',
			'deletePlayList': 'प्ले सूची मेटाउनुहोस्',
			'clearplaylistmediashint': 'के तपाईं यो प्ले सूचीबाट सबै मिडिया हटाउन चाहनुहुन्छ?',
			'deletePlayListhint': 'के तपाईं यो प्ले सूची मेटाउन र सबै मिडिया सफा गर्न चाहनुहुन्छ?',
			'comments': 'टिप्पणीहरू',
			'replies': 'उत्तरहरू',
			'reply': 'उत्तर',
			'logintoaddcomment': 'टिप्पणी थप्न लगइन गर्नुहोस्',
			'logintoreply': 'उत्तर दिन लगइन गर्नुहोस्',
			'writeamessage': 'सन्देश लेख्नुहोस्...',
			'nocomments': 'कुनै टिप्पणी भेटिएन \nपुन: प्रयास गर्न क्लिक गर्नुहोस्',
			'errormakingcomments': 'हाल टिप्पणी गर्न सकिएन..',
			'errordeletingcomments': 'हाल यो टिप्पणी मेटाउन सकिँदैन..',
			'erroreditingcomments': 'हाल यो टिप्पणी सम्पादन गर्न सकिँदैन..',
			'errorloadingmorecomments': 'हाल अधिक टिप्पणीहरू लोड गर्न सकिँदैन..',
			'deletingcomment': 'टिप्पणी मेट्दै',
			'editingcomment': 'टिप्पणी सम्पादन गर्दै',
			'deletecommentalert': 'टिप्पणी मेटाउनुहोस्',
			'editcommentalert': 'टिप्पणी सम्पादन गर्नुहोस्',
			'deletecommentalerttext': 'के तपाईं यो टिप्पणी मेटाउन चाहनुहुन्छ? यस कार्यलाई उल्टाउन सकिँदैन',
			'loadmore': 'अधिक लोड गर्नुहोस्',
			'messages': 'सन्देशहरू',
			'guestuser': 'अतिथि प्रयोगकर्ता',
			'fullname': 'पूरा नाम',
			'emailaddress': 'इमेल ठेगाना',
			'password': 'पासवर्ड',
			'repeatpassword': 'पासवर्ड पुन: प्रविष्ट गर्नुहोस्',
			'register': 'दर्ता गर्नुहोस्',
			'login': 'लगइन गर्नुहोस्',
			'logout': 'लगआउट गर्नुहोस्',
			'logoutfromapp': 'एपबाट लगआउट गर्नुहोस्?',
			'logoutfromapphint': 'तपाईं लगइन नभएको अवस्थामा तपाईंलाई लेखहरू र भिडियोहरूमा टिप्पणी गर्न वा मन पराउन सक्षम हुने छैन।',
			'gotologin': 'लगइनमा जानुहोस्',
			'resetpassword': 'पासवर्ड रिसेट गर्नुहोस्',
			'logintoaccount': 'पहिले नै खाता छ? लगइन गर्नुहोस्',
			'emptyfielderrorhint': 'तपाईंले सबै क्षेत्रहरू भर्न आवश्यक छ',
			'invalidemailerrorhint': 'तपाईंले मान्य इमेल ठेगाना प्रविष्ट गर्नु आवश्यक छ',
			'passwordsdontmatch': 'पासवर्डहरू मेल खाँदैनन्',
			'processingpleasewait': 'प्रसंस्करण गर्दै, कृपया पर्खनुहोस्...',
			'createaccount': 'खाता सिर्जना गर्नुहोस्',
			'forgotpassword': 'पासवर्ड बिर्सनुभयो?',
			'orloginwith': 'वा लगइन गर्नुहोस्',
			'facebook': 'फेसबुक',
			'google': 'गुगल',
			'moreoptions': 'थप विकल्पहरू',
			'about': 'हाम्रोबारे',
			'privacy': 'गोपनीयता नीति',
			'terms': 'एपका सर्तहरू',
			'rate': 'एपलाई रेट गर्नुहोस्',
			'version': 'संस्करण',
			'pulluploadmore': 'लोड गर्न तान्नुहोस्',
			'loadfailedretry': 'लोड असफल भयो! पुन: प्रयास गर्न क्लिक गर्नुहोस्!',
			'releaseloadmore': 'अधिक लोड गर्न छोड्नुहोस्',
			'nomoredata': 'अझै डाटा छैन',
			'errorReportingComment': 'टिप्पणी रिपोर्टिङ त्रुटि',
			'reportingComment': 'टिप्पणी रिपोर्ट गर्दै',
			'reportcomment': 'रिपोर्ट विकल्पहरू',
			'reportCommentsList.0': 'अनचाहिएको व्यावसायिक सामग्री वा स्प्याम',
			'reportCommentsList.1': 'अश्लीलता वा यौन स्पष्ट सामग्री',
			'reportCommentsList.2': 'घृणा भाषण वा ग्राफिक हिंसा',
			'reportCommentsList.3': 'उत्पीडन वा धम्की',
			'bookmarksMedia': 'मेरो बुकमार्कहरू',
			'noitemstodisplay': 'प्रदर्शन गर्न कुनै वस्तु छैन',
			'loginrequired': 'लगइन आवश्यक छ',
			'loginrequiredhint': 'यस प्लेटफर्ममा सदस्यता लिन, तपाईंलाई लगइन गर्न आवश्यक छ। अहिले एक निःशुल्क खाता सिर्जना गर्नुहोस् वा तपाईंको विद्यमान खातामा लगइन गर्नुहोस्।',
			'subscriptions': 'एप सदस्यता',
			'subscribe': 'सदस्यता लिनुहोस्',
			'subscribehint': 'सदस्यता आवश्यक छ',
			'playsubscriptionrequiredhint': 'यस मिडिया सुन्न वा हेर्नका लागि तपाईंलाई सदस्यता लिन आवश्यक छ।',
			'previewsubscriptionrequiredhint': 'यस मिडियाका लागि तपाईंले अनुमति दिइएको पूर्वावलोकन अवधि पुग्नुभएको छ। सुन्न वा हेर्नका लागि तपाईंलाई सदस्यता लिन आवश्यक छ।',
			'copiedtoclipboard': 'क्लिपबोर्डमा प्रतिलिपि गरियो',
			'downloadbible': 'बाइबल डाउनलोड गर्नुहोस्',
			'downloadversion': 'डाउनलोड गर्नुहोस्',
			'downloading': 'डाउनलोड गर्दै',
			'failedtodownload': 'डाउनलोड गर्न असफल भयो',
			'pleaseclicktoretry': 'कृपया पुन: प्रयास गर्न क्लिक गर्नुहोस्।',
			'of': 'को',
			'nobibleversionshint': 'प्रदर्शन गर्न कुनै बाइबल डाटा छैन, कम्तिमा एउटा बाइबल संस्करण डाउनलोड गर्न तलको बटनमा क्लिक गर्नुहोस्।',
			'downloaded': 'डाउनलोड गरियो',
			'enteremailaddresstoresetpassword': 'तपाईंको पासवर्ड रिसेट गर्न तपाईंको इमेल प्रविष्ट गर्नुहोस्',
			'backtologin': 'लगइनमा फिर्ता जानुहोस्',
			'signintocontinue': 'अगाडि बढ्न साइन इन गर्नुहोस्',
			'signin': 'साइन इन गर्नुहोस्',
			'signinforanaccount': 'खाताका लागि साइन अप गर्नुहोस्?',
			'alreadyhaveanaccount': 'पहिले नै खाता छ?',
			'updateprofile': 'प्रोफाइल अद्यावधिक गर्नुहोस्',
			'updateprofilehint': 'सुरु गर्न, कृपया तपाईंको प्रोफाइल पृष्ठ अद्यावधिक गर्नुहोस्, यसले हामीलाई अन्य व्यक्तिहरूसँग जोड्न मद्दत गर्दछ',
			'autoplayvideos': 'स्वतः प्ले भिडियोहरू',
			'gosocial': 'सामाजिक जानुहोस्',
			'searchbible': 'बाइबल खोज्नुहोस्',
			'filtersearchoptions': 'खोज विकल्पहरू फिल्टर गर्नुहोस्',
			'narrowdownsearch': 'अधिक सटीक परिणामहरूको लागि खोजलाई संकीर्ण गर्न तलको फिल्टर बटन प्रयोग गर्नुहोस्।',
			'searchbibleversion': 'बाइबल संस्करण खोज्नुहोस्',
			'searchbiblebook': 'बाइबल पुस्तक खोज्नुहोस्',
			'search': 'खोज्नुहोस्',
			'setBibleBook': 'बाइबल पुस्तक सेट गर्नुहोस्',
			'oldtestament': 'पुरानो करार',
			'newtestament': 'नयाँ करार',
			'limitresults': 'परिणामहरू सीमित गर्नुहोस्',
			'setfilters': 'फिल्टरहरू सेट गर्नुहोस्',
			'bibletranslator': 'बाइबल अनुवादक',
			'chapter': ' अध्याय ',
			'verse': ' पद ',
			'translate': 'अनुवाद गर्नुहोस्',
			'bibledownloadinfo': 'बाइबल डाउनलोड सुरु भयो, डाउनलोड पूरा नभएसम्म कृपया यो पृष्ठ बन्द नगर्नुहोस्।',
			'received': 'प्राप्त',
			'outoftotal': 'कुल',
			'set': 'सेट गर्नुहोस्',
			'selectColor': 'रंग चयन गर्नुहोस्',
			'switchbibleversion': 'बाइबल संस्करण बदल्नुहोस्',
			'switchbiblebook': 'बाइबल पुस्तक बदल्नुहोस्',
			'gotosearch': 'अध्यायमा जानुहोस्',
			'changefontsize': 'फन्ट आकार बदल्नुहोस्',
			'font': 'फन्ट',
			'readchapter': 'अध्याय पढ्नुहोस्',
			'showhighlightedverse': 'हाइलाइट गरिएको पद देखाउनुहोस्',
			'downloadmoreversions': 'अधिक संस्करणहरू डाउनलोड गर्नुहोस्',
			'suggestedusers': 'सुझाव गरिएका प्रयोगकर्ताहरू',
			'unfollow': 'अनफॉलो गर्नुहोस्',
			'follow': 'अनुसरण गर्नुहोस्',
			'searchforpeople': 'व्यक्तिहरू खोज्नुहोस्',
			'viewpost': 'पोस्ट हेर्नुहोस्',
			'viewprofile': 'प्रोफाइल हेर्नुहोस्',
			'mypins': 'मेरो पिनहरू',
			'viewpinnedposts': 'पिन गरिएको पोस्टहरू हेर्नुहोस्',
			'personal': 'व्यक्तिगत',
			'update': 'अद्यावधिक गर्नुहोस्',
			'phonenumber': 'फोन नम्बर',
			'showmyphonenumber': 'मेरो फोन नम्बर प्रयोगकर्ताहरूलाई देखाउनुहोस्',
			'dateofbirth': 'जन्म मिति',
			'showmyfulldateofbirth': 'मेरो स्थिति हेर्ने व्यक्तिहरूलाई मेरो पूरा जन्म मिति देखाउनुहोस्',
			'notifications': 'सूचनाहरू',
			'notifywhenuserfollowsme': 'प्रयोगकर्ताले मलाई अनुसरण गर्दा मलाई सूचित गर्नुहोस्',
			'notifymewhenusercommentsonmypost': 'प्रयोगकर्ताहरूले मेरो पोस्टमा टिप्पणी गर्दा मलाई सूचित गर्नुहोस्',
			'notifymewhenuserlikesmypost': 'प्रयोगकर्ताहरूले मेरो पोस्टलाई मन पराउँदा मलाई सूचित गर्नुहोस्',
			'churchsocial': 'चर्च सामाजिक',
			'shareyourthoughts': 'तपाईंका विचारहरू साझा गर्नुहोस्',
			'readmore': '...अधिक पढ्नुहोस्',
			'less': ' कम',
			'couldnotprocess': 'अनुरोधित कार्य प्रक्रिया गर्न सकिएन।',
			'pleaseselectprofilephoto': 'कृपया अपलोड गर्न प्रोफाइल फोटो चयन गर्नुहोस्',
			'pleaseselectprofilecover': 'कृपया अपलोड गर्न कभर फोटो चयन गर्नुहोस्',
			'updateprofileerrorhint': 'तपाईंले अगाडि बढ्न तपाईंको नाम, जन्म मिति, लिंग, फोन र स्थान भर्नु आवश्यक छ।',
			'gender': 'लिंग',
			'male': 'पुरुष',
			'female': 'महिला',
			'dob': 'जन्म मिति',
			'location': 'हालको स्थान',
			'qualification': 'योग्यता',
			'aboutme': 'मेरो बारेमा',
			'facebookprofilelink': 'फेसबुक प्रोफाइल लिङ्क',
			'twitterprofilelink': 'ट्विटर प्रोफाइल लिङ्क',
			'linkdln': 'लिंक्डइन प्रोफाइल लिङ्क',
			'likes': 'मन पराउनुहोस्',
			'likess': 'मन परे',
			'pinnedposts': 'मेरो पिन गरिएको पोस्टहरू',
			'unpinpost': 'पोस्ट अनपिन गर्नुहोस्',
			'unpinposthint': 'के तपाईं यो पोस्ट तपाईंको पिन गरिएको पोस्टबाट हटाउन चाहनुहुन्छ?',
			'postdetails': 'पोस्ट विवरण',
			'posts': 'पोस्टहरू',
			'followers': 'अनुयायीहरू',
			'followings': 'अनुसरण गर्दै',
			'my': 'मेरो',
			'edit': 'सम्पादन गर्नुहोस्',
			'delete': 'मेटाउनुहोस्',
			'deletepost': 'पोस्ट मेटाउनुहोस्',
			'deleteposthint': 'के तपाईं यो पोस्ट मेटाउन चाहनुहुन्छ? पोस्टहरू अझै केही प्रयोगकर्ताहरूको फीडमा देखिन सक्छन्।',
			'maximumallowedsizehint': 'अनुमत अपलोड फाइल आकार सीमा पुगेको',
			'maximumuploadsizehint': 'चयन गरिएको फाइल अनुमत अपलोड फाइल आकार सीमालाई नाघेको छ।',
			'makeposterror': 'हाल पोस्ट बनाउन सकिएन, कृपया पुन: प्रयास गर्न क्लिक गर्नुहोस्।',
			'makepost': 'पोस्ट गर्नुहोस्',
			'selectfile': 'फाइल चयन गर्नुहोस्',
			'images': 'तस्बिरहरू',
			'shareYourThoughtsNow': 'तपाईंका विचारहरू अहिले साझा गर्नुहोस्...',
			'photoviewer': 'फोटो दर्शक',
			'nochatsavailable': 'कुनै पनि कुराकानी उपलब्ध छैन \n तलको चिन्हमा क्लिक गर्नुहोस् \n प्रयोगकर्ताहरूलाई चयन गर्न',
			'typing': 'टाइप गर्दै...',
			'photo': 'फोटो',
			'online': 'अनलाइन',
			'offline': 'अफलाइन',
			'lastseen': 'अन्तिम देखिएको',
			'deleteselectedhint': 'यस कार्यले चयन गरिएको सन्देशहरू मेटाउँछ। कृपया ध्यान दिनुहोस् कि यसले केवल तपाईंको पक्षको कुराकानी मेटाउँछ,\n सन्देशहरू अझै तपाईंको साथीको उपकरणमा देखिन्छ।',
			'deleteselected': 'चयन गरिएको मेटाउनुहोस्',
			'unabletofetchconversation': 'तपाईंको कुराकानी प्राप्त गर्न सकेन \n',
			'loadmoreconversation': 'अधिक कुराकानी लोड गर्नुहोस्',
			'sendyourfirstmessage': 'तपाईंको पहिलो सन्देश पठाउनुहोस् \n',
			'unblock': 'अनब्लक गर्नुहोस् ',
			'block': 'ब्लक गर्नुहोस्',
			'writeyourmessage': 'तपाईंको सन्देश लेख्नुहोस्...',
			'clearconversation': 'कुराकानी सफा गर्नुहोस्',
			'clearconversationhintone': 'यस कार्यले तपाईंको सबै कुराकानी सफा गर्छ ',
			'clearconversationhinttwo': '.\n कृपया ध्यान दिनुहोस् कि यसले केवल तपाईंको पक्षको कुराकानी मेटाउँछ, सन्देशहरू अझै तपाईंको साथीको च्याटमा देखिन्छ।',
			'facebookloginerror': 'लॉगिन प्रक्रियामा केही गडबड भयो।\n यहाँ फेसबुकले हामीलाई दिएको त्रुटि छ',
			'selectLanguage': 'भाषा चयन गर्नुहोस्',
			'howTo': 'कसरी',
			'noBibleTextsAvailable': 'कुनै बाइबल पाठ उपलब्ध छैन',
			'languages': 'भाषाहरू',
			'searchLanguages': 'भाषाहरू खोज्नुहोस्...',
			'biblesFilesets': 'बाइबल: {bibles}, फाइलसेटहरू: {filesets}',
			'oldTestament': 'पुरानो करार',
			'newTestament': 'नयाँ करार',
			'play': 'बजाउनुहोस्',
			'no_verse_content': 'प्रदर्शन गर्न कुनै बाइबल पद्य सामग्री उपलब्ध छैन।',
			'no_audio_content': 'प्रदर्शन गर्न कुनै बाइबल अडियो सामग्री उपलब्ध छैन।',
		};
	}
}

extension on _StringsOr {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'ମୋଭର୍ଚୁଆଲପାଷ୍ଟର',
			'selectlanguage': 'ଭାଷା ବାଛନ୍ତୁ',
			'deletemyaccount': 'ମୋ ଖାତା ବାହାର କରନ୍ତୁ',
			'deleteaccount': 'ଖାତା ବାହାର କରନ୍ତୁ',
			'deleteaccounthint': 'ଏହି କାର୍ଯ୍ୟଟି ଆପଣଙ୍କର ଖାତା ବାହାର କରି ଆପଣଙ୍କର ସମସ୍ତ ତଥ୍ୟ ବାହାର କରିବ। ଯଦି ତଥ୍ୟ ବାହାର ହୋଇ ଯାଇଛି, ତାହା ପୁନଃପ୍ରାପ୍ତ ହେବା ନାହିଁ।',
			'deleteaccountsuccess': 'ଖାତା ବାହାର କରିବା ସଫଳ ହୋଇଛି',
			'chooseapplanguage': 'ଆପ୍ ପାଇଁ ଭାଷା ବାଛନ୍ତୁ',
			'nightmode': 'ରାତି ମୋଡ୍',
			'initializingapp': 'ଆରମ୍ଭ କରାଯାଉଛି...',
			'home': 'ମୂଳପୃଷ୍ଠା',
			'branches': 'ଶାଖାଗୁଡ଼ିକ',
			'inbox': 'ଇନବକ୍ସ',
			'downloads': 'ଡାଉନଲୋଡ୍ସ',
			'settings': 'ସେଟିଙ୍ଗ୍ସ',
			'events': 'ଇବେଣ୍ଟଗୁଡ଼ିକ',
			'myplaylists': 'ମୋର ପ୍ଲେଲିଷ୍ଟଗୁଡ଼ିକ',
			'website': 'ୱେବସାଇଟ୍',
			'hymns': 'ଭଜନଗୁଡ଼ିକ',
			'articles': 'ଲେଖାଗୁଡ଼ିକ',
			'notes': 'ଟିପ୍ପଣୀଗୁଡ଼ିକ',
			'donate': 'ଦାନ',
			'offering': 'ଅର୍ପଣ',
			'savenotetitle': 'ଟିପ୍ପଣୀ ଶୀର୍ଷକ',
			'nonotesfound': 'କୌଣସି ଟିପ୍ପଣୀ ମିଳିଲା ନାହିଁ',
			'newnote': 'ନୂଆ',
			'deletenote': 'ଟିପ୍ପଣୀ ବାହାର କରନ୍ତୁ',
			'deletenotehint': 'ଆପଣ ଏହି ଟିପ୍ପଣୀ ବାହାର କରିବାକୁ ଚାହୁଁଛନ୍ତି କି? ଏହି କାର୍ଯ୍ୟଟି ପୁନଃ ପାଇଁ କରାଯାଇପାରିବ ନାହିଁ।',
			'bookmarks': 'ବୁକମାର୍କଗୁଡ଼ିକ',
			'socialplatforms': 'ସାମାଜିକ ପ୍ଲାଟଫର୍ମଗୁଡ଼ିକ',
			'onboardingpagetitles.0': 'ମୋ ଚର୍ଚ୍ଚରେ ସ୍ୱାଗତ',
			'onboardingpagetitles.1': 'ସୁବିଧାଗୁଡ଼ିକ ସହିତ ପୂର୍ଣ୍ଣ',
			'onboardingpagetitles.2': 'ଅଡିଓ, ଭିଡିଓ \n ଏବଂ ଲାଇଭ୍ ସ୍ଟ୍ରିମିଂ',
			'onboardingpagetitles.3': 'ଖାତା ସୃଷ୍ଟି କରନ୍ତୁ',
			'onboardingpagehints.0': 'ସୁନ୍ଦର ସକାଳ ବା ଆପଣଙ୍କର ଚର୍ଚ୍ଚର ଚାରିଟିଏ ପରିସର। ଏକ ମୋବାଇଲ୍ କେନ୍ଦ୍ରିକ ଲୋକ ସହିତ ଆପଣଙ୍କୁ ଯୋଡ଼ିବାକୁ ଯାହା କାହିଁକି ଆପଣକୁ ଆବଶ୍ୟକ।',
			'onboardingpagehints.1': 'ଆମେ ଆପଣଙ୍କର ଚର୍ଚ୍ଚ ଆପ୍ ପାଇଁ ଆବଶ୍ୟକ ତଥ୍ୟଗୁଡ଼ିକ ଆଣିଛୁ। ଇବେଣ୍ଟଗୁଡ଼ିକ, ଭକ୍ତିଗୀତ, ନୋଟିଫିକେସନ୍ସ, ଟିପ୍ପଣୀଗୁଡ଼ିକ ଏବଂ ବହୁ-ସଂସ୍କରଣ ବାଇବଲ୍।',
			'onboardingpagehints.2': 'ବିଶ୍ୱରେ ଭିନ୍ନ-ଭିନ୍ନ ସ୍ଥାନରୁ ବିଭିନ୍ନ ଭିଡିଓ ଦେଖିବାକୁ, ଅଡିଓ ସନ୍ଦେଶଗୁଡ଼ିକ ଶୁଣିବାକୁ ଏବଂ ଆପଣଙ୍କ ଚର୍ଚ୍ଚ ସେବାଗୁଡ଼ିକର ଲାଇଭ୍ ସ୍ଟ୍ରିମ୍ ମାନେ ଦେଖିବାକୁ ଅନୁମତି ଦିଅନ୍ତୁ।',
			'onboardingpagehints.3': 'କେବଳ ଏକ ସମ୍ପର୍କ ଉପବାସ ଅନୁଭୂତିକୁ ଆପଣଙ୍କ ଯାତ୍ରା ଆରମ୍ଭ କରନ୍ତୁ।',
			'next': 'ପରେ',
			'done': 'ଆରମ୍ଭ କରନ୍ତୁ',
			'quitapp': 'ଆପ୍ ବନ୍ଦ କରନ୍ତୁ!',
			'quitappwarning': 'ଆପଣ ଆପ୍ ବନ୍ଦ କରିବାକୁ ଚାହୁଁଛନ୍ତି କି?',
			'quitappaudiowarning': 'ଆପଣ ବର୍ତ୍ତମାନ ଏକ ଅଡିଓ ପ୍ଲେ କରୁଛନ୍ତି, ଆପ୍ ବନ୍ଦ କଲେ ଅଡିଓ ପ୍ଲେବାକ୍ ଥମ୍ବିବ। ଯଦି ଆପଣ ପ୍ଲେବାକ୍ ବନ୍ଦ କରିବାକୁ ଚାହୁଁନାହିଁ, କେବଳ ମଧ୍ୟ ବଟନ୍ ସହିତ ଆପ୍କୁ ମିନିମାଇଜ୍ କରନ୍ତୁ କିମ୍ବା ଠିକ ମଧ୍ୟ କରି ଆପ୍କୁ ବନ୍ଦ କରନ୍ତୁ।',
			'ok': 'ଠିକ',
			'retry': 'ପୁନଃପ୍ରୟାସ କରନ୍ତୁ',
			'oops': 'ଆହ!',
			'save': 'ସଂରକ୍ଷଣ କରନ୍ତୁ',
			'cancel': 'ବାତିଲ୍ କରନ୍ତୁ',
			'error': 'ତ୍ରୁଟି',
			'success': 'ସଫଳତା',
			'skip': 'ଛାଡ଼ନ୍ତୁ',
			'skiplogin': 'ଲଗଇନ୍ ଛାଡ଼ନ୍ତୁ',
			'skipregister': 'ପଞ୍ଜୀକରଣ ଛାଡ଼ନ୍ତୁ',
			'dataloaderror': 'ବର୍ତ୍ତମାନ ଅନୁରୋଧ କରାଯାଇଥିବା ତଥ୍ୟ ଲୋଡ୍ କରିପାରିବା ନାହିଁ, ଆପଣଙ୍କର ତଥ୍ୟ ସଂଯୋଗ ଯାଞ୍ଚ କରନ୍ତୁ ଏବଂ ପୁନଃ ପ୍ରୟାସ କରିବାକୁ କ୍ଲିକ୍ କରନ୍ତୁ।',
			'suggestedforyou': 'ଆପଣଙ୍କ ପାଇଁ ସୁପାରିସ୍ କରାଯାଇଛି',
			'videomessages': 'ଭିଡିଓ ସନ୍ଦେଶଗୁଡ଼ିକ',
			'audiomessages': 'ଅଡିଓ ସନ୍ଦେଶଗୁଡ଼ିକ',
			'devotionals': 'ଭକ୍ତିଗୀତଗୁଡ଼ିକ',
			'categories': 'ଶ୍ରେଣୀଗୁଡ଼ିକ',
			'category': 'ଶ୍ରେଣୀ',
			'videos': 'ଭିଡିଓଗୁଡ଼ିକ',
			'audios': 'ଅଡିଓଗୁଡ଼ିକ',
			'biblebooks': 'ବାଇବଲ୍',
			'sermons': 'ପ୍ରବଚନଗୁଡ଼ିକ',
			'tools': 'ଉପକରଣଗୁଡ଼ିକ',
			'profile': 'ପ୍ରୋଫାଇଲ୍',
			'audiobible': 'ଅଡିଓ ବାଇବଲ୍',
			'homesentence': 'ଆପଣଙ୍କୁ ଭଗବାନଙ୍କର ଆହ୍ୱାନ କରାଯାଇଥିବା ଲୋକ ପର୍ଯ୍ୟନ୍ତ ବୃଦ୍ଧି ପାଇଁ ସାହାଯ୍ୟ କରିବା ପାଇଁ 1 ବର୍ଷ ପାଇଁ ଆପଣଙ୍କର ପାଷ୍ଟର।',
			'livestreams': 'ଲାଇଭ୍ ସ୍ଟ୍ରିମ୍ଗୁଡ଼ିକ',
			'radio': 'ରେଡିଓ',
			'allitems': 'ସମସ୍ତ ବସ୍ତୁଗୁଡ଼ିକ',
			'emptyplaylist': 'କୌଣସି ପ୍ଲେଲିଷ୍ଟ ନାହିଁ',
			'notsupported': 'ସମର୍ଥନ କରିନଥିଲେ',
			'cleanupresources': 'ସାଧନଗୁଡ଼ିକ ସଫା କରାଯାଉଛି',
			'grantstoragepermission': 'ଦୟାକରି ଅଗ୍ରଗତି କରିବା ପାଇଁ ଷ୍ଟୋରେଜ୍ ପରିସ୍ରମନ୍ ଦିଅନ୍ତୁ',
			'sharefiletitle': 'ପହଁଚନ୍ତୁ କିମ୍ବା ଶୁଣନ୍ତୁ ',
			'sharefilebody': 'ମୋଭର୍ଚୁଆଲପାଷ୍ଟର ଆପ୍ ମାଧ୍ୟମରେ, ବର୍ତ୍ତମାନ ଡାଉନଲୋଡ୍ କରନ୍ତୁ ',
			'sharetext': 'ଅସୀମିତ ଅଡିଓ ଏବଂ ଭିଡିଓ ସ୍ଟ୍ରିମିଂର ଆନନ୍ଦ ନିଅନ୍ତୁ',
			'sharetexthint': 'ଆପଣଙ୍କୁ ବିଶ୍ୱରୁ ଆଣିଥିବା ଲାଖୋ ଫାଇଲ ଦେଖିବାକୁ ଏବଂ ଶୁଣିବାକୁ ଦେଇଥିବା ଭିଡିଓ ଏବଂ ଅଡିଓ ସ୍ଟ୍ରିମିଂ ପ୍ଲାଟଫର୍ମକୁ ଯୋଗ ଦିଅନ୍ତୁ। ବର୍ତ୍ତମାନ ଡାଉନଲୋଡ୍ କରନ୍ତୁ ',
			'download': 'ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
			'addplaylist': 'ପ୍ଲେଲିଷ୍ଟରେ ଯୋଡନ୍ତୁ',
			'bookmark': 'ବୁକମାର୍କ୍',
			'unbookmark': 'ବୁକମାର୍କ୍ ବାହାର କରନ୍ତୁ',
			'share': 'ସେୟାର କରନ୍ତୁ',
			'deletemedia': 'ଫାଇଲ ବାହାର କରନ୍ତୁ',
			'deletemediahint': 'ଆପଣ ଏହି ଡାଉନଲୋଡ୍ ହୋଇଥିବା ଫାଇଲ ବାହାର କରିବାକୁ ଚାହୁଁଛନ୍ତି କି? ଏହି କାର୍ଯ୍ୟଟି ପୁନଃ କରାଯାଇପାରିବ ନାହିଁ।',
			'searchhint': 'ଅଡିଓ ଏବଂ ଭିଡିଓ ସନ୍ଦେଶଗୁଡ଼ିକୁ ଖୋଜନ୍ତୁ',
			'performingsearch': 'ଅଡିଓ ଏବଂ ଭିଡିଓ ଖୋଜୁଛି',
			'nosearchresult': 'କୌଣସି ଫଳ ମିଳିଲା ନାହିଁ',
			'nosearchresulthint': 'ଅଧିକ ସାଧାରଣ କିୱାର୍ଡ ପ୍ରବେଶ କରିବାକୁ ଚେଷ୍ଟା କରନ୍ତୁ',
			'addtoplaylist': 'ପ୍ଲେଲିଷ୍ଟରେ ଯୋଡନ୍ତୁ',
			'newplaylist': 'ନୂଆ ପ୍ଲେଲିଷ୍ଟ',
			'playlistitm': 'ପ୍ଲେଲିଷ୍ଟ',
			'mediaaddedtoplaylist': 'ମିଡିଆ ପ୍ଲେଲିଷ୍ଟରେ ଯୋଡାଯାଇଛି।',
			'mediaremovedfromplaylist': 'ମିଡିଆ ପ୍ଲେଲିଷ୍ଟରୁ ବାହାର ହୋଇଛି',
			'clearplaylistmedias': 'ସମସ୍ତ ମିଡିଆ ସଫା କରନ୍ତୁ',
			'deletePlayList': 'ପ୍ଲେଲିଷ୍ଟ ବାହାର କରନ୍ତୁ',
			'clearplaylistmediashint': 'ଆପଣ ଏହି ପ୍ଲେଲିଷ୍ଟରୁ ସମସ୍ତ ମିଡିଆ ବାହାର କରିବାକୁ ଚାହୁଁଛନ୍ତି?',
			'deletePlayListhint': 'ଆପଣ ଏହି ପ୍ଲେଲିଷ୍ଟ ବାହାର କରିବାକୁ ଏବଂ ସମସ୍ତ ମିଡିଆ ସଫା କରିବାକୁ ଚାହୁଁଛନ୍ତି?',
			'comments': 'ଟିପ୍ପଣୀଗୁଡ଼ିକ',
			'replies': 'ପ୍ରତିଉତ୍ତରଗୁଡ଼ିକ',
			'reply': 'ପ୍ରତିଉତ୍ତର',
			'logintoaddcomment': 'ଟିପ୍ପଣୀ ଯୋଡିବାକୁ ଲଗଇନ୍ କରନ୍ତୁ',
			'logintoreply': 'ପ୍ରତିଉତ୍ତର ପାଇଁ ଲଗଇନ୍ କରନ୍ତୁ',
			'writeamessage': 'ଏକ ସନ୍ଦେଶ ଲେଖନ୍ତୁ...',
			'nocomments': 'କୌଣସି ଟିପ୍ପଣୀ ମିଳିଲା ନାହିଁ \nପୁନଃ ପ୍ରୟାସ କରିବାକୁ କ୍ଲିକ୍ କରନ୍ତୁ',
			'errormakingcomments': 'ଏବେ ବର୍ତ୍ତମାନ ଟିପ୍ପଣୀ କରିପାରିବା ନାହିଁ..',
			'errordeletingcomments': 'ଏବେ ବର୍ତ୍ତମାନ ଏହି ଟିପ୍ପଣୀ ବାହାର କରିପାରିବା ନାହିଁ..',
			'erroreditingcomments': 'ଏବେ ବର୍ତ୍ତମାନ ଏହି ଟିପ୍ପଣୀ ସମ୍ପାଦନ କରିପାରିବା ନାହିଁ..',
			'errorloadingmorecomments': 'ଏବେ ବର୍ତ୍ତମାନ ଅଧିକ ଟିପ୍ପଣୀ ଲୋଡ୍ କରିପାରିବା ନାହିଁ..',
			'deletingcomment': 'ଟିପ୍ପଣୀ ବାହାର କରାଯାଉଛି',
			'editingcomment': 'ଟିପ୍ପଣୀ ସମ୍ପାଦନ କରାଯାଉଛି',
			'deletecommentalert': 'ଟିପ୍ପଣୀ ବାହାର କରନ୍ତୁ',
			'editcommentalert': 'ଟିପ୍ପଣୀ ସମ୍ପାଦନ କରନ୍ତୁ',
			'deletecommentalerttext': 'ଆପଣ ଏହି ଟିପ୍ପଣୀ ବାହାର କରିବାକୁ ଚାହୁଁଛନ୍ତି କି? ଏହି କାର୍ଯ୍ୟଟି ପୁନଃ କରାଯାଇପାରିବ ନାହିଁ',
			'loadmore': 'ଅଧିକ ଲୋଡ୍ କରନ୍ତୁ',
			'messages': 'ସନ୍ଦେଶଗୁଡ଼ିକ',
			'guestuser': 'ଅତିଥି ବ୍ୟବହାରକାରୀ',
			'fullname': 'ପୂରା ନାମ',
			'emailaddress': 'ଇମେଲ୍ ପତା',
			'password': 'ପାସୱାର୍ଡ୍',
			'repeatpassword': 'ପାସୱାର୍ଡ୍ ପୁନଃ ପ୍ରବେଶ କରନ୍ତୁ',
			'register': 'ପଞ୍ଜୀକରଣ କରନ୍ତୁ',
			'login': 'ଲଗଇନ୍ କରନ୍ତୁ',
			'logout': 'ଲଗାଉଟ୍ କରନ୍ତୁ',
			'logoutfromapp': 'ଆପ୍ରୁ ଲଗାଉଟ୍ କରିବାକୁ?',
			'logoutfromapphint': 'ଆପଣ ଲଗଇନ୍ ନଥିଲେ ଆପଣଙ୍କୁ ଲେଖାଗୁଡ଼ିକ ଏବଂ ଭିଡିଓଗୁଡ଼ିକରେ ଟିପ୍ପଣୀ କରିବାକୁ କିମ୍ବା ପସନ୍ଦ କରିବାକୁ ସମର୍ଥ ହେବା ନାହିଁ।',
			'gotologin': 'ଲଗଇନ୍କୁ ଯାନ୍ତୁ',
			'resetpassword': 'ପାସୱାର୍ଡ୍ ପୁନଃ ସେଟ୍ କରନ୍ତୁ',
			'logintoaccount': 'ପୂର୍ବରୁ ଖାତା ଅଛି? ଲଗଇନ୍ କରନ୍ତୁ',
			'emptyfielderrorhint': 'ଆପଣ ସମସ୍ତ କ୍ଷେତ୍ରଗୁଡ଼ିକୁ ପୂରଣ କରିବା ଆବଶ୍ୟକ',
			'invalidemailerrorhint': 'ଆପଣ ଏକ ବୈଧ ଇମେଲ୍ ପତା ପ୍ରବେଶ କରିବାକୁ ଆବଶ୍ୟକ',
			'passwordsdontmatch': 'ପାସୱାର୍ଡଗୁଡ଼ିକ ମେଳ ଖାଉନାହିଁ',
			'processingpleasewait': 'ପ୍ରସେସ୍ କରାଯାଉଛି, ଦୟାକରି ପ୍ରତିକ୍ଷା କରନ୍ତୁ...',
			'createaccount': 'ଏକ ଖାତା ସୃଷ୍ଟି କରନ୍ତୁ',
			'forgotpassword': 'ପାସୱାର୍ଡ୍ ବିସରିଯାଇଛନ୍ତି?',
			'orloginwith': 'କିମ୍ବା ଲଗଇନ୍ କରନ୍ତୁ',
			'facebook': 'ଫେସବୁକ୍',
			'google': 'ଗୁଗୁଲ୍',
			'moreoptions': 'ଅଧିକ ବିକଳ୍ପଗୁଡ଼ିକ',
			'about': 'ଆମ୍ଭାନଙ୍କ ବିଷୟରେ',
			'privacy': 'ଗୋପନୀୟତା ନୀତି',
			'terms': 'ଆପ୍ ନିୟମଗୁଡ଼ିକ',
			'rate': 'ଆପ୍ରେ ରେଟ୍ କରନ୍ତୁ',
			'version': 'ସଂସ୍କରଣ',
			'pulluploadmore': 'ଲୋଡ୍ କରିବାକୁ ଟାଣନ୍ତୁ',
			'loadfailedretry': 'ଲୋଡ୍ ବିଫଳ ହେଲା! ପୁନଃ ପ୍ରୟାସ କରିବାକୁ କ୍ଲିକ୍ କରନ୍ତୁ!',
			'releaseloadmore': 'ଅଧିକ ଲୋଡ୍ କରିବାକୁ ଛାଡ଼ନ୍ତୁ',
			'nomoredata': 'ଆଉ ତଥ୍ୟ ନାହିଁ',
			'errorReportingComment': 'ଟିପ୍ପଣୀ ରିପୋର୍ଟ୍ ତ୍ରୁଟି',
			'reportingComment': 'ଟିପ୍ପଣୀ ରିପୋର୍ଟ୍ କରାଯାଉଛି',
			'reportcomment': 'ରିପୋର୍ଟ୍ ବିକଳ୍ପଗୁଡ଼ିକ',
			'reportCommentsList.0': 'ଅନବାଞ୍ଛିତ ବ୍ୟାବସାୟିକ ବିଷୟବସ୍ତୁ କିମ୍ବା ସ୍ପାମ୍',
			'reportCommentsList.1': 'ଅଶ୍ଳୀଳ କିମ୍ବା ଲିଙ୍ଗୀୟ ସ୍ପଷ୍ଟ ବିଷୟବସ୍ତୁ',
			'reportCommentsList.2': 'ଘୃଣାଭାଷଣ କିମ୍ବା ଗ୍ରାଫିକ୍ ହିଂସା',
			'reportCommentsList.3': 'ଅତ୍ୟାଚାର କିମ୍ବା ଧମକ',
			'bookmarksMedia': 'ମୋର ବୁକମାର୍କଗୁଡ଼ିକ',
			'noitemstodisplay': 'ଦେଖାଇବାକୁ କୌଣସି ବସ୍ତୁ ନାହିଁ',
			'loginrequired': 'ଲଗଇନ୍ ଆବଶ୍ୟକ',
			'loginrequiredhint': 'ଏହି ପ୍ଲାଟଫର୍ମରେ ସଦସ୍ୟତା ପାଇଁ, ଆପଣଙ୍କୁ ଲଗଇନ୍ କରିବାକୁ ଆବଶ୍ୟକ। ଏକ ମାଗଣା ଖାତା ବର୍ତ୍ତମାନ ସୃଷ୍ଟି କରନ୍ତୁ କିମ୍ବା ଆପଣଙ୍କର ମୂଲ ଖାତାରେ ଲଗଇନ୍ କରନ୍ତୁ।',
			'subscriptions': 'ଆପ୍ ସଦସ୍ୟତା',
			'subscribe': 'ସଦସ୍ୟତା',
			'subscribehint': 'ସଦସ୍ୟତା ଆବଶ୍ୟକ',
			'playsubscriptionrequiredhint': 'ଏହି ମିଡିଆ ଶୁଣିବା କିମ୍ବା ଦେଖିବା ପାଇଁ ଆପଣଙ୍କୁ ସଦସ୍ୟତା ଦେବାକୁ ଆବଶ୍ୟକ।',
			'previewsubscriptionrequiredhint': 'ଏହି ମିଡିଆ ପାଇଁ ଆପଣ ଅନୁମୋଦିତ ପ୍ରାରମ୍ଭିକ ଅବଧି ସ୍ୱାଧୀନତା ହାସଲ କରିଛନ୍ତି। ଶୁଣିବା କିମ୍ବା ଦେଖିବା ପାଇଁ ଆପଣଙ୍କୁ ସଦସ୍ୟତା ଆବଶ୍ୟକ।',
			'copiedtoclipboard': 'କ୍ଲିପବୋର୍ଡ୍ରେ ଅନୁକୃତି କରାଯାଇଛି',
			'downloadbible': 'ବାଇବଲ୍ ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
			'downloadversion': 'ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
			'downloading': 'ଡାଉନଲୋଡ୍ କରାଯାଉଛି',
			'failedtodownload': 'ଡାଉନଲୋଡ୍ ବିଫଳ ହୋଇଛି',
			'pleaseclicktoretry': 'ଦୟାକରି ପୁନଃ ପ୍ରୟାସ କରିବାକୁ କ୍ଲିକ୍ କରନ୍ତୁ।',
			'of': 'ର',
			'nobibleversionshint': 'ଦେଖାଇବାକୁ କୌଣସି ବାଇବଲ୍ ତଥ୍ୟ ନାହିଁ, ଅନ୍ୟତମ ଏକ ବାଇବଲ୍ ସଂସ୍କରଣ ଡାଉନଲୋଡ୍ କରିବା ପାଇଁ ତଳେ ବଟନ୍ କ୍ଲିକ୍ କରନ୍ତୁ।',
			'downloaded': 'ଡାଉନଲୋଡ୍ ହୋଇଛି',
			'enteremailaddresstoresetpassword': 'ଆପଣଙ୍କର ପାସୱାର୍ଡ୍ ପୁନଃ ସେଟ୍ କରିବା ପାଇଁ ଆପଣଙ୍କର ଇମେଲ୍ ପତା ପ୍ରବେଶ କରନ୍ତୁ',
			'backtologin': 'ଲଗଇନ୍କୁ ଫେରନ୍ତୁ',
			'signintocontinue': 'ଅଗ୍ରଗତି କରିବା ପାଇଁ ସାଇନ୍ ଇନ୍ କରନ୍ତୁ',
			'signin': 'ସାଇନ୍ ଇନ୍ କରନ୍ତୁ',
			'signinforanaccount': 'ଏକ ଖାତା ପାଇଁ ସାଇନ୍ ଅପ୍ କରନ୍ତୁ?',
			'alreadyhaveanaccount': 'ପୂର୍ବରୁ ଏକ ଖାତା ଅଛି?',
			'updateprofile': 'ପ୍ରୋଫାଇଲ୍ ଅଦ୍ୟତନ କରନ୍ତୁ',
			'updateprofilehint': 'ଆରମ୍ଭ କରିବାକୁ, ଦୟାକରି ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ପୃଷ୍ଠା ଅଦ୍ୟତନ କରନ୍ତୁ, ଏହା ଆମକୁ ଅନ୍ୟ ଲୋକମାନଙ୍କ ସହିତ ଯୋଡିବାକୁ ସାହାଯ୍ୟ କରିବ',
			'autoplayvideos': 'ଅଟୋପ୍ଲେ ଭିଡିଓଗୁଡ଼ିକ',
			'gosocial': 'ସୋସିଆଲକୁ ଯାନ୍ତୁ',
			'searchbible': 'ବାଇବଲ୍ ଖୋଜନ୍ତୁ',
			'filtersearchoptions': 'ଖୋଜ ବିକଳ୍ପଗୁଡ଼ିକୁ ଫିଲ୍ଟର କରନ୍ତୁ',
			'narrowdownsearch': 'ଅଧିକ ସଠିକ୍ ପରିଣାମ ପାଇଁ ତଳର ଫିଲ୍ଟର ବଟନ୍ ବ୍ୟବହାର କରି ଖୋଜ ସଂକୀର୍ଣ୍ଣ କରନ୍ତୁ।',
			'searchbibleversion': 'ବାଇବଲ୍ ସଂସ୍କରଣ ଖୋଜନ୍ତୁ',
			'searchbiblebook': 'ବାଇବଲ୍ ପୁସ୍ତକ ଖୋଜନ୍ତୁ',
			'search': 'ଖୋଜନ୍ତୁ',
			'setBibleBook': 'ବାଇବଲ୍ ପୁସ୍ତକ ସେଟ୍ କରନ୍ତୁ',
			'oldtestament': 'ପୁରାତନ ତତ୍ତ୍ଵ',
			'newtestament': 'ନୂତନ ତତ୍ତ୍ଵ',
			'limitresults': 'ପରିଣାମଗୁଡ଼ିକୁ ସୀମାବଦ୍ଧ କରନ୍ତୁ',
			'setfilters': 'ଫିଲ୍ଟରଗୁଡ଼ିକୁ ସେଟ୍ କରନ୍ତୁ',
			'bibletranslator': 'ବାଇବଲ୍ ଅନୁବାଦକ',
			'chapter': ' ଅଧ୍ୟାୟ ',
			'verse': ' ପଦ ',
			'translate': 'ଅନୁବାଦ କରନ୍ତୁ',
			'bibledownloadinfo': 'ବାଇବଲ୍ ଡାଉନଲୋଡ୍ ଆରମ୍ଭ ହୋଇଛି, ଡାଉନଲୋଡ୍ ସମାପ୍ତ ହେବା ପର୍ଯ୍ୟନ୍ତ ଦୟାକରି ଏହି ପୃଷ୍ଠାକୁ ବନ୍ଦ କରନ୍ତୁ ନାହିଁ।',
			'received': 'ଗ୍ରହଣ କରାଗଲା',
			'outoftotal': 'ମୋଟରୁ',
			'set': 'ସେଟ୍ କରନ୍ତୁ',
			'selectColor': 'ରଙ୍ଗ ବାଛନ୍ତୁ',
			'switchbibleversion': 'ବାଇବଲ୍ ସଂସ୍କରଣ ବଦଳାନ୍ତୁ',
			'switchbiblebook': 'ବାଇବଲ୍ ପୁସ୍ତକ ବଦଳାନ୍ତୁ',
			'gotosearch': 'ଅଧ୍ୟାୟକୁ ଯାନ୍ତୁ',
			'changefontsize': 'ଫନ୍ଟ୍ ଆକାର ବଦଳାନ୍ତୁ',
			'font': 'ଫନ୍ଟ୍',
			'readchapter': 'ଅଧ୍ୟାୟ ପଢନ୍ତୁ',
			'showhighlightedverse': 'ହାଇଲାଇଟ୍ କରାଯାଇଥିବା ପଦ ଦେଖନ୍ତୁ',
			'downloadmoreversions': 'ଅଧିକ ସଂସ୍କରଣଗୁଡ଼ିକୁ ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
			'suggestedusers': 'ସୁପାରିସ୍ କରାଯାଇଥିବା ବ୍ୟବହାରକାରୀମାନେ',
			'unfollow': 'ଅନଫଲୋ କରନ୍ତୁ',
			'follow': 'ଫଲୋ କରନ୍ତୁ',
			'searchforpeople': 'ଲୋକମାନଙ୍କୁ ଖୋଜନ୍ତୁ',
			'viewpost': 'ପୋଷ୍ଟ ଦେଖନ୍ତୁ',
			'viewprofile': 'ପ୍ରୋଫାଇଲ୍ ଦେଖନ୍ତୁ',
			'mypins': 'ମୋ ପିନ୍ସ୍',
			'viewpinnedposts': 'ପିନ୍ କରାଯାଇଥିବା ପୋଷ୍ଟଗୁଡ଼ିକୁ ଦେଖନ୍ତୁ',
			'personal': 'ବ୍ୟକ୍ତିଗତ',
			'update': 'ଅଦ୍ୟତନ କରନ୍ତୁ',
			'phonenumber': 'ଫୋନ୍ ନମ୍ବର',
			'showmyphonenumber': 'ମୋର ଫୋନ୍ ନମ୍ବରକୁ ବ୍ୟବହାରକାରୀମାନଙ୍କୁ ଦେଖନ୍ତୁ',
			'dateofbirth': 'ଜନ୍ମ ତାରିଖ',
			'showmyfulldateofbirth': 'ମୋର ଅବସ୍ଥାକୁ ଦେଖୁଥିବା ଲୋକମାନଙ୍କୁ ମୋର ପୂରା ଜନ୍ମ ତାରିଖ ଦେଖନ୍ତୁ',
			'notifications': 'ସୂଚନାଗୁଡ଼ିକ',
			'notifywhenuserfollowsme': 'ଯେତେବେଳେ ଏକ ବ୍ୟବହାରକାରୀ ମୋତେ ଫଲୋ କରିଥାଏ ତାହା ଆମକୁ ସୂଚିତ କରନ୍ତୁ',
			'notifymewhenusercommentsonmypost': 'ଯେତେବେଳେ ବ୍ୟବହାରକାରୀମାନେ ମୋର ପୋଷ୍ଟରେ ଟିପ୍ପଣୀ କରନ୍ତି ମୋତେ ସୂଚିତ କରନ୍ତୁ',
			'notifymewhenuserlikesmypost': 'ଯେତେବେଳେ ବ୍ୟବହାରକାରୀମାନେ ମୋର ପୋଷ୍ଟକୁ ପସନ୍ଦ କରନ୍ତି ମୋତେ ସୂଚିତ କରନ୍ତୁ',
			'churchsocial': 'ଚର୍ଚ୍ଚ ସାମାଜିକ',
			'shareyourthoughts': 'ଆପଣଙ୍କର ଭାବନାଗୁଡ଼ିକୁ ସେୟାର କରନ୍ତୁ',
			'readmore': '...ଅଧିକ ପଢନ୍ତୁ',
			'less': ' କମ୍',
			'couldnotprocess': 'ଅନୁରୋଧ କରାଯାଇଥିବା କାର୍ଯ୍ୟ ପ୍ରକ୍ରିୟାକୁ କରିପାରିବା ନାହିଁ।',
			'pleaseselectprofilephoto': 'ଦୟାକରି ଅପଲୋଡ୍ କରିବା ପାଇଁ ଏକ ପ୍ରୋଫାଇଲ୍ ଫଟୋ ବାଛନ୍ତୁ',
			'pleaseselectprofilecover': 'ଦୟାକରି ଅପଲୋଡ୍ କରିବା ପାଇଁ ଏକ କଭର୍ ଫଟୋ ବାଛନ୍ତୁ',
			'updateprofileerrorhint': 'ଆଗେକୁ ବଢିବା ପୂର୍ବରୁ ଆପଣଙ୍କର ନାମ, ଜନ୍ମତାରିଖ, ଲିଙ୍ଗ, ଫୋନ୍ ଏବଂ ସ୍ଥାନ ପୂରଣ କରିବା ଆବଶ୍ୟକ।',
			'gender': 'ଲିଙ୍ଗ',
			'male': 'ପୁରୁଷ',
			'female': 'ମହିଳା',
			'dob': 'ଜନ୍ମ ତାରିଖ',
			'location': 'ଚାଲୁ ଅବସ୍ଥାନ',
			'qualification': 'ଯୋଗ୍ୟତା',
			'aboutme': 'ମୋ ବିଷୟରେ',
			'facebookprofilelink': 'ଫେସବୁକ୍ ପ୍ରୋଫାଇଲ୍ ଲିଙ୍କ୍',
			'twitterprofilelink': 'ଟ୍ୱିଟର୍ ପ୍ରୋଫାଇଲ୍ ଲିଙ୍କ୍',
			'linkdln': 'ଲିଙ୍କ୍ଡ୍ଇନ୍ ପ୍ରୋଫାଇଲ୍ ଲିଙ୍କ୍',
			'likes': 'ଭଲପାଉଛି',
			'likess': 'ପସନ୍ଦ',
			'pinnedposts': 'ମୋର ପିନ୍ ହୋଇଥିବା ପୋଷ୍ଟଗୁଡ଼ିକ',
			'unpinpost': 'ପୋଷ୍ଟ ପିନ୍ କରନ୍ତୁ',
			'unpinposthint': 'ଆପଣ ଏହି ପୋଷ୍ଟକୁ ଆପଣଙ୍କର ପିନ୍ ହୋଇଥିବା ପୋଷ୍ଟରୁ ବାହାର କରିବାକୁ ଚାହୁଁଛନ୍ତି?',
			'postdetails': 'ପୋଷ୍ଟ ତଥ୍ୟ',
			'posts': 'ପୋଷ୍ଟଗୁଡ଼ିକ',
			'followers': 'ଅନୁସରଣକାରୀମାନେ',
			'followings': 'ଅନୁସରଣ କରୁଛି',
			'my': 'ମୋର',
			'edit': 'ସମ୍ପାଦନ କରନ୍ତୁ',
			'delete': 'ବାହାର କରନ୍ତୁ',
			'deletepost': 'ପୋଷ୍ଟ ବାହାର କରନ୍ତୁ',
			'deleteposthint': 'ଆପଣ ଏହି ପୋଷ୍ଟ ବାହାର କରିବାକୁ ଚାହୁଁଛନ୍ତି? ଏହି ପୋଷ୍ଟ ଅଜାଣା ବ୍ୟବହାରକାରୀମାନଙ୍କ ପ୍ରତିକ୍ରିୟାରେ ଦେଖାଯାଇପାରିବ।',
			'maximumallowedsizehint': 'ଅନୁମତି କରାଯାଇଥିବା ଅପଲୋଡ୍ ଫାଇଲ୍ ଆକାର ସୀମାକୁ ପହଞ୍ଚିଯାଇଛି',
			'maximumuploadsizehint': 'ଅନୁମତି କରାଯାଇଥିବା ଅପଲୋଡ୍ ଫାଇଲ୍ ଆକାର ସୀମାକୁ ପର୍ଯ୍ୟାନ୍ତ ଚୟନ କରାଯାଇଥିବା ଫାଇଲ୍ ଅଧିକ ଆଛି।',
			'makeposterror': 'ବର୍ତ୍ତମାନ ଏହି ପୋଷ୍ଟ ବନ୍ଦ କରାଯାଇପାରିବ ନାହିଁ, ଦୟାକରି ପୁନଃପ୍ରୟାସ କରିବାକୁ କ୍ଲିକ୍ କରନ୍ତୁ।',
			'makepost': 'ପୋଷ୍ଟ କରନ୍ତୁ',
			'selectfile': 'ଫାଇଲ୍ ବାଛନ୍ତୁ',
			'images': 'ଚିତ୍ରଗୁଡ଼ିକ',
			'shareYourThoughtsNow': 'ଆପଣଙ୍କର ଭାବନାଗୁଡ଼ିକ ସେୟାର କରନ୍ତୁ...',
			'photoviewer': 'ଫଟୋ ଦର୍ଶକ',
			'nochatsavailable': 'କୌଣସି କଥାବାର୍ତ୍ତା ଉପଲବ୍ଧ ନାହିଁ \n ତଳକୁ ଲୋଡ୍ ଅଇକନ୍ କ୍ଲିକ୍ କରନ୍ତୁ \n ଦର୍ଶକମାନଙ୍କୁ ବାଛନ୍ତୁ',
			'typing': 'ଟାଇପ୍ କରାଯାଉଛି...',
			'photo': 'ଫଟୋ',
			'online': 'ଅନଲାଇନ୍',
			'offline': 'ଅଫଲାଇନ୍',
			'lastseen': 'ଶେଷ ଦେଖାଯାଇଥିଲା',
			'deleteselectedhint': 'ଏହି କାର୍ଯ୍ୟଟି ଚୟନ କରାଯାଇଥିବା ସନ୍ଦେଶଗୁଡ଼ିକୁ ବାହାର କରିବ। ଦୟାକରି ଧ୍ୟାନ ଦିଅନ୍ତୁ ଏହା କେବଳ ଆପଣଙ୍କର ପର୍ଯ୍ୟନ୍ତ ସନ୍ଦେଶଗୁଡ଼ିକୁ ବାହାର କରିବ,\n ସନ୍ଦେଶଗୁଡ଼ିକ ଏବେ ଆପଣଙ୍କର ସାଥୀଙ୍କର ଡିଭାଇସରେ ଦେଖାଯାଇପାରିବ।',
			'deleteselected': 'ଚୟନ କରାଯାଇଥିବାକୁ ବାହାର କରନ୍ତୁ',
			'unabletofetchconversation': 'ଆପଣଙ୍କର କଥାବାର୍ତ୍ତାକୁ ଆଣିପାରିବା ନାହିଁ \n',
			'loadmoreconversation': 'ଅଧିକ କଥାବାର୍ତ୍ତାଗୁଡ଼ିକୁ ଲୋଡ୍ କରନ୍ତୁ',
			'sendyourfirstmessage': 'ଆପଣଙ୍କର ପ୍ରଥମ ସନ୍ଦେଶ ପଠାନ୍ତୁ \n',
			'unblock': 'ଅନବ୍ଲକ୍ କରନ୍ତୁ ',
			'block': 'ବ୍ଲକ୍ କରନ୍ତୁ',
			'writeyourmessage': 'ଆପଣଙ୍କର ସନ୍ଦେଶ ଲେଖନ୍ତୁ...',
			'clearconversation': 'କଥାବାର୍ତ୍ତାଗୁଡ଼ିକୁ ସଫା କରନ୍ତୁ',
			'clearconversationhintone': 'ଏହି କାର୍ଯ୍ୟଟି ଆପଣଙ୍କର ସମସ୍ତ କଥାବାର୍ତ୍ତାକୁ ସଫା କରିବ ',
			'clearconversationhinttwo': '.\n ଦୟାକରି ଧ୍ୟାନ ଦିଅନ୍ତୁ ଏହା କେବଳ ଆପଣଙ୍କର ପର୍ଯ୍ୟନ୍ତ କଥାବାର୍ତ୍ତାକୁ ବାହାର କରିବ, ସନ୍ଦେଶଗୁଡ଼ିକ ଏବେ ଆପଣଙ୍କର ସାଥୀଙ୍କର ଚ୍ୟାଟରେ ଦେଖାଯାଇପାରିବ।',
			'facebookloginerror': 'ଲଗଇନ୍ ପ୍ରକ୍ରିୟାରେ କିଛି ତ୍ରୁଟି ହୋଇଛି।\n ଏହି ସମୟରେ ଫେସବୁକ୍ ଆମକୁ ଯେତେବେଳେ ତ୍ରୁଟି ଦେଲା',
			'selectLanguage': 'ଭାଷା ଚୟନ କରନ୍ତୁ',
			'howTo': 'କିପରି',
			'noBibleTextsAvailable': 'କ any ଣସି ବାଇବେଲ ଟେକ୍ସଟ୍ ଉପଲବ୍ଧ ନାହିଁ',
			'languages': 'ଭାଷାଗୁଡିକ',
			'searchLanguages': 'ଭାଷାଗୁଡିକୁ ଖୋଜନ୍ତୁ...',
			'biblesFilesets': 'ବାଇବେଲ: {bibles}, ଫାଇଲସେଟ୍‌ସ: {filesets}',
			'oldTestament': 'ପୁରାତନ ନିୟମ',
			'newTestament': 'ନୂତନ ନିୟମ',
			'play': 'ଖେଳିବା',
			'no_verse_content': 'ପ୍ରଦର୍ଶନ କରିବା ପାଇଁ କୌଣସି ବାଇବେଲ ଶ୍ଲୋକ ବିଷୟବସ୍ତୁ ଉପଲବ୍ଧ ନାହିଁ।',
			'no_audio_content': 'ପ୍ରଦର୍ଶନ କରିବା ପାଇଁ କୌଣସି ବାଇବେଲ ଅଡିଓ ବିଷୟବସ୍ତୁ ଉପଲବ୍ଧ ନାହିଁ।',
		};
	}
}

extension on _StringsPa {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'VirtualPastor',
			'selectlanguage': 'ਭਾਸ਼ਾ ਚੁਣੋ',
			'deletemyaccount': 'ਮੇਰਾ ਖਾਤਾ ਮਿਟਾਓ',
			'deleteaccount': 'ਖਾਤਾ ਮਿਟਾਓ',
			'deleteaccounthint': 'ਇਹ ਕਿਰਿਆ ਤੁਹਾਡਾ ਖਾਤਾ ਮਿਟਾ ਦੇਵੇਗੀ ਅਤੇ ਤੁਹਾਡੇ ਸਾਰੇ ਡਾਟਾ ਨੂੰ ਮਿਟਾ ਦੇਵੇਗੀ, ਇੱਕ ਵਾਰ ਡਾਟਾ ਮਿਟਾ ਦਿੱਤਾ ਗਿਆ ਤਾਂ ਇਹ ਦੁਬਾਰਾ ਪ੍ਰਾਪਤ ਨਹੀਂ ਹੋ ਸਕਦਾ।',
			'deleteaccountsuccess': 'ਖਾਤਾ ਮਿਟਾਉਣਾ ਸਫਲ ਰਿਹਾ',
			'chooseapplanguage': 'ਐਪ ਭਾਸ਼ਾ ਚੁਣੋ',
			'nightmode': 'ਰਾਤੀ ਮੋਡ',
			'initializingapp': 'ਸ਼ੁਰੂ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...',
			'home': 'ਹੋਮ',
			'branches': 'ਸ਼ਾਖਾਵਾਂ',
			'inbox': 'ਇਨਬਾਕਸ',
			'downloads': 'ਡਾਊਨਲੋਡਸ',
			'settings': 'ਸੈਟਿੰਗਸ',
			'events': 'ਘਟਨਾਵਾਂ',
			'myplaylists': 'ਮੇਰੀ ਪਲੇਲਿਸਟ',
			'website': 'ਵੈਬਸਾਈਟ',
			'hymns': 'ਭਜਨ',
			'articles': 'ਲੇਖ',
			'notes': 'ਨੋਟਸ',
			'donate': 'ਦਾਨ ਕਰੋ',
			'offering': 'ਭੇਟ',
			'savenotetitle': 'ਨੋਟਸ ਸਿਰਲੇਖ',
			'nonotesfound': 'ਕੋਈ ਨੋਟਸ ਨਹੀਂ ਮਿਲੇ',
			'newnote': 'ਨਵਾਂ',
			'deletenote': 'ਨੋਟਸ ਮਿਟਾਓ',
			'deletenotehint': 'ਕੀ ਤੁਸੀਂ ਇਹ ਨੋਟਸ ਮਿਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ? ਇਹ ਕਿਰਿਆ ਦੁਬਾਰਾ ਨਹੀਂ ਕੀਤੀ ਜਾ ਸਕਦੀ।',
			'bookmarks': 'ਬੁਕਮਾਰਕਸ',
			'socialplatforms': 'ਸੋਸ਼ਲ ਪਲੇਟਫਾਰਮ',
			'onboardingpagetitles.0': 'ਮੇਰੇ ਚਰਚ ਵਿੱਚ ਸਵਾਗਤ ਹੈ',
			'onboardingpagetitles.1': 'ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਨਾਲ ਭਰਪੂਰ',
			'onboardingpagetitles.2': 'ਆਡੀਓ, ਵੀਡੀਓ \n ਅਤੇ ਲਾਈਵ ਸਟਰੀਮਿੰਗ',
			'onboardingpagetitles.3': 'ਖਾਤਾ ਬਣਾਓ',
			'onboardingpagehints.0': 'ਐਤਵਾਰ ਸਵੇਰਾਂ ਅਤੇ ਤੁਹਾਡੇ ਚਰਚ ਦੀਆਂ ਚਾਰ ਦੀਵਾਰਾਂ ਤੋਂ ਪਰੇ ਵਧੋ। ਤੁਹਾਨੂੰ ਇਕ ਮੋਬਾਈਲ-ਕੇਂਦਰੀਤ ਦੁਨੀਆ ਨਾਲ ਸੰਚਾਰ ਅਤੇ ਭਾਗੀਦਾਰੀ ਕਰਨ ਲਈ ਜੋ ਕੁਝ ਵੀ ਚਾਹੀਦਾ ਹੈ।',
			'onboardingpagehints.1': 'ਅਸੀਂ ਤੁਹਾਡੇ ਚਰਚ ਐਪ ਦੇ ਸਾਰੇ ਮੁੱਖ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਨੂੰ ਇਕੱਠਾ ਕੀਤਾ ਹੈ। ਘਟਨਾਵਾਂ, ਭਜਨ, ਨੋਟੀਫਿਕੇਸ਼ਨ, ਨੋਟਸ ਅਤੇ ਬਹੁ-ਸੰਸਕਰਣ ਬਾਈਬਲ।',
			'onboardingpagehints.2': 'ਦੁਨੀਆ ਭਰ ਦੇ ਉਪਭੋਗਤਾਵਾਂ ਨੂੰ ਤੁਹਾਡੇ ਚਰਚ ਦੀਆਂ ਸੇਵਾਵਾਂ ਦੀਆਂ ਲਾਈਵ ਸਟਰੀਮਿੰਗ ਦੇਖਣ, ਆਡੀਓ ਸੰਦੇਸ਼ ਸੁਣਨ ਅਤੇ ਵੀਡੀਓ ਦੇਖਣ ਦੀ ਆਗਿਆ ਦਿਓ।',
			'onboardingpagehints.3': 'ਇੱਕ ਨਿਰੰਤਰ ਪੂਜਾ ਦੇ ਤਜਰਬੇ ਤੱਕ ਆਪਣੀ ਯਾਤਰਾ ਸ਼ੁਰੂ ਕਰੋ।',
			'next': 'ਅਗਲਾ',
			'done': 'ਸ਼ੁਰੂ ਕਰੋ',
			'quitapp': 'ਐਪ ਬੰਦ ਕਰੋ!',
			'quitappwarning': 'ਕੀ ਤੁਸੀਂ ਐਪ ਬੰਦ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?',
			'quitappaudiowarning': 'ਤੁਸੀਂ ਵਰਤਮਾਨ ਵਿੱਚ ਇਕ ਆਡੀਓ ਚਲਾ ਰਹੇ ਹੋ, ਐਪ ਬੰਦ ਕਰਨ ਨਾਲ ਆਡੀਓ ਪਲੇਬੈਕ ਰੁਕ ਜਾਏਗਾ। ਜੇ ਤੁਸੀਂ ਪਲੇਬੈਕ ਰੁਕਵਾਉਣਾ ਨਹੀਂ ਚਾਹੁੰਦੇ, ਤਾਂ ਕੇਂਦਰ ਬਟਨ ਨਾਲ ਐਪ ਨੂੰ ਘੱਟ ਕਰੋ ਜਾਂ ਹੁਣੇ ਐਪ ਬੰਦ ਕਰਨ ਲਈ ਓਕੇ ਬਟਨ \'ਤੇ ਕਲਿੱਕ ਕਰੋ।',
			'ok': 'ਠੀਕ ਹੈ',
			'retry': 'ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰੋ',
			'oops': 'ਓਹ!',
			'save': 'ਸੰਭਾਲੋ',
			'cancel': 'ਰੱਦ ਕਰੋ',
			'error': 'ਗਲਤੀ',
			'success': 'ਸਫਲਤਾ',
			'skip': 'ਛੱਡੋ',
			'skiplogin': 'ਲਾਗਿਨ ਛੱਡੋ',
			'skipregister': 'ਰਜਿਸਟਰੇਸ਼ਨ ਛੱਡੋ',
			'dataloaderror': 'ਵਰਤਮਾਨ ਸਮੇਂ ਅਨੁਰੋਧ ਕੀਤੇ ਡਾਟਾ ਨੂੰ ਲੋਡ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ, ਆਪਣੇ ਡਾਟਾ ਕਨੈਕਸ਼ਨ ਨੂੰ ਜਾਂਚੋ ਅਤੇ ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰਨ ਲਈ ਕਲਿੱਕ ਕਰੋ।',
			'suggestedforyou': 'ਤੁਹਾਡੇ ਲਈ ਸੁਝਾਏ ਗਏ',
			'videomessages': 'ਵੀਡੀਓ ਸੰਦੇਸ਼',
			'audiomessages': 'ਆਡੀਓ ਸੰਦੇਸ਼',
			'devotionals': 'ਭਗਤੀਗੀਤ',
			'categories': 'ਸ਼੍ਰੇਣੀਆਂ',
			'category': 'ਸ਼੍ਰੇਣੀ',
			'videos': 'ਵੀਡੀਓਜ਼',
			'audios': 'ਆਡੀਓਜ਼',
			'biblebooks': 'ਬਾਈਬਲ',
			'sermons': 'ਪ੍ਰਵਚਨ',
			'tools': 'ਉਪਕਰਣ',
			'profile': 'ਪਰੋਫਾਈਲ',
			'audiobible': 'ਆਡੀਓ ਬਾਈਬਲ',
			'homesentence': 'ਤੁਹਾਨੂੰ ਇੱਕ ਵਿਅਕਤੀ ਬਣਨ ਵਿੱਚ ਮਦਦ ਕਰਨ ਲਈ ਤੁਹਾਡੇ ਪਾਸਟਰ ਵਾਂਗ ਸਾਲ ਲਈ, ਜਿਸ ਨੂੰ ਭਗਵਾਨ ਨੇ ਤੁਹਾਨੂੰ ਕਾਲ ਕੀਤਾ ਹੈ।',
			'livestreams': 'ਲਾਈਵ ਸਟਰੀਮਿੰਗ',
			'radio': 'ਰੇਡੀਓ',
			'allitems': 'ਸਾਰੇ ਆਈਟਮ',
			'emptyplaylist': 'ਕੋਈ ਪਲੇਲਿਸਟ ਨਹੀਂ',
			'notsupported': 'ਸਮਰਥਿਤ ਨਹੀਂ ਹੈ',
			'cleanupresources': 'ਸਰੋਤਾਂ ਨੂੰ ਸਾਫ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ',
			'grantstoragepermission': 'ਅੱਗੇ ਵਧਣ ਲਈ ਕਿਰਪਾ ਕਰਕੇ ਸਟੋਰੇਜ ਪ੍ਰਵਾਨਗੀ ਦਿਓ',
			'sharefiletitle': 'ਵੇਖੋ ਜਾਂ ਸੁਣੋ ',
			'sharefilebody': 'MyVirtualPastor ਐਪ ਦੇ ਰਾਹੀਂ, ਹੁਣੇ ਡਾਊਨਲੋਡ ਕਰੋ ',
			'sharetext': 'ਅਸਮੀਤ ਆਡੀਓ ਅਤੇ ਵੀਡੀਓ ਸਟਰੀਮਿੰਗ ਦਾ ਅਨੰਦ ਮਾਣੋ',
			'sharetexthint': 'ਅਸੀਂ ਤੁਹਾਡੇ ਲਈ ਇੱਕ ਵਿਡੀਓ ਅਤੇ ਆਡੀਓ ਸਟਰੀਮਿੰਗ ਪਲੇਟਫਾਰਮ ਪ੍ਰਦਾਨ ਕਰਦੇ ਹਾਂ ਜਿਸ ਨਾਲ ਤੁਸੀਂ ਦੁਨੀਆ ਭਰ ਤੋਂ ਮਿਲੀਅਨ ਫਾਈਲਾਂ ਦੇਖ ਅਤੇ ਸੁਣ ਸਕਦੇ ਹੋ। ਹੁਣੇ ਡਾਊਨਲੋਡ ਕਰੋ ',
			'download': 'ਡਾਊਨਲੋਡ ਕਰੋ',
			'addplaylist': 'ਪਲੇਲਿਸਟ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ',
			'bookmark': 'ਬੁਕਮਾਰਕ',
			'unbookmark': 'ਬੁਕਮਾਰਕ ਹਟਾਓ',
			'share': 'ਸਾਂਝਾ ਕਰੋ',
			'deletemedia': 'ਫਾਇਲ ਮਿਟਾਓ',
			'deletemediahint': 'ਕੀ ਤੁਸੀਂ ਇਸ ਡਾਊਨਲੋਡ ਕੀਤੀ ਗਈ ਫਾਇਲ ਨੂੰ ਮਿਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ? ਇਹ ਕਿਰਿਆ ਦੁਬਾਰਾ ਨਹੀਂ ਕੀਤੀ ਜਾ ਸਕਦੀ।',
			'searchhint': 'ਆਡੀਓ ਅਤੇ ਵੀਡੀਓ ਸੰਦੇਸ਼ਾਂ ਦੀ ਭਾਲ ਕਰੋ',
			'performingsearch': 'ਆਡੀਓ ਅਤੇ ਵੀਡੀਓ ਭਾਲ ਕਰ ਰਿਹਾ ਹੈ',
			'nosearchresult': 'ਕੋਈ ਨਤੀਜੇ ਨਹੀਂ ਮਿਲੇ',
			'nosearchresulthint': 'ਵਧੇਰੇ ਆਮ ਕੁੰਜੀਸ਼ਬਦ ਪ੍ਰਵਿਸ਼ਟ ਕਰੋ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ',
			'addtoplaylist': 'ਪਲੇਲਿਸਟ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ',
			'newplaylist': 'ਨਵੀਂ ਪਲੇਲਿਸਟ',
			'playlistitm': 'ਪਲੇਲਿਸਟ',
			'mediaaddedtoplaylist': 'ਮੀਡੀਆ ਨੂੰ ਪਲੇਲਿਸਟ ਵਿੱਚ ਸ਼ਾਮਲ ਕੀਤਾ ਗਿਆ ਹੈ।',
			'mediaremovedfromplaylist': 'ਮੀਡੀਆ ਨੂੰ ਪਲੇਲਿਸਟ ਵਿੱਚੋਂ ਹਟਾਇਆ ਗਿਆ ਹੈ',
			'clearplaylistmedias': 'ਸਾਰੇ ਮੀਡੀਆ ਨੂੰ ਸਾਫ ਕਰੋ',
			'deletePlayList': 'ਪਲੇਲਿਸਟ ਮਿਟਾਓ',
			'clearplaylistmediashint': 'ਕੀ ਤੁਸੀਂ ਇਸ ਪਲੇਲਿਸਟ ਤੋਂ ਸਾਰੇ ਮੀਡੀਆ ਨੂੰ ਹਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ?',
			'deletePlayListhint': 'ਕੀ ਤੁਸੀਂ ਇਸ ਪਲੇਲਿਸਟ ਨੂੰ ਮਿਟਾਉਣਾ ਅਤੇ ਸਾਰੇ ਮੀਡੀਆ ਨੂੰ ਸਾਫ਼ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?',
			'comments': 'ਟਿੱਪਣੀਆਂ',
			'replies': 'ਜਵਾਬ',
			'reply': 'ਜਵਾਬ',
			'logintoaddcomment': 'ਟਿੱਪਣੀ ਸ਼ਾਮਲ ਕਰਨ ਲਈ ਲਾਗਿਨ ਕਰੋ',
			'logintoreply': 'ਜਵਾਬ ਦੇਣ ਲਈ ਲਾਗਿਨ ਕਰੋ',
			'writeamessage': 'ਇੱਕ ਸੁਨੇਹਾ ਲਿਖੋ...',
			'nocomments': 'ਕੋਈ ਟਿੱਪਣੀਆਂ ਨਹੀਂ ਮਿਲੀਆਂ \nਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰਨ ਲਈ ਕਲਿੱਕ ਕਰੋ',
			'errormakingcomments': 'ਇਸ ਸਮੇਂ ਟਿੱਪਣੀ ਪ੍ਰਕਿਰਿਆ ਕਰਨਾ ਸਮਭਵ ਨਹੀਂ ਹੈ..',
			'errordeletingcomments': 'ਇਸ ਸਮੇਂ ਇਸ ਟਿੱਪਣੀ ਨੂੰ ਮਿਟਾਉਣਾ ਸਮਭਵ ਨਹੀਂ ਹੈ..',
			'erroreditingcomments': 'ਇਸ ਸਮੇਂ ਇਸ ਟਿੱਪਣੀ ਨੂੰ ਸੰਪਾਦਿਤ ਕਰਨਾ ਸਮਭਵ ਨਹੀਂ ਹੈ..',
			'errorloadingmorecomments': 'ਇਸ ਸਮੇਂ ਹੋਰ ਟਿੱਪਣੀਆਂ ਲੋਡ ਕਰਨਾ ਸਮਭਵ ਨਹੀਂ ਹੈ..',
			'deletingcomment': 'ਟਿੱਪਣੀ ਮਿਟਾਈ ਜਾ ਰਹੀ ਹੈ',
			'editingcomment': 'ਟਿੱਪਣੀ ਸੰਪਾਦਿਤ ਕੀਤੀ ਜਾ ਰਹੀ ਹੈ',
			'deletecommentalert': 'ਟਿੱਪਣੀ ਮਿਟਾਓ',
			'editcommentalert': 'ਟਿੱਪਣੀ ਸੰਪਾਦਿਤ ਕਰੋ',
			'deletecommentalerttext': 'ਕੀ ਤੁਸੀਂ ਇਸ ਟਿੱਪਣੀ ਨੂੰ ਮਿਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ? ਇਹ ਕਿਰਿਆ ਦੁਬਾਰਾ ਨਹੀਂ ਕੀਤੀ ਜਾ ਸਕਦੀ',
			'loadmore': 'ਹੋਰ ਲੋਡ ਕਰੋ',
			'messages': 'ਸੁਨੇਹੇ',
			'guestuser': 'ਮਹਿਮਾਨ ਉਪਭੋਗਤਾ',
			'fullname': 'ਪੂਰਾ ਨਾਮ',
			'emailaddress': 'ਈਮੇਲ ਪਤਾ',
			'password': 'ਪਾਸਵਰਡ',
			'repeatpassword': 'ਪਾਸਵਰਡ ਦੁਬਾਰਾ ਲਿਖੋ',
			'register': 'ਰਜਿਸਟਰ ਕਰੋ',
			'login': 'ਲਾਗਿਨ ਕਰੋ',
			'logout': 'ਲਾਗਆਉਟ ਕਰੋ',
			'logoutfromapp': 'ਐਪ ਤੋਂ ਲਾਗਆਉਟ?',
			'logoutfromapphint': 'ਜੇ ਤੁਸੀਂ ਲਾਗਿਨ ਨਹੀਂ ਹੋਏ ਹੋ ਤਾਂ ਤੁਸੀਂ ਲੇਖਾਂ ਅਤੇ ਵੀਡੀਓਜ਼ \'ਤੇ ਟਿੱਪਣੀ ਕਰਨ ਜਾਂ ਪਸੰਦ ਕਰਨ ਸਮਰਥ ਨਹੀਂ ਹੋਵੋਗੇ।',
			'gotologin': 'ਲਾਗਿਨ ਕਰਨ ਲਈ ਜਾਓ',
			'resetpassword': 'ਪਾਸਵਰਡ ਰੀਸੈਟ ਕਰੋ',
			'logintoaccount': 'ਪਹਿਲਾਂ ਹੀ ਖਾਤਾ ਹੈ? ਲਾਗਿਨ ਕਰੋ',
			'emptyfielderrorhint': 'ਤੁਹਾਨੂੰ ਸਾਰੇ ਖੇਤਰ ਭਰਣੇ ਚਾਹੀਦੇ ਹਨ',
			'invalidemailerrorhint': 'ਤੁਹਾਨੂੰ ਇੱਕ ਮਾਨਯ ਈਮੇਲ ਪਤਾ ਦਰਜ ਕਰਨਾ ਚਾਹੀਦਾ ਹੈ',
			'passwordsdontmatch': 'ਪਾਸਵਰਡ ਮਿਲਦੇ ਨਹੀਂ ਹਨ',
			'processingpleasewait': 'ਪ੍ਰਕਿਰਿਆ ਹੋ ਰਹੀ ਹੈ, ਕਿਰਪਾ ਕਰਕੇ ਉਡੀਕ ਕਰੋ...',
			'createaccount': 'ਖਾਤਾ ਬਣਾਓ',
			'forgotpassword': 'ਪਾਸਵਰਡ ਭੁੱਲ ਗਏ?',
			'orloginwith': 'ਜਾਂ ਨਾਲ ਲਾਗਿਨ ਕਰੋ',
			'facebook': 'ਫੇਸਬੁਕ',
			'google': 'ਗੂਗਲ',
			'moreoptions': 'ਹੋਰ ਵਿਕਲਪ',
			'about': 'ਸਾਡੇ ਬਾਰੇ',
			'privacy': 'ਪਰਾਈਵੇਟ ਨੀਤੀ',
			'terms': 'ਐਪ ਸ਼ਰਤਾਂ',
			'rate': 'ਐਪ ਰੇਟ ਕਰੋ',
			'version': 'ਵਰਜਨ',
			'pulluploadmore': 'ਉਪਰ ਖਿੱਚੋ',
			'loadfailedretry': 'ਲੋਡ ਫੇਲ੍ਹ! ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰੋ!',
			'releaseloadmore': 'ਹੋਰ ਲੋਡ ਕਰਨ ਲਈ ਛੱਡੋ',
			'nomoredata': 'ਹੋਰ ਡਾਟਾ ਨਹੀਂ',
			'errorReportingComment': 'ਟਿੱਪਣੀ ਰਿਪੋਰਟ ਕਰਦੇ ਸਮੇਂ ਗਲਤੀ',
			'reportingComment': 'ਟਿੱਪਣੀ ਰਿਪੋਰਟ ਕੀਤੀ ਜਾ ਰਹੀ ਹੈ',
			'reportcomment': 'ਰਿਪੋਰਟ ਵਿਕਲਪ',
			'reportCommentsList.0': 'ਗੈਰ-ਚਾਹੁਣ ਵਾਲੀ ਵਪਾਰਕ ਸਮੱਗਰੀ ਜਾਂ ਸਪੈਮ',
			'reportCommentsList.1': 'ਅਸ਼ਲੀਲ ਜਾਂ ਯੌਨ ਸਪਸ਼ਟ ਸਮੱਗਰੀ',
			'reportCommentsList.2': 'ਘ੍ਰਿਣਾ ਭਾਸ਼ਣ ਜਾਂ ਗ੍ਰਾਫਿਕ ਹਿੰਸਾ',
			'reportCommentsList.3': 'ਉਤਪੀੜਨ ਜਾਂ ਧੱਕੇਸ਼ਾਹੀ',
			'bookmarksMedia': 'ਮੇਰੇ ਬੁਕਮਾਰਕਸ',
			'noitemstodisplay': 'ਕੋਈ ਆਈਟਮ ਪ੍ਰਦਰਸ਼ਿਤ ਕਰਨ ਲਈ ਨਹੀਂ',
			'loginrequired': 'ਲਾਗਿਨ ਜ਼ਰੂਰੀ ਹੈ',
			'loginrequiredhint': 'ਇਸ ਪਲੇਟਫਾਰਮ \'ਤੇ ਗਾਹਕ ਬਣਨ ਲਈ, ਤੁਹਾਨੂੰ ਲਾਗਿਨ ਕਰਨਾ ਪਵੇਗਾ। ਹੁਣੇ ਮੁਫ਼ਤ ਖਾਤਾ ਬਣਾਓ ਜਾਂ ਮੌਜੂਦਾ ਖਾਤੇ ਵਿੱਚ ਲਾਗਿਨ ਕਰੋ।',
			'subscriptions': 'ਐਪ ਗਾਹਕੀ',
			'subscribe': 'ਗਾਹਕੀ',
			'subscribehint': 'ਗਾਹਕੀ ਜ਼ਰੂਰੀ ਹੈ',
			'playsubscriptionrequiredhint': 'ਇਸ ਮੀਡੀਆ ਨੂੰ ਸੁਣਨ ਜਾਂ ਦੇਖਣ ਲਈ ਤੁਹਾਨੂੰ ਗਾਹਕੀ ਦੀ ਲੋੜ ਹੈ।',
			'previewsubscriptionrequiredhint': 'ਤੁਸੀਂ ਇਸ ਮੀਡੀਆ ਲਈ ਅਨੁਮਤ ਮੁਕਤ ਅਵਧੀ ਪਹੁੰਚ ਹਾਸਲ ਕਰ ਲਈ ਹੈ। ਸੁਣਨ ਜਾਂ ਦੇਖਣ ਲਈ ਤੁਹਾਨੂੰ ਗਾਹਕੀ ਦੀ ਲੋੜ ਹੈ।',
			'copiedtoclipboard': 'ਕਲਿੱਪਬੋਰਡ \'ਤੇ ਨਕਲ ਕੀਤਾ ਗਿਆ',
			'downloadbible': 'ਬਾਈਬਲ ਡਾਊਨਲੋਡ ਕਰੋ',
			'downloadversion': 'ਡਾਊਨਲੋਡ ਕਰੋ',
			'downloading': 'ਡਾਊਨਲੋਡ ਹੋ ਰਿਹਾ ਹੈ',
			'failedtodownload': 'ਡਾਊਨਲੋਡ ਫੇਲ੍ਹ',
			'pleaseclicktoretry': 'ਕਿਰਪਾ ਕਰਕੇ ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰਨ ਲਈ ਕਲਿੱਕ ਕਰੋ।',
			'of': 'ਦੀ',
			'nobibleversionshint': 'ਦਿਖਾਉਣ ਲਈ ਕੋਈ ਬਾਈਬਲ ਡਾਟਾ ਨਹੀਂ ਹੈ, ਘੱਟੋ-ਘੱਟ ਇੱਕ ਬਾਈਬਲ ਵਰਜਨ ਡਾਊਨਲੋਡ ਕਰਨ ਲਈ ਹੇਠਾਂ ਦਿੱਤੇ ਬਟਨ \'ਤੇ ਕਲਿੱਕ ਕਰੋ।',
			'downloaded': 'ਡਾਊਨਲੋਡ ਕੀਤਾ ਗਿਆ',
			'enteremailaddresstoresetpassword': 'ਆਪਣਾ ਪਾਸਵਰਡ ਰੀਸੈਟ ਕਰਨ ਲਈ ਆਪਣਾ ਈਮੇਲ ਪਤਾ ਦਰਜ ਕਰੋ',
			'backtologin': 'ਲਾਗਿਨ \'ਤੇ ਵਾਪਸ',
			'signintocontinue': 'ਜਾਰੀ ਰੱਖਣ ਲਈ ਸਾਇਨ ਇਨ ਕਰੋ',
			'signin': 'ਸਾਇਨ ਇਨ',
			'signinforanaccount': 'ਇਕ ਖਾਤੇ ਲਈ ਸਾਇਨ ਅਪ ਕਰੋ?',
			'alreadyhaveanaccount': 'ਪਹਿਲਾਂ ਹੀ ਇੱਕ ਖਾਤਾ ਹੈ?',
			'updateprofile': 'ਪਰੋਫਾਈਲ ਅੱਪਡੇਟ ਕਰੋ',
			'updateprofilehint': 'ਸ਼ੁਰੂ ਕਰਨ ਲਈ, ਕਿਰਪਾ ਕਰਕੇ ਆਪਣਾ ਪਰੋਫਾਈਲ ਪੰਨਾ ਅੱਪਡੇਟ ਕਰੋ, ਇਹ ਸਾਨੂੰ ਹੋਰ ਲੋਕਾਂ ਨਾਲ ਜੋੜਨ ਵਿੱਚ ਮਦਦ ਕਰੇਗਾ',
			'autoplayvideos': 'ਆਟੋਪਲੇ ਵੀਡੀਓਜ਼',
			'gosocial': 'ਸੋਸ਼ਲ ਤੇ ਜਾਓ',
			'searchbible': 'ਬਾਈਬਲ ਭਾਲ ਕਰੋ',
			'filtersearchoptions': 'ਭਾਲ ਵਿਕਲਪਾਂ ਨੂੰ ਫਿਲਟਰ ਕਰੋ',
			'narrowdownsearch': 'ਇੱਕ ਹੋਰ ਸਹੀ ਨਤੀਜੇ ਲਈ ਹੇਠਾਂ ਦਿੱਤੇ ਫਿਲਟਰ ਬਟਨ ਦਾ ਪ੍ਰਯੋਗ ਕਰੋ।',
			'searchbibleversion': 'ਬਾਈਬਲ ਵਰਜਨ ਭਾਲੋ',
			'searchbiblebook': 'ਬਾਈਬਲ ਪੁਸਤਕ ਭਾਲੋ',
			'search': 'ਭਾਲੋ',
			'setBibleBook': 'ਬਾਈਬਲ ਪੁਸਤਕ ਸੈੱਟ ਕਰੋ',
			'oldtestament': 'ਪੁਰਾਣਾ ਨਿਯਮ',
			'newtestament': 'ਨਵਾਂ ਨਿਯਮ',
			'limitresults': 'ਨਤੀਜੇ ਸੀਮਿਤ ਕਰੋ',
			'setfilters': 'ਫਿਲਟਰ ਸੈੱਟ ਕਰੋ',
			'bibletranslator': 'ਬਾਈਬਲ ਅਨੁਵਾਦਕ',
			'chapter': ' ਅਧਿਆਇ ',
			'verse': ' ਆਇਤ ',
			'translate': 'ਅਨੁਵਾਦ ਕਰੋ',
			'bibledownloadinfo': 'ਬਾਈਬਲ ਡਾਊਨਲੋਡ ਸ਼ੁਰੂ ਹੋ ਗਿਆ ਹੈ, ਕਿਰਪਾ ਕਰਕੇ ਡਾਊਨਲੋਡ ਮੁਕੰਮਲ ਹੋਣ ਤੱਕ ਇਸ ਪੇਜ਼ ਨੂੰ ਬੰਦ ਨਾ ਕਰੋ।',
			'received': 'ਮਿਲਿਆ',
			'outoftotal': 'ਕੁੱਲ ਵਿੱਚੋਂ',
			'set': 'ਸੈੱਟ ਕਰੋ',
			'selectColor': 'ਰੰਗ ਚੁਣੋ',
			'switchbibleversion': 'ਬਾਈਬਲ ਵਰਜਨ ਬਦਲੋ',
			'switchbiblebook': 'ਬਾਈਬਲ ਕਿਤਾਬ ਬਦਲੋ',
			'gotosearch': 'ਅਧਿਆਇ ਤੇ ਜਾਓ',
			'changefontsize': 'ਫੌਂਟ ਸਾਈਜ਼ ਬਦਲੋ',
			'font': 'ਫੌਂਟ',
			'readchapter': 'ਅਧਿਆਇ ਪੜ੍ਹੋ',
			'showhighlightedverse': 'ਹਾਈਲਾਈਟ ਕੀਤੀ ਗਈ ਆਇਤ ਵਿਖਾਓ',
			'downloadmoreversions': 'ਹੋਰ ਵਰਜਨ ਡਾਊਨਲੋਡ ਕਰੋ',
			'suggestedusers': 'ਸਿਫਾਰਸ਼ ਕੀਤੇ ਯੂਜ਼ਰ',
			'unfollow': 'ਅਨਫੌਲੋ ਕਰੋ',
			'follow': 'ਫੌਲੋ ਕਰੋ',
			'searchforpeople': 'ਲੋਕਾਂ ਦੀ ਖੋਜ ਕਰੋ',
			'viewpost': 'ਪੋਸਟ ਵੇਖੋ',
			'viewprofile': 'ਪ੍ਰੋਫਾਈਲ ਵੇਖੋ',
			'mypins': 'ਮੇਰੇ ਪਿਨ',
			'viewpinnedposts': 'ਪਿੰਨ ਕੀਤੀਆਂ ਪੋਸਟਾਂ ਵੇਖੋ',
			'personal': 'ਨਿੱਜੀ',
			'update': 'ਅੱਪਡੇਟ',
			'phonenumber': 'ਫ਼ੋਨ ਨੰਬਰ',
			'showmyphonenumber': 'ਮੇਰਾ ਫ਼ੋਨ ਨੰਬਰ ਯੂਜ਼ਰਾਂ ਨੂੰ ਵਿਖਾਓ',
			'dateofbirth': 'ਜਨਮ ਮਿਤੀ',
			'showmyfulldateofbirth': 'ਮੇਰੀ ਪੂਰੀ ਜਨਮ ਮਿਤੀ ਨੂੰ ਲੋਕਾਂ ਨੂੰ ਵਿਖਾਓ',
			'notifications': 'ਨੋਟਿਸਾਂ',
			'notifywhenuserfollowsme': 'ਜਦੋਂ ਕੋਈ ਯੂਜ਼ਰ ਮੈਨੂੰ ਫੌਲੋ ਕਰੇ ਤਾਂ ਮੈਨੂੰ ਸੂਚਿਤ ਕਰੋ',
			'notifymewhenusercommentsonmypost': 'ਜਦੋਂ ਯੂਜ਼ਰ ਮੇਰੀ ਪੋਸਟ ਤੇ ਟਿੱਪਣੀ ਕਰੇ ਤਾਂ ਮੈਨੂੰ ਸੂਚਿਤ ਕਰੋ',
			'notifymewhenuserlikesmypost': 'ਜਦੋਂ ਯੂਜ਼ਰ ਮੇਰੀ ਪੋਸਟ ਨੂੰ ਲਾਇਕ ਕਰੇ ਤਾਂ ਮੈਨੂੰ ਸੂਚਿਤ ਕਰੋ',
			'churchsocial': 'ਚਰਚ ਸੋਸ਼ਲ',
			'shareyourthoughts': 'ਆਪਣੇ ਵਿਚਾਰ ਸਾਂਝੇ ਕਰੋ',
			'readmore': '...ਹੋਰ ਪੜ੍ਹੋ',
			'less': ' ਘੱਟ',
			'couldnotprocess': 'ਬੇਨਤੀ ਕੀਤੀ ਕਾਰਵਾਈ ਨੂੰ ਪ੍ਰਕਿਰਿਆ ਨਹੀਂ ਕੀਤੀ ਜਾ ਸਕੀ।',
			'pleaseselectprofilephoto': 'ਕਿਰਪਾ ਕਰਕੇ ਅਪਲੋਡ ਕਰਨ ਲਈ ਇੱਕ ਪ੍ਰੋਫਾਈਲ ਫੋਟੋ ਚੁਣੋ',
			'pleaseselectprofilecover': 'ਕਿਰਪਾ ਕਰਕੇ ਅਪਲੋਡ ਕਰਨ ਲਈ ਇੱਕ ਕਵਰ ਫੋਟੋ ਚੁਣੋ',
			'updateprofileerrorhint': 'ਅੱਗੇ ਵਧਣ ਲਈ ਤੁਹਾਨੂੰ ਆਪਣਾ ਨਾਮ, ਜਨਮ ਮਿਤੀ, ਲਿੰਗ, ਫੋਨ ਅਤੇ ਸਥਾਨ ਭਰਨਾ ਹੋਵੇਗਾ।',
			'gender': 'ਲਿੰਗ',
			'male': 'ਮਰਦ',
			'female': 'ਔਰਤ',
			'dob': 'ਜਨਮ ਮਿਤੀ',
			'location': 'ਮੌਜੂਦਾ ਸਥਾਨ',
			'qualification': 'ਯੋਗਤਾ',
			'aboutme': 'ਮੇਰੇ ਬਾਰੇ',
			'facebookprofilelink': 'ਫੇਸਬੁੱਕ ਪ੍ਰੋਫਾਈਲ ਲਿੰਕ',
			'twitterprofilelink': 'ਟਵਿੱਟਰ ਪ੍ਰੋਫਾਈਲ ਲਿੰਕ',
			'linkdln': 'ਲਿੰਕਡਿਨ ਪ੍ਰੋਫਾਈਲ ਲਿੰਕ',
			'likes': 'ਪਸੰਦ',
			'likess': 'ਪਸੰਦਾਂ',
			'pinnedposts': 'ਮੇਰੀਆਂ ਪਿੰਨ ਕੀਤੀਆਂ ਪੋਸਟਾਂ',
			'unpinpost': 'ਪੋਸਟ ਨੂੰ ਅਨਪਿਨ ਕਰੋ',
			'unpinposthint': 'ਕੀ ਤੁਸੀਂ ਇਸ ਪੋਸਟ ਨੂੰ ਆਪਣੇ ਪਿੰਨ ਕੀਤੇ ਪੋਸਟਾਂ ਤੋਂ ਹਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ?',
			'postdetails': 'ਪੋਸਟ ਵੇਰਵੇ',
			'posts': 'ਪੋਸਟਾਂ',
			'followers': 'ਫੌਲੋਅਰਸ',
			'followings': 'ਫੌਲੋਵਿੰਗ',
			'my': 'ਮੇਰਾ',
			'edit': 'ਸੋਧ',
			'delete': 'ਮਿਟਾਓ',
			'deletepost': 'ਪੋਸਟ ਮਿਟਾਓ',
			'deleteposthint': 'ਕੀ ਤੁਸੀਂ ਇਸ ਪੋਸਟ ਨੂੰ ਮਿਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ? ਪੋਸਟਾਂ ਅਜੇ ਵੀ ਕੁਝ ਯੂਜ਼ਰਾਂ ਦੇ ਫੀਡ ਵਿੱਚ ਦਰਸਾਈਆਂ ਜਾ ਸਕਦੀਆਂ ਹਨ।',
			'maximumallowedsizehint': 'ਅਨੁਮਤ ਅਪਲੋਡ ਫਾਈਲ ਆਕਾਰ ਸੀਮਾ ਪਹੁੰਚ ਗਈ ਹੈ',
			'maximumuploadsizehint': 'ਚੁਣੀ ਗਈ ਫਾਈਲ ਅਨੁਮਤ ਅਪਲੋਡ ਫਾਈਲ ਆਕਾਰ ਸੀਮਾ ਨੂੰ ਪਾਰ ਕਰਦੀ ਹੈ।',
			'makeposterror': 'ਇਸ ਸਮੇਂ ਪੋਸਟ ਕਰਨ ਵਿੱਚ ਅਸਫਲ, ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰਨ ਲਈ ਕਲਿਕ ਕਰੋ।',
			'makepost': 'ਪੋਸਟ ਕਰੋ',
			'selectfile': 'ਫਾਈਲ ਚੁਣੋ',
			'images': 'ਤਸਵੀਰਾਂ',
			'shareYourThoughtsNow': 'ਹੁਣ ਆਪਣੇ ਵਿਚਾਰ ਸਾਂਝੇ ਕਰੋ...',
			'photoviewer': 'ਫੋਟੋ ਵੇਖਣ ਵਾਲਾ',
			'nochatsavailable': 'ਕੋਈ ਵੀ ਗੱਲਬਾਤ ਉਪਲਬਧ ਨਹੀਂ ਹੈ \n ਕਿਰਪਾ ਕਰਕੇ ਹੇਠਾਂ ਦੇ ਆਈਕਨ \'ਤੇ ਕਲਿਕ ਕਰੋ \n ਯੂਜ਼ਰਾਂ ਨੂੰ ਚੁਣਨ ਲਈ',
			'typing': 'ਟਾਈਪ ਕਰ ਰਿਹਾ ਹੈ...',
			'photo': 'ਫੋਟੋ',
			'online': 'ਆਨਲਾਈਨ',
			'offline': 'ਆਫਲਾਈਨ',
			'lastseen': 'ਆਖਰੀ ਵਾਰ ਵੇਖਿਆ ਗਿਆ',
			'deleteselectedhint': 'ਇਹ ਕਾਰਵਾਈ ਚੁਣੇ ਗਏ ਸੁਨੇਹੇ ਨੂੰ ਮਿਟਾਉਂਦੀ ਹੈ। ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਇਹ ਕੇਵਲ ਤੁਹਾਡੇ ਪਾਸੇ ਦੀ ਗੱਲਬਾਤ ਨੂੰ ਮਿਟਾਉਂਦੀ ਹੈ,\n ਸੁਨੇਹੇ ਅਜੇ ਵੀ ਤੁਹਾਡੇ ਸਾਥੀ ਦੇ ਡਿਵਾਈਸ ਤੇ ਵੇਖੇ ਜਾਣਗੇ।',
			'deleteselected': 'ਚੁਣੇ ਹੋਏ ਨੂੰ ਮਿਟਾਓ',
			'unabletofetchconversation': 'ਤੁਹਾਡੀ ਗੱਲਬਾਤ ਪ੍ਰਾਪਤ ਕਰਨ ਵਿੱਚ ਅਸਮਰੱਥ \n',
			'loadmoreconversation': 'ਹੋਰ ਗੱਲਬਾਤਾਂ ਨੂੰ ਲੋਡ ਕਰੋ',
			'sendyourfirstmessage': 'ਤੁਹਾਡਾ ਪਹਿਲਾ ਸੁਨੇਹਾ ਭੇਜੋ \n',
			'unblock': 'ਅਨਬਲੌਕ ਕਰੋ ',
			'block': 'ਬਲੌਕ ਕਰੋ',
			'writeyourmessage': 'ਤੁਹਾਡਾ ਸੁਨੇਹਾ ਲਿਖੋ...',
			'clearconversation': 'ਗੱਲਬਾਤ ਸਾਫ਼ ਕਰੋ',
			'clearconversationhintone': 'ਇਹ ਕਾਰਵਾਈ ਤੁਹਾਡੇ ਸਾਰੇ ਗੱਲਬਾਤ ਨੂੰ ਸਾਫ਼ ਕਰੇਗੀ ',
			'clearconversationhinttwo': '.\n ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਇਹ ਕੇਵਲ ਤੁਹਾਡੇ ਪਾਸੇ ਦੀ ਗੱਲਬਾਤ ਨੂੰ ਮਿਟਾਉਂਦੀ ਹੈ, ਸੁਨੇਹੇ ਅਜੇ ਵੀ ਤੁਹਾਡੇ ਸਾਥੀ ਦੇ ਚੈਟ \'ਤੇ ਵੇਖੇ ਜਾਣਗੇ।',
			'facebookloginerror': 'ਲੌਗਇਨ ਪ੍ਰਕਿਰਿਆ ਵਿੱਚ ਕੁਝ ਗਲਤ ਹੋ ਗਿਆ ਹੈ।\n ਇਥੇ ਫੇਸਬੁੱਕ ਨੇ ਸਾਨੂੰ ਦਿੱਤੀ ਗਲਤੀ ਹੈ',
			'selectLanguage': 'ਭਾਸ਼ਾ ਚੁਣੋ',
			'howTo': 'ਕਿਵੇਂ',
			'noBibleTextsAvailable': 'ਕੋਈ ਬਾਈਬਲ ਪਾਠ ਉਪਲਬਧ ਨਹੀਂ ਹੈ',
			'languages': 'ਭਾਸ਼ਾਵਾਂ',
			'searchLanguages': 'ਭਾਸ਼ਾਵਾਂ ਦੀ ਖੋਜ ਕਰੋ...',
			'biblesFilesets': 'ਬਾਈਬਲ: {bibles}, ਫਾਈਲਸੈਟਸ: {filesets}',
			'oldTestament': 'ਪੁਰਾਣਾ ਨਿਯਮ',
			'newTestament': 'ਨਵਾਂ ਨਿਯਮ',
			'play': 'ਚਲਾਓ',
			'no_verse_content': 'ਪ੍ਰਦਰਸ਼ਿਤ ਕਰਨ ਲਈ ਕੋਈ ਬਾਈਬਲ ਅੱਧਿਆਇ ਸਮੱਗਰੀ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।',
			'no_audio_content': 'ਪ੍ਰਦਰਸ਼ਿਤ ਕਰਨ ਲਈ ਕੋਈ ਬਾਈਬਲ ਆਡੀਓ ਸਮੱਗਰੀ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।',
		};
	}
}

extension on _StringsPt {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'VirtualPastor',
			'deleteaccount': 'Delete my account',
			'deletemyaccount': 'Delete my account',
			'deleteaccounthint': 'This action will delete your account and remove all your data, once your data is deleted, it cannot be recovered.',
			'deleteaccountsuccess': 'Account deletion was succesful',
			'selectlanguage': 'Selecione o idioma',
			'chooseapplanguage': 'Escolha o idioma do aplicativo',
			'nightmode': 'Modo noturno',
			'initializingapp': 'inicializando...',
			'home': 'Casa',
			'branches': 'Ramos',
			'inbox': 'Caixa de entrada',
			'downloads': 'Transferências',
			'settings': 'Configurações',
			'events': 'Eventos',
			'myplaylists': 'Minhas Playlists',
			'website': 'Local na rede Internet',
			'hymns': 'Hinos',
			'articles': 'Artigos',
			'notes': 'Notas',
			'donate': 'Doar',
			'offering': 'Oferta',
			'bookmarks': 'Favoritos',
			'socialplatforms': 'Plataformas Sociais',
			'onboardingpagetitles.0': 'Bem-vindo ao MyChurch',
			'onboardingpagetitles.1': 'Repleto de recursos',
			'onboardingpagetitles.2': 'Áudio, vídeo \n e transmissão ao vivo',
			'onboardingpagetitles.3': 'Criar Conta',
			'onboardingpagehints.0': 'Vá além das manhãs de domingo e das quatro paredes de sua igreja. Tudo que você precisa para se comunicar e interagir com um mundo focado em dispositivos móveis.',
			'onboardingpagehints.1': 'Reunimos todos os principais recursos que seu aplicativo de igreja deve ter. Eventos, devocionais, notificações, notas e bíblia em várias versões.',
			'onboardingpagehints.2': 'Permita que usuários de todo o mundo assistam a vídeos, ouçam mensagens de áudio e assistam a transmissões ao vivo de seus serviços religiosos.',
			'onboardingpagehints.3': 'Comece sua jornada para uma experiência de adoração sem fim.',
			'next': 'PRÓXIMO',
			'done': 'INICIAR',
			'quitapp': 'Sair do aplicativo!',
			'quitappwarning': 'Você deseja fechar o aplicativo?',
			'quitappaudiowarning': 'No momento, você está reproduzindo um áudio. Sair do aplicativo interromperá a reprodução do áudio. Se você não deseja interromper a reprodução, apenas minimize o aplicativo com o botão central ou clique no botão Ok para encerrar o aplicativo agora.',
			'ok': 'Está bem',
			'retry': 'TENTAR NOVAMENTE',
			'oops': 'Opa!',
			'save': 'Salve ',
			'cancel': 'Cancelar',
			'error': 'Erro',
			'success': 'Sucesso',
			'skip': 'Pular',
			'skiplogin': 'Pular login',
			'skipregister': 'Ignorar registro',
			'dataloaderror': 'Não foi possível carregar os dados solicitados no momento, verifique sua conexão de dados e clique para tentar novamente.',
			'suggestedforyou': 'Sugerido para você',
			'devotionals': 'Devocionais',
			'categories': 'Categorias',
			'category': 'Categoria',
			'videos': 'Vídeos',
			'audios': 'Áudios',
			'biblebooks': 'Bíblia',
			'audiobible': 'Bíblia em Áudio',
			'sermons': 'Sermões',
			'profile': 'Perfil',
			'tools': 'Ferramentas',
			'homesentence': 'Seu pastor por 1 ano, para ajudá-lo a se tornar a pessoa que Deus o chamou para ser.',
			'livestreams': 'Transmissões ao vivo',
			'radio': 'Rádio',
			'allitems': 'Todos os itens',
			'emptyplaylist': 'Sem listas de reprodução',
			'notsupported': 'Não suportado',
			'cleanupresources': 'Limpando recursos',
			'grantstoragepermission': 'Conceda permissão de acesso ao armazenamento para continuar',
			'sharefiletitle': 'Assistir ou ouvir ',
			'sharefilebody': 'Através da MyVirtualPastor App, Baixe agora em ',
			'sharetext': 'Desfrute de streaming ilimitado de áudio e vídeo',
			'sharetexthint': 'Junte-se à plataforma de streaming de vídeo e áudio que permite assistir e ouvir milhões de arquivos de todo o mundo. Baixe agora em',
			'download': 'Baixar',
			'addplaylist': 'Adicionar à Playlist',
			'bookmark': 'marca páginas',
			'unbookmark': 'Desmarcar',
			'share': 'Compartilhar',
			'deletemedia': 'Excluir arquivo',
			'deletemediahint': 'Você deseja excluir este arquivo baixado? Essa ação não pode ser desfeita.',
			'nonotesfound': 'Nenhuma nota encontrada',
			'newnote': 'Novo',
			'savenotetitle': 'Título da Nota',
			'searchhint': 'Pesquisar mensagens de áudio e vídeo',
			'performingsearch': 'Pesquisando áudios e vídeos',
			'nosearchresult': 'Nenhum resultado encontrado',
			'nosearchresulthint': 'Tente inserir palavras-chave mais gerais',
			'deletenote': 'Excluir nota',
			'deletenotehint': 'Você quer deletar esta nota? Esta ação não pode ser revertida.',
			'addtoplaylist': 'Adicionar à Playlist',
			'newplaylist': 'Nova Playlist',
			'playlistitm': 'Lista de reprodução',
			'mediaaddedtoplaylist': 'Mídia adicionada à lista de reprodução.',
			'mediaremovedfromplaylist': 'Mídia removida da lista de reprodução',
			'clearplaylistmedias': 'Limpar todas as mídias',
			'deletePlayList': 'Excluir lista de reprodução',
			'clearplaylistmediashint': 'Vá em frente e remover todas as mídias desta lista de reprodução?',
			'deletePlayListhint': 'Vá em frente e exclua esta lista de reprodução e limpar todas as mídias?',
			'videomessages': 'Mensagens de Vídeo',
			'audiomessages': 'Mensagens de Áudio',
			'comments': 'Comentários',
			'replies': 'Respostas',
			'reply': 'Resposta',
			'logintoaddcomment': 'Faça login para adicionar um comentário',
			'logintoreply': 'Entre para responder',
			'writeamessage': 'Escreve uma mensagem...',
			'nocomments': 'Nenhum comentário encontrado \nclique para tentar novamente',
			'errormakingcomments': 'Não é possível processar comentários no momento..',
			'errordeletingcomments': 'Não é possível excluir este comentário no momento..',
			'erroreditingcomments': 'Não é possível editar este comentário no momento..',
			'errorloadingmorecomments': 'Não é possível carregar mais comentários no momento..',
			'deletingcomment': 'Excluindo comentário',
			'editingcomment': 'Editando comentário',
			'deletecommentalert': 'Apagar Comentário',
			'editcommentalert': 'Editar Comentário',
			'deletecommentalerttext': 'Você deseja deletar este comentário? Essa ação não pode ser desfeita',
			'loadmore': 'Carregue mais',
			'messages': 'Mensagens',
			'guestuser': 'Usuário Convidado',
			'fullname': 'Nome completo',
			'emailaddress': 'Endereço de e-mail',
			'password': 'Senha',
			'repeatpassword': 'Repita a senha',
			'register': 'Registro',
			'login': 'Conecte-se',
			'logout': 'Sair',
			'logoutfromapp': 'Sair do aplicativo?',
			'logoutfromapphint': 'Você não poderá curtir ou comentar em artigos e vídeos se não estiver logado.',
			'gotologin': 'Vá para o Login',
			'resetpassword': 'Redefinir senha',
			'logintoaccount': 'já tem uma conta? Conecte-se',
			'emptyfielderrorhint': 'Você precisa preencher todos os campos',
			'invalidemailerrorhint': 'Você precisa inserir um endereço de e-mail válido',
			'passwordsdontmatch': 'As senhas não conferem',
			'processingpleasewait': 'Processando ... Por favor aguarde',
			'createaccount': 'Crie a sua conta aqui',
			'forgotpassword': 'Esqueceu a senha?',
			'orloginwith': 'Ou faça login com',
			'facebook': 'Facebook',
			'google': 'Google',
			'moreoptions': 'Mais opções',
			'about': 'Sobre nós',
			'privacy': 'Privacidade',
			'terms': 'Termos do aplicativo',
			'rate': 'Avaliar aplicativo',
			'version': 'Versão',
			'pulluploadmore': 'puxar a carga',
			'loadfailedretry': 'Falha ao carregar! Clique em repetir!',
			'releaseloadmore': 'solte para carregar mais',
			'nomoredata': 'Sem mais dados',
			'errorReportingComment': 'Comentário do Error Reporting',
			'reportingComment': 'Comentário de relatório',
			'reportcomment': 'Opções de relatório',
			'reportCommentsList.0': 'Conteúdo comercial indesejado ou spam',
			'reportCommentsList.1': 'Pornografia ou material sexual explícito',
			'reportCommentsList.2': 'Discurso de ódio ou violência gráfica',
			'reportCommentsList.3': 'Assédio ou intimidação',
			'bookmarksMedia': 'Meus marcadores de livro',
			'noitemstodisplay': 'Nenhum item para exibir',
			'loginrequired': 'Login necessário',
			'loginrequiredhint': 'Para se inscrever nesta plataforma, você precisa estar logado. Crie uma conta gratuita agora ou faça login em sua conta existente.',
			'subscriptions': 'Assinaturas de aplicativos',
			'subscribe': 'SE INSCREVER',
			'subscribehint': 'Assinatura necessária',
			'playsubscriptionrequiredhint': 'Você precisa se inscrever antes de ouvir ou assistir a esta mídia.',
			'previewsubscriptionrequiredhint': 'Você atingiu a duração de visualização permitida para esta mídia. Você precisa se inscrever para continuar ouvindo ou assistindo esta mídia.',
			'copiedtoclipboard': 'Copiado para a área de transferência',
			'downloadbible': 'Baixe a Bíblia',
			'downloadversion': 'Baixar',
			'downloading': 'Baixando',
			'failedtodownload': 'Falhou o download',
			'pleaseclicktoretry': 'Clique para tentar novamente.',
			'of': 'Do',
			'nobibleversionshint': 'Não há dados da Bíblia para exibir, clique no botão abaixo para baixar pelo menos uma versão da Bíblia.',
			'downloaded': 'Baixado',
			'enteremailaddresstoresetpassword': 'Insira seu e-mail para redefinir sua senha',
			'backtologin': 'VOLTE AO LOGIN',
			'signintocontinue': 'Faça login para continuar',
			'signin': 'ASSINAR EM',
			'signinforanaccount': 'INSCREVA-SE PRA UMA CONTA?',
			'alreadyhaveanaccount': 'já tem uma conta?',
			'updateprofile': 'Atualizar perfil',
			'updateprofilehint': 'Para começar, atualize sua página de perfil, isso nos ajudará a conectar você com outras pessoas',
			'autoplayvideos': 'Vídeos de reprodução automática',
			'gosocial': 'Social',
			'searchbible': 'Bíblia Pesquisa',
			'filtersearchoptions': 'Opções de pesquisa de filtro',
			'narrowdownsearch': 'Use o botão de filtro abaixo para restringir a busca por um resultado mais preciso.',
			'searchbibleversion': 'Versão da Bíblia de pesquisa',
			'searchbiblebook': 'Pesquisar livro bíblico',
			'search': 'Procurar',
			'setBibleBook': 'Set Bible Book',
			'oldtestament': 'Antigo Testamento',
			'newtestament': 'Novo Testamento',
			'limitresults': 'Limite de resultados',
			'setfilters': 'Definir Filtros',
			'bibletranslator': 'Tradutor da bíblia',
			'chapter': ' Capítulo ',
			'verse': ' Versículo ',
			'translate': 'traduzir',
			'bibledownloadinfo': 'Download da Bíblia iniciado, por favor, não feche esta página até que o download seja concluído.',
			'received': 'recebido',
			'outoftotal': 'fora do total',
			'set': 'CONJUNTO',
			'selectColor': 'Selecione a cor',
			'switchbibleversion': 'Mudar a versão da Bíblia',
			'switchbiblebook': 'Trocar livro bíblico',
			'gotosearch': 'Vá para o Capítulo',
			'changefontsize': 'Mudar TAMANHO DA FONTE',
			'font': 'Fonte',
			'readchapter': 'Leia o capítulo',
			'showhighlightedverse': 'Mostrar versos em destaque',
			'downloadmoreversions': 'Baixe mais versões',
			'suggestedusers': 'Usuários sugeridos para seguir',
			'unfollow': 'Deixar de seguir',
			'follow': 'Segue',
			'searchforpeople': 'Procura por pessoas',
			'viewpost': 'Ver postagem',
			'viewprofile': 'Ver perfil',
			'mypins': 'Meus Pins',
			'viewpinnedposts': 'Ver postagens fixadas',
			'personal': 'Pessoal',
			'update': 'Atualizar',
			'phonenumber': 'Número de telefone',
			'showmyphonenumber': 'Mostrar meu número de telefone aos usuários',
			'dateofbirth': 'Data de nascimento',
			'showmyfulldateofbirth': 'Mostrar minha data de nascimento completa para as pessoas que visualizam meu status',
			'notifications': 'Notificações',
			'notifywhenuserfollowsme': 'Notifique-me quando um usuário me seguir',
			'notifymewhenusercommentsonmypost': 'Notifique-me quando usuários comentarem em minha postagem',
			'notifymewhenuserlikesmypost': 'Notifique-me quando os usuários curtirem minha postagem',
			'churchsocial': 'Igreja Social',
			'shareyourthoughts': 'Compartilhe seus pensamentos',
			'readmore': '...Consulte Mais informação',
			'less': ' Menos',
			'couldnotprocess': 'Não foi possível processar a ação solicitada.',
			'pleaseselectprofilephoto': 'Selecione uma foto de perfil para fazer upload',
			'pleaseselectprofilecover': 'Selecione uma foto de capa para fazer upload',
			'updateprofileerrorhint': 'Você precisa preencher seu nome, data de nascimento, sexo, telefone e localização antes de continuar.',
			'gender': 'Gênero',
			'male': 'Masculino',
			'female': 'Fêmeo',
			'dob': 'Data de nascimento',
			'location': 'Localização atual',
			'qualification': 'Qualificação',
			'aboutme': 'Sobre mim',
			'facebookprofilelink': 'Link do perfil do Facebook',
			'twitterprofilelink': 'Link do perfil do Twitter',
			'linkdln': 'Link do perfil Linkedln',
			'likes': 'Gosta',
			'likess': 'Gosto (s)',
			'pinnedposts': 'Minhas postagens fixadas',
			'unpinpost': 'Liberar postagem',
			'unpinposthint': 'Você deseja remover esta postagem de suas postagens fixadas?',
			'postdetails': 'Detalhes da postagem',
			'posts': 'Postagens',
			'followers': 'Seguidores',
			'followings': 'Seguidores',
			'my': 'Minhas',
			'edit': 'Editar',
			'delete': 'Excluir',
			'deletepost': 'Apague a postagem',
			'deleteposthint': 'Você deseja deletar esta postagem? As postagens ainda podem aparecer nos feeds de alguns usuários.',
			'maximumallowedsizehint': 'Máximo de upload de arquivo permitido atingido',
			'maximumuploadsizehint': 'O arquivo selecionado excede o limite de tamanho de arquivo para upload permitido.',
			'makeposterror': 'Não é possível postar no momento, por favor clique para tentar novamente.',
			'makepost': 'Fazer Postagem',
			'selectfile': 'Selecione o arquivo',
			'images': 'Imagens',
			'shareYourThoughtsNow': 'Share your thoughts ...',
			'photoviewer': 'Visualizador de fotos',
			'nochatsavailable': 'Nenhuma conversa disponível \n Clique no ícone adicionar abaixo \npara selecionar usuários para bater papo',
			'typing': 'Digitando...',
			'photo': 'Foto',
			'online': 'Conectados',
			'offline': 'Desligado',
			'lastseen': 'Visto pela última vez',
			'deleteselectedhint': 'Esta ação excluirá as mensagens selecionadas. Observe que isso exclui apenas o seu lado da conversa, \n as mensagens ainda serão exibidas no dispositivo do seu parceiro',
			'deleteselected': 'Apagar selecionado',
			'unabletofetchconversation': 'Não é possível buscar \n sua conversa com \n',
			'loadmoreconversation': 'Carregar mais conversas',
			'sendyourfirstmessage': 'Envie sua primeira mensagem para \n',
			'unblock': 'Desbloquear ',
			'block': 'Quadra ',
			'writeyourmessage': 'Escreva sua mensagem...',
			'clearconversation': 'Conversa Clara',
			'clearconversationhintone': 'Esta ação irá limpar toda a sua conversa com ',
			'clearconversationhinttwo': '.\n  Observe que isso apenas exclui o seu lado da conversa, as mensagens ainda serão exibidas no bate-papo de seus parceiros.',
			'facebookloginerror': 'Something went wrong with the login process.\n, Here is the error Facebook gave us',
			'selectLanguage': 'Selecione o idioma',
			'howTo': 'Como',
			'noBibleTextsAvailable': 'Nenhum texto bíblico disponível',
			'languages': 'Idiomas',
			'searchLanguages': 'Pesquisar idiomas...',
			'biblesFilesets': 'Bíblias: {bibles}, Conjuntos de arquivos: {filesets}',
			'oldTestament': 'Antigo Testamento',
			'newTestament': 'Novo Testamento',
			'play': 'Tocar',
			'no_verse_content': 'Nenhum conteúdo de versículo da Bíblia disponível para exibição.',
			'no_audio_content': 'Nenhum conteúdo de áudio da Bíblia disponível para exibição.',
		};
	}
}

extension on _StringsTa {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'VirtualPastor',
			'selectlanguage': 'மொழியைத் தேர்ந்தெடுக்கவும்',
			'deletemyaccount': 'என் கணக்கை நீக்கவும்',
			'deleteaccount': 'கணக்கை நீக்கவும்',
			'deleteaccounthint': 'இந்தச் செயல் உங்கள் கணக்கை நீக்கி உங்கள் அனைத்து தரவுகளையும் அகற்றும், உங்கள் தரவுகள் நீக்கப்பட்ட பிறகு, அதை மீட்க முடியாது.',
			'deleteaccountsuccess': 'கணக்கு நீக்கல் வெற்றிகரமாக முடிந்தது',
			'chooseapplanguage': 'ஆப் மொழியைத் தேர்ந்தெடுக்கவும்',
			'nightmode': 'இரவு முறை',
			'initializingapp': 'தொடங்குகிறது...',
			'home': 'முகப்பு',
			'branches': 'கிளைகள்',
			'inbox': 'இன்பாக்ஸ்',
			'downloads': 'பதிவிறக்கங்கள்',
			'settings': 'அமைப்புகள்',
			'events': 'நிகழ்வுகள்',
			'myplaylists': 'என் பிளேலிஸ்ட்கள்',
			'website': 'இணையதளம்',
			'hymns': 'பாடல்கள்',
			'articles': 'கட்டுரைகள்',
			'notes': 'குறிப்புகள்',
			'donate': 'நன்கொடைகள்',
			'offering': 'வழங்குதல்',
			'savenotetitle': 'குறிப்பு தலைப்பு',
			'nonotesfound': 'எந்தவிதமான குறிப்புகளும் கிடைக்கவில்லை',
			'newnote': 'புதியது',
			'deletenote': 'குறிப்பை நீக்கவும்',
			'deletenotehint': 'இந்த குறிப்பை நீக்க விரும்புகிறீர்களா? இந்தச் செயல் மாற்ற முடியாது.',
			'bookmarks': 'புத்தக குறியிடுதல்',
			'socialplatforms': 'சமூக ஊடகங்கள்',
			'onboardingpagetitles.0': 'எங்கள் சபையில் வருக',
			'onboardingpagetitles.1': 'விசேஷங்கள் நிறைந்தவை',
			'onboardingpagetitles.2': 'ஒலி, காணொளி \n மற்றும் நேரடி ஒளிபரப்பு',
			'onboardingpagetitles.3': 'கணக்கு உருவாக்கு',
			'onboardingpagehints.0': 'ஞாயிற்றுக்கிழமையைக் கடந்தும் உங்கள் சபையின் நான்கு சுவற்றினை கடந்தும். மொபைல் குவியலான உலகத்துடன் தொடர்பு கொள்ளவும் ஈடுபடவும் நீங்கள் தேவையான எல்லாம் உள்ளது.',
			'onboardingpagehints.1': 'உங்கள் சபை ஆப்பிற்குத் தேவையான எல்லா முன்னணி அம்சங்களையும் நாங்கள் ஒருங்கிணைத்துள்ளோம். நிகழ்வுகள், பக்தி பாடல்கள், அறிவிப்புகள், குறிப்புகள் மற்றும் பல பதிப்புகளின் பைபிள்.',
			'onboardingpagehints.2': 'உலகம் முழுவதிலுமிருந்து பயனர்களுக்கு உங்கள் சபை சேவைகளை நேரடி ஒளிபரப்புகள், ஒலிப் பதிவுகள் மற்றும் காணொளிகளைப் பார்க்க அனுமதிக்கவும்.',
			'onboardingpagehints.3': 'நிறைவற்ற வணக்க அனுபவத்திற்கான உங்கள் பயணத்தைத் தொடங்குங்கள்.',
			'next': 'அடுத்து',
			'done': 'தொடங்கு',
			'quitapp': 'ஆப்பை விட்டு வெளியேற!',
			'quitappwarning': 'ஆப்பை மூட விரும்புகிறீர்களா?',
			'quitappaudiowarning': 'நீங்கள் தற்போது ஒலியைப் பிளே செய்துகொண்டிருக்கிறீர்கள், ஆப்பை மூடுவதால் ஒலி பிளேபேக் நிறுத்தப்படும். பிளேபேக் நிறுத்த விரும்பாவிட்டால், மையப் பொத்தானைக் க்கொண்டனர் அல்லது ஆப்பை இப்போது மூட "ஓகே" பட்டனை அழுத்தவும்.',
			'ok': 'சரி',
			'retry': 'மீண்டும் முயற்சிக்கவும்',
			'oops': 'அருகில்!',
			'save': 'சேமிக்கவும்',
			'cancel': 'ரத்து செய்யவும்',
			'error': 'பிழை',
			'success': 'வெற்றி',
			'skip': 'தவிர்க்கவும்',
			'skiplogin': 'உள்நுழைவினை தவிர்க்கவும்',
			'skipregister': 'பதிவைத் தவிர்க்கவும்',
			'dataloaderror': 'தற்போது கேட்டுள்ள தரவினை ஏற்ற முடியவில்லை, உங்கள் தரவுக் குவியலைச் சரி பார்க்கவும் மற்றும் மீண்டும் முயற்சிக்கவும்.',
			'suggestedforyou': 'உங்களுக்கு பரிந்துரைக்கப்பட்டது',
			'videomessages': 'காணொளி செய்திகள்',
			'audiomessages': 'ஒலி செய்திகள்',
			'devotionals': 'பக்தி பாடல்கள்',
			'categories': 'வகைகள்',
			'category': 'வகை',
			'videos': 'காணொளிகள்',
			'audios': 'ஒலிகள்',
			'biblebooks': 'பைபிள்',
			'sermons': 'போதனைகள்',
			'tools': 'கருவிகள்',
			'profile': 'சுயவிவரம்',
			'audiobible': 'ஒலி பைபிள்',
			'homesentence': 'அனைத்து அன்பின் நண்பர்களுக்காக அன்பின் உள்ளத்தில் சிறந்த வழிகாட்டியாக, நம் ஆண்டவர் இயேசுவின் அன்பின் இயேசுவுக்காக வாழ்வோம்.',
			'livestreams': 'நேரடி ஒளிபரப்புகள்',
			'radio': 'வானொலி',
			'allitems': 'அனைத்து உருப்படிகள்',
			'emptyplaylist': 'பிளேலிஸ்ட் இல்லை',
			'notsupported': 'ஆதரிக்கவில்லை',
			'cleanupresources': 'ஆதாரங்களை சுத்தம் செய்யப்படுகிறது',
			'grantstoragepermission': 'தொடர்வதற்கு சேமிப்பு அனுமதியை வழங்கவும்',
			'sharefiletitle': 'காணவும் அல்லது கேளுங்கள் ',
			'sharefilebody': 'MyVirtualPastor ஆப் மூலம், இப்போதே பதிவிறக்கவும் ',
			'sharetext': 'எல்லா விதமான ஒலிகள் மற்றும் காணொளிகளை அனுபவிக்கவும்',
			'sharetexthint': 'உலகெங்கிலும் உள்ள மில்லியன் கணக்கான கோப்புகளைப் பார்ப்பதற்கும் கேட்பதற்கும் உங்களை அனுமதிக்கும் காணொளி மற்றும் ஒலி ஒளிபரப்பு தளத்தில் இணையவும். இப்போதே பதிவிறக்கவும்',
			'download': 'பதிவிறக்கவும்',
			'addplaylist': 'பிளேலிஸ்டில் சேர்',
			'bookmark': 'புத்தக குறியிடுதல்',
			'unbookmark': 'புத்தக குறியிடல் நீக்கவும்',
			'share': 'பகிரவும்',
			'deletemedia': 'கோப்பை நீக்கவும்',
			'deletemediahint': 'இந்த பதிவிறக்கப்பட்ட கோப்பை நீக்க விரும்புகிறீர்களா? இந்தச் செயல் திரும்ப முடியாது.',
			'searchhint': 'ஒலி மற்றும் காணொளி செய்திகளைத் தேடுங்கள்',
			'performingsearch': 'ஒலிகள் மற்றும் காணொளிகளைத் தேடுகிறது',
			'nosearchresult': 'எந்தவிதமான முடிவுகளும் கிடைக்கவில்லை',
			'nosearchresulthint': 'மேலும் பொதுவான முக்கியவார்த்தையை உள்ளிட முயலுங்கள்',
			'addtoplaylist': 'பிளேலிஸ்டில் சேர்',
			'newplaylist': 'புதிய பிளேலிஸ்ட்',
			'playlistitm': 'பிளேலிஸ்ட்',
			'mediaaddedtoplaylist': 'ஊடகம் பிளேலிஸ்டில் சேர்க்கப்பட்டுள்ளது.',
			'mediaremovedfromplaylist': 'ஊடகம் பிளேலிஸ்டில் இருந்து நீக்கப்பட்டுள்ளது',
			'clearplaylistmedias': 'அனைத்து ஊடகங்களைத் துடைக்கவும்',
			'deletePlayList': 'பிளேலிஸ்டை நீக்கவும்',
			'clearplaylistmediashint': 'இந்த பிளேலிஸ்டிலிருந்து அனைத்து ஊடகங்களையும் நீக்க விரும்புகிறீர்களா?',
			'deletePlayListhint': 'இந்த பிளேலிஸ்டை நீக்கி அனைத்து ஊடகங்களையும் துடைக்க விரும்புகிறீர்களா?',
			'comments': 'கருத்துகள்',
			'replies': 'பதில்',
			'reply': 'பதில்',
			'logintoaddcomment': 'கருத்து சேர்க்க உள்நுழைக',
			'logintoreply': 'பதிலளிக்க உள்நுழைக',
			'writeamessage': 'ஒரு செய்தியை எழுதவும்...',
			'nocomments': 'எந்தவிதமான கருத்துகளும் இல்லை \n மீண்டும் முயற்சிக்க கிளிக் செய்யவும்',
			'errormakingcomments': 'தற்போது கருத்துகளை செயலாக்க முடியவில்லை..',
			'errordeletingcomments': 'தற்போது இந்த கருத்தை நீக்க முடியவில்லை..',
			'erroreditingcomments': 'தற்போது இந்த கருத்தைத் திருத்த முடியவில்லை..',
			'errorloadingmorecomments': 'தற்போது மேலும் கருத்துகளை ஏற்ற முடியவில்லை..',
			'deletingcomment': 'கருத்து நீக்கப்படுகிறது',
			'editingcomment': 'கருத்து திருத்தப்படுகிறது',
			'deletecommentalert': 'கருத்து நீக்கவும்',
			'editcommentalert': 'கருத்து திருத்தவும்',
			'deletecommentalerttext': 'இந்த கருத்தை நீக்க விரும்புகிறீர்களா? இந்தச் செயல் திரும்ப முடியாது',
			'loadmore': 'மேலும் ஏற்றுக',
			'messages': 'செய்திகள்',
			'guestuser': 'விருந்தினர் பயனர்',
			'fullname': 'முழு பெயர்',
			'emailaddress': 'மின்னஞ்சல் முகவரி',
			'password': 'கடவுச்சொல்',
			'repeatpassword': 'கடவுச்சொல்லை மீண்டும் உள்ளிடவும்',
			'register': 'பதிவு செய்க',
			'login': 'உள்நுழைய',
			'logout': 'வெளியேறு',
			'logoutfromapp': 'ஆப்பிலிருந்து வெளியேறவா?',
			'logoutfromapphint': 'நீங்கள் உள்நுழையாவிட்டால் கட்டுரைகள் மற்றும் காணொளிகளில் நீங்கள் பிடிக்கவோ அல்லது கருத்துரையிடவோ முடியாது.',
			'gotologin': 'உள்நுழைய செல்லவும்',
			'resetpassword': 'கடவுச்சொல்லை மீட்டமை',
			'logintoaccount': 'ஏற்கனவே கணக்கு உள்ளதா? உள்நுழைய',
			'emptyfielderrorhint': 'நீங்கள் அனைத்து புலங்களையும் நிரப்ப வேண்டும்',
			'invalidemailerrorhint': 'நீங்கள் செல்லுபடியாகும் மின்னஞ்சல் முகவரியை உள்ளிட வேண்டும்',
			'passwordsdontmatch': 'கடவுச்சொற்கள் பொருந்தவில்லை',
			'processingpleasewait': 'செயலாக்குகிறது, காத்திருங்கள்...',
			'createaccount': 'ஒரு கணக்கை உருவாக்கு',
			'forgotpassword': 'கடவுச்சொல்லை மறந்துவிட்டீர்களா?',
			'orloginwith': 'அல்லது உள்நுழையவும்',
			'facebook': 'பேஸ்புக்',
			'google': 'கூகுள்',
			'moreoptions': 'மேலும் விருப்பங்கள்',
			'about': 'எங்களைப் பற்றி',
			'privacy': 'தனியுரிமைக் கொள்கை',
			'terms': 'ஆப் நிபந்தனைகள்',
			'rate': 'ஆப்பை மதிப்பீடு செய்க',
			'version': 'பதிப்பு',
			'pulluploadmore': 'மேலே இழுத்து ஏற்றவும்',
			'loadfailedretry': 'ஏற்றுதல் தோல்வி! மீண்டும் முயற்சிக்க கிளிக் செய்க!',
			'releaseloadmore': 'மேலும் ஏற்ற இழுத்து விடு',
			'nomoredata': 'மேலும் தரவுகள் இல்லை',
			'errorReportingComment': 'கருத்து அறிக்கை பிழை',
			'reportingComment': 'கருத்து அறிக்கை செய்யப்படுகிறது',
			'reportcomment': 'அறிக்கை விருப்பங்கள்',
			'reportCommentsList.0': 'தேவையற்ற வாணிப உள்ளடக்கம் அல்லது ஸ்பாம்',
			'reportCommentsList.1': 'அசிங்கமான அல்லது பாலியல் தெளிவான உள்ளடக்கம்',
			'reportCommentsList.2': 'வெறுக்கத்தக்க பேச்சு அல்லது கிராபிக் வன்முறை',
			'reportCommentsList.3': 'துன்புறுத்தல் அல்லது மிரட்டல்',
			'bookmarksMedia': 'எனது புத்தக குறியீடுகள்',
			'noitemstodisplay': 'காண்பிக்க உருப்படிகள் இல்லை',
			'loginrequired': 'உள்நுழைவு தேவையானது',
			'loginrequiredhint': 'இந்த தளத்தில் சந்தா செலுத்த, உள்நுழைய வேண்டும். இப்போது இலவச கணக்கை உருவாக்குங்கள் அல்லது உங்கள் ஏற்கனவே உள்ள கணக்கில் உள்நுழையுங்கள்.',
			'subscriptions': 'ஆப் சந்தாக்கள்',
			'subscribe': 'சந்தா',
			'subscribehint': 'சந்தா தேவையானது',
			'playsubscriptionrequiredhint': 'இந்த ஊடகத்தை கேட்க அல்லது பார்க்க, நீங்கள் சந்தா செலுத்த வேண்டும்.',
			'previewsubscriptionrequiredhint': 'இந்த ஊடகத்திற்கு அனுமதிக்கப்பட்ட முன்னோட்ட காலத்தை நீங்கள் முடித்து விட்டீர்கள். கேட்க அல்லது பார்க்க, நீங்கள் சந்தா செலுத்த வேண்டும்.',
			'copiedtoclipboard': 'கிளிப்போர்டுக்கு நகலெடுக்கப்பட்டது',
			'downloadbible': 'பைபிளை பதிவிறக்கவும்',
			'downloadversion': 'பதிவு',
			'downloading': 'பதிவிறக்கப்படுகிறது',
			'failedtodownload': 'பதிவிறக்கம் தோல்வி',
			'pleaseclicktoretry': 'மீண்டும் முயற்சிக்க தயவுசெய்து கிளிக் செய்யவும்.',
			'of': 'இல்',
			'nobibleversionshint': 'காண்பிக்க பைபிள் தரவுகள் இல்லை, குறைந்தது ஒரு பைபிள் பதிப்பை பதிவிறக்க, கீழே உள்ள பொத்தானை கிளிக் செய்க.',
			'downloaded': 'பதிவிறக்கம் முடிந்தது',
			'enteremailaddresstoresetpassword': 'உங்கள் கடவுச்சொல்லை மீட்டமை செய்ய உங்கள் மின்னஞ்சல் முகவரியை உள்ளிடுங்கள்',
			'backtologin': 'உள்நுழைய திரும்பவும்',
			'signintocontinue': 'தொடர உள்நுழைக',
			'signin': 'உள்நுழைய',
			'signinforanaccount': 'ஒரு கணக்கை உருவாக்க உள்நுழைக?',
			'alreadyhaveanaccount': 'ஏற்கனவே ஒரு கணக்கு உள்ளதா?',
			'updateprofile': 'சுயவிவரத்தைப் புதுப்பிக்கவும்',
			'updateprofilehint': 'தொடங்க, தயவுசெய்து உங்கள் சுயவிவர பக்கத்தை புதுப்பிக்கவும், இது மற்றவர்களுடன் நீங்கள் தொடர்பு கொள்ள உதவும்',
			'autoplayvideos': 'தானியங்கி விளையாட்டு வீடியோக்கள்',
			'gosocial': 'சமூகத்திற்கு செல்லவும்',
			'searchbible': 'பைபிள் தேடல்',
			'filtersearchoptions': 'தேடல் விருப்பங்களை வடிகட்டி',
			'narrowdownsearch': 'மேலும் துல்லியமான முடிவுக்கு தேடலை குறைக்க கீழே உள்ள வடிகட்டி பொத்தானை பயன்படுத்தவும்.',
			'searchbibleversion': 'பைபிள் பதிப்பு தேடல்',
			'searchbiblebook': 'பைபிள் புத்தகம் தேடல்',
			'search': 'தேடல்',
			'setBibleBook': 'பைபிள் புத்தகம் அமைக்கவும்',
			'oldtestament': 'பழைய ஏற்பாடு',
			'newtestament': 'புதிய ஏற்பாடு',
			'limitresults': 'முடிவுகளை மட்டுப்படுத்தவும்',
			'setfilters': 'வடிகட்டிகளை அமைக்கவும்',
			'bibletranslator': 'பைபிள் மொழிபெயர்ப்பாளர்',
			'chapter': ' அதிகாரம் ',
			'verse': ' வசனம் ',
			'translate': 'மொழிபெயர்க்கவும்',
			'bibledownloadinfo': 'பைபிள் பதிவிறக்கம் தொடங்கியது, பதிவிறக்கம் முடியும் வரை இந்த பக்கத்தை மூடாதீர்கள்.',
			'received': 'பெறப்பட்டது',
			'outoftotal': 'மொத்தத்தில் இருந்து',
			'set': 'அமைக்கவும்',
			'selectColor': 'நிறத்தைத் தேர்ந்தெடுக்கவும்',
			'switchbibleversion': 'பைபிள் பதிப்பை மாற்றவும்',
			'switchbiblebook': 'பைபிள் புத்தகத்தை மாற்றவும்',
			'gotosearch': 'அதிகாரத்திற்கு செல்',
			'changefontsize': 'எழுத்துரு அளவை மாற்றவும்',
			'font': 'எழுத்துரு',
			'readchapter': 'அதிகாரம் படிக்கவும்',
			'showhighlightedverse': 'முக்கிய வசனங்களை காட்டு',
			'downloadmoreversions': 'மேலும் பதிப்புகளை பதிவிறக்கவும்',
			'suggestedusers': 'பின்பற்ற பரிந்துரைக்கப்பட்ட பயனர்கள்',
			'unfollow': 'பின்தொடர வேண்டாம்',
			'follow': 'பின்தொடரவும்',
			'searchforpeople': 'மக்களைத் தேடுங்கள்',
			'viewpost': 'பதிவைப் பார்க்கவும்',
			'viewprofile': 'சுயவிவரத்தைப் பார்க்கவும்',
			'mypins': 'எனது பின்கள்',
			'viewpinnedposts': 'பின்னப்பட்ட பதிவுகளைப் பார்க்கவும்',
			'personal': 'தனிப்பட்ட',
			'update': 'புதுப்பிக்கவும்',
			'phonenumber': 'தொலைபேசி எண்',
			'showmyphonenumber': 'பயனர்களுக்கு என்னுடைய தொலைபேசி எண்ணை காட்டவும்',
			'dateofbirth': 'பிறந்த தேதி',
			'showmyfulldateofbirth': 'என்னுடைய நிலையைப் பார்ப்பவர்களுக்கு என்னுடைய முழு பிறந்த தேதியை காட்டவும்',
			'notifications': 'அறிவிப்புகள்',
			'notifywhenuserfollowsme': 'யாரேனும் பயனர் என்னை பின்தொடரும்போது என்னை அறிவிக்கவும்',
			'notifymewhenusercommentsonmypost': 'பயனர்கள் என்னுடைய பதிவுகளில் கருத்துரைக்கும்போது என்னை அறிவிக்கவும்',
			'notifymewhenuserlikesmypost': 'பயனர்கள் என்னுடைய பதிவுகளை விரும்பினால் என்னை அறிவிக்கவும்',
			'churchsocial': 'சர்ச் சோஷியல்',
			'shareyourthoughts': 'உங்கள் கருத்துகளைப் பகிரவும்',
			'readmore': '...மேலும் படிக்கவும்',
			'less': ' குறைவாக',
			'couldnotprocess': 'கோரிய செயல்முறையை செயலாக்க முடியவில்லை.',
			'pleaseselectprofilephoto': 'பதிவேற்ற ஒன்றைத் தேர்வுசெய்யவும்',
			'pleaseselectprofilecover': 'தயவுசெய்து ஒரு கவர் புகைப்படத்தைத் தேர்வுசெய்யவும்',
			'updateprofileerrorhint': 'தொடர்வதற்கு உங்கள் பெயர், பிறந்த தேதி, பாலினம், தொலைபேசி மற்றும் இருப்பிடம் ஆகியவற்றை நிரப்ப வேண்டும்.',
			'gender': 'பாலினம்',
			'male': 'ஆண்',
			'female': 'பெண்',
			'dob': 'பிறந்த தேதி',
			'location': 'தற்போதைய இருப்பிடம்',
			'qualification': 'தகுதி',
			'aboutme': 'என்னை பற்றி',
			'facebookprofilelink': 'பேஸ்புக் ப்ரொஃபைல் லிங்க்',
			'twitterprofilelink': 'ட்விட்டர் ப்ரொஃபைல் லிங்க்',
			'linkdln': 'லிங்க்டின் ப்ரொஃபைல் லிங்க்',
			'likes': 'விருப்பம்',
			'likess': 'விருப்பங்கள்',
			'pinnedposts': 'பின் செய்யப்பட்ட பதிவுகள்',
			'unpinpost': 'பின்னப்பட்ட பதிவை அகற்றுங்கள்',
			'unpinposthint': 'இந்த பதிவை உங்கள் பின்னப்பட்ட பதிவுகளில் இருந்து அகற்ற விரும்புகிறீர்களா?',
			'postdetails': 'பதிவு விவரங்கள்',
			'posts': 'பதிவுகள்',
			'followers': 'பின்தொடர்பவர்கள்',
			'followings': 'பின்தொடர்பவர்கள்',
			'my': 'எனது',
			'edit': 'தொகு',
			'delete': 'நீக்கு',
			'deletepost': 'பதிவை நீக்கு',
			'deleteposthint': 'இந்த பதிவை நீக்க விரும்புகிறீர்களா? பதிவுகள் இன்னும் சில பயனர்களின் பிணைகளில் தோன்றலாம்.',
			'maximumallowedsizehint': 'அனுமதிக்கப்பட்ட பதிவேற்ற கோப்பு அளவு எல்லையை எட்டியது',
			'maximumuploadsizehint': 'தேர்ந்தெடுக்கப்பட்ட கோப்பு அனுமதிக்கப்பட்ட பதிவேற்ற கோப்பு அளவுக்குச் சற்று அதிகமாக உள்ளது.',
			'makeposterror': 'இந்த நேரத்தில் பதிவிட முடியவில்லை, மீண்டும் முயற்சிக்க கிளிக் செய்யவும்.',
			'makepost': 'பதிவிடு',
			'selectfile': 'கோப்பைத் தேர்ந்தெடுக்கவும்',
			'images': 'படங்கள்',
			'shareYourThoughtsNow': 'உங்கள் கருத்துகளை இப்போதே பகிரவும்...',
			'photoviewer': 'புகைப்பட பார்வையாளர்',
			'nochatsavailable': 'கிடைக்கக்கூடிய உரையாடல்கள் இல்லை \n சேர்க்க பைசன் ஆல் உரையாடலைத் தேர்வு செய்ய \n கீழே உள்ள ஐகானை கிளிக் செய்யவும்',
			'typing': 'தட்டச்சு செய்கிறது...',
			'photo': 'புகைப்படம்',
			'online': 'நிகழ்நிலை',
			'offline': 'ஆஃப்லைன்',
			'lastseen': 'கடைசியாக காணப்பட்டது',
			'deleteselectedhint': 'இந்த செயல் தேர்ந்தெடுக்கப்பட்ட செய்திகளை நீக்கிவிடும். தயவுசெய்து கவனிக்கவும், இது உங்கள் பக்கத்தின் உரையாடலை மட்டுமே நீக்கிவிடும்,\n செய்திகள் இன்னும் உங்கள் நண்பரின் சாதனத்தில் தோன்றும்.',
			'deleteselected': 'தேர்ந்தெடுக்கப்பட்டதை நீக்கவும்',
			'unabletofetchconversation': 'உங்களின் உரையாடலை பெற முடியவில்லை \n',
			'loadmoreconversation': 'மேலும் உரையாடலை ஏற்றவும்',
			'sendyourfirstmessage': 'உங்கள் முதல் செய்தியை அனுப்புங்கள் \n',
			'unblock': 'தடையை நீக்கு ',
			'block': 'தடை செய்',
			'writeyourmessage': 'உங்கள் செய்தியை எழுதுங்கள்...',
			'clearconversation': 'உரையாடலைத் தூக்கு',
			'clearconversationhintone': 'இந்த செயல் உங்களின் அனைத்து உரையாடல்களையும் தூக்கிவிடும் ',
			'clearconversationhinttwo': '.\n தயவுசெய்து கவனிக்கவும், இது உங்கள் பக்கத்தின் உரையாடலை மட்டுமே நீக்கிவிடும், செய்திகள் இன்னும் உங்கள் நண்பரின் சாதனத்தில் தோன்றும்.',
			'facebookloginerror': 'உள்நுழைவு செயல்முறையில் ஏதோ தவறாகிவிட்டது.\n இதோ இங்கே பேஸ்புக் நமக்கு கொடுத்த பிழை',
			'selectLanguage': 'மொழியைத் தேர்ந்தெடுக்கவும்',
			'howTo': 'எப்படி',
			'noBibleTextsAvailable': 'யாதொரு பைபிள் உரைகளும் கிடைக்கவில்லை',
			'languages': 'மொழிகள்',
			'searchLanguages': 'மொழிகளைத் தேடுங்கள்...',
			'biblesFilesets': 'பைபிள்கள்: {bibles}, கோப்புகளின் தொகுப்புகள்: {filesets}',
			'oldTestament': 'பழைய ஏற்பாடு',
			'newTestament': 'புதிய ஏற்பாடு',
			'play': 'விளையாடு',
			'no_verse_content': 'காட்ட Bible வசன உள்ளடக்கம் கிடைக்கவில்லை.',
			'no_audio_content': 'காட்ட Bible ஆடியோ உள்ளடக்கம் கிடைக்கவில்லை.',
		};
	}
}

extension on _StringsTe {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'VirtualPastor',
			'selectlanguage': 'భాషను ఎంచుకోండి',
			'deletemyaccount': 'నా ఖాతాను తొలగించండి',
			'deleteaccount': 'ఖాతాను తొలగించండి',
			'deleteaccounthint': 'ఈ చర్య మీ ఖాతాను తొలగించి మీ అన్ని డేటాను తొలగిస్తుంది, ఒకసారి మీ డేటా తొలగించబడితే, అది తిరిగి పొందబడదు.',
			'deleteaccountsuccess': 'ఖాతా తొలగించడం విజయవంతమైంది',
			'chooseapplanguage': 'యాప్ భాషను ఎంచుకోండి',
			'nightmode': 'రాత్రి మోడ్',
			'initializingapp': 'ఆరంభిస్తుంది...',
			'home': 'హోమ్',
			'branches': 'శాఖలు',
			'inbox': 'ఇన్బాక్స్',
			'downloads': 'డౌన్లోడ్లు',
			'settings': 'సెట్టింగ్‌లు',
			'events': 'ఈవెంట్‌లు',
			'myplaylists': 'నా ప్లేలిస్ట్‌లు',
			'website': 'వెబ్‌సైట్',
			'hymns': 'హిమ్స్',
			'articles': 'ఆర్టికల్‌లు',
			'notes': 'నోట్‌లు',
			'donate': 'దానం చేయండి',
			'offering': 'అర్పణ',
			'savenotetitle': 'నోట్ టైటిల్',
			'nonotesfound': 'నోట్‌లు కనుగొనబడలేదు',
			'newnote': 'కొత్తది',
			'deletenote': 'నోట్ తొలగించండి',
			'deletenotehint': 'మీరు ఈ నోట్‌ను తొలగించాలనుకుంటున్నారా? ఈ చర్యను తిరిగి చేయడం సాధ్యంకాదు.',
			'bookmarks': 'బుక్మార్క్‌లు',
			'socialplatforms': 'సోషల్ ప్లాట్‌ఫారమ్‌లు',
			'onboardingpagetitles.0': 'మన చర్చిలోకి స్వాగతం',
			'onboardingpagetitles.1': 'ఫీచర్‌లతో నిండినవి',
			'onboardingpagetitles.2': 'ఆడియో, వీడియో \n మరియు లైవ్ స్ట్రీమింగ్',
			'onboardingpagetitles.3': 'ఖాతాను సృష్టించండి',
			'onboardingpagehints.0': 'ఆదివారం ఉదయాలు మరియు మీ చర్చి యొక్క నాలుగు గోడలపైకి వ్యాపించండి. మొబైల్-కేంద్రిత ప్రపంచంతో సంభాషించడానికి మరియు నిమగ్నం చేయడానికి మీకు అవసరమైన అన్ని ఉన్నవి.',
			'onboardingpagehints.1': 'మీ చర్చి యాప్‌లో ఉండవలసిన టాప్ ఫీచర్‌లన్నింటినీ మేము కలిపి తీసుకొచ్చాము. ఈవెంట్‌లు, భక్తిగీతాలు, నోటిఫికేషన్‌లు, నోట్‌లు మరియు మల్టీ-వర్షన్ బైబిల్.',
			'onboardingpagehints.2': 'ప్రపంచవ్యాప్తంగా ఉన్న వినియోగదారులు మీ చర్చి సేవల లైవ్ స్ట్రీమింగ్‌లను చూడటానికి, ఆడియో సందేశాలను వినటానికి మరియు వీడియోలను చూడటానికి అనుమతించండి.',
			'onboardingpagehints.3': 'ఎంతైనా ఆరాధన అనుభవం ప్రారంభించండి.',
			'next': 'తరువాత',
			'done': 'ప్రారంభించు',
			'quitapp': 'యాప్ క్విట్ చేయండి!',
			'quitappwarning': 'మీరు యాప్ క్విట్ చేయాలనుకుంటున్నారా?',
			'quitappaudiowarning': 'మీరు ప్రస్తుతం ఒక ఆడియోని ప్లే చేస్తున్నారు, యాప్ క్విట్ చేయడం ఆడియో ప్లేబ్యాక్‌ను నిలిపివేస్తుంది. ప్లేబ్యాక్‌ను నిలిపివేయకూడదని భావిస్తే, కేవలం యాప్‌ను సెంటర్ బటన్‌తో మినిమైజ్ చేయండి లేదా యాప్‌ను ఇప్పుడు క్విట్ చేయడానికి ఓకే బటన్ క్లిక్ చేయండి.',
			'ok': 'సరే',
			'retry': 'మళ్లీ ప్రయత్నించండి',
			'oops': 'ఓహ్!',
			'save': 'సేవ్ చేయండి',
			'cancel': 'రద్దు చేయండి',
			'error': 'లోపం',
			'success': 'విజయం',
			'skip': 'దాటండి',
			'skiplogin': 'లాగిన్‌ను దాటండి',
			'skipregister': 'నమోదును దాటండి',
			'dataloaderror': 'ప్రస్తుత సమయంలో అభ్యర్థించిన డేటాను లోడ్ చేయలేము, మీ డేటా కనెక్షన్‌ను తనిఖీ చేసి మళ్లీ ప్రయత్నించడానికి క్లిక్ చేయండి.',
			'suggestedforyou': 'మీ కోసం సిఫార్సు చేయబడింది',
			'videomessages': 'వీడియో సందేశాలు',
			'audiomessages': 'ఆడియో సందేశాలు',
			'devotionals': 'భక్తిగీతాలు',
			'categories': 'వర్గాలు',
			'category': 'వర్గం',
			'videos': 'వీడియోలు',
			'audios': 'ఆడియోలు',
			'biblebooks': 'బైబిల్',
			'sermons': 'ప్రవచనలు',
			'tools': 'ఉపకరణాలు',
			'profile': 'ప్రొఫైల్',
			'audiobible': 'ఆడియో బైబిల్',
			'homesentence': 'మీరు దేవుని పిలుపు పొందిన వ్యక్తిగా మారటానికి మీ పాస్టర్ కోసం 1 సంవత్సరం.',
			'livestreams': 'లైవ్ స్ట్రీమ్స్',
			'radio': 'రేడియో',
			'allitems': 'అన్ని అంశాలు',
			'emptyplaylist': 'ప్లేలిస్ట్‌లు లేవు',
			'notsupported': 'మద్దతు ఇవ్వబడలేదు',
			'cleanupresources': 'వనరులను శుభ్రపరుస్తున్నారు',
			'grantstoragepermission': 'కొనసాగించడానికి దయచేసి స్టోరేజ్ అనుమతిని అనుమతించండి',
			'sharefiletitle': 'చూడండి లేదా వినండి ',
			'sharefilebody': 'MyVirtualPastor యాప్ ద్వారా, ఇప్పుడు డౌన్లోడ్ చేయండి ',
			'sharetext': 'అనంతమైన ఆడియో & వీడియో స్ట్రీమింగ్‌ను ఆనందించండి',
			'sharetexthint': 'ప్రపంచవ్యాప్తంగా ఉన్న లక్షల సంఖ్యలో ఫైళ్లను చూడటానికి మరియు వినడానికి మీకు అనుమతించే వీడియో మరియు ఆడియో స్ట్రీమింగ్ ప్లాట్‌ఫారమ్‌లో చేరండి. ఇప్పుడు డౌన్లోడ్ చేయండి ',
			'download': 'డౌన్లోడ్ చేయండి',
			'addplaylist': 'ప్లేలిస్ట్‌లో జోడించండి',
			'bookmark': 'బుక్‌మార్క్',
			'unbookmark': 'బుక్‌మార్క్ తొలగించండి',
			'share': 'పంచుకోండి',
			'deletemedia': 'ఫైల్ తొలగించండి',
			'deletemediahint': 'ఈ డౌన్లోడ్ చేసిన ఫైల్‌ని మీరు తొలగించాలనుకుంటున్నారా? ఈ చర్య తిరిగి చేయలేము.',
			'searchhint': 'ఆడియో & వీడియో సందేశాలను వెతకండి',
			'performingsearch': 'ఆడియోలను మరియు వీడియోలను వెతుకుతున్నాము',
			'nosearchresult': 'ఫలితాలు లభించలేదు',
			'nosearchresulthint': 'సాధారణ కీవర్డ్‌ని నమోదు చేయడానికి ప్రయత్నించండి',
			'addtoplaylist': 'ప్లేలిస్ట్‌లో చేర్చు',
			'newplaylist': 'కొత్త ప్లేలిస్ట్',
			'playlistitm': 'ప్లేలిస్ట్',
			'mediaaddedtoplaylist': 'మీడియాను ప్లేలిస్ట్‌లో చేర్చారు.',
			'mediaremovedfromplaylist': 'మీడియాను ప్లేలిస్ట్ నుండి తొలగించారు',
			'clearplaylistmedias': 'అన్ని మీడియాను క్లియర్ చేయండి',
			'deletePlayList': 'ప్లేలిస్ట్ తొలగించండి',
			'clearplaylistmediashint': 'ఈ ప్లేలిస్ట్ నుండి అన్ని మీడియాను తొలగించాలనుకుంటున్నారా?',
			'deletePlayListhint': 'ఈ ప్లేలిస్ట్‌ను తొలగించి అన్ని మీడియాను క్లియర్ చేయాలనుకుంటున్నారా?',
			'comments': 'కామెంట్స్',
			'replies': 'ప్రత్యుత్తరాలు',
			'reply': 'ప్రత్యుత్తరం',
			'logintoaddcomment': 'కామెంట్ చేయడానికి లాగిన్ చేయండి',
			'logintoreply': 'ప్రత్యుత్తరం ఇవ్వడానికి లాగిన్ చేయండి',
			'writeamessage': 'ఒక సందేశం రాయండి...',
			'nocomments': 'కామెంట్స్ కనుగొనబడలేదు \nమళ్ళీ ప్రయత్నించడానికి క్లిక్ చేయండి',
			'errormakingcomments': 'ప్రస్తుతం కామెంట్ చేయడం సాధ్యం కాదు..',
			'errordeletingcomments': 'ప్రస్తుతం ఈ కామెంట్‌ని తొలగించడం సాధ్యం కాదు..',
			'erroreditingcomments': 'ప్రస్తుతం ఈ కామెంట్‌ని సవరించడం సాధ్యం కాదు..',
			'errorloadingmorecomments': 'ప్రస్తుతం మరిన్ని కామెంట్‌లను లోడ్ చేయడం సాధ్యం కాదు..',
			'deletingcomment': 'కామెంట్ తొలగించబడుతోంది',
			'editingcomment': 'కామెంట్ సవరించబడుతోంది',
			'deletecommentalert': 'కామెంట్ తొలగించు',
			'editcommentalert': 'కామెంట్ సవరించు',
			'deletecommentalerttext': 'మీరు ఈ కామెంట్‌ను తొలగించాలనుకుంటున్నారా? ఈ చర్యను తిరిగి చేయడం సాధ్యంకాదు',
			'loadmore': 'మరిన్ని లోడ్ చేయండి',
			'messages': 'సందేశాలు',
			'guestuser': 'అతిథి యూజర్',
			'fullname': 'పూర్తి పేరు',
			'emailaddress': 'ఈమెయిల్ చిరునామా',
			'password': 'పాస్వర్డ్',
			'repeatpassword': 'పాస్వర్డ్ మళ్లీ ఎంటర్ చేయండి',
			'register': 'నమోదు చేయండి',
			'login': 'లాగిన్ చేయండి',
			'logout': 'లాగ్ అవుట్ చేయండి',
			'logoutfromapp': 'యాప్ నుండి లాగ్ అవుట్?',
			'logoutfromapphint': 'మీరు లాగిన్ చేయకపోతే మీరు వ్యాసాలు మరియు వీడియోలపై లైక్ చేయడం లేదా కామెంట్ చేయడం సాధ్యం కాదు.',
			'gotologin': 'లాగిన్ చేయడానికి వెళ్ళండి',
			'resetpassword': 'పాస్వర్డ్ రీసెట్ చేయండి',
			'logintoaccount': 'ఇప్పటికే ఖాతా ఉందా? లాగిన్ చేయండి',
			'emptyfielderrorhint': 'మీరు అన్ని ఫీల్డ్‌లను నింపాలి',
			'invalidemailerrorhint': 'మీరు చెల్లుబాటు అయ్యే ఇమెయిల్ చిరునామాను ఎంటర్ చేయాలి',
			'passwordsdontmatch': 'పాస్వర్డ్‌లు సరిపోలడం లేదు',
			'processingpleasewait': 'ప్రాసెసింగ్, దయచేసి వేచి ఉండండి...',
			'createaccount': 'ఖాతాను సృష్టించు',
			'forgotpassword': 'పాస్వర్డ్ మర్చిపోయారా?',
			'orloginwith': 'లేదా తో లాగిన్ చేయండి',
			'facebook': 'ఫేస్‌బుక్',
			'google': 'గూగుల్',
			'moreoptions': 'మరిన్ని ఎంపికలు',
			'about': 'మా గురించి',
			'privacy': 'ప్రైవసీ పాలసీ',
			'terms': 'యాప్ షరతులు',
			'rate': 'యాప్ రేట్ చేయండి',
			'version': 'వర్షన్',
			'pulluploadmore': 'పైకి లాగి లోడ్ చేయండి',
			'loadfailedretry': 'లోడ్ విఫలమైంది! మళ్ళీ ప్రయత్నించండి!',
			'releaseloadmore': 'మరిన్ని లోడ్ చేయడానికి విడుదల చేయండి',
			'nomoredata': 'ఇంకా డేటా లేదు',
			'errorReportingComment': 'కామెంట్ రిపోర్ట్ లోపం',
			'reportingComment': 'కామెంట్ రిపోర్ట్ చేయబడుతోంది',
			'reportcomment': 'రిపోర్ట్ ఎంపికలు',
			'reportCommentsList.0': 'అవాంఛిత వాణిజ్య కంటెంట్ లేదా స్పామ్',
			'reportCommentsList.1': 'అశ్లీల లేదా లైంగిక స్పష్టత కలిగిన కంటెంట్',
			'reportCommentsList.2': 'పగతో కూడిన ప్రసంగం లేదా గ్రాఫిక్ హింస',
			'reportCommentsList.3': 'హింస లేదా దౌర్జన్యం',
			'bookmarksMedia': 'నా బుక్మార్క్‌లు',
			'noitemstodisplay': 'చూపించడానికి అంశాలు లేవు',
			'loginrequired': 'లాగిన్ అవసరం',
			'loginrequiredhint': 'ఈ ప్లాట్‌ఫారమ్‌లో చందా సబ్స్క్రైబ్ చేయడానికి, మీరు లాగిన్ చేయాలి. ఉచిత ఖాతాను సృష్టించండి లేదా మీ ప్రస్తుత ఖాతాలో లాగిన్ చేయండి.',
			'subscriptions': 'యాప్ సబ్‌స్క్రిప్షన్‌లు',
			'subscribe': 'చందా',
			'subscribehint': 'చందా అవసరం',
			'playsubscriptionrequiredhint': 'ఈ మీడియాను వినడానికి లేదా చూడడానికి మీరు చందా అవసరం.',
			'previewsubscriptionrequiredhint': 'మీరు ఈ మీడియా కోసం అనుమతించిన ప్రివ్యూ వ్యవధికి చేరుకున్నారు. వినడానికి లేదా చూడడానికి మీరు చందా అవసరం.',
			'copiedtoclipboard': 'క్లిప్‌బోర్డ్‌కి కాపీ చేయబడింది',
			'downloadbible': 'బైబిల్ డౌన్లోడ్ చేయండి',
			'downloadversion': 'డౌన్లోడ్ చేయండి',
			'downloading': 'డౌన్లోడ్ అవుతోంది',
			'failedtodownload': 'డౌన్లోడ్ విఫలమైంది',
			'pleaseclicktoretry': 'దయచేసి మళ్ళీ ప్రయత్నించడానికి క్లిక్ చేయండి.',
			'of': 'యొక్క',
			'nobibleversionshint': 'చూపించడానికి బైబిల్ డేటా లేదు, కనీసం ఒక బైబిల్ వెర్షన్‌ని డౌన్‌లోడ్ చేయడానికి క్రింది బటన్‌ని క్లిక్ చేయండి.',
			'downloaded': 'డౌన్లోడ్ చేయబడింది',
			'enteremailaddresstoresetpassword': 'మీ పాస్‌వర్డ్‌ని రీసెట్ చేయడానికి మీ ఇమెయిల్ చిరునామాను నమోదు చేయండి',
			'backtologin': 'లాగిన్‌కు తిరిగి వెళ్ళండి',
			'signintocontinue': 'కొనసాగించడానికి సైన్ ఇన్ చేయండి',
			'signin': 'సైన్ ఇన్',
			'signinforanaccount': 'ఒక ఖాతాకు సైన్ అప్ చేయండి?',
			'alreadyhaveanaccount': 'ఇప్పటికే ఒక ఖాతా ఉందా?',
			'updateprofile': 'ప్రొఫైల్‌ను నవీకరించండి',
			'updateprofilehint': 'ప్రారంభించడానికి, దయచేసి మీ ప్రొఫైల్ పేజీని నవీకరించండి, ఇది మమ్మల్ని ఇతరులతో కనెక్ట్ చేయడానికి సహాయపడుతుంది',
			'autoplayvideos': 'ఆటోప్లే వీడియోలు',
			'gosocial': 'సోషియల్‌కి వెళ్ళండి',
			'searchbible': 'బైబిల్‌ని శోధించండి',
			'filtersearchoptions': 'శోధన ఎంపికలను ఫిల్టర్ చేయండి',
			'narrowdownsearch': 'ప్రమాణవంతమైన ఫలితానికి కింది ఫిల్టర్ బటన్‌ను ఉపయోగించి శోధనను కుదించండి.',
			'searchbibleversion': 'బైబిల్ వెర్షన్ శోధించండి',
			'searchbiblebook': 'బైబిల్ పుస్తకం శోధించండి',
			'search': 'శోధన',
			'setBibleBook': 'బైబిల్ పుస్తకాన్ని సెట్ చేయండి',
			'oldtestament': 'పాత నిబంధన',
			'newtestament': 'క్రొత్త నిబంధన',
			'limitresults': 'ఫలితాలను పరిమితం చేయండి',
			'setfilters': 'ఫిల్టర్‌లను సెట్ చేయండి',
			'bibletranslator': 'బైబిల్ అనువాదకుడు',
			'chapter': ' అధ్యాయం ',
			'verse': ' వచనం ',
			'translate': 'అనువదించు',
			'bibledownloadinfo': 'బైబిల్ డౌన్‌లోడ్ ప్రారంభమైంది, డౌన్‌లోడ్ పూర్తయ్యే వరకు ఈ పేజీని మూసివేయవద్దు.',
			'received': 'ప్రాప్తి',
			'outoftotal': 'మొత్తం నుండి',
			'set': 'సెట్',
			'selectColor': 'రంగును ఎంచుకోండి',
			'switchbibleversion': 'బైబిల్ వెర్షన్ మార్చండి',
			'switchbiblebook': 'బైబిల్ పుస్తకాన్ని మార్చండి',
			'gotosearch': 'అధ్యాయానికి వెళ్ళండి',
			'changefontsize': 'అక్షరరూప పరిమాణాన్ని మార్చండి',
			'font': 'అక్షరరూపం',
			'readchapter': 'అధ్యాయం చదవండి',
			'showhighlightedverse': 'హైలైట్ చేసిన వచనాలను చూపించు',
			'downloadmoreversions': 'మరిన్ని వెర్షన్‌లను డౌన్‌లోడ్ చేయండి',
			'suggestedusers': 'అనుసరించడానికి సూచించిన వినియోగదారులు',
			'unfollow': 'అనుసరించవద్దు',
			'follow': 'అనుసరించండి',
			'searchforpeople': 'వ్యక్తులను శోధించండి',
			'viewpost': 'పోస్ట్‌ని చూడండి',
			'viewprofile': 'ప్రొఫైల్‌ని చూడండి',
			'mypins': 'నా పిన్స్',
			'viewpinnedposts': 'పిన్న్ చేసిన పోస్ట్‌లను చూడండి',
			'personal': 'వ్యక్తిగత',
			'update': 'నవీకరించు',
			'phonenumber': 'ఫోన్ నంబర్',
			'showmyphonenumber': 'వినియోగదారులకు నా ఫోన్ నంబర్ చూపించు',
			'dateofbirth': 'పుట్టిన తేది',
			'showmyfulldateofbirth': 'నా స్థితిని వీక్షిస్తున్న వ్యక్తులకు నా పూర్తి పుట్టిన తేది చూపించు',
			'notifications': 'నోటిఫికేషన్లు',
			'notifywhenuserfollowsme': 'వినియోగదారుడు నన్ను అనుసరించినప్పుడు నన్ను తెలియజేయండి',
			'notifymewhenusercommentsonmypost': 'వినియోగదారులు నా పోస్ట్‌లపై కామెంట్ చేసినప్పుడు నన్ను తెలియజేయండి',
			'notifymewhenuserlikesmypost': 'వినియోగదారులు నా పోస్ట్‌లను లైక్ చేసినప్పుడు నన్ను తెలియజేయండి',
			'churchsocial': 'చర్చ్ సోషల్',
			'shareyourthoughts': 'మీ ఆలోచనలను పంచుకోండి',
			'readmore': '...మరింత చదవండి',
			'less': ' తక్కువ',
			'couldnotprocess': 'అభ్యర్థనను ప్రాసెస్ చేయడం సాధ్యంకాలేదు.',
			'pleaseselectprofilephoto': 'అప్‌లోడ్ చేయడానికి ప్రొఫైల్ ఫోటోను ఎంచుకోండి',
			'pleaseselectprofilecover': 'దయచేసి కవర్ ఫోటోను ఎంచుకోండి',
			'updateprofileerrorhint': 'కొనసాగించడానికి మీ పేరు, పుట్టిన తేది, లింగం, ఫోన్ మరియు ప్రదేశాన్ని పూర్తి చేయాలి.',
			'gender': 'లింగం',
			'male': 'పురుషుడు',
			'female': 'స్త్రీ',
			'dob': 'పుట్టిన తేదీ',
			'location': 'ప్రస్తుత స్థానం',
			'qualification': 'అర్హత',
			'aboutme': 'నా గురించి',
			'facebookprofilelink': 'ఫేస్బుక్ ప్రొఫైల్ లింక్',
			'twitterprofilelink': 'ట్విట్టర్ ప్రొఫైల్ లింక్',
			'linkdln': 'లింక్డిన్ ప్రొఫైల్ లింక్',
			'likes': 'ఇష్టాలు',
			'likess': 'ఇష్టాలు',
			'pinnedposts': 'పిన్నెడ్ పోస్ట్‌లు',
			'unpinpost': 'పిన్నెడ్ పోస్ట్‌ని తీసివేయి',
			'unpinposthint': 'ఈ పోస్ట్‌ని మీ పిన్నెడ్ పోస్ట్‌ల నుండి తీసివేయాలనుకుంటున్నారా?',
			'postdetails': 'పోస్ట్ వివరాలు',
			'posts': 'పోస్ట్‌లు',
			'followers': 'అనుచరులు',
			'followings': 'అనుసరణలు',
			'my': 'నా',
			'edit': 'మార్చు',
			'delete': 'తొలగించు',
			'deletepost': 'పోస్ట్‌ని తొలగించు',
			'deleteposthint': 'మీరు ఈ పోస్ట్‌ని తొలగించాలనుకుంటున్నారా? కొన్ని వినియోగదారుల ఫీడ్స్‌లో పోస్ట్‌లు ఇంకా కనిపించవచ్చు.',
			'maximumallowedsizehint': 'అనుమతించిన అప్‌లోడ్ ఫైల్ పరిమితిని చేరుకుంది',
			'maximumuploadsizehint': 'ఎంపిక చేసిన ఫైల్ అనుమతించిన అప్‌లోడ్ ఫైల్ పరిమితికి కాస్త ఎక్కువ.',
			'makeposterror': 'ప్రస్తుతం పోస్ట్ చేయడం సాధ్యం కాదు, మళ్లీ ప్రయత్నించడానికి క్లిక్ చేయండి.',
			'makepost': 'పోస్ట్ చేయండి',
			'selectfile': 'ఫైల్‌ని ఎంచుకోండి',
			'images': 'చిత్రాలు',
			'shareYourThoughtsNow': 'మీ ఆలోచనలను ఇప్పుడు పంచుకోండి...',
			'photoviewer': 'ఫోటో వీయర్',
			'nochatsavailable': 'ముట్టడి చేయడానికి సంభాషణలు లేవు \nకింద ఉన్న చిహ్నాన్ని క్లిక్ చేసి చాట్‌కి స్నేహితులను ఎంచుకోండి',
			'typing': 'టైపింగ్...',
			'photo': 'ఫోటో',
			'online': 'ఆన్లైన్',
			'offline': 'ఆఫ్లైన్',
			'lastseen': 'చివరిసారిగా చూసింది',
			'deleteselectedhint': 'ఈ చర్య ఎంపిక చేసిన సందేశాలను తొలగిస్తుంది. దయచేసి గమనించండి, ఇది మీ భాగంలో ఉన్న సంభాషణని మాత్రమే తొలగిస్తుంది,\n సందేశాలు ఇంకా మీ భాగస్వామి యొక్క పరికరంలో కనిపిస్తాయి.',
			'deleteselected': 'ఎంపిక చేసిన వాటిని తొలగించండి',
			'unabletofetchconversation': 'మీ సంభాషణని పొందలేకపోయాం \n',
			'loadmoreconversation': 'మరింత సంభాషణని లోడ్ చేయండి',
			'sendyourfirstmessage': 'మీ మొదటి సందేశాన్ని పంపండి \n',
			'unblock': 'అన్‌బ్లాక్ చేయండి ',
			'block': 'బ్లాక్ చేయండి',
			'writeyourmessage': 'మీ సందేశాన్ని రాయండి...',
			'clearconversation': 'సంభాషణని తొలగించండి',
			'clearconversationhintone': 'ఈ చర్య మీ అన్ని సంభాషణలను తొలగిస్తుంది ',
			'clearconversationhinttwo': '.\n దయచేసి గమనించండి, ఇది మీ భాగంలో ఉన్న సంభాషణని మాత్రమే తొలగిస్తుంది, సందేశాలు ఇంకా మీ భాగస్వామి యొక్క పరికరంలో కనిపిస్తాయి.',
			'facebookloginerror': 'లాగిన్ ప్రక్రియలో ఏదో తేడా జరిగింది.\n ఇది ఫేస్‌బుక్ మాకు ఇచ్చిన లోపం',
			'selectLanguage': 'భాషను ఎంచుకోండి',
			'howTo': 'ఎలా',
			'noBibleTextsAvailable': 'ఎటువంటి బైబిల్ గ్రంథాలు అందుబాటులో లేవు',
			'languages': 'భాషలు',
			'searchLanguages': 'భాషలు శోధించండి...',
			'biblesFilesets': 'బైబిల్స్: {bibles}, ఫైల్సెట్లను: {filesets}',
			'oldTestament': 'పాత నిబంధన',
			'newTestament': 'కొత్త నిబంధన',
			'play': 'ఆడించు',
			'no_verse_content': 'ప్రదర్శించడానికి బైబిల్ వాక్య కంటెంట్ అందుబాటులో లేదు.',
			'no_audio_content': 'ప్రదర్శించడానికి బైబిల్ ఆడియో కంటెంట్ అందుబాటులో లేదు.',
		};
	}
}

extension on _StringsUr {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'میرا ورچوئل پادری',
			'selectlanguage': 'زبان منتخب کریں',
			'deletemyaccount': 'میرا اکاؤنٹ حذف کریں',
			'deleteaccount': 'اکاؤنٹ حذف کریں',
			'deleteaccounthint': 'یہ عمل آپ کے اکاؤنٹ اور آپ کے تمام ڈیٹا کو حذف کر دے گا، ایک بار حذف کیا گیا ڈیٹا بازیافت نہیں کیا جا سکتا۔',
			'deleteaccountsuccess': 'اکاؤنٹ حذف کرنا کامیاب رہا',
			'chooseapplanguage': 'ایپ کی زبان منتخب کریں',
			'nightmode': 'نائٹ موڈ',
			'initializingapp': 'شروع کیا جا رہا ہے...',
			'home': 'ہوم',
			'branches': 'برانچز',
			'inbox': 'ان باکس',
			'downloads': 'ڈاؤن لوڈز',
			'settings': 'سیٹنگز',
			'events': 'ایونٹس',
			'myplaylists': 'میری پلے لسٹ',
			'website': 'ویب سائٹ',
			'hymns': 'حمد',
			'articles': 'مضامین',
			'notes': 'نوٹس',
			'donate': 'عطیہ کریں',
			'offering': 'نذرانہ',
			'savenotetitle': 'نوٹ کا عنوان محفوظ کریں',
			'nonotesfound': 'کوئی نوٹس نہیں ملے',
			'newnote': 'نیا',
			'deletenote': 'نوٹ حذف کریں',
			'deletenotehint': 'کیا آپ یہ نوٹ حذف کرنا چاہتے ہیں؟ اس عمل کو واپس نہیں کیا جا سکتا۔',
			'bookmarks': 'بک مارکس',
			'socialplatforms': 'سوشل پلیٹ فارمز',
			'onboardingpagetitles.0': 'میرے چرچ میں خوش آمدید',
			'onboardingpagetitles.1': 'خصوصیات سے بھرپور',
			'onboardingpagetitles.2': 'آڈیو، ویڈیو \n اور لائیو اسٹریم',
			'onboardingpagetitles.3': 'اکاؤنٹ بنائیں',
			'onboardingpagehints.0': 'اتوار کی صبح اور آپ کے چرچ کی چار دیواری سے آگے جائیں۔ موبائل پر مبنی دنیا کے ساتھ بات چیت اور مشغول ہونے کے لیے آپ کو جو کچھ بھی درکار ہے۔',
			'onboardingpagehints.1': 'ہم نے آپ کے چرچ ایپ کے لیے تمام اعلیٰ خصوصیات کو اکٹھا کیا ہے۔ واقعات، حمد، نوٹیفیکیشنز، نوٹس اور ملٹی ورژن بائبل۔',
			'onboardingpagehints.2': 'دنیا بھر کے صارفین کو آپ کی چرچ کی خدمات کی لائیو اسٹریم دیکھنے، آڈیو پیغامات سننے اور ویڈیوز دیکھنے کی اجازت دیں۔',
			'onboardingpagehints.3': 'ایک نہ ختم ہونے والے عبادت کے تجربے کا آغاز کریں۔',
			'next': 'اگلا',
			'done': 'شروع کریں',
			'quitapp': 'ایپ بند کریں!',
			'quitappwarning': 'کیا آپ ایپ بند کرنا چاہتے ہیں؟',
			'quitappaudiowarning': 'آپ اس وقت ایک آڈیو چلا رہے ہیں، ایپ بند کرنے سے آڈیو پلے بیک رک جائے گا۔ اگر آپ پلے بیک کو روکنا نہیں چاہتے ہیں تو بس ایپ کو سنٹر بٹن سے کم سے کم کریں یا ایپ کو ابھی بند کرنے کے لیے اوکے بٹن پر کلک کریں۔',
			'ok': 'ٹھیک ہے',
			'retry': 'دوبارہ کوشش کریں',
			'oops': 'اوہ!',
			'save': 'محفوظ کریں',
			'cancel': 'منسوخ کریں',
			'error': 'خرابی',
			'success': 'کامیابی',
			'skip': 'چھوڑ دیں',
			'skiplogin': 'لاگ ان چھوڑ دیں',
			'skipregister': 'رجسٹریشن چھوڑ دیں',
			'dataloaderror': 'فی الحال درخواست کردہ ڈیٹا لوڈ نہیں کیا جا سکتا، اپنے ڈیٹا کنکشن کو چیک کریں اور دوبارہ کوشش کرنے کے لیے کلک کریں۔',
			'suggestedforyou': 'آپ کے لیے تجویز کردہ',
			'videomessages': 'ویڈیو پیغامات',
			'audiomessages': 'آڈیو پیغامات',
			'devotionals': 'عبادت',
			'categories': 'زمرے',
			'category': 'زمرہ',
			'videos': 'ویڈیوز',
			'audios': 'آڈیوز',
			'biblebooks': 'بائبل',
			'sermons': 'خطبات',
			'tools': 'اوزار',
			'profile': 'پروفائل',
			'audiobible': 'آڈیو بائبل',
			'homesentence': 'آپ کے پادری کے لیے 1 سال، آپ کو اس شخص میں بڑھنے میں مدد کرنے کے لیے جس کے لیے خدا نے آپ کو بلایا ہے۔',
			'livestreams': 'لائیو اسٹریم',
			'radio': 'ریڈیو',
			'allitems': 'تمام آئٹمز',
			'emptyplaylist': 'کوئی پلے لسٹ نہیں',
			'notsupported': 'مدد نہیں دی گئی',
			'cleanupresources': 'وسائل کو صاف کیا جا رہا ہے',
			'grantstoragepermission': 'جاری رکھنے کے لیے براہ کرم اسٹوریج تک رسائی کی اجازت دیں',
			'sharefiletitle': 'دیکھیں یا سنیں ',
			'sharefilebody': 'MyVirtualPastor ایپ کے ذریعے، ابھی ڈاؤن لوڈ کریں ',
			'sharetext': 'لامحدود آڈیو اور ویڈیو سٹریمنگ کا لطف اٹھائیں',
			'sharetexthint': 'ہم آپ کے لیے ایک ویڈیو اور آڈیو سٹریمنگ پلیٹ فارم فراہم کرتے ہیں جس سے آپ دنیا بھر سے لاکھوں فائلیں دیکھ اور سن سکتے ہیں۔ ابھی ڈاؤن لوڈ کریں ',
			'download': 'ڈاؤن لوڈ کریں',
			'addplaylist': 'پلے لسٹ میں شامل کریں',
			'bookmark': 'بک مارک',
			'unbookmark': 'بک مارک ہٹائیں',
			'share': 'شیئر کریں',
			'deletemedia': 'فائل حذف کریں',
			'deletemediahint': 'کیا آپ اس ڈاؤن لوڈ کردہ فائل کو حذف کرنا چاہتے ہیں؟ اس عمل کو واپس نہیں کیا جا سکتا۔',
			'searchhint': 'آڈیو اور ویڈیو پیغامات تلاش کریں',
			'performingsearch': 'آڈیوز اور ویڈیوز تلاش کر رہے ہیں',
			'nosearchresult': 'کوئی نتیجہ نہیں ملا',
			'nosearchresulthint': 'زیادہ عام کلیدی لفظ درج کرنے کی کوشش کریں',
			'addtoplaylist': 'پلے لسٹ میں شامل کریں',
			'newplaylist': 'نئی پلے لسٹ',
			'playlistitm': 'پلے لسٹ',
			'mediaaddedtoplaylist': 'میڈیا کو پلے لسٹ میں شامل کیا گیا ہے۔',
			'mediaremovedfromplaylist': 'میڈیا کو پلے لسٹ سے ہٹا دیا گیا ہے',
			'clearplaylistmedias': 'تمام میڈیا کو صاف کریں',
			'deletePlayList': 'پلے لسٹ حذف کریں',
			'clearplaylistmediashint': 'کیا آپ اس پلے لسٹ سے تمام میڈیا کو ہٹانا چاہتے ہیں؟',
			'deletePlayListhint': 'کیا آپ اس پلے لسٹ کو حذف کرنا اور تمام میڈیا کو صاف کرنا چاہتے ہیں؟',
			'comments': 'تبصرے',
			'replies': 'جوابات',
			'reply': 'جواب',
			'logintoaddcomment': 'تبصرہ شامل کرنے کے لیے لاگ ان کریں',
			'logintoreply': 'جواب دینے کے لیے لاگ ان کریں',
			'writeamessage': 'ایک پیغام لکھیں...',
			'nocomments': 'کوئی تبصرے نہیں ملے \nدوبارہ کوشش کرنے کے لیے کلک کریں',
			'errormakingcomments': 'اس وقت تبصرہ کرنا ممکن نہیں ہے..',
			'errordeletingcomments': 'اس وقت اس تبصرے کو حذف کرنا ممکن نہیں ہے..',
			'erroreditingcomments': 'اس وقت اس تبصرے کو ترمیم کرنا ممکن نہیں ہے..',
			'errorloadingmorecomments': 'اس وقت مزید تبصرے لوڈ کرنا ممکن نہیں ہے..',
			'deletingcomment': 'تبصرہ حذف کیا جا رہا ہے',
			'editingcomment': 'تبصرہ ترمیم کیا جا رہا ہے',
			'deletecommentalert': 'تبصرہ حذف کریں',
			'editcommentalert': 'تبصرہ ترمیم کریں',
			'deletecommentalerttext': 'کیا آپ اس تبصرے کو حذف کرنا چاہتے ہیں؟ اس عمل کو واپس نہیں کیا جا سکتا',
			'loadmore': 'مزید لوڈ کریں',
			'messages': 'پیغامات',
			'guestuser': 'مہمان صارف',
			'fullname': 'پورا نام',
			'emailaddress': 'ای میل پتہ',
			'password': 'پاس ورڈ',
			'repeatpassword': 'پاس ورڈ دوبارہ درج کریں',
			'register': 'رجسٹر کریں',
			'login': 'لاگ ان کریں',
			'logout': 'لاگ آؤٹ کریں',
			'logoutfromapp': 'ایپ سے لاگ آؤٹ کریں؟',
			'logoutfromapphint': 'اگر آپ لاگ ان نہیں کرتے ہیں تو آپ مضامین اور ویڈیوز کو پسند یا تبصرہ نہیں کر سکیں گے۔',
			'gotologin': 'لاگ ان کرنے کے لیے جائیں',
			'resetpassword': 'پاس ورڈ ری سیٹ کریں',
			'logintoaccount': 'پہلے سے ہی ایک اکاؤنٹ ہے؟ لاگ ان کریں',
			'emptyfielderrorhint': 'آپ کو تمام فیلڈز کو بھرنا ہے',
			'invalidemailerrorhint': 'آپ کو ایک صحیح ای میل پتہ درج کرنا ہوگا',
			'passwordsdontmatch': 'پاس ورڈز مطابقت نہیں رکھتے',
			'processingpleasewait': 'پروسیسنگ ہو رہی ہے، براہ کرم انتظار کریں...',
			'createaccount': 'اکاؤنٹ بنائیں',
			'forgotpassword': 'پاس ورڈ بھول گئے؟',
			'orloginwith': 'یا لاگ ان کریں',
			'facebook': 'فیس بک',
			'google': 'گوگل',
			'moreoptions': 'مزید اختیارات',
			'about': 'ہمارے بارے میں',
			'privacy': 'رازداری کی پالیسی',
			'terms': 'ایپ کی شرائط',
			'rate': 'ایپ کی درجہ بندی کریں',
			'version': 'ورژن',
			'pulluploadmore': 'اوپر کھینچیں اور لوڈ کریں',
			'loadfailedretry': 'لوڈ ناکام! دوبارہ کوشش کریں!',
			'releaseloadmore': 'مزید لوڈ کرنے کے لیے ریلیز کریں',
			'nomoredata': 'مزید ڈیٹا نہیں',
			'errorReportingComment': 'تبصرہ رپورٹ کرنے میں خرابی',
			'reportingComment': 'تبصرہ رپورٹ کیا جا رہا ہے',
			'reportcomment': 'رپورٹ اختیارات',
			'reportCommentsList.0': 'ناپسندیدہ تجارتی مواد یا سپیم',
			'reportCommentsList.1': 'فحش یا جنسی واضح مواد',
			'reportCommentsList.2': 'نفرت انگیز تقریر یا گرافک تشدد',
			'reportCommentsList.3': 'ہراساں کرنا یا دھونس',
			'bookmarksMedia': 'میرے بک مارکس',
			'noitemstodisplay': 'دکھانے کے لیے کوئی آئٹمز نہیں ہیں',
			'loginrequired': 'لاگ ان ضروری ہے',
			'loginrequiredhint': 'اس پلیٹ فارم پر سبسکرائب کرنے کے لیے، آپ کو لاگ ان کرنا ہوگا۔ ابھی مفت اکاؤنٹ بنائیں یا اپنے موجودہ اکاؤنٹ میں لاگ ان کریں۔',
			'subscriptions': 'ایپ سبسکرپشنز',
			'subscribe': 'سبسکرائب کریں',
			'subscribehint': 'سبسکرپشن ضروری ہے',
			'playsubscriptionrequiredhint': 'اس میڈیا کو سننے یا دیکھنے کے لیے آپ کو سبسکرپشن کی ضرورت ہے۔',
			'previewsubscriptionrequiredhint': 'آپ اس میڈیا کے لیے اجازت شدہ پیش نظارہ مدت تک پہنچ چکے ہیں۔ سننے یا دیکھنے کے لیے آپ کو سبسکرپشن کی ضرورت ہے۔',
			'copiedtoclipboard': 'کلپ بورڈ پر کاپی کیا گیا',
			'downloadbible': 'بائبل ڈاؤن لوڈ کریں',
			'downloadversion': 'ڈاؤن لوڈ کریں',
			'downloading': 'ڈاؤن لوڈ ہو رہا ہے',
			'failedtodownload': 'ڈاؤن لوڈ ناکام',
			'pleaseclicktoretry': 'دوبارہ کوشش کرنے کے لیے کلک کریں۔',
			'of': 'کا',
			'nobibleversionshint': 'دکھانے کے لیے کوئی بائبل ڈیٹا نہیں ہے، کم از کم ایک بائبل ورژن ڈاؤن لوڈ کرنے کے لیے نیچے دیے گئے بٹن پر کلک کریں۔',
			'downloaded': 'ڈاؤن لوڈ کیا گیا',
			'enteremailaddresstoresetpassword': 'اپنا پاس ورڈ ری سیٹ کرنے کے لیے اپنا ای میل پتہ درج کریں',
			'backtologin': 'لاگ ان پر واپس جائیں',
			'signintocontinue': 'جاری رکھنے کے لیے سائن ان کریں',
			'signin': 'سائن ان',
			'signinforanaccount': 'ایک اکاؤنٹ کے لیے سائن اپ کریں؟',
			'alreadyhaveanaccount': 'پہلے سے ہی ایک اکاؤنٹ ہے؟',
			'updateprofile': 'پروفائل کو اپ ڈیٹ کریں',
			'updateprofilehint': 'شروع کرنے کے لیے، براہ کرم اپنا پروفائل پیج اپ ڈیٹ کریں، اس سے ہمیں دوسرے لوگوں سے جڑنے میں مدد ملے گی',
			'autoplayvideos': 'آٹو پلے ویڈیوز',
			'gosocial': 'سوشل پر جائیں',
			'searchbible': 'بائبل تلاش کریں',
			'filtersearchoptions': 'تلاش کے اختیارات کو فلٹر کریں',
			'narrowdownsearch': 'زیادہ درست نتیجہ کے لئے نیچے دیے گئے فلٹر بٹن کو استعمال کر کے تلاش کو کم کریں۔',
			'searchbibleversion': 'بائبل کا ورژن تلاش کریں',
			'searchbiblebook': 'بائبل کی کتاب تلاش کریں',
			'search': 'تلاش',
			'setBibleBook': 'بائبل کی کتاب سیٹ کریں',
			'oldtestament': 'پرانا عہد نامہ',
			'newtestament': 'نیا عہد نامہ',
			'limitresults': 'نتائج کو محدود کریں',
			'setfilters': 'فلٹرز سیٹ کریں',
			'bibletranslator': 'بائبل مترجم',
			'chapter': ' باب ',
			'verse': ' آیت ',
			'translate': 'ترجمہ کریں',
			'bibledownloadinfo': 'بائبل ڈاؤن لوڈ شروع ہو چکی ہے، ڈاؤن لوڈ مکمل ہونے تک اس صفحہ کو بند نہ کریں۔',
			'received': 'موصول',
			'outoftotal': 'کل میں سے',
			'set': 'سیٹ',
			'selectColor': 'رنگ منتخب کریں',
			'switchbibleversion': 'بائبل کا ورژن تبدیل کریں',
			'switchbiblebook': 'بائبل کی کتاب تبدیل کریں',
			'gotosearch': 'باب پر جائیں',
			'changefontsize': 'فونٹ سائز تبدیل کریں',
			'font': 'فونٹ',
			'readchapter': 'باب پڑھیں',
			'showhighlightedverse': 'ہائیلائٹ کی گئی آیت دکھائیں',
			'downloadmoreversions': 'مزید ورژن ڈاؤن لوڈ کریں',
			'suggestedusers': 'تجویز کردہ صارفین',
			'unfollow': 'فالو نہ کریں',
			'follow': 'فالو کریں',
			'searchforpeople': 'لوگوں کو تلاش کریں',
			'viewpost': 'پوسٹ دیکھیں',
			'viewprofile': 'پروفائل دیکھیں',
			'mypins': 'میری پنز',
			'viewpinnedposts': 'پین کی گئی پوسٹس دیکھیں',
			'personal': 'ذاتی',
			'update': 'اپ ڈیٹ',
			'phonenumber': 'فون نمبر',
			'showmyphonenumber': 'میرا فون نمبر دکھائیں',
			'dateofbirth': 'تاریخ پیدائش',
			'showmyfulldateofbirth': 'میری اسٹیٹس دیکھنے والوں کو میری مکمل تاریخ پیدائش دکھائیں',
			'notifications': 'اطلاعات',
			'notifywhenuserfollowsme': 'جب کوئی صارف مجھے فالو کرے تو مطلع کریں',
			'notifymewhenusercommentsonmypost': 'جب صارف میری پوسٹ پر تبصرہ کریں تو مطلع کریں',
			'notifymewhenuserlikesmypost': 'جب صارف میری پوسٹ کو پسند کریں تو مطلع کریں',
			'churchsocial': 'چرچ سوشل',
			'shareyourthoughts': 'اپنے خیالات کا اشتراک کریں',
			'readmore': '...مزید پڑھیں',
			'less': ' کم',
			'couldnotprocess': 'درخواست پر عمل نہیں ہو سکا۔',
			'pleaseselectprofilephoto': 'پروفائل فوٹو اپ لوڈ کرنے کے لیے منتخب کریں',
			'pleaseselectprofilecover': 'براہ کرم کور فوٹو منتخب کریں',
			'updateprofileerrorhint': 'جاری رکھنے کے لئے اپنا نام، تاریخ پیدائش، جنس، فون اور مقام کو پُر کریں۔',
			'gender': 'جنس',
			'male': 'مرد',
			'female': 'عورت',
			'dob': 'تاریخ پیدائش',
			'location': 'موجودہ مقام',
			'qualification': 'قابلیت',
			'aboutme': 'میرے بارے میں',
			'facebookprofilelink': 'فیس بک پروفائل لنک',
			'twitterprofilelink': 'ٹوئٹر پروفائل لنک',
			'linkdln': 'لنکڈن پروفائل لنک',
			'likes': 'پسند',
			'likess': 'پسندیدگیاں',
			'pinnedposts': 'پن کی گئی پوسٹس',
			'unpinpost': 'پن ہٹائیں',
			'unpinposthint': 'کیا آپ اس پوسٹ کو اپنے پن کی گئی پوسٹس سے ہٹانا چاہتے ہیں؟',
			'postdetails': 'پوسٹ کی تفصیلات',
			'posts': 'پوسٹس',
			'followers': 'فالوورز',
			'followings': 'فالووِنگ',
			'my': 'میرا',
			'edit': 'ترمیم',
			'delete': 'حذف کریں',
			'deletepost': 'پوسٹ حذف کریں',
			'deleteposthint': 'کیا آپ اس پوسٹ کو حذف کرنا چاہتے ہیں؟ پوسٹس ابھی بھی کچھ صارفین کی فیڈز میں دکھائی دے سکتی ہیں۔',
			'maximumallowedsizehint': 'اجازت شدہ اپلوڈ فائل سائز کی حد تک پہنچ گئی',
			'maximumuploadsizehint': 'منتخب کردہ فائل اجازت شدہ اپلوڈ فائل سائز کی حد سے بڑی ہے۔',
			'makeposterror': 'اس وقت پوسٹ نہیں کر سکتے، دوبارہ کوشش کرنے کے لئے کلک کریں۔',
			'makepost': 'پوسٹ کریں',
			'selectfile': 'فائل منتخب کریں',
			'images': 'تصاویر',
			'shareYourThoughtsNow': 'ابھی اپنے خیالات کا اشتراک کریں...',
			'photoviewer': 'فوٹو ویوئر',
			'nochatsavailable': 'کوئی دستیاب گفتگو نہیں ہے \n گفتگو منتخب کرنے کے لئے نیچے دیے گئے آئیکن پر کلک کریں',
			'typing': 'ٹائپنگ...',
			'photo': 'تصویر',
			'online': 'آن لائن',
			'offline': 'آف لائن',
			'lastseen': 'آخری بار دیکھا گیا',
			'deleteselectedhint': 'یہ عمل منتخب کردہ پیغامات کو حذف کر دے گا۔ براہ کرم نوٹ کریں کہ یہ آپ کی طرف کی گفتگو کو ہی حذف کرے گا، \n پیغامات ابھی بھی آپ کے پارٹنر کے آلہ پر دکھائی دیں گے۔',
			'deleteselected': 'منتخب کردہ حذف کریں',
			'unabletofetchconversation': 'آپ کی گفتگو حاصل کرنے میں ناکام \n',
			'loadmoreconversation': 'مزید گفتگو لوڈ کریں',
			'sendyourfirstmessage': 'اپنا پہلا پیغام بھیجیں \n',
			'unblock': 'ان بلاک کریں ',
			'block': 'بلاک کریں',
			'writeyourmessage': 'اپنا پیغام لکھیں...',
			'clearconversation': 'گفتگو صاف کریں',
			'clearconversationhintone': 'یہ عمل آپ کی تمام گفتگو صاف کر دے گا ',
			'clearconversationhinttwo': '.\n براہ کرم نوٹ کریں کہ یہ آپ کی طرف کی گفتگو کو ہی صاف کرے گا، پیغامات ابھی بھی آپ کے پارٹنر کے چیٹ میں دکھائی دیں گے۔',
			'facebookloginerror': 'لاگ ان عمل میں کچھ غلط ہو گیا ہے۔\n یہاں فیس بک نے ہمیں دی ہوئی خرابی ہے',
			'selectLanguage': 'زبان منتخب کریں',
			'howTo': 'کیسے',
			'noBibleTextsAvailable': 'کوئی بائبل کے متن دستیاب نہیں ہیں',
			'languages': 'زبانیں',
			'searchLanguages': 'زبانیں تلاش کریں...',
			'biblesFilesets': 'بائبل: {bibles}, فائلسیٹ: {filesets}',
			'oldTestament': 'پرانا عہد نامہ',
			'newTestament': 'نیا عہد نامہ',
			'play': 'چلائیں',
			'no_verse_content': 'دکھانے کے لئے کوئی بائبل کی آیت کا مواد دستیاب نہیں ہے۔',
			'no_audio_content': 'دکھانے کے لئے کوئی بائبل کی آڈیو مواد دستیاب نہیں ہے۔',
		};
	}
}
