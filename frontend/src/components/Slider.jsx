import Image from "next/image";
import Slider01 from "../assets/slide01.jpg";




const Slider = () => {
    
    return(
<div>
    <Image src={Slider01} className="w-full h-[500px] object-cover" alt="Slider01" />
</div>
    )
}

export default Slider;