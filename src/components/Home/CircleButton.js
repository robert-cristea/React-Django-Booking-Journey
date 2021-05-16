import React, { useState } from "react";
import "./CircleButton.css";

export function CircleButton(props) {
    return (
        <div onClick={props.onClick} {...props} className={"rounded-circle text-center mb-0 circle-button d-flex align-items-center " + (props.clicked ? 'clicked-btn' : 'non-clicked-btn')}>
            <p className="font-weight-medium mx-auto mb-0 circleBtnFont" >{props.name}</p>
        </div>
    )
}