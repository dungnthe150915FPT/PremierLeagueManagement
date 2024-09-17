using System;
using System.Collections.Generic;

namespace PremierLeagueWeb.Models;

public partial class PlayerLocation
{
    public int Id { get; set; }

    public string PlayerLocationName { get; set; } = null!;

    public virtual ICollection<Player> Players { get; set; } = new List<Player>();
}
