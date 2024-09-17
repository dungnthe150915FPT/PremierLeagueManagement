using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace PremierLeagueAPI.Models;

public partial class PremierLeagueContext : DbContext
{
    public PremierLeagueContext()
    {
    }

    public PremierLeagueContext(DbContextOptions<PremierLeagueContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Club> Clubs { get; set; }

    public virtual DbSet<Coach> Coaches { get; set; }

    public virtual DbSet<CostumeManufacturer> CostumeManufacturers { get; set; }

    public virtual DbSet<Match> Matches { get; set; }

    public virtual DbSet<Player> Players { get; set; }

    public virtual DbSet<PlayerLocation> PlayerLocations { get; set; }

    public virtual DbSet<Ranking> Rankings { get; set; }

    public virtual DbSet<Sponsor> Sponsors { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("server=localhost; database=PremierLeague;uid=sa;pwd=123456;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Club>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_Clubs");

            entity.ToTable("Club");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.ClubName)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.Image)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.RankingId).HasColumnName("RankingID");
            entity.Property(e => e.Stadium).HasMaxLength(50);

            entity.HasOne(d => d.CostumeManufacturerNavigation).WithMany(p => p.Clubs)
                .HasForeignKey(d => d.CostumeManufacturer)
                .HasConstraintName("FK_Club_CostumeManufacturer");

            entity.HasOne(d => d.Ranking).WithMany(p => p.Clubs)
                .HasForeignKey(d => d.RankingId)
                .HasConstraintName("FK_Club_Ranking");

            entity.HasOne(d => d.SponsorNavigation).WithMany(p => p.Clubs)
                .HasForeignKey(d => d.Sponsor)
                .HasConstraintName("FK_Club_Sponsor");
        });

        modelBuilder.Entity<Coach>(entity =>
        {
            entity.ToTable("Coach");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.ClubId).HasColumnName("ClubID");
            entity.Property(e => e.CoachName).HasMaxLength(150);
            entity.Property(e => e.Description).HasMaxLength(250);
            entity.Property(e => e.Dob)
                .HasColumnType("date")
                .HasColumnName("DOB");
            entity.Property(e => e.Image)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.Nationality).HasMaxLength(50);
            entity.Property(e => e.ReleaseYearInClub).HasColumnType("date");

            entity.HasOne(d => d.Club).WithMany(p => p.Coaches)
                .HasForeignKey(d => d.ClubId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Coach_Club");
        });

        modelBuilder.Entity<CostumeManufacturer>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_CostumeManufacture");

            entity.ToTable("CostumeManufacturer");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.CostumeManufaturerName).HasMaxLength(50);
        });

        modelBuilder.Entity<Match>(entity =>
        {
            entity.ToTable("Match");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.AwayClubId).HasColumnName("AwayClubID");
            entity.Property(e => e.HomeClubId).HasColumnName("HomeClubID");
            entity.Property(e => e.Time).HasColumnType("datetime");

            entity.HasOne(d => d.AwayClub).WithMany(p => p.MatchAwayClubs)
                .HasForeignKey(d => d.AwayClubId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Match_Club1");

            entity.HasOne(d => d.HomeClub).WithMany(p => p.MatchHomeClubs)
                .HasForeignKey(d => d.HomeClubId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Match_Club");
        });

        modelBuilder.Entity<Player>(entity =>
        {
            entity.ToTable("Player");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.ClubId).HasColumnName("ClubID");
            entity.Property(e => e.Dob)
                .HasColumnType("date")
                .HasColumnName("DOB");
            entity.Property(e => e.Image)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.Nationality).HasMaxLength(50);
            entity.Property(e => e.PlayerLocationId).HasColumnName("PlayerLocationID");
            entity.Property(e => e.PlayerName).HasMaxLength(150);

            entity.HasOne(d => d.Club).WithMany(p => p.Players)
                .HasForeignKey(d => d.ClubId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Player_Club");

            entity.HasOne(d => d.PlayerLocation).WithMany(p => p.Players)
                .HasForeignKey(d => d.PlayerLocationId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Player_PlayerLocation");
        });

        modelBuilder.Entity<PlayerLocation>(entity =>
        {
            entity.ToTable("PlayerLocation");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.PlayerLocationName).HasMaxLength(50);
        });

        modelBuilder.Entity<Ranking>(entity =>
        {
            entity.ToTable("Ranking");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
        });

        modelBuilder.Entity<Sponsor>(entity =>
        {
            entity.ToTable("Sponsor");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.SponsorName).HasMaxLength(50);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
