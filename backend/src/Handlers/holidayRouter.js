import { Router } from "express";
import {
  getAllHolidays,
  getHolidayById,
  createNewHoliday,
  updateHoliday,
  deleteHoliday,
} from "./holidayHandlers.js";

const holidayRouter = Router();

holidayRouter.get("/", getAllHolidays);
holidayRouter.get("/:id", getHolidayById);
holidayRouter.post("/", createNewHoliday);
holidayRouter.put("/:id", updateHoliday);
holidayRouter.delete("/:id", deleteHoliday);

export default holidayRouter;




