import { Router } from "express";
import {
  getAllHolidays,
  getHolidayById,
  createNewHoliday,
  updateHoliday,
  deleteHoliday,
} from "./holidayHandlers.js";

const holidayRouter = Router();

holidayRouter.get("/holidays", getAllHolidays);
holidayRouter.get("/holidays/:id", getHolidayById);
holidayRouter.post("/holidays", createNewHoliday);
holidayRouter.put("/holidays/:id", updateHoliday);
holidayRouter.delete("/holidays/:id", deleteHoliday);

export default holidayRouter;




