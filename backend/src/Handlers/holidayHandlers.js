import database from "../database.js";

const getAllHolidays = async (req, res) => {
    database.query("SELECT packages.*, departure_cities.city FROM packages JOIN departure_cities ON packages.departure_city_id = departure_cities.id")
    .then(([results]) => {
        res.json(results);
    })
    .catch((err) => {
        console.log(err);
        res.status(500).send("Error retrieving holidays");
    });
};

const getHolidayById = async (req, res) => {
    const id = req.params.id;
    database.query("SELECT packages.*, departure_cities.city FROM packages JOIN departure_cities ON packages.departure_city_id = departure_cities.id WHERE packages.id = ?", [id])
    .then(([results]) => {
        res.json(results);
    })
    .catch((err) => {
        console.log(err);
        res.status(500).send("Error retrieving holiday");
    });
};

const createNewHoliday = async (req, res) => {
    const { name, description, price, departure_city_id, departure_date, return_date, imageURL } = req.body;
    database.query("INSERT INTO packages (name, description, price, departure_city_id, departure_date, return_date, imageURL) VALUES (?, ?, ?, ?, ?, ?, ?)", [name, description, price, departure_city_id, departure_date, return_date, imageURL])
    .then(([results]) => {
        res.json(results);
    })
    .catch((err) => {
        console.log(err);
        res.status(500).send("Error creating holiday");
    });
};

const updateHoliday = async (req, res) => {
    const id = req.params.id;
    const { name, description, price, departure_city_id, departure_date, return_date, imageURL } = req.body;
    database.query("UPDATE packages SET name = ?, description = ?, price = ?, departure_city_id = ?, departure_date = ?, return_date = ?, imageURL = ? WHERE id = ?", [name, description, price, departure_city_id, departure_date, return_date, imageURL, id])
    .then(([results]) => {
        res.json(results);
    })
    .catch((err) => {
        console.log(err);
        res.status(500).send("Error updating holiday");
    });
};

const deleteHoliday = async (req, res) => {
    const id = req.params.id;
    database.query("DELETE FROM packages WHERE id = ?", [id])
    .then(([results]) => {
        res.json(results);
    })
    .catch((err) => {
        console.log(err);
        res.status(500).send("Error deleting holiday");
    });
};

export  {
    getAllHolidays,
    getHolidayById,
    createNewHoliday,
    updateHoliday,
    deleteHoliday
    }






