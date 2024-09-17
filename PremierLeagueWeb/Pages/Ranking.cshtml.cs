using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using PremierLeagueAPI.Models.DTO;
using PremierLeagueWeb.Models;

namespace PremierLeagueWeb.Pages
{
    public class RankingModel : PageModel
    {
        private readonly PremierLeagueContext _context;

        public RankingModel(PremierLeagueContext context)
        {
            _context = context;
        }

        public List<RankingDTO> Rankings { get; set; }

        public void OnGet()
        {
            Rankings = _context.Rankings
                .OrderByDescending(r => r.Score)
                .ThenByDescending(r => r.NumberDifference)
                .ThenByDescending(r => r.Goal)
                .Include(r => r.Clubs)
                .Select(r => new RankingDTO
                {
                    ClubName = r.Clubs.First().ClubName,
                    Image = r.Clubs.First().Image,
                    Id = r.Id,
                    Matches = r.Matches,
                    Win = r.Win,
                    Draw = r.Draw,
                    Lose = r.Lose,
                    Goal = r.Goal,
                    LoseGoal = r.LoseGoal,
                    NumberDifference = r.NumberDifference,
                    Score = r.Score
                }).ToList();
        }
    }
}

