namespace PremierLeagueAPI.ModelsDTO
{
    public class CoachDTO
    {
        public Guid Id { get; set; }
        public string CoachName { get; set; }
        public DateTime Dob { get; set; }
        public string Nationality { get; set; }
        public DateTime ReleaseYearInClub { get; set; }
        public string Image { get; set; }
        public string Description { get; set; }
        public int ClubId { get; set; }
        public string ClubName { get; set; }
    }

    public class CoachUpdateDTO
    {
        public string CoachName { get; set; }
        public DateTime Dob { get; set; }
        public string Nationality { get; set; }
        public string Image { get; set; }
        public string Description { get; set; }
        public DateTime ReleaseYearInClub { get; set; }
        public int ClubId { get; set; }
    }
}
