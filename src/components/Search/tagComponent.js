import React, {Component,useState} from "react";

const TagComponent = (props) => {
    return (
        <div className="d-flex justify-content-center align-items-center px-2 py-1 my-1 mx-1" style={{ backgroundColor:"#00DAF8", borderRadius:"0.7rem",color:"white", fontSize:"0.8rem",height:"1.5rem" }}><span className="">{props.name}</span>{ props.case === "1"?<span className="pl-2" onClick={props.onClick} style={{cursor:"default"}}> &times;</span>:""}</div>
    );
}

export default TagComponent;