using System;
using System.Collections.Generic;

namespace PremierLeagueAPI.Models;

public partial class Sponsor
{
    public int Id { get; set; }

    public string SponsorName { get; set; } = null!;

    public virtual ICollection<Club> Clubs { get; set; } = new List<Club>();
}
