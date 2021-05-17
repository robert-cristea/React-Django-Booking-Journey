import React, { Component, useState } from 'react';
import './search.css';

import DateRangePicker from 'react-bootstrap-daterangepicker';
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-daterangepicker/daterangepicker.css';

import calendarIcon from "../../images/calendarIcon.png";
import { Checkbox } from '@material-ui/core';

const Search = (props) => {

    const [budgetArr, setbudgetArr] = useState([]);

    const handleBudgetBtnClick = (budget) => {
        if(!budgetArr.includes(budget)){
            setbudgetArr([...budgetArr, budget])
        }
    }

    const handleClearBtnClick = (parm) => {
        switch(parm){
            case 0:
                setbudgetArr([]);
                break;
            case 1:
                setbudgetArr([]);
                break;
            case 2:
                break;
            case 3:
                break;
            default:
                break;

        }
    }

    return (
        <div className="w-full">
            <div className="d-flex justify-content-between">
                <p className="page-title">Results (#)</p>
                <div className="d-flex align-items-center">
                    <label for="category" className="pr-4 filter-label">SORT BY</label>
                    <select id="category">
                        <option value="match">Match</option>
                        <option value="price">Price</option>
                    </select>
                </div>
            </div>
            <hr className="title-underline" />
            <div className="d-flex justify-content-between">
                <div className="pt-3 select-box">
                    <div className="px-1 pb-2">
                        <div className="d-flex px-2 justify-content-between align-items-center">
                            <p className="select-header-title">Increase Matching</p>
                            <p className="clear" onClick={() => handleClearBtnClick(0)}>CLEAR ALL</p>
                        </div>
                        <hr className="select-title-underline" />
                        <div className="select-area">
                            <div className="px-2 pb-2">
                                <p className="select-item-name">Budget</p>
                            </div>
                            <div className="px-2 item-spacing">
                                <div class="btn-group d-flex flex-wrap" role="group" aria-label="Basic example">
                                    <button type="button" class={"btn "+ (budgetArr.includes("low")?"clicked":"")} onClick={()=>handleBudgetBtnClick("low")}>Low</button>
                                    <button type="button" class={"btn "+ (budgetArr.includes("normal")?"clicked":"")} onClick={()=>handleBudgetBtnClick("normal")}>Normal</button>
                                    <button type="button" class={"btn "+ (budgetArr.includes("high")?"clicked":"")} onClick={()=>handleBudgetBtnClick("high")}>High</button>
                                </div>
                            </div>
                            <div className="d-flex px-2 pb-2 justify-content-between align-items-center">
                                <p className="select-item-name">Time Frame</p>
                                <p className="clear">CLEAR</p>
                            </div>
                            <div className="px-2 item-spacing">
                                <DateRangePicker
                                    initialSettings={{ startDate: '1/1/2014', endDate: '3/1/2014' }}
                                >
                                    <button className="d-flex align-items-center date-range-btn"><img src={calendarIcon} className="mr-4" alt="calendarIcon" /> Can Start From - Need to Return By</button>
                                </DateRangePicker>
                            </div>
                            <div className="d-flex px-2 pb-2 justify-content-between align-items-center">
                                <p className="select-item-name">Vacation Tags</p>
                                <p className="clear">CLEAR</p>
                            </div>
                            <div className="px-2 pb-2">
                                <select id="tags">
                                    <option value="match">Match</option>
                                    <option value="price">Price</option>
                                </select>
                            </div>
                            <div className="px-2 item-spacing">
                                <div className="d-flex flex-wrap pt-2 px-2 tag-area">
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
                                <p className="select-item-name">Travelers Composition</p>
                                <p className="clear">CLEAR</p>
                            </div>
                            <div className="px-2">
                                {/* <div style={{ width: "100%" }}> */}
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
                                {/* </div> */}
                            </div>
                        </div>
                    </div>
                    <div className="w-full" style={{ zIndex: "1" }}>
                        <button className="btn w-100 filter-btn">Filter</button>
                    </div>
                </div>
                <div style={{ border: "2px solid red", width: "76%" }}>ffdfdfssaf</div>
            </div>
        </div>

    )
}

export default Search;