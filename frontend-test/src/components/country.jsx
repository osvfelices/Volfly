import React from "react";
import Image from "next/image";
import DominicanRepublic from "../assets/DominicanRepublic.jpg";

const Country = () => {

    return (
<div className="flex flex-1">
              <div className="overflow-hidden shadow-lg w-full">
                <Image
                  className="w-full h-1/2 object-cover"
                  src={DominicanRepublic}
                  alt="Dominican Republic"
                />
                <div className="px-6 bg-[#FFCA00] h-full">
                  <div className="py-28">
                    <div className="font-bold text-[#003265] uppercase text-[3rem] mb-2">
                      Dominican Republic
                    </div>
                    <div>
                      <p className="text-[#003265] text-base">
                        Dominican Republic is the second largest and most
                        diverse Caribbean country, situated just two hours south
                        of Miami, less than four hours from New York and eight
                        hours from most European cities. Known for our warm and
                        hospitable people, Dominican Republic is a destination
                        like no other, featuring astounding nature, intriguing
                        history and rich culture. Surrounded by the Atlantic
                        Ocean on the north and the Caribbean Sea on the south,
                        our lush tropical island paradise boasts nearly 1,000
                        miles (1,609 km) of coastline, 250 miles (402 km) of the
                        world’s top beaches, magnificent resorts and hotels, and
                        a variety of sports, recreation and entertainment
                        options. Here you can dance to the pulse pounding thrill
                        of the merengue, renew in our luxurious and diverse
                        accommodations, explore ancient relics of centuries
                        past, delight in delicious Dominican gastronomy or enjoy
                        ecotourism adventures in our magnificent national parks,
                        mountain ranges, rivers, and beaches.
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
    );
    }

export default Country;