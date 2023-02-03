import React from "react";
import Header from "../components/Header";
import Footer from "../components/Footer";
import { MdFlightTakeoff } from "react-icons/md";
import { RiHotelFill } from "react-icons/ri";

const Summary = () => {
  return (
    <div>
      <Header />
      <div className="flex flex-col justify-center mx-[400px] h-screen">
        <div className="flex justify-between p-4 bg-white border border-gray-200 rounded shadow sm:p-8 dark:bg-gray-800 dark:border-gray-700 my-4 ">
          <div>
            <h1 className="text-3xl font-semibold text-[#003366]">
              Budget summary
            </h1>
          </div>
          <div className="flex gap-10 text-[#003366]">
            <div className="font-semibold">
              <p>Origin:</p>
              <p>Destination:</p>
              <p>Departure date:</p>
              <p>Number of Nights:</p>
            </div>
            <div className="text-[#003366]">
              <p>Paris</p>
              <p>Dominican Republic</p>
              <p>05-02-2023</p>
              <p>7</p>
            </div>
          </div>
          <div className="flex flex-col justify-center">
            <p className="text-[#003366]">Total Price:</p>
            <p className="font-extrabold text-2xl text-[#36ad8d]">1242.00 €</p>
          </div>
        </div>
        <div className="flex flex-col justify-between p-4 bg-white border border-gray-200 rounded shadow sm:p-8 dark:bg-gray-800 dark:border-gray-700 my-4">
          <div>
            <h1 className="text-3xl font-semibold text-[#003366] mb-6">
              Selected Flights
            </h1>
          </div>
          <div className="flex justify-between text-[#003366]">
            <div className="flex gap-40">
              <p>Date</p>
              <p>Flight</p>
              <p>Airline</p>
              <p>Departure</p>
            </div>
            <div className="flex">
              <p className="text-[#003366]">Arrival</p>
            </div>
          </div>
          <div className="flex py-5 items-center">
            <div className="flex-grow border-t border-[#003366]"></div>
          </div>
          <div className="flex gap-20 items-center">
            <div>
              <div className="flex gap-2">
                <MdFlightTakeoff className="text-[#003366] text-2xl" />
                <p>Departure:</p>
              </div>
              <p>05-02-2023</p>
            </div>
            <p className="ml-1">Direct flight</p>
            <p className="ml-9">Air France</p>
            <p className="ml-14">Paris</p>
            <p className="ml-64">Punta Cana</p>
          </div>
          <div className="flex py-5 items-center">
            <div className="flex-grow border-t border-[#003366]"></div>
          </div>
          <div className="flex gap-20 items-center">
            <div>
              <div className="flex gap-2">
                <MdFlightTakeoff className="text-[#003366] text-2xl" />
                <p>Arrival:</p>
              </div>
              <p>13-02-2023</p>
            </div>
            <p className="ml-6">Direct flight</p>
            <p className="ml-9">Air France</p>
            <p className="ml-14">Punta Cana</p>
            <p className="ml-64">Paris</p>
          </div>
        </div>

        <div className="flex flex-col justify-between p-4 bg-white border border-gray-200 rounded shadow sm:p-8 dark:bg-gray-800 dark:border-gray-700 my-4">
          <div className="flex items-center mb-6 gap-2">
            <RiHotelFill className="text-[#003366] text-2xl" />
            <h1 className="text-3xl font-semibold text-[#003366]">
              Selected Hotel
            </h1>
          </div>
          <div className="flex justify-between text-[#003366]">
            <div className="flex gap-40">
              <p>Grand Bahia Principe Punta Cana</p>
            </div>
            <div className="flex">
              <p className="text-[#003366]">Arrival</p>
            </div>
          </div>
          <div className="flex py-5 items-center">
            <div className="flex-grow border-t border-[#003366]"></div>
          </div>
          <div className="flex gap-20 items-center">
            <div>
              <div className="flex gap-2">
                <p>Entry Date</p>
              </div>
            </div>
            <p className="ml-10">Nights</p>
            <p className="ml-20">Room type</p>
            <p className="ml-8">Holiday type</p>
          </div>
          <div className="flex py-5 items-center">
            <div className="flex-grow border-t border-[#003366]"></div>
          </div>
          <div className="flex gap-20 items-center">
            <div>
              <div className="flex gap-2">
                <p>05-02-2023</p>
              </div>
            </div>
            <p className="ml-6">7</p>
            <p className="ml-20">1 Superior Junior Suite</p>
            <p className="ml-8">All Inclusive</p>
          </div>
        </div>
      </div>
      <Footer />
    </div>
  );
};

export default Summary;
