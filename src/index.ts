import express from "express";
import playerRoutes from "./routes/playerRoutes";

const app = express();
app.use(express.json());
app.use("/players", playerRoutes);

const PORT = 3000;

app.listen(PORT, async () => {
  console.log(`🚀 Server attivo su http://localhost:${PORT}`);
});
