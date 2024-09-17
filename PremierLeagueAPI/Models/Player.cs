using System;
using System.Collections.Generic;

namespace PremierLeagueAPI.Models;

public partial class Player
{
    public Guid Id { get; set; }

    public string PlayerName { get; set; } = null!;

    public DateTime Dob { get; set; }

    public string Nationality { get; set; } = null!;

    public int Number { get; set; }

    public string Image { get; set; } = null!;

    public int ClubId { get; set; }

    public int PlayerLocationId { get; set; }

    public string? Description { get; set; }

    public virtual Club Club { get; set; } = null!;

    public virtual PlayerLocation PlayerLocation { get; set; } = null!;
}
public class PlayerDTO
{
    public Guid Id { get; set; }

    public string PlayerName { get; set; } = null!;

    public DateTime Dob { get; set; }

    public string Nationality { get; set; } = null!;

    public int Number { get; set; }

    public string Image { get; set; } = null!;

    public int ClubId { get; set; }

    public int PlayerLocationId { get; set; }

    public string? Description { get; set; }
}
