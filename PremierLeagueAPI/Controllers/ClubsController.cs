using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PremierLeagueAPI.Models;
using PremierLeagueAPI.Models.DTO;
using PremierLeagueAPI.ModelsDTO;

namespace PremierLeagueAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ClubsController : ControllerBase
    {
        private readonly PremierLeagueContext _context;
        public ClubsController(PremierLeagueContext context)
        {
            _context = context;
        }
        /*[Authorize]*/
        [HttpGet("GetAllClubs")]
        public IActionResult GetAllClubs()
        {
            try
            {
                var clubs = _context.Clubs
                    .Include(c => c.CostumeManufacturerNavigation)
                    .Include(c => c.SponsorNavigation)
                    .Include(c => c.Coaches)
                    .Select(c => new ClubDTO
                    {
                        Id = c.Id,
                        ClubName = c.ClubName,
                        Image = c.Image,
                        Description = c.Description,
                        ReleaseYear = c.ReleaseYear,
                        Stadium = c.Stadium,
                        CostumeManufacturerName = c.CostumeManufacturerNavigation.CostumeManufaturerName,
                        SponsorName = c.SponsorNavigation.SponsorName,
                        Coaches = c.Coaches.Select(coach => new CoachDTO
                        {
                            Id = coach.Id,
                            CoachName = coach.CoachName,
                            Dob = coach.Dob,
                            Image = coach.Image,
                            ReleaseYearInClub = coach.ReleaseYearInClub,
                            Nationality = coach.Nationality,
                            Description = coach.Description,
                            ClubId = coach.ClubId,
                            ClubName = coach.Club.ClubName
                        }).ToList()
                    }).ToList();

                return Ok(clubs);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal Server Error: {ex.Message}");
            }
        }
        /*[Authorize]*/
        [HttpPut("UpdateClub/{id}")]
        public IActionResult UpdateClub(int id, [FromBody] ClubUpdateDTO clubUpdateDTO)
        {
            try
            {
                // Kiểm tra tính hợp lệ của dữ liệu đầu vào
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                // Lấy thông tin CLB cần cập nhật từ database
                var existingClub = _context.Clubs
                    .FirstOrDefault(c => c.Id == id);

                // Nếu không tìm thấy CLB
                if (existingClub == null)
                {
                    return NotFound();
                }

                // Cập nhật thông tin chung của CLB
                existingClub.ClubName = clubUpdateDTO.ClubName;
                existingClub.Description = clubUpdateDTO.Description;
                existingClub.Stadium = clubUpdateDTO.Stadium;
                existingClub.Image = clubUpdateDTO.Image;
                existingClub.ReleaseYear = clubUpdateDTO.ReleaseYear;
/*                existingClub.Sponsor = clubUpdateDTO.SponsorID;
                existingClub.CostumeManufacturer = clubUpdateDTO.CostumeManufacturerID;*/

                // Cập nhật thông tin nhà sản xuất đồ đội
                existingClub.CostumeManufacturer = clubUpdateDTO.CostumeManufacturerID;

                // Cập nhật thông tin nhà tài trợ
                existingClub.Sponsor = clubUpdateDTO.SponsorID;

                // Lưu các thay đổi vào cơ sở dữ liệu
                _context.SaveChanges();

                return Ok();
            }
            catch (Exception ex)
            {
                // Log lỗi và trả về 500 Internal Server Error
                Console.Error.WriteLine($"Error updating club: {ex.Message}");
                return StatusCode(500, "Internal Server Error. Check the logs for details.");
            }
        }
        /*[Authorize]*/
        [HttpGet("GetClubByID/{id}")]
        public IActionResult GetClubByID(int id)
        {
            try
            {
                // Lấy thông tin CLB từ database dựa trên ID
                var club = _context.Clubs
                    .Include(c => c.CostumeManufacturerNavigation)
                    .Include(c => c.SponsorNavigation)
                    .Include(c => c.Coaches)
                    .FirstOrDefault(c => c.Id == id);

                // Nếu không tìm thấy CLB
                if (club == null)
                {
                    return NotFound();
                }

                // Mapping thông tin CLB sang DTO để trả về
                var clubDTO = new ClubDTO
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
                        Description = coach.Description,
                        ClubId= coach.ClubId,
                        ClubName = coach.Club.ClubName
                    }).ToList()
                };

                return Ok(clubDTO);
            }
            catch (Exception ex)
            {
                // Log lỗi và trả về 500 Internal Server Error
                Console.Error.WriteLine($"Error getting club by ID: {ex.Message}");
                return StatusCode(500, "Internal Server Error. Check the logs for details.");
            }
        }

    }
}
