class UploadedPost{
  String productName;
  String brandName;
  String productCategory;
// the productImage could be File Object or String (URL)
  dynamic productImage;
  int? fakeVotes;
  int? originalVotes;
  String? postDate;
  String? uploaderUsername;
  String? uploaderImage;
  String? postID;


  UploadedPost({required this.productName, required this.brandName, required this.productCategory,
    required this.productImage, this.postDate, this.postID,
  this.uploaderUsername, this.uploaderImage});
}