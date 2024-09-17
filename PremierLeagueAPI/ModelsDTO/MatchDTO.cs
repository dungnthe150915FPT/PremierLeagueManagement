namespace PremierLeagueAPI.ModelsDTO
{
    public class MatchDTO
    {
        public Guid Id { get; set; }

        public DateTime Time { get; set; }

        public int HomeClubId { get; set; }

        public int AwayClubId { get; set; }

        public string HomeClubName { get; set; }

        public string AwayClubName { get; set; }

        public int HomeClubScore { get; set; }

        public int AwayClubScore { get; set; }
    }

    public class MatchUpdateDTO
    {
        public DateTime Time { get; set; }

        public int HomeClubId { get; set; }

        public int AwayClubId { get; set; }

        public int HomeClubScore { get; set; }

        public int AwayClubScore { get; set; }
    }

    public class MatchCreateDTO
    {
        public DateTime Time { get; set; }

        public int HomeClubId { get; set; }

        public int AwayClubId { get; set; }

        public int HomeClubScore { get; set; }

        public int AwayClubScore { get; set; }
    }
}
