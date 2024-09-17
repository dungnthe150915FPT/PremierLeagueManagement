using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using PremierLeagueAPI.Models.DTO;
using PremierLeagueAPI.ModelsDTO;
using PremierLeagueWeb.Models;

namespace PremierLeagueWeb.Pages
{
    public class IndexModel : PageModel
    {
        /*private readonly ILogger<IndexModel> _logger;

        public IndexModel(ILogger<IndexModel> logger)
        {
            _logger = logger;
        }*/

        private readonly PremierLeagueContext _context;

        public IndexModel(PremierLeagueContext context)
        {
            _context = context;
        }

        public List<ClubDTO> Clubs { get; set; }

        public void OnGet()
        {
            Clubs = _context.Clubs
                .Include(c => c.CostumeManufacturerNavigation)
                .Include(c => c.SponsorNavigation)
                .Include(c => c.Coaches)
                .Select(c => new ClubDTO
                {
                    Id = c.Id,
                    ClubName = c.ClubName,
                    Image = c.Image,
                    Description = c.Description,
                    ReleaseYear = c.ReleaseYear,
                    Stadium = c.Stadium,
                    CostumeManufacturerName = c.CostumeManufacturerNavigation.CostumeManufaturerName,
                    SponsorName = c.SponsorNavigation.SponsorName,
                    Coaches = c.Coaches.Select(coach => new CoachDTO
                    {
                        Id = coach.Id,
                        CoachName = coach.CoachName,
                    }).ToList()
                }).ToList();
        }
    }
}