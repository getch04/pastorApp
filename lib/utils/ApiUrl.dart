class ApiUrl {
  static const String BASEURL = "https://myvirtualpastor.org/";
  static const String ABOUTUS = "${BASEURL}api/app_details";
  static const String CATEGORY_AUDIO = "${BASEURL}api/fetchAudioByCategory/";
  static const String TERMS = "https://dashboard.mychurchapp.xyz/privacy";
  static const String PRIVACY = "https://dashboard.mychurchapp.xyz/privacy";
  static const String ABOUT = "https://dashboard.mychurchapp.xyz/privacy";

  //FAQ
  static const String GET_FAQ = BASEURL + "api/fetch_faqs";
  static const String GET_TOOLS = BASEURL + "api/fetch_tools";
  static const String GET_HOWTO = BASEURL + "api/fetch_hows";
  static const String DONATION = BASEURL + "api/saveDonation";
  // static const String TOOLCATEGORIES = BASEURL + "api/toolCategories";


  //DO NOT EDIT THE LINES BELOW, ELSE THE APPLICATION WILL MISBEHAVE
  static const String GET_BIBLE = BASEURL + "getBibleVersions";
  static const String DONATE = BASEURL + "donate";
  static const String DISCOVER = BASEURL + "discover";
  static const String CATEGORIES = BASEURL + "fetch_categories";
  static const String LIVESTREAMS = BASEURL + "discoverLivestreams";
  static const String TRENDING = BASEURL + "discoverTrends";
  static const String FETCH_MEDIA = BASEURL + "fetch_media";
  static const String FETCH_BRANCHES = BASEURL + "church_branches";
  static const String DEVOTIONALS = BASEURL + "devotionals";
  static const String PURCHASEBOOK = BASEURL + "purchasebook";
  static const String EVENTS = BASEURL + "fetch_events";
  static const String SUBMIT_PRAYER = BASEURL + "submitprayer";
  static const String PRAYERS = BASEURL + "fetch_prayerpoints";
  static const String INBOX = BASEURL + "fetch_inbox";
  static const String HYMNS = BASEURL + "fetch_hymns";
  static const String FETCH_BOOKS = BASEURL + "fetch_books";
  static const String counsellingrequest = BASEURL + "counsellingrequest";
  static const String FETCH_CATEGORIES_MEDIA =
      BASEURL + "fetch_categories_media";
  static const String SEARCH = BASEURL + "search";
  static const String REGISTER = BASEURL + "registerUser";
  static const String LOGIN = BASEURL + "loginUser";
  static const String DELETEACCOUNT = BASEURL + "deleteaccount";
  static const String RESETPASSWORD = BASEURL + "resetPassword";
  static const String getmediatotallikesandcommentsviews =
      BASEURL + "getmediatotallikesandcommentsviews";
  static const String update_media_total_views =
      BASEURL + "update_media_total_views";
  static const String likeunlikemedia = BASEURL + "likeunlikemedia";
  static const String editcomment = BASEURL + "editcomment";
  static const String deletecomment = BASEURL + "deletecomment";
  static const String makecomment = BASEURL + "makecomment";
  static const String loadcomments = BASEURL + "loadcomments";
  static const String editreply = BASEURL + "editreply";
  static const String deletereply = BASEURL + "deletereply";
  static const String replycomment = BASEURL + "replycomment";
  static const String loadreplies = BASEURL + "loadreplies";
  static const String reportcomment = BASEURL + "reportcomment";
  static const String storeFcmToken = BASEURL + "storefcmtoken";

  static const String getUsersToFollow = BASEURL + "get_users_to_follow";
  static const String followUnfollowUser = BASEURL + "follow_unfollow_user";
  static const String userNotifications = BASEURL + "userNotifications";
  static const String fetchUserSettings = BASEURL + "fetch_user_settings";
  static const String updateUserSettings = BASEURL + "update_user_settings";
  static const String fetchUserPosts = BASEURL + "fetch_posts_flutter";
  static const String likeunlikepost = BASEURL + "likeunlikepost";
  static const String pinunpinpost = BASEURL + "pinunpinpost";
  static const String postLikesPeople = BASEURL + "post_likes_people";
  static const String fetchUserPins = BASEURL + "fetchUserPinsFlutter";
  static const String loadpostcomments = BASEURL + "loadpostcomments";
  static const String makepostcomment = BASEURL + "makepostcomment";
  static const String editpostcomment = BASEURL + "editpostcomment";
  static const String deletepostcomment = BASEURL + "deletepostcomment";
  static const String reportpostcomment = BASEURL + "reportpostcomment";
  static const String loadpostreplies = BASEURL + "loadpostreplies";
  static const String replypostcomment = BASEURL + "replypostcomment";
  static const String editpostreply = BASEURL + "editpostreply";
  static const String deletepostreply = BASEURL + "deletepostreply";
  static const String userBioInfoFlutter = BASEURL + "userBioInfoFlutter";
  static const String fetchUserdataPosts = BASEURL + "fetchUserPostsflutter";
  static const String usersFollowPeopleList = BASEURL + "users_follow_people";
  static const String makePost = BASEURL + "make_post_flutter";
  static const String editPost = BASEURL + "editpost";
  static const String deletePost = BASEURL + "deletepost";
  static const String updateUserSocialFcmToken =
      BASEURL + "updateUserSocialFcmToken";

  static const String FETCH_USER_CHATS = BASEURL + "fetch_user_chats";
  static const String FETCH_PARTNER_CHATS = BASEURL + "fetch_user_partner_chat";
  static const String SAVE_CHAT_CONVERSATION =
      BASEURL + "save_user_conversation";
  static const String ONSEEN_USER_CONVERSATION =
      BASEURL + "on_seen_conversation";
  static const String ON_USER_TYPING = BASEURL + "on_user_typing";
  static const String UPDATE_ONLINE_PRESENCE =
      BASEURL + "update_user_online_status";
  static const String DELETE_SELECTED_CHATS =
      BASEURL + "delete_selected_chat_messages";
  static const String CLEAR_USER_CONVERSATION =
      BASEURL + "clear_user_conversation";
  static const String BLOCK_UNBLOCK_USER = BASEURL + "blockUnblockUser";
  static const String LOAD_MORE_CHATS = BASEURL + "load_more_chats";
  static const String CHECK_FOR_NEW_MESSAGES = BASEURL + "checkfornewmessages";
  static const String DELETE_ACCOUNT = BASEURL + "deleteaccount";
}
