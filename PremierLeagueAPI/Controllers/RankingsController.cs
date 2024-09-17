/*using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PremierLeagueAPI.Models;
using PremierLeagueAPI.Models.DTO;

namespace PremierLeagueAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RankingController : ControllerBase
    {
        private readonly PremierLeagueContext _context;

        public RankingController(PremierLeagueContext context)
        {
            _context = context;
        }

        [HttpGet("GetTopRanking")]
        public IActionResult GetTopRanking()
        {
            // Lấy ra danh sách bảng xếp hạng đã được sắp xếp theo top
            var topRanking = _context.Rankings
                .OrderBy(r => r.Top)
                .Include(r => r.Clubs)  // Thực hiện JOIN với bảng Club
                .ToList();

            // Chuyển đổi sang DTO nếu cần
            var topRankingDto = topRanking.Select(r => new RankingDTO
            {
                ClubName = r.Clubs.First().ClubName,  // Lấy tên đội từ bảng Club
                Image = r.Clubs.First().Image,  // Lấy hình ảnh từ bảng Club
                Id = r.Id,
                Top = r.Top,
                Matches = r.Matches,
                Win = r.Win,
                Draw = r.Draw,
                Goal = r.Goal,
                LoseGoal = r.LoseGoal,
                NumberDifference = r.NumberDifference,
                Score = r.Score,
                Lose = r.Lose
            }).ToList();

            return Ok(topRankingDto);
        }
    }
}
*/

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PremierLeagueAPI.Models;
using PremierLeagueAPI.Models.DTO;
using System;
using System.Collections.Generic;
using System.Linq;

namespace PremierLeagueAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RankingsController : ControllerBase
    {
        private readonly PremierLeagueContext _context;

        public RankingsController(PremierLeagueContext context)
        {
            _context = context;
        }
        /*[Authorize]*/
        [HttpGet("GetTopRanking")]
        public IActionResult GetTopRanking()
        {
            // Get the ranking sorted by the specified criteria
            var topRanking = _context.Rankings
                .OrderByDescending(r => r.Score)
                .ThenByDescending(r => r.NumberDifference)
                .ThenByDescending(r => r.Goal)
                .Include(r => r.Clubs)
                .ToList();

            // Convert to DTO
            var topRankingDto = topRanking.Select(r => new RankingDTO
            {
                ClubName = r.Clubs.First().ClubName,
                Image = r.Clubs.First().Image,
                Id = r.Id,
                Matches = r.Matches,
                Win = r.Win,
                Draw = r.Draw,
                Goal = r.Goal,
                LoseGoal = r.LoseGoal,
                NumberDifference = r.NumberDifference,
                Score = r.Score,
                Lose = r.Lose
            }).ToList();

            return Ok(topRankingDto);
        }
        /*[Authorize]*/
        [HttpPut("UpdateRanking/{rankingId}")]
        public IActionResult UpdateRanking(int rankingId, [FromBody] RankingUpdateDTO rankingUpdate)
        {
            // Find the ranking by Id
            var ranking = _context.Rankings
                .Include(r => r.Clubs)
                .FirstOrDefault(r => r.Id == rankingId);

            if (ranking == null)
            {
                return NotFound();
            }

            // Update Win, Lose, Draw, LoseGoal, Goal
            ranking.Win = rankingUpdate.Win;
            ranking.Lose = rankingUpdate.Lose;
            ranking.Draw = rankingUpdate.Draw;
            ranking.LoseGoal = rankingUpdate.LoseGoal;
            ranking.Goal = rankingUpdate.Goal;

            // Update calculated properties
            ranking.Score = (ranking.Win * 3) + ranking.Draw;
            ranking.NumberDifference = ranking.Goal - ranking.LoseGoal;
            ranking.Matches = (int)(ranking.Win + ranking.Lose + ranking.Draw);

            // Update the Top based on the specified criteria
            var sortedRankings = _context.Rankings
                .OrderBy(r => r.Score)
                .ThenBy(r => r.NumberDifference)
                .ThenBy(r => r.Goal)
                .ToList();

            // Save changes to the database
            _context.SaveChanges();

            return Ok();
        }
        [Authorize]
        [HttpGet("GetRankingById/{rankingId}")]
        public IActionResult GetRankingById(int rankingId)
        {
            var ranking = _context.Rankings
                .Include(r => r.Clubs)
                .FirstOrDefault(r => r.Id == rankingId);

            if (ranking == null)
            {
                return NotFound();
            }

            var rankingDto = new RankingDTO
            {
                ClubName = ranking.Clubs.First().ClubName,
                Image = ranking.Clubs.First().Image,
                Id = ranking.Id,
                Matches = ranking.Matches,
                Win = ranking.Win,
                Draw = ranking.Draw,
                Goal = ranking.Goal,
                LoseGoal = ranking.LoseGoal,
                NumberDifference = ranking.NumberDifference,
                Score = ranking.Score,
                Lose = ranking.Lose
            };

            return Ok(rankingDto);
        }
    }
}
