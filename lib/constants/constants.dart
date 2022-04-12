//constants
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

const kPayloadMonthly = 'monthlyRefresh';
const kPayloadDebug = 'payloadDebug';

//GetStorage
@Deprecated('No longer store location based on index')
const kStoredGlobalIndex = "storedGlobalIndex";
const kStoredLocationJakimCode = "storedJakimCode";
const kIsFirstRun = "storedFirstRunApp";

const kBookmarkSurah = "BookmarkSurah";
const kBookmarkSurahName = "BookmarkSurahName";
const kBookmarkSurahNum = "BookmarkSurahNum";

const kAzanSoundName = "kAzanSoundName";

const kthemeMode = "kthemeMode";

const kLocationLatitude = 'kLocationLatitude';
const kLocationlongitude = 'kLocationlongitude' ;
const kLocationCountry = 'kLocationCountry' ;
const kLocationlocation = "kLocationlocation" ;
const kCalculationMethod = "kCalculationMethod" ;
const kCalculationMethodMadhab= "kCalculationMethodMadhab" ;
const kStoredTimeIs12 = "storedTimeFormat";
const kStoredLocationLocality = "storedLocationLocality";

const kStoredShowOtherPrayerTime = "storedshowothertime";
const kStoredApiPrayerCall = "storedApiPrayCall";
const kStoredShouldUpdateNotif = "storedShouldUpdateNotif";
const kStoredLastUpdateNotif = "storedLastUpdateNotif";
const kStoredNotificationLimit = "storedNotificationLimit";
const kNumberOfNotifsScheduled = "numnotifscheduled";
const kIsDebugMode = "debugModeSet";
const kForceUpdateNotif = "storedForceUpdateNotif";
const kDiscoveredDeveloperOption = "storedDevDiscovered";
const kSharingFormat = "storedSharingFormat";
const kFontSize = "storedFontSize";
const kHijriOffset = "storedHijriOffset";
const kJsonCache = "jsonCache2";
const kJsonCacheCheck = "jsonCacheCheck";
const kAppLaunchCount = "appLaunchCount";
const kHasOpenSharingDialog = "openedSharedDialog";
const kShowNotifPrompt = "notifPrompt";
const kNotificationType = "notiftype";
const kHaventIntroducedToNotifType ="introducedNotifType"; // Temporary implementation

// saly
const kSalyMinetRemnd = 'salyReminderTime';
const kSalyMinetRemndtimeType = 'salyReminderTimeType';
const kSalyMinetRemnditem = 'salyReminderMinutesItem';
const kSalySourceSound = 'salySourceSound';
const kSalySounditem = 'salySounditem';
//Network image
const kAppIconUrl =
    'https://firebasestorage.googleapis.com/v0/b/malaysia-waktu-solat.appspot.com/o/icon%20(Custom).png?alt=media&token=9efb706e-4bf3-4e60-af8e-9a88ee6db60c';
const kDeveloperActivityImage =
    'https://firebasestorage.googleapis.com/v0/b/malaysia-waktu-solat.appspot.com/o/In%20app%2Fundraw_developer_activity_bv83.svg?alt=media&token=e787419a-fb75-4484-860d-512b4b634c97';

//Network Image (Scenery time images)
// const kWaktuSubuhImage =
//     'https://firebasestorage.googleapis.com/v0/b/malaysia-waktu-solat.appspot.com/o/Scenery%2FtimeDay1%20(Custom).jpg?alt=media&token=293ecf62-033a-4925-802b-9c8e3167c2c0';
// const kWaktuZohorImage =
//     'https://firebasestorage.googleapis.com/v0/b/malaysia-waktu-solat.appspot.com/o/Scenery%2FtimeDay2%20(Custom).jpg?alt=media&token=f5c189a1-b5a6-4dc5-818b-912bc8ea2925';
// const kWaktuAsarImage =
//     'https://firebasestorage.googleapis.com/v0/b/malaysia-waktu-solat.appspot.com/o/Scenery%2FtimeDay3%20(Custom).jpg?alt=media&token=0816267c-5c27-4aa0-a395-782536f83d43';
// const kWaktuMaghribImage =
//     'https://firebasestorage.googleapis.com/v0/b/malaysia-waktu-solat.appspot.com/o/Scenery%2FtimeDay1%20(Custom).png?alt=media&token=b3a669f1-1403-42f4-bd94-675b1a8ba81c';
// const kWaktuIsyakImage =
//     'https://firebasestorage.googleapis.com/v0/b/malaysia-waktu-solat.appspot.com/o/Scenery%2FtimeDay4%20(Custom).jpg?alt=media&token=429b449c-6573-40df-acef-aaf0a67a8695';

//App info
const kPlayStoreListingLink =
    'https://play.google.com/store/apps/details?id=live.iqfareez.waktusolatmalaysia';
const kPlayStoreListingShortLink = 'http://bit.ly/MPTdl';
const kPrivacyPolicyLink =
    'https://github.com/iqfareez/app_waktu_solat_malaysia/wiki/Privacy-Policy';
const kReleaseNotesLink =
    'https://telegra.ph/MPT-Changelogs---Malaysia-Prayer-Time-Flutter-07-20';
const kReleaseNotesShortLink = 'http://bit.ly/mpt-clog';
const kGithubRepoLink = 'https://github.com/iqfareez/app_waktu_solat_malaysia';
const kSolatJakimLink = 'https://www.e-solat.gov.my/';
const kWebappUrl = 'https://waktusolat.web.app';
const kMptFdlGetLink = 'https://solat.page.link/get';

//Developer info
const kAppEmail = 'mptwaktusolat@gmail.com';
const kDevTwitter = 'https://twitter.com/iqfareez';
const kDevInstagram = 'https://www.instagram.com/iqfareez/';
const kInstaStoryDevlog =
    'https://www.instagram.com/s/aGlnaGxpZ2h0OjE3ODcyMTc0ODcwODEzNjM1?igshid=3jwa3e1iy3u7&story_media_id=2342912100646673991_32997533904';
const kGithubLink = 'https://github.com/iqfareez';
const kPlayStoreDevLink =
    'https://play.google.com/store/apps/dev?id=9200064795631584674';

//Contribution page
const kBuyMeACoffeeLink = 'https://www.buymeacoffee.com/iqfareez';
const kBankAccountNum = '162348620850'; //maybank
const kPaypalDonateShortLink = 'paypal.me/iqfareez';
const kPaypalDonateFullLink = 'https://www.paypal.com/paypalme/iqfareez';

//hero tag
const kAppIconTag = 'appIconTag';


String KSurahName = '';


class ScreenArguments {
  final Widget childScreen;
  //final String user;

  ScreenArguments(this.childScreen);
  
}
