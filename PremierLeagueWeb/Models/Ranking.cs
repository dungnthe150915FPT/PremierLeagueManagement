using System;
using System.Collections.Generic;

namespace PremierLeagueWeb.Models;

public partial class Ranking
{
    public int Id { get; set; }

    public int Matches { get; set; }

    public int Win { get; set; }

    public int Draw { get; set; }

    public int Goal { get; set; }

    public int LoseGoal { get; set; }

    public int NumberDifference { get; set; }

    public int Score { get; set; }

    public int? Lose { get; set; }

    public virtual ICollection<Club> Clubs { get; set; } = new List<Club>();
}
