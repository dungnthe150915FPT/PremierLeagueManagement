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
    public class CostumeManufacturerController : ControllerBase
    {
        private readonly PremierLeagueContext _context;

        public CostumeManufacturerController(PremierLeagueContext context)
        {
            _context = context;
        }

        [HttpGet("GetAllCostumeManufacturers")]
        public IActionResult GetAllCostumeManufacturers()
        {
            var manufacturers = _context.CostumeManufacturers.ToList();
            return Ok(manufacturers);
        }

        [HttpGet("GetCostumeManufacturerById/{id}")]
        public IActionResult GetCostumeManufacturerById(int id)
        {
            var manufacturer = _context.CostumeManufacturers.FirstOrDefault(m => m.Id == id);

            if (manufacturer == null)
            {
                return NotFound();
            }

            return Ok(manufacturer);
        }

        [HttpPost("CreateCostumeManufacturer")]
        public IActionResult CreateCostumeManufacturer([FromBody] CostumeManufacturer newManufacturer)
        {
            try
            {
                _context.CostumeManufacturers.Add(newManufacturer);
                _context.SaveChanges();

                return Ok();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal Server Error: {ex.Message}");
            }
        }

        [HttpPut("UpdateCostumeManufacturer/{id}")]
        public IActionResult UpdateCostumeManufacturer(int id, [FromBody] CostumeManufacturer updatedManufacturer)
        {
            try
            {
                var existingManufacturer = _context.CostumeManufacturers.FirstOrDefault(m => m.Id == id);

                if (existingManufacturer == null)
                {
                    return NotFound();
                }

                existingManufacturer.CostumeManufaturerName = updatedManufacturer.CostumeManufaturerName;
                // Update other properties as needed

                _context.SaveChanges();

                return Ok();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal Server Error: {ex.Message}");
            }
        }

        [HttpDelete("DeleteCostumeManufacturer/{id}")]
        public IActionResult DeleteCostumeManufacturer(int id)
        {
            try
            {
                var manufacturer = _context.CostumeManufacturers.FirstOrDefault(m => m.Id == id);

                if (manufacturer == null)
                {
                    return NotFound();
                }

                _context.CostumeManufacturers.Remove(manufacturer);
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
