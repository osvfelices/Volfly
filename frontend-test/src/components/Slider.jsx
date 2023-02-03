import React, { useState, useEffect } from "react";
import Link from "next/link";
import Image from "next/image";
import Slider01 from "../assets/slide01.jpg";
import Slider02 from "../assets/slide02.jpg";
import Slider03 from "../assets/slide03.jpg";




const Slider = () => {
    
    return(
<div>
    <Image src={Slider01} className="w-full h-[500px] object-cover" alt="Slider01" />
</div>
    )
}

export default Slider;