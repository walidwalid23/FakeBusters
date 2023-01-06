
class Post{
  String postID;
String productName;
String brandName;
String productCategory;
// the productImage could be File Object or String (URL)
dynamic productImage;
int? fakeVotes;
int? originalVotes;
String? postDate;
String uploaderUsername;
String uploaderImage;
bool isCurrentUserUploader;
bool hasCurrentUserVoted;

Post({required this.productName, required this.brandName, required this.productCategory,
required this.productImage, this.postDate, required this.uploaderImage, required this.uploaderUsername,
required this.postID, required this.isCurrentUserUploader,
 required this.hasCurrentUserVoted
});
}