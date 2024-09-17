using System;
using System.Collections.Generic;

namespace PremierLeagueWeb.Models;

public partial class Coach
{
    public Guid Id { get; set; }

    public string CoachName { get; set; } = null!;

    public DateTime Dob { get; set; }

    public string Nationality { get; set; } = null!;

    public DateTime ReleaseYearInClub { get; set; }

    public string Image { get; set; } = null!;

    public int ClubId { get; set; }

    public string Description { get; set; } = null!;

    public virtual Club Club { get; set; } = null!;
}
