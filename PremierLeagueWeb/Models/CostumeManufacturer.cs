using System;
using System.Collections.Generic;

namespace PremierLeagueWeb.Models;

public partial class CostumeManufacturer
{
    public int Id { get; set; }

    public string CostumeManufaturerName { get; set; } = null!;

    public virtual ICollection<Club> Clubs { get; set; } = new List<Club>();
}
