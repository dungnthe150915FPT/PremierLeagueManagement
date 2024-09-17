namespace PremierLeagueAPI.ModelsDTO
{
    public class PlayerDTO
    {
        public Guid Id { get; set; }

        public string PlayerName { get; set; } = null!;

        public DateTime Dob { get; set; }

        public string Nationality { get; set; } = null!;

        public int Number { get; set; }

        public string Image { get; set; } = null!;

        public int ClubId { get; set; }

        public string PlayerLocationName { get; set; }

        public int PlayerLocationId { get; set; }

        public string? Description { get; set; }
    }
    public class PlayerUpdateDTO
    {
        public string PlayerName { get; set; }
        public DateTime Dob { get; set; }
        public string Nationality { get; set; }
        public int Number { get; set; }
        public string Image { get; set; }
        public int ClubId { get; set; }
        public int PlayerLocationId { get; set; }
        public string Description { get; set; }
    }

    public class PlayerCreateDTO
    {
        public string PlayerName { get; set; }
        public DateTime Dob { get; set; }
        public string Nationality { get; set; }
        public int Number { get; set; }
        public string Image { get; set; }
        public int ClubId { get; set; }
        public int PlayerLocationId { get; set; }
        public string Description { get; set; }
    }
}
