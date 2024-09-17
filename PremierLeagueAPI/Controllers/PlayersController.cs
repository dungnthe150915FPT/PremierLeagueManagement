using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PremierLeagueAPI.Models;
using PremierLeagueAPI.ModelsDTO;

namespace PremierLeagueAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PlayersController : ControllerBase
    {
        private readonly PremierLeagueContext _context;

        public PlayersController(PremierLeagueContext context)
        {
            _context = context;
        }

        [HttpGet("GetAllPlayers")]
        public IActionResult GetAllPlayers()
        {
            try
            {
                var players = _context.Players
                    .Include(p => p.PlayerLocation)
                    .Include(p => p.Club).OrderBy(p => p.PlayerLocationId)
                    .Select(p => new
                    {
                        Id = p.Id,
                        PlayerName = p.PlayerName,
                        Dob = p.Dob,
                        Nationality = p.Nationality,
                        Number = p.Number,
                        Image = p.Image,
/*                        ClubId = p.ClubId,
                        PlayerLocationId = p.PlayerLocationId,*/
                        Description = p.Description,
                        ClubName = p.Club.ClubName,
                        PlayerLocationName = p.PlayerLocation.PlayerLocationName
                    }).ToList();

                return Ok(players);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal Server Error: {ex.Message}");
            }
        }

        [HttpGet("GetPlayerById/{id}")]
        public IActionResult GetPlayerById(Guid id)
        {
            try
            {
                var player = _context.Players
                    .Include(p => p.PlayerLocation)
                    .Include(p => p.Club)
                    .FirstOrDefault(p => p.Id == id);

                if (player == null)
                    return NotFound();

                var playerDto = new
                {
                    Id = player.Id,
                    PlayerName = player.PlayerName,
                    Dob = player.Dob,
                    Nationality = player.Nationality,
                    Number = player.Number,
                    Image = player.Image,
/*                    ClubId = player.ClubId,
                    PlayerLocationId = player.PlayerLocationId,*/
                    Description = player.Description,
                    ClubName = player.Club.ClubName,
                    PlayerLocationName = player.PlayerLocation.PlayerLocationName
                };

                return Ok(playerDto);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal Server Error: {ex.Message}");
            }
        }

        [HttpPost("CreatePlayer")]
        public IActionResult CreatePlayer([FromBody] PlayerCreateDTO newPlayerDTO)
        {
            try
            {
                var newPlayer = new Player
                {
                    Id = Guid.NewGuid(),
                    PlayerName = newPlayerDTO.PlayerName,
                    Dob = newPlayerDTO.Dob,
                    Nationality = newPlayerDTO.Nationality,
                    Number = newPlayerDTO.Number,
                    Image = newPlayerDTO.Image,
                    Description = newPlayerDTO.Description,
                    ClubId = newPlayerDTO.ClubId,
                    PlayerLocationId = newPlayerDTO.PlayerLocationId
                };

                // Attach related entities
                newPlayer.Club = _context.Clubs.Find(newPlayerDTO.ClubId);
                newPlayer.PlayerLocation = _context.PlayerLocations.Find(newPlayerDTO.PlayerLocationId);

                _context.Players.Add(newPlayer);
                _context.SaveChanges();

                return Ok();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal Server Error: {ex.Message}");
            }
        }


        [HttpPut("UpdatePlayer/{id}")]
        public IActionResult UpdatePlayer(Guid id, [FromBody] PlayerUpdateDTO updatedPlayerDTO)
        {
            try
            {
                var existingPlayer = _context.Players
                    .Include(p => p.PlayerLocation)
                    .Include(p => p.Club)
                    .FirstOrDefault(p => p.Id == id);

                if (existingPlayer == null)
                    return NotFound();

                // Update player fields
                existingPlayer.PlayerName = updatedPlayerDTO.PlayerName;
                existingPlayer.Dob = updatedPlayerDTO.Dob;
                existingPlayer.Nationality = updatedPlayerDTO.Nationality;
                existingPlayer.Number = updatedPlayerDTO.Number;
                existingPlayer.Image = updatedPlayerDTO.Image;
                existingPlayer.Description = updatedPlayerDTO.Description;

                // Update related entities
                if (existingPlayer.ClubId != updatedPlayerDTO.ClubId)
                {
                    existingPlayer.ClubId = updatedPlayerDTO.ClubId;
                    existingPlayer.Club = _context.Clubs.Find(updatedPlayerDTO.ClubId);
                }

                if (existingPlayer.PlayerLocationId != updatedPlayerDTO.PlayerLocationId)
                {
                    existingPlayer.PlayerLocationId = updatedPlayerDTO.PlayerLocationId;
                    existingPlayer.PlayerLocation = _context.PlayerLocations.Find(updatedPlayerDTO.PlayerLocationId);
                }

                _context.SaveChanges();

                return Ok();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal Server Error: {ex.Message}");
            }
        }


        [HttpDelete("DeletePlayer/{id}")]
        public IActionResult DeletePlayer(Guid id)
        {
            try
            {
                var player = _context.Players.FirstOrDefault(p => p.Id == id);

                if (player == null)
                    return NotFound();

                _context.Players.Remove(player);
                _context.SaveChanges();

                return Ok();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal Server Error: {ex.Message}");
            }
        }
    }
}
