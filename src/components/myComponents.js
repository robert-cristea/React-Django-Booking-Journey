import React, {Component} from 'react';
import BubbleUI from "react-bubble-ui";
import "react-bubble-ui/dist/index.css";
// import Child from "./ChildComponent";
import "./myComponent.css";

const MyComponent = (props) => {
	const options = {
		"size": 180,
		"minSize": 20,
		"gutter": 0,
		"provideProps": true,
		"numCols": 2,
		"fringeWidth": 160,
		"yRadius": 120,
		"xRadius": 120,
		"cornerRadius": 10,
		"showGuides": true,
		"compact": true,
		"gravitation": 5
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