import React from "react";
import { useEffect, useState } from "react";
import Link from "next/link";
import Image from "next/image";
import Cuba from "../assets/Cuba.jpg";
import Header from "../components/Header";
import SearcherLeft from "../components/SearcherLeft";
import axios from "axios";
import { HiLocationMarker } from "react-icons/hi";
import { AiFillStar } from "react-icons/ai";
const Bookings = () => {
  const API_URL = "http://localhost:5005";

  const [holidays, setHolidays] = useState([]);
  const [filteredHolidays, setFilteredHolidays] = useState(holidays);

  useEffect(() => {
    const source = axios.CancelToken.source();

    axios
      .get(`${API_URL}/holidays`)
      .then((response) => {
        setHolidays(response.data);
      })
      .catch((error) => {
        console.log(error);
      });
  }, []);

  console.log(filteredHolidays);

  // https://regexr.com/702h5
  const protoRegex = /(\w*:\/\/)/g;

  function domainName(url) {
    // console.log(`Testing url: ${url}`);

    // Filter out any protocol in front of domain name
    const protoMatches = url.match(protoRegex);
    const noProto =
      protoMatches != null &&
      protoMatches.length > 0 &&
      url.startsWith(protoMatches[0])
        ? url.slice(protoMatches[0].length)
        : url;
    // console.log(`Removing protocol: ${noProto}`);

    // Omit anything after domain name
    let beforeSlash = noProto.split("/")[0];
    // console.log(`Only full domain string: ${beforeSlash}`);

    // Consider special cases
    // https://en.wikipedia.org/wiki/Country_code_second-level_domain
    // const specialCases = ["co.uk", "co.jp"];
    // specialCases.forEach(
    //   (value) => (beforeSlash = beforeSlash.replace(value, "REMOVE"))
    // );
    // console.log(`Special cases considered: ${beforeSlash}`);

    // Ignoring subdomains, get domain name (second item from the right)
    const domain = beforeSlash;

    return domain;
  }

  console.log(
    holidays
      .reduce(
        (acc, val) =>
          acc.includes(val.imageURL) ? acc : [...acc, val.imageURL],
        []
      )
      .map((imgURL) => domainName(imgURL))
  );

  return (
    <div>
      <Header />

      <div className="mx-20">
        <div className="mt-28 mb-10">
          <h1 className="text-4xl">Paquetes Vacacionales en Punta Cana</h1>
        </div>

        <div className="">
          <div className="flex justify-beteern gap-2">
            <div className="flex  bg-white  w-[30%]  md:flex-row  hover:bg-gray-100 dark:border-dark-700 dark:bg-gray-800 dark:hover:bg-gray-700">
              <div className="w-full">
                <SearcherLeft
                  holidays={holidays}
                  setFilteredHolidays={setFilteredHolidays}
                />
              </div>
            </div>
            <div className="w-full bg-[#00336618] p-4">
              {filteredHolidays.slice(0, 10).map((holiday, index) => {
                const randomIndex = Math.floor(
                  Math.random() * filteredHolidays.length
                );
                const randomHoliday = filteredHolidays[randomIndex];

                return (
                  <div className="w-full" key={holiday.id}>
                    <div
                      className="flex justify-between items-center bg-white border border-gray-200 rounded-sm shadow md:flex-row  hover:bg-gray-100 dark:border-dark-700 dark:bg-gray-800 dark:hover:bg-gray-700 mb-4"
                      href="#"
                    >
                      <div className="flex justify-between leading-normal gap-4">
                        <Image
                          className="object-cover w-full rounded-sm h-96 md:h-auto md:w-48 "
                          src={randomHoliday.imageURL}
                          width={500}
                          height={500}
                          alt=""
                        />
                        <div className="flex flex-col justify-center">
                          <h5 className="mb-2 text-2xl font-semibold tracking-tight text-gray-900 dark:text-white">
                            {randomHoliday.hotel}
                          </h5>
                          <div className="flex my-2">
                            {Array.from(
                              { length: randomHoliday.number_of_stars },
                              (_, i) => (
                                <AiFillStar
                                  key={i}
                                  className="text-[#FFCA00]"
                                />
                              )
                            )}
                          </div>
                          <div className="flex items-center font-normal text-[#003265] text-sm">
                            <HiLocationMarker className="inline-block text-sm mr-1" />
                            <p className=" dark:text-gray-400">
                              {randomHoliday.destination}
                            </p>
                          </div>
                        </div>
                      </div>
                      <div className="flex flex-col justify-items-end mr-4">
                        <p className="font-extrabold text-2xl text-[#36ad8d]">
                          {randomHoliday.price}
                        </p>
                        <p>All Inclusive</p>
                        <Link href={"/summary"}>
                          <button className="text-white font-normal text-sm px-10 py-1 bg-[#003265]">
                            Book
                          </button>
                        </Link>
                      </div>
                    </div>
                  </div>
                );
              })}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Bookings;
