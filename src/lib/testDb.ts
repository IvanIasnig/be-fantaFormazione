// TODO: FILE DA RIMUOVERE, SOLO DI PROVA
import { prisma } from "./db";

async function main() {
  const player = await prisma.player.create({
    data: {
      apiId: 1001,
      name: "Alvaro Morata",
      team: "Como",
      position: "Forward",
      goals: 10,
      assists: 2,
      totalPoints: 78.5,
    },
  });

  console.log("✅ Giocatore inserito:", player);

  const allPlayers = await prisma.player.findMany();
  console.log("📊 Tutti i giocatori:", allPlayers);
}

main()
  .catch(console.error)
  .finally(() => prisma.$disconnect());
