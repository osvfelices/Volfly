import React from "react";
import Link from "next/link";
import Image from "next/image";
import Logo from "../assets/logo_volfly.png";

const Header = () => {
  return (
    <div className="">
      <nav className="p-3 bg-[#003366]">
        <div className="flex flex-wrap items-center justify-between mx-10">
          <Link href="/" className="flex items-center">
            <Image src={Logo} className="w-[150px]" alt="Volfly Logo" />
          </Link>

          <div className="hidden w-full md:block md:w-auto" id="navbar-solid-bg">
            <ul className="flex flex-col mt-4 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium md:border-0 md:bg-transparent dark:bg-gray-800 md:dark:bg-transparent dark:border-gray-700">
              <li>
                <Link
                  href="#"
                  className="block py-2 pl-3 pr-4 text-white font-light md:text-[#FFCA00] md:p-0"
                  aria-current="page"
                >
                  Hot Deals
                </Link>
              </li>
              <li>
                <Link
                  href="#"
                  className="block py-2 pl-3 pr-4 text-white font-light md:text-[#FFCA00] md:p-0"
                >
                  Last Minute
                </Link>
              </li>
              <li>
                <a
                  href="#"
                  className="block py-2 pl-3 pr-4 text-white font-light md:text-[#FFCA00] md:p-0"
                >
                  All Inclusive
                </a>
              </li>
              <li>
                <Link
                  href="#"
                  className="block py-2 pl-3 pr-4 text-white font-light md:text-[#FFCA00] md:p-0"
                >
                  Hotels
                </Link>
              </li>
              <li>
                <Link
                  href="#"
                  className="block py-2 pl-3 pr-4 text-white font-light md:text-[#FFCA00] md:p-0"
                >
                  Support
                </Link>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </div>
  );
};

export default Header;
