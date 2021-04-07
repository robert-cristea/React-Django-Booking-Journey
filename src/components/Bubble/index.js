// Core
import React, { Component } from 'react';
import init from './core';


export default class Bubbles extends Component {
	
	constructor(props) {
		super();

		// Binds
		this.init = this.init.bind(this);
		this.id = this.id.bind(this);
		this.color = this.color.bind(this);
	}

	componentDidMount() {
		this.init();

		window.addEventListener('resize', this.init);
	}


	componentWillUnmount() {
		window.removeEventListener('resize', this.init);
	}


	/*
	 * Initialises the core JS that controls the animation
	 *
	 */
	init() {
		init(this.id(), this.color());
	}


	/*
	 * Gives the bubble canvas a unique id. This will be necessary if you need more than one canvas on the page
	 * @returns (String) - DOM id
	 */
	id() {
		if(this.props.id) {
			return this.props.id;
		}

		return 'wd-floating-bubbles';
	}


	/*
	 * The color used for the bubbles
	 * @returns (String) - An RGB string
	 */
	color() {
		if(this.props.color) {
			return this.props.color;
		}

		return '0,0,0';
	}


	render() {
		const style = {
			position: 'absolute',
			top: 0,
			left: 0,
		    width: '100%',
		    height: '100%',
		};

		return (<canvas id={this.id()} style={style}></canvas>);
	}
}