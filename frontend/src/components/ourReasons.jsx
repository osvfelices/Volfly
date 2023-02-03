import React from "react";
import { GiWorld } from "react-icons/gi";
import { MdOutlineSell } from "react-icons/md";
import { MdOutlineSupportAgent } from "react-icons/md";
import { RiEmotionHappyLine } from "react-icons/ri";


const OurReasons = () => {
    return(
        <div className="flex justify-center items-center text-center gap-20 flex-col md:flex-row">
            <div className="flex flex-col justify-center items-center text-center">
              <GiWorld className="text-[#003265] text-5xl mb-6" />
              <p>
                We offer you holidays in three of the most beautiful corners of
                the Caribbean, revealing their charms and secrets.
              </p>
            </div>
            <div className="flex flex-col justify-center items-center text-center">
              <MdOutlineSell className="text-[#003265] text-5xl mb-6" />
              <p>
                Only selected promotions and offers. We will find the best
                holiday for you!
              </p>
            </div>
            <div className="flex flex-col justify-center items-center text-center">
              <MdOutlineSupportAgent className="text-[#003265] text-5xl mb-6" />
              <p>
                Stress-free. Specialised agents will help you choose and plan
                your dream holiday!
              </p>
            </div>
            <div className="flex flex-col justify-center items-center text-center">
              <RiEmotionHappyLine className="text-[#003265] text-5xl mb-6" />
              <p>
                Rest assured: a free assistant is at your disposal 365 days a
                year.
              </p>
            </div>
          </div>
    )
};

export default OurReasons;