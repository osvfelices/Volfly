import React, { useState, useEffect } from "react";
import "react-date-range/dist/styles.css"; // main css file
import "react-date-range/dist/theme/default.css"; // theme css file
import { DateRange } from "react-date-range";
import { IoLocation } from "react-icons/io5";
import { MdLocationCity } from "react-icons/md";
import { BsFillPeopleFill } from "react-icons/bs";
import { BsCalendarDateFill } from "react-icons/bs";
import axios from "axios";
import Link from "next/link";
import { useRouter } from "next/router";
import moment from "moment";



const Searcher = ({ holidays, setFilteredHolidays }) => {
    if (!holidays) return <span>Loading...</span>;
    const [searchTerm, setSearchTerm] = useState("");
    const [showPicker, setShowPicker] = useState(false);
    const [selectCity, setSelectCity] = useState("");
    const [selectDestination, setSelectDestination] = useState("");
    const [selectDate, setSelectDate] = useState("");
    const [departureDates, setDepartureDates] = useState([]);
    const [prices, setPrices] = useState({});
    const router = useRouter();
  
    const [state, setState] = useState([
      {
        startDate: new Date(),
        endDate: null,
        key: 'selection'
      }
    ]);
 
  
    useEffect(() => {
      setSelectCity(router.query.city || "");
      setSelectDestination(router.query.destination || "");
    }, [router.query]);
  
    const handleSearch = (event) => {
        setFilteredHolidays(
            holidays.filter((holiday) => {
              return (
                (selectCity === "" || holiday.city.toLowerCase().includes(selectCity.toLowerCase())) &&
                (selectDestination === "" || holiday.destination.toLowerCase().includes(selectDestination.toLowerCase())) &&
                (selectDate === "" || new Date(holiday.departure_date).toLocaleDateString().toLowerCase().includes(selectDate))

              );
            })
          );
      event.preventDefault();
      const params = new URLSearchParams();
      params.append("city", selectCity);
      params.append("destination", selectDestination);
      router.push("/bookings?" + params.toString());
    };

    

  const onChange = (item) => {
    setState([item.selection]);

    const selectedDate = departureDates.find(date => {
        return moment(date).isSameOrAfter(item.selection.startDate) && moment(date).isSameOrBefore(item.selection.endDate);
    });

    if (selectedDate) {
        setSelectDate(selectedDate);
        setFilteredHolidays(holidays.filter(holiday => holiday.departure_date === selectedDate));
    } else {
        setSelectDate("");
        setFilteredHolidays([]);
    }
  };

  return (
    <div className="">
      <form value={searchTerm} onSubmit={handleSearch}>
        <div className="flex flex-col border bg-[#fff]">
          <div className="flex flex-col border  py-5 pl-4 bg-[#fff]">
            <label className="mb-2 uppercase">departing city</label>
            <div className="flex">
              <MdLocationCity className="text-2xl" />
              <select
                id="city"
                name="city"
                value={selectCity}
                onChange={(e) => setSelectCity(e.target.value)}
                className="appearance-none bg-transparent border-none w-full text-gray-700 mr-3 py-1 px-2 leading-tight focus:outline-none"
              >
                {/* <option value=""></option> */}
                {[...new Set(holidays.map((holiday) => holiday.city))].map(
                  (city) => (
                    <option key={city} value={city}>
                      {city}
                    </option>
                  )
                )}
              </select>
            </div>
          </div>
          <div className="flex items-center px-4 ">
            <div className="flex-grow border-t border-[#003366]"></div>
          </div>
          <div className="flex flex-col border py-5 pl-4 bg-[#fff]">
            <label className="mb-2 uppercase">pick a destination</label>
            <div className="flex">
              <IoLocation className="text-2xl" />
              <select
                id="destination"
                name="destination"
                value={selectDestination}
                onChange={(e) => setSelectDestination(e.target.value)}
                className="appearance-none bg-transparent border-none w-full text-gray-700 mr-3 py-1 px-2 leading-tight focus:outline-none"
              >
                <option value="">Select Country</option>
                {/* {[
                  ...new Set(holidays.map((holiday) => holiday.destination)),
                ].map((destination) => ( */}
                {holidays
                  .reduce((destinations, holiday) => {
                    if (!destinations.includes(holiday.destination)) {
                      return [...destinations, holiday.destination];
                    }
                    return destinations;
                  }, [])
                  .map((destination) => (
                    <option key={destination} value={destination}>
                      {destination}
                    </option>
                  ))}
              </select>
            </div>
          </div>
          <div className="flex items-center px-4 ">
            <div className="flex-grow border-t border-[#003366]"></div>
          </div>
          <div className="flex flex-col pl-4 py-5 bg-[#fff] border">
            <label className="mb-2 uppercase">pick a date</label>
            <div className="flex">
            <BsCalendarDateFill className="text-1xl mt-2" />
            <input
              type="text"
              className="appearance-none bg-transparent border-none w-full text-gray-700 mr-3 py-1 px-2 leading-tight focus:outline-none"
              onClick={() => setShowPicker(!showPicker )}
            />
            {showPicker && (
                <div>
                <DateRange
                  editableDateInputs={true}
                  onChange={onChange}
                  onClick={() => setShowPicker(!showPicker)}
                  moveRangeOnFirstSelection={false}
                  ranges={state}
                />
                {selectDate && (
                  <span>
                    Selected departure date: {selectDate} ({prices[selectDate]})
                  </span>
                )}
              </div>

            )}
            </div>
          </div>
          <div className="flex items-center px-4 ">
            <div className="flex-grow border-t border-[#003366]"></div>
          </div>
          <div className="flex flex-col py-5 pl-4 bg-[#fff] border border-b-[#003366]">
            <label className="mb-2 uppercase">How many people</label>
            <div className="flex">
            <BsFillPeopleFill className="text-2xl" />
            <select
              id="people"
              name="people"
              className="appearance-none bg-transparent border-none w-full text-gray-700 mr-3 py-1 px-2 leading-tight focus:outline-none"
            >
              <option value="2">2</option>
              <option value="4">4</option>
            </select>
            </div>
          </div>
          <div className="flex flex-col text-white">
            <button
              type="submit"
              className=" h-[6.4rem] bg-[#003265] text-white font-medium py-2 px-4 focus:outline-none"
            >
              Search
            </button>
          </div>
        </div>
        <div className="flex justify-center py-5 bg-[#fff border-b-[#003366]">
        
        </div>
      </form>
    </div>
  );
};

export default Searcher;
