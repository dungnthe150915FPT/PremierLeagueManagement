using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using PremierLeagueAPI.ModelsDTO;
using PremierLeagueWeb.Models;

namespace PremierLeagueWeb.Pages
{
    public class CoachModel : PageModel
    {
        private readonly PremierLeagueContext _context;

        public CoachModel(PremierLeagueContext context)
        {
            _context = context;
        }

        public CoachDTO Coach { get; set; }

        public IActionResult OnGet(Guid id)
        {
            var coach = _context.Coaches
                .FirstOrDefault(c => c.Id == id);

            if (coach == null)
            {
                return NotFound();
            }

            Coach = new CoachDTO
            {
                Id = coach.Id,
                CoachName = coach.CoachName,
                Dob = coach.Dob, // Format the date
                Nationality = coach.Nationality,
                ReleaseYearInClub = coach.ReleaseYearInClub,
                Image = coach.Image,
                Description = coach.Description
                // Add other coach properties here
            };

            return Page();
        }
    }
}
