import { myTeamRepository } from "../repositories/myTeamRepository";

export const myTeamService = {
  addPlayers: (ids: number[]) => myTeamRepository.addPlayers(ids),
  listPlayers: () => myTeamRepository.listPlayers(),
};
