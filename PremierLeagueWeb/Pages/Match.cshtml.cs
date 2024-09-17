using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using PremierLeagueWeb.Models;

namespace PremierLeagueWeb.Pages
{
    public class MatchModel : PageModel
    {
        private readonly PremierLeagueContext _context;

        public MatchModel(PremierLeagueContext context)
        {
            _context = context;
        }

        public List<Match> UpcomingMatches { get; set; }
        public List<Match> FutureMatches { get; set; } 

        public void OnGet()
        {
            var currentTime = DateTime.Now;

            UpcomingMatches = _context.Matches
                .Where(m => m.Time > currentTime)
                .OrderBy(m => m.Time)
                .Include(m => m.HomeClub)
                .Include(m => m.AwayClub)
                .ToList();

            FutureMatches = _context.Matches
                .Where(m => m.Time <= currentTime)
                .OrderByDescending(m => m.Time)
                .Include(m => m.HomeClub)
                .Include(m => m.AwayClub)
                .ToList();

                if(UpcomingMatches == null){
                    ViewData["Message"] = "No match up coming";
                }
        }
    }
}
