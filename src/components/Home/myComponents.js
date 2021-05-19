import React, { useEffect, useState } from 'react';
import BubbleUI from "react-bubble-ui";
import "react-bubble-ui/dist/index.css";

const MyComponent = (props) => {

	const [breakpoint, setbreakpoint] = useState(0);

	//choose the screen size
	const handleResize = () => {
		const screenwidth = window.innerWidth;

		if (screenwidth < 600) {
			setbreakpoint(3);
		} else if (screenwidth >= 600 && screenwidth <= 768) {
			setbreakpoint(2);
		} else if (screenwidth >= 768 && screenwidth <= 992) {
			setbreakpoint(1);
		} else {
			setbreakpoint(0);
		}
	}

	useEffect(() => {
		handleResize();
		window.addEventListener("resize", handleResize)
	})

	const options = {
		"size": breakpoint === 0 ? 100 : (breakpoint === 1 ? 90 : (breakpoint === 2 ? 80 : 70)),
		"minSize": breakpoint === 0 ? 100 : (breakpoint === 1 ? 90 : (breakpoint === 2 ? 80 : 70)),
		"gutter": 1,
		"provideProps": true,
		"numCols": 3,
		"fringeWidth": 160,
		"yRadius": 140,
		"xRadius": 140,
		"cornerRadius": 10,
		"showGuides": false,
		"compact": true,
		"gravitation": 5,
	}

	return (
		<BubbleUI options={options} className="myBubbleUI" style={{ height: "100%" }}>
			{props.children}
		</BubbleUI>
	);
};

export default MyComponent;