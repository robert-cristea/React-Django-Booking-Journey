import React, {Component} from 'react';
import BubbleUI from "react-bubble-ui";
import "react-bubble-ui/dist/index.css";
// import Child from "./ChildComponent";
import "./myComponent.css";

const MyComponent = (props) => {
	const options = {
		"size": 145,
		"minSize": 145,
		"gutter": 15,
		"provideProps": true,
		"numCols": 3,
		"fringeWidth": 160,
		"yRadius": 120,
		"xRadius": 120,
		"cornerRadius": 10,
		"showGuides": false,
		"compact": true,
		"gravitation": 5,
		"cornerRadius":120
	}

	// const children = props.data.map((data, i) => {
	// 	 return <Child data={data} className="child" key={i}>
	// });
	// const children = props.children;

	return (
		<BubbleUI options={options} className="myBubbleUI">
			{props.children}
		</BubbleUI>
	);
};

export default MyComponent;