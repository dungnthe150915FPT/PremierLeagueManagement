// Controllers/CostumeManufacturerController.cs

using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PremierLeagueAPI.Models;
using System.Collections.Generic;
using System.Linq;

namespace PremierLeagueAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SponsorController : ControllerBase
    {
        private readonly PremierLeagueContext _context;

        public SponsorController(PremierLeagueContext context)
        {
            _context = context;
        }

        [HttpGet("GetAllSponsors")]
        public IActionResult GetAllSponsor()
        {
            var sponsors = _context.Sponsors.ToList();
            return Ok(sponsors);
        }

        [HttpGet("GetSponsorById/{id}")]
        public IActionResult GetSponsorById(int id)
        {
            var sponsor = _context.Sponsors.FirstOrDefault(m => m.Id == id);

            if (sponsor == null)
            {
                return NotFound();
            }

            return Ok(sponsor);
        }

        [HttpPost("CreateSponsor")]
        public IActionResult CreateSponsor([FromBody] Sponsor newSponsor)
        {
            try
            {
                _context.Sponsors.Add(newSponsor);
                _context.SaveChanges();

                return Ok();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal Server Error: {ex.Message}");
            }
        }

        [HttpPut("UpdateSponsor/{id}")]
        public IActionResult UpdateSponsor(int id, [FromBody] Sponsor updateSponsor)
        {
            try
            {
                var existingSponsor = _context.Sponsors.FirstOrDefault(m => m.Id == id);

                if (existingSponsor == null)
                {
                    return NotFound();
                }

                existingSponsor.SponsorName = updateSponsor.SponsorName;
                // Update other properties as needed

                _context.SaveChanges();

                return Ok();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal Server Error: {ex.Message}");
            }
        }

        [HttpDelete("DeleteSponsor/{id}")]
        public IActionResult DeleteSponsor(int id)
        {
            try
            {
                var sponsor = _context.Sponsors.FirstOrDefault(m => m.Id == id);

                if (sponsor == null)
                {
                    return NotFound();
                }

                _context.Sponsors.Remove(sponsor);
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
