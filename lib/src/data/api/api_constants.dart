class ApiConstants {
  static const String EKYC_ACCESSTOKEN =
      "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlZmVmODVhNC02MDdiLTI3Y2QtZTA1My02MzE5OWYwYTAwOGQiLCJhdWQiOlsicmVzdHNlcnZpY2UiXSwidXNlcl9uYW1lIjoia2hhbmhodXluaGh1dUBnbWFpbC5jb20iLCJzY29wZSI6WyJyZWFkIl0sImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0IiwibmFtZSI6ImtoYW5oaHV5bmhodXVAZ21haWwuY29tIiwidXVpZF9hY2NvdW50IjoiZWZlZjg1YTQtNjA3Yi0yN2NkLWUwNTMtNjMxOTlmMGEwMDhkIiwiYXV0aG9yaXRpZXMiOlsiVVNFUiJdLCJqdGkiOiJlNzAwMzdmNy1kMzdjLTQwYmEtOTVmMi03ZTdiODA1M2QyZTAiLCJjbGllbnRfaWQiOiJhZG1pbmFwcCJ9.mCyqzjDTN_3H0avJyaJXbSCZRdGzBgaqm-e0vvlCnibwHwk04GvBgGlAq3QNgvQUdTQLLWQz79aDTn1fK1W1XwqcpV0Fa6fRM2OIOEhPHiMOGuW8kvgi67rp_zP4SnnYEQN0ClSzbj85RnC4Ux26uuGFFTwrgKlXYrUDkKMi64HnaaCHk-pamWoZKA9woYcj8QvMAGb4zvh21uyC1_Wq5BrMCyJGcDsXMlFVd50xvRacgLzkYNMxOBrI3LmV0VKLOm7eZNwnTs6uyMD7l2PuL-SqzXJdVwHCUJtS3cADWCeLwtrgOQBMOSjF5RuTo3upYHwEpBpxV21TjU5qH57zIg";

  static const String EKYC_TOKENID = "efef8926-2955-2368-e053-62199f0a8157";
  static const String EKYC_TOKENKEY =
      "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKcenJ4wbqE0s/3LpYUmYBTeyxsOLQQnszLg3e/YCecExrR3OvwFRn9bEJMuwvqRJZZrYwdLJjA4db66vLYwViECAwEAAQ==";

  static const BASE_URL = "https://10.8.0.6:17200/api/v1";
  static const EKYC_URL = "https://api.idg.vnpt.vn";

  // Endpoints
  //auth
  static const LOGIN = "/Auth/login";
  static const REGISTER = "/Auth/register";
  static const CHANGE_PASSWORD = "/Auth/change_password";

  //ekyc
  static const EKYC_ADDFILE = "/file-service/v1/addFile";
  static const EKYC_GETINFO = "/ai/v1/ocr/id";
  static const EKYC_COMPARE = "/ai/v1/face/compare";

  //otp
  static const OTP_SEND = "/Verify/send";
  static const OTP_VERIFY = "/Verify/verify";

  // account
  static const GET_BALANCE = "/Account/balance";
  static const TRANSFER = "/Transaction/transfer";
  static const GET_TRANSACTION = "/Transaction/history";
  static const GET_NAME_BY_ACCOUNT_NO = "/Account/name";
  static const ADD_CONTACT = "/Account/add-contact";
  static const GET_CONTACTS = "/Account/contacts";
  static const GET_NOTIFCATIONS = "/Account/notifications";
  static const GET_PASSBOOK_BALANCE = "/Account/passbook-balance";
  static const DEPOSIT = "/Account/deposit";
  static const WITHDRAW = "/Account/withdraw";
  static const CHECK_CONTACT = "/Account/check-contacts";
}
