class Vote{
   int fakeVotes;
   int originalVotes;

   Vote({required this.fakeVotes, required this.originalVotes});

   String getFakeVotesPercentage(){
      if(fakeVotes + originalVotes ==0){
         // Avoid dividing by 0 to prevent NAN EXCEPTION
         return "0";
      }
      else {
         double fakeVotesPercentage = (fakeVotes /
             (fakeVotes + originalVotes)) * 100;
         return fakeVotesPercentage.toStringAsFixed(2);
      }
   }
   String getOriginalVotesPercentage(){
      if(fakeVotes + originalVotes ==0){
         // Avoid dividing by 0 to prevent NAN EXCEPTION
         return "0";
      }
      else {
         double originalVotesPercentage = (originalVotes /
             (fakeVotes + originalVotes)) * 100;
         return originalVotesPercentage.toStringAsFixed(2);
      }
   }
}