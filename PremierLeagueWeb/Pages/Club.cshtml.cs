using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using PremierLeagueAPI.Models.DTO;
using PremierLeagueAPI.ModelsDTO;
using PremierLeagueWeb.Models;

namespace PremierLeagueWeb.Pages
{
    public class ClubModel : PageModel
    {
        private readonly PremierLeagueContext _context;

        public ClubModel(PremierLeagueContext context)
        {
            _context = context;
        }

        public ClubDTO Club { get; set; }

        public IActionResult OnGet(int id)
        {
            var club = _context.Clubs
                .Include(c => c.CostumeManufacturerNavigation)
                .Include(c => c.SponsorNavigation)
                .Include(c => c.Coaches)
                .Include(c => c.Players).ThenInclude(c => c.PlayerLocation) // Include players for the club
                .FirstOrDefault(c => c.Id == id);

            if (club == null)
            {
                return NotFound();
            }

            Club = new ClubDTO
            {
                Id = club.Id,
                ClubName = club.ClubName,
                Image = club.Image,
                Description = club.Description,
                ReleaseYear = club.ReleaseYear,
                Stadium = club.Stadium,
                CostumeManufacturerName = club.CostumeManufacturerNavigation.CostumeManufaturerName,
                SponsorName = club.SponsorNavigation.SponsorName,
                Coaches = club.Coaches.Select(coach => new CoachDTO
                {
                    Id = coach.Id,
                    CoachName = coach.CoachName,
                    Dob = coach.Dob,
                    Image = coach.Image,
                    ReleaseYearInClub = coach.ReleaseYearInClub,
                    Nationality = coach.Nationality,
                    Description = coach.Description
                }).ToList(),
                Players = club.Players.Select(player => new PlayerDTO
                {
                    Id = player.Id,
                    PlayerName = player.PlayerName,
                    Dob = player.Dob,
                    Nationality = player.Nationality,
                    Number = player.Number,
                    Image = player.Image,
                    PlayerLocationName = player.PlayerLocation.PlayerLocationName
                }).ToList()
            };

            // Add logging to check if Players collection is null
            if (Club.Players == null)
            {
                Console.WriteLine("Players collection is null");
            }

            return Page();
        }
    }
}
