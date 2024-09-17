using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using PremierLeagueAPI.ModelsDTO;
using PremierLeagueWeb.Models;

namespace PremierLeagueWeb.Pages
{
    public class PlayerModel : PageModel
    {
        private readonly PremierLeagueContext _context;

        public PlayerModel(PremierLeagueContext context)
        {
            _context = context;
        }

        public PlayerDTO Player { get; set; }

        public IActionResult OnGet(Guid id)
        {
            var player = _context.Players
                .Include(p => p.PlayerLocation)
                .FirstOrDefault(p => p.Id == id);

            if (player == null)
            {
                return NotFound();
            }

            Player = new PlayerDTO
            {
                Id = player.Id,
                PlayerName = player.PlayerName,
                Dob = player.Dob,
                Nationality = player.Nationality,
                PlayerLocationName = player.PlayerLocation.PlayerLocationName,
                Number = player.Number,
                Image = player.Image,
                Description = player.Description
            };

            return Page();
        }
    }
}

