namespace PremierLeagueAPI.Models.DTO
{
    public class RankingDTO
    {
        public string ClubName { get; set; }
        public string Image { get; set; }
        public int Id { get; set; }
        public int Matches { get; set; }
        public int Win { get; set; }
        public int Draw { get; set; }
        public int? Lose { get; set; }
        public int Goal { get; set; }
        public int LoseGoal { get; set; }
        public int NumberDifference { get; set; }
        public int Score { get; set; }
    }

    public class RankingUpdateDTO
    {
        public int Matches { get; set; }
        public int Win { get; set; }
        public int Draw { get; set; }
        public int? Lose { get; set; }
        public int Score { get; set; }
        public int NumberDifference { get; set; }
        public int Goal { get; set; }
        public int LoseGoal { get; set; }
    }
}
