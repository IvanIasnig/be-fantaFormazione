import express from "express";
import playerRoutes from "./routes/playerRoutes";
import { errorHandler } from "./utils/apiHandler";

const app = express();
app.use(express.json());
app.use("/players", playerRoutes);
app.use(errorHandler);

const PORT = 3000;

app.listen(PORT, async () => {
  console.log(`Server attivo su http://localhost:${PORT}`);
});
