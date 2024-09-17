using System;
using System.Collections.Generic;

namespace PremierLeagueAPI.Models;

public partial class Club
{
    public int Id { get; set; }

    public string ClubName { get; set; } = null!;

    public string Image { get; set; } = null!;

    public string Description { get; set; } = null!;

    public int ReleaseYear { get; set; }

    public string? Stadium { get; set; }

    public int? CostumeManufacturer { get; set; }

    public int? Sponsor { get; set; }

    public int? RankingId { get; set; }

    public virtual ICollection<Coach> Coaches { get; set; } = new List<Coach>();

    public virtual CostumeManufacturer? CostumeManufacturerNavigation { get; set; }

    public virtual ICollection<Match> MatchAwayClubs { get; set; } = new List<Match>();

    public virtual ICollection<Match> MatchHomeClubs { get; set; } = new List<Match>();

    public virtual ICollection<Player> Players { get; set; } = new List<Player>();

    public virtual Ranking? Ranking { get; set; }

    public virtual Sponsor? SponsorNavigation { get; set; }
}
