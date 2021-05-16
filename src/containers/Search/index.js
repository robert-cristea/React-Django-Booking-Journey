import React, { Component, useState } from 'react';
import './search.css';

import DateRangePicker from 'react-bootstrap-daterangepicker';
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-daterangepicker/daterangepicker.css';

import calendarIcon from "../../images/calendarIcon.png";
import { Checkbox } from '@material-ui/core';

const Search = (props) => {

    return (
        <div className="w-full">
            <div className="d-flex justify-content-between">
                <p style={{ fontSize: "1.5rem" }}>Results (#)</p>
                <div className="d-flex align-items-center">
                    <label for="cars" className="pr-4" style={{ fontSize: "18px", marginBottom: "0", color: "rgba(0,0,0,0.5)" }}>SORT BY</label>
                    <select id="cars" style={{ border: "none", fontSize: "14px", width: "60px", color: "rgba(0,0,0,0.7)" }}>
                        <option value="match">Match</option>
                        <option value="price">Price</option>
                    </select>
                </div>
            </div>
            <hr style={{ width: "100%", marginTop: "0", marginBottom: "5px", color: "rgba(0,0,0,0.1)" }} />
            <div className="d-flex justify-content-between">
                <div className="px-1 pt-3" style={{ border: "1px solid #555555", borderRadius: "5px", width: "22%", minWidth: "150px", height:"60vh", overflow:"scroll" }}>
                    <div className="d-flex px-2 justify-content-between align-items-center">
                        <p style={{ fontSize: "1.2rem", marginBottom: "0", fontWeight: "500", color: "rgba(0,0,0,0.7)" }}>Increase Matching</p>
                        <p style={{ fontSize: "0.8rem", marginBottom: "0", color: "rgba(0,0,0,0.3)" }}>CLEAR ALL</p>
                    </div>
                    <hr style={{ width: "100%", marginTop: "5px", marginBottom: "15px", color: "rgba(0,0,0,0.1)" }} />
                    <div className="px-2 pb-2">
                        <p style={{ fontSize: "1rem", marginBottom: "0", fontWeight: "500", color: "rgba(0,0,0,0.7)" }}>Budget</p>
                    </div>
                    <div className="px-2" style={{ paddingBottom: "2.5rem" }}>
                        <div class="btn-group d-flex flex-wrap" role="group" aria-label="Basic example" style={{ width: "100%", height: "2rem" }}>
                            <button type="button" class="btn btn-secondary" style={{ fontSize: "1rem", fontWeight: "400", backgroundColor: "#F5F5F5", color: "#555555" }}>Low</button>
                            <button type="button" class="btn btn-secondary" style={{ fontSize: "1rem", fontWeight: "400", borderRadius: "4px", backgroundColor: "#00DAF8", color: "white" }}>Normal</button>
                            <button type="button" class="btn btn-secondary" style={{ fontSize: "1rem", fontWeight: "400", backgroundColor: "#F5F5F5", color: "#555555" }}>High</button>
                        </div>
                    </div>
                    <div className="d-flex px-2 pb-2 justify-content-between align-items-center">
                        <p style={{ fontSize: "1rem", marginBottom: "0", fontWeight: "500", color: "rgba(0,0,0,0.7)" }}>Time Frame</p>
                        <p style={{ fontSize: "0.8rem", marginBottom: "0", color: "rgba(0,0,0,0.3)" }}>CLEAR</p>
                    </div>
                    <div className="px-2" style={{ paddingBottom: "2.5rem" }}>
                        <div style={{ width: "100%" }}>
                            <DateRangePicker
                                initialSettings={{ startDate: '1/1/2014', endDate: '3/1/2014' }}
                            >
                                <button className="d-flex align-items-center" style={{ width: "100%", height: "2rem", borderRadius: "4px", border: "1px solid #555555", fontSize: "0.7rem", backgroundColor: "#F5F5F5" }}><img src={calendarIcon} className="mr-4" alt="calendarIcon" /> Can Start From - Need to Return By</button>
                            </DateRangePicker>
                        </div>
                    </div>
                    <div className="d-flex px-2 pb-2 justify-content-between align-items-center">
                        <p style={{ fontSize: "1rem", marginBottom: "0", fontWeight: "500", color: "rgba(0,0,0,0.7)" }}>Vacation Tags</p>
                        <p style={{ fontSize: "0.8rem", marginBottom: "0", color: "rgba(0,0,0,0.3)" }}>CLEAR</p>
                    </div>
                    <div className="px-2">
                        <div style={{ width: "100%" }}>
                            <select id="tags" style={{ border: "none", fontSize: "14px", width: "100%", border: "1px solid #555555", height: "2rem", borderRadius: "4px", backgroundColor: "#F5F5F5", color: "rgba(0,0,0,0.7)" }}>
                                <option value="match">Match</option>
                                <option value="price">Price</option>
                            </select>
                        </div>
                    </div>
                    <div className="px-2"  style={{ paddingBottom: "2.5rem" }}>
                        <div className="d-flex flex-wrap pt-2 px-2 tag-area" style={{ width: "100%", border: "1px solid #555555", backgroundColor: "white", borderRadius: "4px", height: "70px"}}>
                            <div className="px-2 py-1 my-2 mx-1" style={{ backgroundColor: "#00DAF8", borderRadius: "4px", color: "white", fontSize: "10px" }}>Friends &times;</div>
                            <div className="px-2 py-1 my-2 mx-1" style={{ backgroundColor: "#00DAF8", borderRadius: "4px", color: "white", fontSize: "10px" }}>Friends &times;</div>
                            <div className="px-2 py-1 my-2 mx-1" style={{ backgroundColor: "#00DAF8", borderRadius: "4px", color: "white", fontSize: "10px" }}>Friends &times;</div>
                            <div className="px-2 py-1 my-2 mx-1" style={{ backgroundColor: "#00DAF8", borderRadius: "4px", color: "white", fontSize: "10px" }}>Friends &times;</div>
                            <div className="px-2 py-1 my-2 mx-1" style={{ backgroundColor: "#00DAF8", borderRadius: "4px", color: "white", fontSize: "10px" }}>Friends &times;</div>
                            <div className="px-2 py-1 my-2 mx-1" style={{ backgroundColor: "#00DAF8", borderRadius: "4px", color: "white", fontSize: "10px" }}>Friends &times;</div>
                            <div className="px-2 py-1 my-2 mx-1" style={{ backgroundColor: "#00DAF8", borderRadius: "4px", color: "white", fontSize: "10px" }}>Friends &times;</div>
                            <div className="px-2 py-1 my-2 mx-1" style={{ backgroundColor: "#00DAF8", borderRadius: "4px", color: "white", fontSize: "10px" }}>Friends &times;</div>
                            <div className="px-2 py-1 my-2 mx-1" style={{ backgroundColor: "#00DAF8", borderRadius: "4px", color: "white", fontSize: "10px" }}>Friends &times;</div>
                            <div className="px-2 py-1 my-2 mx-1" style={{ backgroundColor: "#00DAF8", borderRadius: "4px", color: "white", fontSize: "10px" }}>Friends &times;</div>
                        </div>
                    </div>
                    <div className="d-flex px-2 pb-2 justify-content-between align-items-center">
                        <p style={{ fontSize: "1rem", marginBottom: "0", fontWeight: "500", color: "rgba(0,0,0,0.7)" }}>Travelers Composition</p>
                        <p style={{ fontSize: "0.8rem", marginBottom: "0", color: "rgba(0,0,0,0.3)" }}>CLEAR</p>
                    </div>
                    <div className="px-2">
                        <div style={{ width: "100%" }}>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="boys" />
                                <label class="custom-control-label" for="boys">All Boys Travelers</label>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="girls" />
                                <label class="custom-control-label" for="girls">All Girls Travelers</label>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="elderly" />
                                <label class="custom-control-label" for="elderly">Suitable For The Elderly</label>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="kids" />
                                <label class="custom-control-label" for="kids">Suitable For Kids And Babies</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div style={{ border: "2px solid red", width: "76%" }}>ffdfdfssaf</div>
            </div>
        </div>

    )
}

export default Search;