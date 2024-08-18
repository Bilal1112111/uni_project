//final  baseUrl ="http://localhost:8080/";
// const baseServ = "http://192.168.137.101:8000/";
const baseServ = "https://dailydeals.houseofgeniuses.tech/";
const baseUrl = "${baseServ}api/";
const auth = "auth/";
const comment = "comment/";
const rate = "rate/";
const offer = "offer/";
const appInfo = "app_info/";

class AppUrl {
/*>>>>>>>>>> Auth <<<<<<<<<<*/
  static const register = "$baseUrl${auth}register";
  static const login = "$baseUrl${auth}login";
  static const verifyEmail = "$baseUrl${auth}verifyEmail";
  static const resendVerifyEmailCode = "$baseUrl${auth}resendVerifyEmailCode";
  static const forgetPassword = "$baseUrl${auth}forgetPassword";
  static const forgetPasswordCode = "$baseUrl${auth}forgetPasswordVerify";
  static const resendForgetPasswordVerifyCode =
      "$baseUrl${auth}resendForgetPasswordVerifyCode";
  static const forgetPasswordChange = "$baseUrl${auth}forgetPasswordChange";
  static const changePassword = "$baseUrl${auth}changePassword";
  static const logOut = "$baseUrl${auth}logout";
  /*>>>>>>>>>> Category <<<<<<<<<<*/
  static const listVisibleCategories = "$baseUrl${auth}list_visible_categories";
  /*>>>>>>>>>> Profile <<<<<<<<<<*/
  static const getProfile = "$baseUrl${auth}get_my_profile";
  static const updateProfile = "$baseUrl${auth}update_my_profile";
  static const accountSoftDelete = "$baseUrl${auth}soft_delete_my_account";
  static const accountHardDelete = "$baseUrl${auth}hard_delete_my_account";
  static const restoreAccount = "$baseUrl${auth}restore_my_account";
  /*>>>>>>>>>> Store <<<<<<<<<<*/
  static const storeById = "$baseUrl${auth}store_byID";
  static const showStoreById = "$baseUrl${auth}show_store";
  static const listVisibleStores = "${baseUrl}list_visible_stores";
  /*>>>>>>>>>> Merchant <<<<<<<<<<*/
  static const getMerchantDetail = "$baseUrl${auth}get_merchant_detail";
  static const listMerchantBranches = "${baseUrl}list_merchant_branches";
  static const listMerchantStores = "${baseUrl}list_merchant_stores";
  static const getAllMerchants = "$baseUrl${auth}get_all_merchants";
  /*>>>>>>>>>> Branch <<<<<<<<<<*/
  static const branchById = "$baseUrl${auth}Branch_byID";
  static const listCustomerBranches = "${baseUrl}list_customer_branches";
  /*>>>>>>>>>> Customer <<<<<<<<<<*/
  static const getAllCustomers = "$baseUrl${auth}get_all_customers";
  /*>>>>>>>>>> Comments <<<<<<<<<<*/
  static const addComment = "$baseUrl${comment}addComment";
  static const updateComment = "$baseUrl${comment}updateComment";
  static const deleteComment = "$baseUrl${comment}deleteComment";
  static const getAllCommentsOnOffer =
      "$baseUrl${comment}getAllCommentsOnOffer";
  /*>>>>>>>>>> Rate <<<<<<<<<<*/
  static const addRate = "$baseUrl${rate}addRate";
  static const getBranchesQRs = "$baseUrl${rate}getBranchesQRs";
  /*>>>>>>>>>> Favourite <<<<<<<<<<*/
  static const addFavourite = "${baseUrl}add_favorite";
  static const listFavourite = "${baseUrl}list_favorite";
  /*>>>>>>>>>> Notification <<<<<<<<<<*/
  static const addNotified = "${baseUrl}add_notified";
  static const deleteNotified = "${baseUrl}delete_notified";
  static const listMyNotified = "${baseUrl}list_my_notified";
  /*>>>>>>>>>> Complaint <<<<<<<<<<*/
  static const addComplaint = "${baseUrl}add_complaint";
  /*>>>>>>>>>> Advertisement <<<<<<<<<<*/
  static const addAdvertisement = "${baseUrl}add_advertisement";
  static const listAdvertisement = "$baseUrl${auth}list_advertisement";
  static const advertisementAcceptedDetails =
      "$baseUrl${auth}advertisement_accepted_details";
  /*>>>>>>>>>> Offer <<<<<<<<<<*/
  static const addOfferType = "$baseUrl${offer}addOfferTypeRequest";
  static const updateOfferType = "$baseUrl${offer}updateOfferTypeRequest";
  static const deleteOfferType = "$baseUrl${offer}deleteOfferTypeRequest";
  static const getAllOffer = "$baseUrl${offer}getAll";
  static const getAllOfferForUser = "$baseUrl${offer}getAllForUser";
  /*>>>>>>>>>> App Info <<<<<<<<<<*/
  static const showPrivacyPolicy = "$baseUrl${appInfo}showPrivacyPolicy";
  static const showTermsAndConditions =
      "$baseUrl${appInfo}showTermsAndConditions";
  static const showAboutApp = "$baseUrl${appInfo}showAboutApp";
  static const getFAQ = "$baseUrl${auth}get_faq";
}
