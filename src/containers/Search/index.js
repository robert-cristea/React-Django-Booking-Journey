import React, { useState, useEffect, useRef } from 'react';
import Scrollbar from 'react-perfect-scrollbar'
import DateRangePicker from 'react-bootstrap-daterangepicker';
import './search.css';
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-daterangepicker/daterangepicker.css';
import 'font-awesome/css/font-awesome.min.css';
import 'react-perfect-scrollbar/dist/css/styles.css';
import moment from 'moment';
import axios from "axios";
import _ from 'lodash';
import calendarIcon from "../../images/calendarIcon.png";
import { BACKEND_URL } from '../../utils/request';
import SiteCard from '../../components/Search/SiteCard'
import TagComponent from '../../components/Search/tagComponent'
import SelectSort from '../../components/Search/SelectSort';

const Search = (props) => {

    const parent = useRef(null);
    const daterange = useRef(null)
    const tagBox = useRef(null)

    const [budgetArr, setbudgetArr] = useState([]);
    const [startDate, setStartDate] = useState()
    const [endDate, setEndDate] = useState()

    const [who, setWho] = useState(props.who)
    const [number, setNumber] = useState(props.number)
    const [themes, setThemes] = useState(props.theme)
    const [howlong, setHowlong] = useState(props.howlong)

    const [traveler, setTraveler] = useState([])
    const [citiesInfo, setCitiesInfo] = useState([])
    const [activeCitiesInfo, setActiveCitiesInfo] = useState([])

    const listAndGroups = {
        'Other Themes': ['Adventures', 'Shopping', 'Romantic', 'Ski', 'Remote', 'Wildlife', 'Hiking', 'Road Trip', 'Festivals', 'Nightlife', 'Holidays', 'Vivid', 'Cultural Experience', 'Camping', 'Surfing', 'Honeymoon', 'Scuba Diving', 'Beach', 'City Life', 'Nature', 'Countryside', 'Surprise', 'Other'],
        'How Long': ['Weekend','Midweek','Long Weekend', 'Weekish', '2 Weeks', '3 Weeks', '4 Weeks'],
        'How Many': [1, 2, 3, 4, 5, 6],
        'Who is traveling': ['Solo', 'Couple', 'Friends', 'Family']
    }

    const handleBudgetBtnClick = (budget) => {
        if (!_.includes(budgetArr, budget)) {
            setbudgetArr([...budgetArr, budget])
        } else {
            _.remove(budgetArr, function (n) {
                return n === budget;
            })
            setbudgetArr(_.cloneDeep(budgetArr));
        }
    }

    const toggleDropDown = () => {

        const curr = parent.current
        if (curr) {
            curr.scrollTop = curr.clientHeight
        }

        setIsDropDownOpen(!isDropDownOpen)
    }

    const [isDropDownOpen, setIsDropDownOpen] = useState(false);

    const getCityInfos = () => {
        axios
        .post(BACKEND_URL + '/api-vacation/getCityInfo', {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
            },
        })
        .then(res => { return res.data; })
        .then(res => { console.log(res); setCitiesInfo(res); setActiveCitiesInfo(_.slice(res,0,4)) })
        .catch(err => console.log('Login error: ' + err))
    }

    useEffect(() => {
        getCityInfos();
    }, [])

    const handleShowMoreBtn = () => {
        setActiveCitiesInfo(_.union(activeCitiesInfo,_.slice(citiesInfo,activeCitiesInfo.length,activeCitiesInfo.length+4)));
        console.log('activeCItiey================',activeCitiesInfo);
    }

    const handleClearBtnClick = (parm) => {
        switch (parm) {
            case 0:
                setbudgetArr([]);
                setStartDate()
                setEndDate()
                daterange.current.setStartDate(new Date())
                daterange.current.setEndDate(new Date())
                setWho([]);
                setNumber([]);
                setHowlong([]);
                setThemes([]);
                setTraveler([]);
                break;
            case 1:
                setStartDate()
                setEndDate()
                daterange.current.setStartDate(new Date())
                daterange.current.setEndDate(new Date())
                break;
            case 2:
                setWho([]);
                setNumber([]);
                setHowlong([]);
                setThemes([]);
                break;
            case 3:
                setTraveler([]);
                break;
            default:
                break;
        }
    }

    const handleDeleteTagBtnClick = (value) => {
        _.remove(who, function (n) {
            return n === value;
        });
        setWho(_.cloneDeep(who));

        _.remove(number, function (n) {
            return n === value;
        });
        setNumber(_.cloneDeep(number));

        _.remove(howlong, function (n) {
            return n === value;
        });
        setHowlong(_.cloneDeep(howlong));

        _.remove(themes, function (n) {
            return n === value;
        });
        setThemes(_.cloneDeep(themes));
    }

    const handleDateRangeCallback = (start, end, label) => {

        setStartDate(start);
        setEndDate(end)

    }

    const handleFilterBtnClick = () => {

        var startMonth = startDate ? moment(startDate, 'YYYY-MM-DD').format('M') : "";
        var startYear = startDate ? moment(startDate, 'YYYY-MM-DD').format('Y') : "";
        var endMonth = endDate ? moment(endDate, 'YYYY-MM-DD').format('M') : ""
        var endYear = endDate ? moment(endDate, 'YYYY-MM-DD').format('Y') : ""
        var months = [0,0,0,0,0,0,0,0,0,0,0,0];
        if(startMonth !== "" && endMonth !== "" && startYear !== "" && endYear !== ""){
            var sm = Number(startMonth);
            var em = Number(endMonth);
            var sy = Number(startYear);
            var ey = Number(endYear);
            
            if(ey-sy === 0){
                for(let i = sm; i <= em; i++){
                    months[i-1] = 1;
                }
            }

            if(ey-sy === 1){
                for(let i = sm; i <= 12; i++){
                    months[i-1] = 1;
                }

                for(let i = 1; i <= em; i++){
                    months[i-1] = 1;
                }
            }

            if(ey-sy > 1){
                months = [1,1,1,1,1,1,1,1,1,1,1,1];
            }
        }

        console.log(months)

        const data = {
            'userId': props.userId,
            'budget': budgetArr,
            'months':months,
            'who': who,
            'howlong': howlong,
            'themes': themes,
            'number': number,
            'traveler': traveler
        }

        axios
            .post(BACKEND_URL + '/api-vacation/updateData', data, {
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
            })
            .then(res => { console.log('Results: ' + res); })
            .catch(err => console.log('Login error: ' + err))
        
        getCityInfos();
    }

    const handleTravelerCheck = (evt, where, tagItem) => {

        const { name, checked } = evt.target;

        if (where === "traveler" && checked && !_.includes(traveler, name)) {
            setTraveler([...traveler, name])
        }
        if (where === "traveler" && !checked && _.includes(traveler, name)) {
            _.remove(traveler, function (n) {
                return n === name;
            });
            setTraveler(_.cloneDeep(traveler))
        }

        if (tagItem === 'themes' && where === "tagDropDown" && checked && !_.includes(themes, name)) {
            setThemes([...themes, name])
        }
        if (tagItem === 'themes' && where === "tagDropDown" && !checked && _.includes(themes, name)) {
            _.remove(themes, function (n) {
                return n === name;
            })
            setThemes(_.cloneDeep(themes))
        }

        if (tagItem === 'who' && where === "tagDropDown" && checked && !_.includes(who, name)) {
            setWho([...who, name]);
        }
        if (tagItem === 'who' && where === "tagDropDown" && !checked && _.includes(who, name)) {

            _.remove(who, function (n) {
                return n === name;
            })
            setWho(_.cloneDeep(who))
        }

        if (tagItem === 'howLong' && where === "tagDropDown" && !_.includes(howlong, name)) {

            console.log("-----state-----", howlong)

            setHowlong([...howlong, name])
        }
        if (tagItem === 'howLong' && where === "tagDropDown" && _.includes(howlong, name)) {
            console.log("remove------");
            _.remove(howlong, function (n) {
                return n === name;
            })
            setHowlong(_.cloneDeep(howlong))
        }

        if (tagItem === 'howMany' && where === "tagDropDown" && checked && !_.includes(number, Number(name))) {
            console.log("-----stateforadd-----", number);
            setNumber([...number, Number(name)])
        }
        if (tagItem === 'howMany' && where === "tagDropDown" && !checked && _.includes(number, Number(name))) {
            console.log("removedkfkfjslflksflksfklslksdfkl")
            _.remove(number, function (n) {
                return Number(n) === Number(name);
            })
            setNumber(_.cloneDeep(number))
        }


    }

    const displayTag = (values) => {
        return (
            values.map((value, index) =>
                <TagComponent name={value + (_.isNumber(value) ? (value === 1 ? " person" : " people") : "")} key={index} onClick={() => handleDeleteTagBtnClick(value)} case="1" />
            )
        );
    };

    const handleTagSelectDone = () => {
        setIsDropDownOpen(false);
    }

    const displaySiteCard = (values) => {
        
        return (
            values.map((value, index) =>
                <SiteCard key={index} item={value} userId={props.userId} />
            )
        );
    }

    return (
        <div className="w-full">
            <div  style={{minWidth:"760px"}}>
                <div className="d-flex justify-content-between">
                    <p className="page-title">Results ({activeCitiesInfo.length})</p>
                    <SelectSort />
                </div>
                <hr className="title-underline" />
            </div>
            <div className="d-flex justify-content-between">
                <div className="pt-3 select-box">
                    <div className="px-1 pb-2">
                        <div className="d-flex px-2 justify-content-between align-items-center">
                            <p className="select-header-title">Increase Matching</p>
                            <p className="clear" onClick={() => handleClearBtnClick(0)}>CLEAR ALL</p>
                        </div>
                        <hr className="select-title-underline" />
                        <div className="select-area">
                            <Scrollbar
                                options={{ wheelSpeed: 0.2, wheelPropagation: false }}
                                containerRef={el => (parent.current = el)}
                            >
                                <div className="mb-4" style={{ width: "95%" }}>
                                    <div className="px-2 pb-2">
                                        <p className="select-item-name">Budget</p>
                                    </div>
                                    <div className="px-2 item-spacing">
                                        <div className="btn-group d-flex flex-wrap" role="group" aria-label="Basic example">
                                            <button type="button" className={"btn " + (budgetArr.includes("low") ? "clicked" : "")} onClick={() => handleBudgetBtnClick("low")}>Low</button>
                                            <button type="button" className={"btn " + (budgetArr.includes("normal") ? "clicked" : "")} onClick={() => handleBudgetBtnClick("normal")}>Normal</button>
                                            <button type="button" className={"btn " + (budgetArr.includes("high") ? "clicked" : "")} onClick={() => handleBudgetBtnClick("high")}>High</button>
                                        </div>
                                    </div>
                                    <div className="d-flex px-2 pb-2 justify-content-between align-items-center">
                                        <p className="select-item-name">Time Frame</p>
                                        <p className="clear" onClick={() => handleClearBtnClick(1)}>CLEAR</p>
                                    </div>
                                    <div className="px-2 item-spacing">
                                        <DateRangePicker
                                            initialSettings={{ startDate: startDate, endDate: endDate, minDate: new Date(), applyButtonClasses:"applyButton", cancelButtonClasses: "cancelButton", oldStartDate: false }}
                                            onCallback={handleDateRangeCallback}
                                            autoApply={true}
                                            ref={daterange}
                                        ><div>
                                                <button className="d-flex align-items-center date-range-btn"><img src={calendarIcon} className="mr-4" alt="calendarIcon" /> {!startDate ? "Can Start From - Need to Return By" : (moment(startDate).format("ddd, MMM D") + " - " + (moment(endDate).format("ddd, MMM D")))} </button>
                                            </div>
                                        </DateRangePicker>

                                    </div>
                                    <div className="d-flex px-2 pb-2 justify-content-between align-items-center">
                                        <p className="select-item-name">Vacation Tags</p>
                                        <p className="clear" onClick={() => handleClearBtnClick(2)}>CLEAR</p>
                                    </div>
                                    <div className="px-2 pb-2">
                                        <div className="custom-dropDownParent" style={{ position: "relative", width: "100%" }}>
                                            <button className="tags" type="button" onClick={toggleDropDown}>
                                                Tags
                                            </button>
                                            {isDropDownOpen &&
                                                <div className="custom-dropDownMenu pl-2">
                                                    <div className="w-100" style={{ height: "200px" }}>
                                                        <Scrollbar style={{ paddingLeft: "5px", paddingRight: "15px" }}
                                                            options={{ wheelSpeed: 0.2, wheelPropagation: false }}
                                                        >
                                                            <p className="my-2 tagList-heading">Other Themes</p>
                                                            {listAndGroups['Other Themes'].map((value, index) =>

                                                                <div className="d-flex align-items-center custom-control custom-checkbox" key={index}>
                                                                    <input type="checkbox" className="custom-control-input" name={value} id={value} checked={_.includes(themes, value)} onChange={(evt) => handleTravelerCheck(evt, 'tagDropDown', 'themes')} />
                                                                    <label className="custom-control-label" htmlFor={value}>{value}</label>
                                                                </div>)}
                                                            <p className="my-2 tagList-heading">How Long</p>
                                                            {listAndGroups['How Long'].map((value, index) =>

                                                                <div className="d-flex align-items-center custom-control custom-checkbox" key={index}>
                                                                    <input type="checkbox" className="custom-control-input" name={value} id={value + "howlong"} checked={_.includes(howlong, value)} onChange={(evt) => handleTravelerCheck(evt, 'tagDropDown', 'howLong')} />
                                                                    <label className="custom-control-label" htmlFor={value + "howlong"}>{value}</label>
                                                                </div>)}

                                                            <p className="my-2 tagList-heading">How Many</p>
                                                            {listAndGroups['How Many'].map((value, index) =>

                                                                <div className="d-flex align-items-center custom-control custom-checkbox" key={index}>
                                                                    <input type="checkbox" className="custom-control-input" name={value} id={value + "howMany"} checked={_.includes(number, value)} onChange={(evt) => handleTravelerCheck(evt, 'tagDropDown', 'howMany')} />
                                                                    <label className="custom-control-label" htmlFor={value + "howMany"}>{value}</label>
                                                                </div>)}

                                                            <p className="my-2 tagList-heading">Who is traveling</p>
                                                            {listAndGroups['Who is traveling'].map((value, index) =>

                                                                <div className="d-flex align-items-center custom-control custom-checkbox" key={index}>
                                                                    <input type="checkbox" className="custom-control-input" name={value} id={value} checked={_.includes(who, value)} onChange={(evt) => handleTravelerCheck(evt, 'tagDropDown', 'who')} />
                                                                    <label className="custom-control-label" htmlFor={value}>{value}</label>
                                                                </div>)}
                                                        </Scrollbar>
                                                    </div>
                                                    <div className="w-25 text-center px-2 pt-1 mt-3 mb-1 mx-3 tag-select-done-btn" onClick={handleTagSelectDone}>Done</div>
                                                </div>
                                            }
                                        </div>

                                    </div>
                                    {!isDropDownOpen &&
                                        <div className="px-2 item-spacing">
                                            <div className="tag-area">
                                                <Scrollbar
                                                    options={{ wheelSpeed: 0.2, wheelPropagation: (!_.isEmpty(who) || !_.isEmpty(number) || !_.isEmpty(themes) ||  !_.isEmpty(howlong))?false:true }}
                                                >
                                                    <div className="d-flex flex-wrap pt-2 px-2" ref={tagBox}>
                                                        {displayTag(who)}
                                                        {displayTag(number)}
                                                        {displayTag(themes)}
                                                        {displayTag(howlong)}
                                                    </div>
                                                </Scrollbar>
                                            </div>
                                        </div>}
                                    <div className="d-flex px-2 pb-2 justify-content-between align-items-center">
                                        <p className="select-item-name">Travelers Composition</p>
                                        <p className="clear" onClick={() => handleClearBtnClick(3)}>CLEAR</p>
                                    </div>
                                    <div className="px-2">
                                        <div className="d-flex align-items-center custom-control custom-checkbox">
                                            <input type="checkbox" className="custom-control-input" checked={_.includes(traveler, "boys")} name="boys" id="boys" onChange={(evt) => handleTravelerCheck(evt, 'traveler', '')} />
                                            <label className="custom-control-label" htmlFor="boys">All Boys Travelers</label>
                                        </div>
                                        <div className="d-flex align-items-center custom-control custom-checkbox">
                                            <input type="checkbox" className="custom-control-input" checked={_.includes(traveler, "girls")} name="girls" id="girls" onChange={(evt) => handleTravelerCheck(evt, 'traveler', '')} />
                                            <label className="custom-control-label" htmlFor="girls">All Girls Travelers</label>
                                        </div>
                                        <div className="d-flex align-items-center custom-control custom-checkbox">
                                            <input type="checkbox" className="custom-control-input" checked={_.includes(traveler, "elderly")} name="elderly" id="elderly" onChange={(evt) => handleTravelerCheck(evt, 'traveler', '')} />
                                            <label className="custom-control-label" htmlFor="elderly">Suitable For The Elderly</label>
                                        </div>
                                        <div className="d-flex align-items-center custom-control custom-checkbox">
                                            <input type="checkbox" className="custom-control-input" checked={_.includes(traveler, "kids")} name="kids" id="kids" onChange={(evt) => handleTravelerCheck(evt, 'traveler', '')} />
                                            <label className="custom-control-label" htmlFor="kids">Suitable For Kids And Babies</label>
                                        </div>
                                    </div>
                                </div>

                            </Scrollbar>
                        </div>
                    </div>
                    <div className="w-full" style={{ zIndex: "1" }}>
                        <button className="btn w-100 filter-btn" onClick={handleFilterBtnClick}>Filter</button>
                    </div>
                </div>
                <div className="ml-3 list-box p-2">
                    <Scrollbar style={{ height: "55vh", paddingRight: "15px" }}>
                        {displaySiteCard(activeCitiesInfo)}
                        <div className="d-flex justify-content-center mt-4">
                            {
                                activeCitiesInfo.length !== citiesInfo.length && <button className="btn shadow-lg showMoreBtn" onClick={handleShowMoreBtn}>Show me more</button>
                            }
                        </div>
                    </Scrollbar>
                </div>
            </div>
        </div >

    )
}

export default Search;