import express from "express";
import dotenv from "dotenv";
import helmet from "helmet";
import database from "./database.js";
import cors from "cors";
import holidayRouter from "./Handlers/holidayRouter.js";

dotenv.config();
const EXPRESS_PORT = parseInt(process.env.EXPRESS_PORT ?? "5005", 10);

const app = express();
app.use(express.json());
app.use(helmet());
app.use(
  cors({
    origin: "http://localhost:3000",
  })

);

app.get("/", (req, res) => {
  res.send("Hello from Express!");
});

app.use("/holidays", holidayRouter);

app.listen(5005, () => {
  if (database.getConnection() == null) {
    console.error("Database connection failed");
    process.exit(1);
  }
  console.log(
    "Database connected.\nExpress listening on http://localhost:5005"
  );
});

