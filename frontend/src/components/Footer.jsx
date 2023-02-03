import React from "react";
import { FaFacebookF } from "react-icons/fa";
import { AiFillInstagram } from "react-icons/ai";
import { BsYoutube } from "react-icons/bs";
import { SiVisa } from "react-icons/si";
import { SiMastercard } from "react-icons/si";
import { SiAmericanexpress } from "react-icons/si";
import { FaCcPaypal } from "react-icons/fa";

const Slider = () => {
  return (
    <div>
        <div className="flex justify-evenly bg-[#003265] py-20 items-start">
      <div className="text-white font-normal text-sm leading-6 ">
        <p>Home</p>
        <p>About Us</p>
        <p>Cookies</p>
        <p>Contact</p>
      </div>
      <div className="text-white font-normal text-sm leading-6">
        <p className="text-[#FFD445]">Our Destinations</p>
        <p>Cuba</p>
        <p>Dominican Republic</p>
        <p>Mexico</p>
      </div>
      <div className="text-white font-normal text-sm leading-6 ">
        <p>Our Socials:</p>
        <div className="flex items-center gap-2 mt-2">
          <FaFacebookF className="text-base" />
          <AiFillInstagram className="text-base" />
          <BsYoutube className="text-base" />
        </div>
      </div>
    </div>
    <div className="flex flex-col justify-center text-white bg-[#002246] py-2">
        <p className="text-[10px] text-center mb-2">
            All rights reserved by Volfly 2023
        </p>
        <div className="flex justify-center items-center gap-6">
            <SiVisa className="text-2xl" />
            <SiMastercard className="text-2xl" />
            <SiAmericanexpress className="text-1xl" />
            <FaCcPaypal className="text-2xl" />
        </div>
    </div>
    </div>
  );
};

export default Slider;
