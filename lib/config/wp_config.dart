class WpConfig {


  // YOUR WEBISTE URL
  static const String websiteUrl = "https://katoala.com";

  // CREDENTIALS
  static final String websiteAdminName = "katoaladm";
  static final String websiteAdminPassword = "7Y0GJ%TFIZke@(c8*ugrlNIi";

  //Tag Ids - CHANGE THESE
  static final int featuredTagID = 430;
  static final int videoTagId = 12;

  

  // Hometab 4 categories - CHANGE THESE
  // -- 'Serial Number' : [Category Id, 'Category Name'] -- Length should be 4.
  static final Map selectedCategories = {
    '1': [18, "Música"],
    '2': [21, "Vidas"],
    '3': [6, "Especiais"],
    '4': [435, "Lifestyle"],

  };


  

  // FEATURE IMGAE -  IF YOUR POSTS DON"T HAVE A FEATURE IMAGE
  static const String randomPostFeatureImage = "https://innov8tiv.com/wp-content/uploads/2017/10/blank-screen-google-play-store-1280x720.png";

  // FEATURE CATEGORY IMGAE -  IF YOU HAVEN'T DEFINE A COVER IMAGE FOR A CATEGORY IN THE LIST BELOW
  static const String randomCategoryThumbnail = "https://images.unsplash.com/photo-1494253109108-2e30c049369b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8cmFuZG9tfGVufDB8MHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60";


  // ENTER CATERGORY ID AND ITS COVERS IMAGE - CHANGE THESE
  static const Map categoryThumbnails = {
    // categoryID : 'category thumbnail url'
    9 : "https://images.unsplash.com/photo-1444653389962-8149286c578a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODV8fGJ1c2luZXNzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    2 : "https://images.unsplash.com/photo-1603739903239-8b6e64c3b185?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fGVudGVydGFpbm1lbnR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    10 : "https://images.unsplash.com/photo-1507138086030-616c3b6dd768?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTE1fHxsaWZlc3R5bGV8ZW58MHwwfDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    8 : "https://images.pexels.com/photos/1250655/pexels-photo-1250655.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    7 : "https://images.pexels.com/photos/2698475/pexels-photo-2698475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    5 : "https://images.unsplash.com/photo-1496065187959-7f07b8353c55?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8c2NpZW5jZXxlbnwwfDB8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    3 : "https://images.pexels.com/photos/2885940/pexels-photo-2885940.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    6 : "https://images.pexels.com/photos/1036936/pexels-photo-1036936.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    4 : "https://images.pexels.com/photos/3885493/pexels-photo-3885493.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
  };
}