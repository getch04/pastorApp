
/*
 * Generated file. Do not edit.
 *
 * Locales: 4
 * Strings: 1148 (287.0 per locale)
 *
 * Built on 2024-07-05 at 14:25 UTC
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
	es, // 'es'
	fr, // 'fr'
	pt, // 'pt'
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
late _StringsEs _translationsEs = _StringsEs.build();
late _StringsFr _translationsFr = _StringsFr.build();
late _StringsPt _translationsPt = _StringsPt.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
			case AppLocale.es: return _translationsEs;
			case AppLocale.fr: return _translationsFr;
			case AppLocale.pt: return _translationsPt;
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
			case AppLocale.es: return _StringsEs.build();
			case AppLocale.fr: return _StringsFr.build();
			case AppLocale.pt: return _StringsPt.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.es: return 'es';
			case AppLocale.fr: return 'fr';
			case AppLocale.pt: return 'pt';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.es: return const Locale.fromSubtags(languageCode: 'es');
			case AppLocale.fr: return const Locale.fromSubtags(languageCode: 'fr');
			case AppLocale.pt: return const Locale.fromSubtags(languageCode: 'pt');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'es': return AppLocale.es;
			case 'fr': return AppLocale.fr;
			case 'pt': return AppLocale.pt;
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
	String get appname => 'MyVirtualPastor';
	String get selectlanguage => 'Select Language';
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
	String get homesentence => 'Your Pastor for 1 year, to help you grow into a person God called you to be.';
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
	@override String get appname => 'MyVirtualPastor';
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
	@override String get appname => 'MyVirtualPastor';
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
	@override String get appname => 'MyVirtualPastor';
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
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'MyVirtualPastor',
			'selectlanguage': 'Select Language',
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
			'homesentence': 'Your Pastor for 1 year, to help you grow into a person God called you to be.',
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
		};
	}
}

extension on _StringsEs {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'MyVirtualPastor',
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
		};
	}
}

extension on _StringsFr {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'MyVirtualPastor',
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
		};
	}
}

extension on _StringsPt {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'MyVirtualPastor',
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
		};
	}
}
