import { prisma } from "../lib/db";
import { ApiPlayer, ApiResponse } from "../types/footballPlayersStatistics";

export async function importPlayersFromApi() {
  let currentPage = 1;
  const totalPages: number | null = 4;

  while (totalPages === null || currentPage <= totalPages) {
    const response = await fetch(
      `https://v3.football.api-sports.io/players?league=135&season=2023&page=${currentPage}`,
      {
        headers: {
          "x-apisports-key": process.env.API_FOOTBALL_KEY!,
        },
      },
    );

    const data = (await response.json()) as ApiResponse;

    for (const item of data.response) {
      await savePlayerAndStats(item);
    }

    currentPage++;
    await new Promise(r => setTimeout(r, 800));
  }
}

async function savePlayerAndStats(item: ApiPlayer) {
  const p = item.player;

  const player = await prisma.player.upsert({
    where: { apiId: p.id },
    update: {
      name: p.name,
      firstname: p.firstname ?? null,
      lastname: p.lastname ?? null,
      age: p.age ?? null,
      birthDate: p.birth.date ?? null,
      birthPlace: p.birth.place ?? null,
      birthCountry: p.birth.country ?? null,
      nationality: p.nationality ?? null,
      height: p.height ?? null,
      weight: p.weight ?? null,
      injured: p.injured ?? null,
      photo: p.photo ?? null,
    },
    create: {
      apiId: p.id,
      name: p.name,
      firstname: p.firstname ?? null,
      lastname: p.lastname ?? null,
      age: p.age ?? null,
      birthDate: p.birth.date ?? null,
      birthPlace: p.birth.place ?? null,
      birthCountry: p.birth.country ?? null,
      nationality: p.nationality ?? null,
      height: p.height ?? null,
      weight: p.weight ?? null,
      injured: p.injured ?? null,
      photo: p.photo ?? null,
    },
  });

  await prisma.statistic.deleteMany({ where: { playerId: player.id } });

  for (const s of item.statistics) {
    const team = await prisma.team.upsert({
      where: { apiId: s.team.id },
      update: { name: s.team.name, logo: s.team.logo },
      create: { apiId: s.team.id, name: s.team.name, logo: s.team.logo },
    });

    const league = await prisma.league.upsert({
      where: { apiId: s.league.id },
      update: {
        name: s.league.name,
        country: s.league.country,
        logo: s.league.logo,
        flag: s.league.flag,
        season: s.league.season,
      },
      create: {
        apiId: s.league.id,
        name: s.league.name,
        country: s.league.country,
        logo: s.league.logo,
        flag: s.league.flag,
        season: s.league.season,
      },
    });

    await prisma.statistic.create({
      data: {
        playerId: player.id,
        teamId: team.id,
        leagueId: league.id,

        games: {
          create: {
            appearences: s.games.appearences ?? null,
            lineups: s.games.lineups ?? null,
            minutes: s.games.minutes ?? null,
            number: s.games.number ?? null,
            position: s.games.position ?? null,
            rating: s.games.rating ?? null,
            captain: s.games.captain ?? null,
          },
        },
        substitutes: {
          create: {
            in_: s.substitutes.in ?? null,
            out: s.substitutes.out ?? null,
            bench: s.substitutes.bench ?? null,
          },
        },
        shots: {
          create: {
            total: s.shots.total ?? null,
            onTarget: s.shots.on ?? null,
          },
        },
        goals: {
          create: {
            total: s.goals.total ?? null,
            conceded: s.goals.conceded ?? null,
            assists: s.goals.assists ?? null,
            saves: s.goals.saves ?? null,
          },
        },
        passes: {
          create: {
            total: s.passes.total ?? null,
            key: s.passes.key ?? null,
            accuracy: s.passes.accuracy ?? null,
          },
        },
        tackles: {
          create: {
            total: s.tackles.total ?? null,
            blocks: s.tackles.blocks ?? null,
            interceptions: s.tackles.interceptions ?? null,
          },
        },
        duels: {
          create: {
            total: s.duels.total ?? null,
            won: s.duels.won ?? null,
          },
        },
        dribbles: {
          create: {
            attempts: s.dribbles.attempts ?? null,
            success: s.dribbles.success ?? null,
            past: s.dribbles.past ?? null,
          },
        },
        fouls: {
          create: {
            drawn: s.fouls.drawn ?? null,
            committed: s.fouls.committed ?? null,
          },
        },
        cards: {
          create: {
            yellow: s.cards.yellow ?? null,
            yellowred: s.cards.yellowred ?? null,
            red: s.cards.red ?? null,
          },
        },
        penalty: {
          create: {
            won: s.penalty.won ?? null,
            commited: s.penalty.commited ?? null,
            scored: s.penalty.scored ?? null,
            missed: s.penalty.missed ?? null,
            saved: s.penalty.saved ?? null,
          },
        },
      },
    });
  }
}
