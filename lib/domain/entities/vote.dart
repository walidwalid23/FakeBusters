class Vote{
   int fakeVotes;
   int originalVotes;

   Vote({required this.fakeVotes, required this.originalVotes});

   String getFakeVotesPercentage(){
      double fakeVotesPercentage = (fakeVotes/(fakeVotes+originalVotes))*100;
      return fakeVotesPercentage.toStringAsFixed(2);
   }
   String getOriginalVotesPercentage(){
      double originalVotesPercentage = (originalVotes/(fakeVotes+originalVotes))*100;
      return originalVotesPercentage.toStringAsFixed(2);
   }
}