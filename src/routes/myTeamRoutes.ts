import { Router } from "express";
import { myTeamService } from "../services/myTeamService";

const router = Router();

router.post("/add-many", async (req, res) => {
  const { players } = req.body;
  const result = await myTeamService.addPlayers(players);
  res.json(result);
});

router.get("/", async (_req, res) => {
  const players = await myTeamService.listPlayers();
  res.json(players);
});

export default router;
