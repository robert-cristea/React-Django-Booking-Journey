import React from "react";

export function CircleButton(props) {
    return (
        <div onClick={props.onClick} className="rounded-circle text-center py-5" style={{ color: "white", backgroundColor: "#DC5921", opacity: "100%", maxWidth: "145px", border: "2px solid #D0D0D0",cursor:"pointer" }}>
            <p style={{fontSize: "26px", fontWeight: "600"}}>{props.name}</p>
        </div>
    )
}