import React, {Component,useState} from "react";

const tagComponent = (props) => {
    return (
        <div className="px-2 py-1 my-2 mx-1" style={{backgroundColor:"#00DAF8", borderRadius:"8px",color:"white", fontSize:"10px" }}>{props.name}</div>
    );
}