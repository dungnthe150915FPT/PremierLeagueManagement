using System;
using System.Collections.Generic;

namespace PremierLeagueWeb.Models;

public partial class Match
{
    public Guid Id { get; set; }

    public DateTime Time { get; set; }

    public int HomeClubId { get; set; }

    public int AwayClubId { get; set; }

    public int HomeClubScore { get; set; }

    public int AwayClubScore { get; set; }

    public virtual Club AwayClub { get; set; } = null!;

    public virtual Club HomeClub { get; set; } = null!;
}
