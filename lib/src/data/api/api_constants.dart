class ApiConstants {
  static const String EKYC_ACCESSTOKEN =
      "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlZWQ1YzlkZC1hNWI0LTI1NDEtZTA1My02MzE5OWYwYWE0OTIiLCJhdWQiOlsicmVzdHNlcnZpY2UiXSwidXNlcl9uYW1lIjoia2hhbmgyMDEwMTFAZ21haWwuY29tIiwic2NvcGUiOlsicmVhZCJdLCJpc3MiOiJodHRwczovL2xvY2FsaG9zdCIsIm5hbWUiOiJraGFuaDIwMTAxMUBnbWFpbC5jb20iLCJ1dWlkX2FjY291bnQiOiJlZWQ1YzlkZC1hNWI0LTI1NDEtZTA1My02MzE5OWYwYWE0OTIiLCJhdXRob3JpdGllcyI6WyJVU0VSIl0sImp0aSI6IjJmODNlNDA4LTQ0NjgtNDIyYi04ZGUyLWU3NDVhODA5MzMxNSIsImNsaWVudF9pZCI6ImFkbWluYXBwIn0.w1BBCcJV7zcr8IpZeKk-G1IL_97ZpgvxfvIEjl7q7aZiF2xMwdIHpc5jtpRQcCIjCRsDMX5MDQ7sDSlYZyIyV-2es94a3E_NOFMOG0zyj7vmGcR_LdMK_2tqY9R9h3aISYJfp26zPDFnEGRWU8DdTjcRjWf-RwaZ2fCNK9rwKpiaCK9qFsxUkABjtj9WQKJxtyITWr8rYrRe9B-xmk9BxM-76F86HUyC3NU_gyZAS2wYCTOgJ5IN6wEpXeASouEZXIaL19S6_C_OswOGAdp3SFK27FBrODDEeYsdIabGdwu-roaHmU5cTxdrJ0BlYnUmHrHLVrHJDAS72NAKv48DQA";
  static const String EKYC_TOKENID = "eed5cc40-3160-185d-e053-63199f0a48db";
  static const String EKYC_TOKENKEY =
      "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBALrRKXisljsJFBPkXaYq5JmN2QyJJLBXxdA8U7r293RvtT7k1ei+M7WYGHnr48J5DJADSrqCppVQm6B9JM9ys4MCAwEAAQ==";

  static const BASE_URL = "https://10.0.2.2:17200/api/v1";
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
}
