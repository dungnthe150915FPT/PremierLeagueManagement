using PremierLeagueAPI.ModelsDTO;

namespace PremierLeagueAPI.Models.DTO
{
    public class ClubDTO
    {
        public int Id { get; set; }
        public string ClubName { get; set; }
        public string Image { get; set; }
        public string Description { get; set; }
        public int ReleaseYear { get; set; }
        public string Stadium { get; set; }
        public string CostumeManufacturerName { get; set; }
        public string SponsorName { get; set; }
        public List<CoachDTO> Coaches { get; set; }
    }

    public class ClubUpdateDTO
    {
        public string Image { get; set; }
        public int ReleaseYear { get; set; }
        public string ClubName { get; set; }
        public string Description { get; set; }
        public string Stadium { get; set; }
        public int CostumeManufacturerID { get; set; }
        public int SponsorID { get; set; }
    }
}
