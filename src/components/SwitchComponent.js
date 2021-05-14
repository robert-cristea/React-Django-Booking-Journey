import React, { Component, useEffect, useState } from "react";
import Switch from "react-switch";

const SwitchComponent = (props) => {

  // const [switchsize, setswitchsize] = useState({ width: 38, height: 20 })
  // //choose the screen size
  // const handleResize = () => {
  //   const screenwidth = window.innerWidth;

  //   if (screenwidth < 600) {
  //     setswitchsize({ width: 19, height: 10 })
  //   } else if (screenwidth >= 600 && screenwidth <= 768) {
  //     setswitchsize({ width: 24.7, height: 13 });
  //   } else if (screenwidth >= 768 && screenwidth <= 992) {
  //     setswitchsize({ width: 30.4, height: 16 });
  //   }
  // }

  // useEffect(() => {
  //   handleResize();
  //   window.addEventListener("resize", handleResize)
  //   return () => {
  //   }
  // })

  return (
    <label className="d-flex align-items-center">
      <span className="mr-4" style={{ fontSize: "1rem", fontWeight: "400" }}>Multiple Choice</span>
      <Switch
        onChange={props.onChange}
        checked={props.checked}
        offColor="#ffcfcc"
        onColor="#8ff28d"
        checkedIcon=""
        uncheckedIcon=""
        height={15}
        width={25}
      />
    </label>
  );
}

export default SwitchComponent;