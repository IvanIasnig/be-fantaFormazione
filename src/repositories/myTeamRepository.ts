import { prisma } from "../lib/db";

export const myTeamRepository = {
  async addPlayers(playerIds: number[]) {
    const data = playerIds.map(id => ({ playerId: id }));
    return prisma.myTeamPlayer.createMany({
      data,
    });
  },

  async listPlayers() {
    return prisma.myTeamPlayer.findMany({
      include: { player: true },
    });
  },
};
