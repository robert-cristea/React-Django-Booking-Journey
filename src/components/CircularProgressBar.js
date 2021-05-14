import React, { Component, useEffect, useState } from 'react';
import { CircularProgressbar } from 'react-circular-progressbar';
import 'react-circular-progressbar/dist/styles.css';

export const CircularProgressBar = (props) => {
    const [size, setsize] = useState(38)
    //choose the screen size
    const handleResize = () => {
        const screenwidth = window.innerWidth;

        if (screenwidth < 600) {
            setsize(25)
        } else if (screenwidth >= 600 && screenwidth <= 768) {
            setsize(28)
        } else if (screenwidth >= 768 && screenwidth <= 992) {
            setsize(32)
        } else if (screenwidth >= 992 && screenwidth <= 1200) {
            setsize(36)
        }
    }

    useEffect(() => {
        handleResize();
        window.addEventListener("resize", handleResize)
        return () => {
        }
    })
    return (
        <div style={{ width: size, height: size }}>
            <CircularProgressbar
                strokeWidth={20}
                value={props.percentage}
                styles={{
                    // Customize the root svg element
                    root: {},
                    // Customize the path, i.e. the "completed progress"
                    path: {
                        // Path color
                        stroke: 'green',
                        // Whether to use rounded or flat corners on the ends - can use 'butt' or 'round'
                        strokeLinecap: 'butt',
                        // Customize transition animation
                        transition: 'stroke-dashoffset 0.5s ease 0s',
                        // Rotate the path
                        transform: 'rotate(0turn)',
                        transformOrigin: 'center center',
                    },
                    // Customize the circle behind the path, i.e. the "total progress"
                    trail: {
                        // Trail color
                        stroke: '#d0d0d0',
                        // Whether to use rounded or flat corners on the ends - can use 'butt' or 'round'
                        strokeLinecap: 'butt',
                        // Rotate the trail
                        transform: 'rotate(0.25turn)',
                        transformOrigin: 'center center',
                    },
                    // Customize the text
                    text: {
                        // Text color
                        fill: '#f88',
                        // Text size
                        fontSize: '16px',
                    },
                    // Customize background - only used when the `background` prop is true
                    background: {
                        fill: '#3e98c7',
                    }
                }}
            />
        </div>
    )

}