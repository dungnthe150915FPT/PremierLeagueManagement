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
    public class CoachesController : ControllerBase
    {
        private readonly PremierLeagueContext _context;

        public CoachesController(PremierLeagueContext context)
        {
            _context = context;
        }

        [HttpGet("GetAllCoaches")]
        public IActionResult GetAllCoaches()
        {
            try
            {
                var coaches = _context.Coaches
                    .Include(c => c.Club)
                    .Select(c => new CoachDTO
                    {
                        Id = c.Id,
                        CoachName = c.CoachName,
                        Dob = c.Dob,
                        Nationality = c.Nationality,
                        ReleaseYearInClub = c.ReleaseYearInClub,
                        Image = c.Image,
                        Description = c.Description,
                        ClubId = c.ClubId,
                        ClubName = c.Club.ClubName
                    }).ToList();

                return Ok(coaches);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal Server Error: {ex.Message}");
            }
        }

        [HttpGet("GetCoachById/{id}")]
        public IActionResult GetCoachById(Guid id)
        {
            try
            {
                var coach = _context.Coaches
                    .Include(c => c.Club)
                    .FirstOrDefault(c => c.Id == id);

                if (coach == null)
                    return NotFound();

                var coachDTO = new CoachDTO
                {
                    Id = coach.Id,
                    CoachName = coach.CoachName,
                    Dob = coach.Dob,
                    Nationality = coach.Nationality,
                    ReleaseYearInClub = coach.ReleaseYearInClub,
                    Image = coach.Image,
                    Description = coach.Description,
                    ClubId = coach.ClubId,
                    ClubName = coach.Club.ClubName
                };

                return Ok(coachDTO);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal Server Error: {ex.Message}");
            }
        }

        [HttpPut("UpdateCoach/{id}")]
        public IActionResult UpdateCoach(Guid id, [FromBody] CoachUpdateDTO updatedCoachDTO)
        {
            try
            {
                var existingCoach = _context.Coaches
                    .Include(c => c.Club)
                    .FirstOrDefault(c => c.Id == id);

                if (existingCoach == null)
                    return NotFound();

                // Update coach fields
                existingCoach.CoachName = updatedCoachDTO.CoachName;
                existingCoach.Dob = updatedCoachDTO.Dob;
                existingCoach.Nationality = updatedCoachDTO.Nationality;
                existingCoach.ReleaseYearInClub = updatedCoachDTO.ReleaseYearInClub;
                existingCoach.Image = updatedCoachDTO.Image;
                existingCoach.Description = updatedCoachDTO.Description;

                // Update related entity
                if (existingCoach.ClubId != updatedCoachDTO.ClubId)
                {
                    existingCoach.ClubId = updatedCoachDTO.ClubId;
                    existingCoach.Club = _context.Clubs.Find(updatedCoachDTO.ClubId);
                }

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
