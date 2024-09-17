using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PremierLeagueAPI.Models;
using PremierLeagueAPI.ModelsDTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PremierLeagueAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MatchesController : ControllerBase
    {
        private readonly PremierLeagueContext _context;

        public MatchesController(PremierLeagueContext context)
        {
            _context = context;
        }

        [HttpGet("GetAllMatches")]
        public IActionResult GetAllMatches()
        {
            try
            {
                var matches = _context.Matches
                    .Include(m => m.HomeClub)
                    .Include(m => m.AwayClub)
                    .OrderBy(m => m.Time)
                    .Select(m => new MatchDTO
                    {
                        Id = m.Id,
                        Time = m.Time,
                        HomeClubId = m.HomeClubId,
                        AwayClubId = m.AwayClubId,
                        HomeClubName = m.HomeClub.ClubName,
                        AwayClubName = m.AwayClub.ClubName,
                        HomeClubScore = m.HomeClubScore,
                        AwayClubScore = m.AwayClubScore
                    })
                    .ToList();

                return Ok(matches);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal Server Error: {ex.Message}");
            }
        }

        [HttpGet("GetMatchById/{id}")]
        public IActionResult GetMatchById(Guid id)
        {
            try
            {
                var match = _context.Matches
                    .Include(m => m.HomeClub)
                    .Include(m => m.AwayClub)
                    .FirstOrDefault(m => m.Id == id);

                if (match == null)
                    return NotFound();

                var matchDTO = new MatchDTO
                {
                    Id = match.Id,
                    Time = match.Time,
                    HomeClubId = match.HomeClubId,
                    AwayClubId = match.AwayClubId,
                    HomeClubName = match.HomeClub.ClubName,
                    AwayClubName = match.AwayClub.ClubName,
                    HomeClubScore = match.HomeClubScore,
                    AwayClubScore = match.AwayClubScore
                };

                return Ok(matchDTO);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal Server Error: {ex.Message}");
            }
        }

        [HttpPost("CreateMatch")]
        public IActionResult CreateMatch([FromBody] MatchCreateDTO newMatchDTO)
        {
            try
            {
                var newMatch = new Match
                {
                    Id = Guid.NewGuid(),
                    Time = newMatchDTO.Time,
                    HomeClubId = newMatchDTO.HomeClubId,
                    AwayClubId = newMatchDTO.AwayClubId,
                    HomeClubScore = newMatchDTO.HomeClubScore,
                    AwayClubScore = newMatchDTO.AwayClubScore
                };

                // Attach related entities
                newMatch.HomeClub = _context.Clubs.Find(newMatchDTO.HomeClubId);
                newMatch.AwayClub = _context.Clubs.Find(newMatchDTO.AwayClubId);

                _context.Matches.Add(newMatch);
                _context.SaveChanges();

                return Ok();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal Server Error: {ex.Message}");
            }
        }

        [HttpPut("UpdateMatch/{id}")]
        public IActionResult UpdateMatch(Guid id, [FromBody] MatchUpdateDTO updatedMatchDTO)
        {
            try
            {
                var existingMatch = _context.Matches
                    .Include(m => m.HomeClub)
                    .Include(m => m.AwayClub)
                    .FirstOrDefault(m => m.Id == id);

                if (existingMatch == null)
                    return NotFound();

                // Update match fields
                existingMatch.Time = updatedMatchDTO.Time;
                existingMatch.HomeClubId = updatedMatchDTO.HomeClubId;
                existingMatch.AwayClubId = updatedMatchDTO.AwayClubId;
                existingMatch.HomeClubScore = updatedMatchDTO.HomeClubScore;
                existingMatch.AwayClubScore = updatedMatchDTO.AwayClubScore;

                // Update related entities
                if (existingMatch.HomeClubId != updatedMatchDTO.HomeClubId)
                {
                    existingMatch.HomeClubId = updatedMatchDTO.HomeClubId;
                    existingMatch.HomeClub = _context.Clubs.Find(updatedMatchDTO.HomeClubId);
                }

                if (existingMatch.AwayClubId != updatedMatchDTO.AwayClubId)
                {
                    existingMatch.AwayClubId = updatedMatchDTO.AwayClubId;
                    existingMatch.AwayClub = _context.Clubs.Find(updatedMatchDTO.AwayClubId);
                }

                _context.SaveChanges();

                return Ok();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal Server Error: {ex.Message}");
            }
        }

        [HttpDelete("DeleteMatch/{id}")]
        public IActionResult DeleteMatch(Guid id)
        {
            try
            {
                var match = _context.Matches.FirstOrDefault(m => m.Id == id);

                if (match == null)
                    return NotFound();

                _context.Matches.Remove(match);
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
