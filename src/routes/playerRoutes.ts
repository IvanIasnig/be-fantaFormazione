import { Router } from "express";
import { importPlayers } from "../controllers/playerController";

const router = Router();

router.get("/import", importPlayers);

export default router;
