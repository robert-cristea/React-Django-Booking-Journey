import React, { useState, useEffect } from 'react';
import { CircleButton } from '../../components/Home/CircleButton';
import { CircularProgressBar } from "../../components/Home/CircularProgressBar";
import MyComponent from '../../components/Home/myComponents';
import SwitchComponent from '../../components/Home/SwitchComponent';

import Search from '../Search';

import axios from "axios";
// import dateFormat from 'dateformat'
// import { addDays } from 'date-fns';
import { BACKEND_URL } from '../../utils/request';
import logo from "../../images/logo.png";
import backArrow from "../../images/backArrow.png";
import forwardArrow from "../../images/forwardArrow.png";
import "./home.css";
import 'react-date-range/dist/styles.css';
import 'react-date-range/dist/theme/default.css';

const Home = (props) => {

    // set user info
    const [step, setStep] = useState(1)
    
    const [multiWho, setMultiWho] = useState([])
    const [multiNumber, setMultiNumber] = useState([])
    const [multiPeriod, setMultiPeriod] = useState([])
    const [multiTheme, setMultiTheme] = useState([])
    const [userId, setUserId] = useState()
    
    const isMounted = useMounted();
    const [isMultiple, setIsMultiple] = useState(false)
    const [showLongerPeriod, setShowLongerPeriod] = useState(false)
    const [showAdvancedSearchPage, setShowAdvancedSearchPage] = useState(false)

    const initialButtons = {
        1: [
            { 'name': 'Family', 'clickable': false },
            { 'name': 'Friends', 'clickable': false },
            { 'name': 'Couple', 'clickable': false },
            { 'name': 'Solo', 'clickable': false }
        ],
        2: [
            { 'name': 2, 'clickable': false },
            { 'name': 3, 'clickable': false },
            { 'name': 4, 'clickable': false },
            { 'name': 5, 'clickable': false },
            { 'name': 6, 'clickable': false }
        ],
        3: [
            { 'name': 'Weekend', 'clickable': false },
            { 'name': 'Weekish', 'clickable': false },
            { 'name': 'Long Weekend', 'clickable': false },
            { 'name': 'Midweek', 'clickable': false },
            { 'name': 'Longer', 'clickable': false },
            { 'name': '2 Weeks', 'clickable': false },
            { 'name': '3 Weeks', 'clickable': false },
            { 'name': '4 Weeks', 'clickable': false },
            { 'name': '5 Weeks', 'clickable': false }
        ],
        4: [
            { 'name': 'Beach', 'clickable': false },
            { 'name': 'City Life', 'clickable': false },
            { 'name': 'Nature', 'clickable': false },
            { 'name': 'Surprise me', 'clickable': false },
            { 'name': 'Country side', 'clickable': false },
            { 'name': 'Other', 'clickable': false }
        ],
    }
    const [buttonArray, setbuttonArray] = useState({ ...initialButtons })

    const handleSwitchChange = () => {
        setIsMultiple(!isMultiple)
        switch (step) {
            case 1:
                setMultiWho([]);
                break;
            case 2:
                setMultiNumber([]);
                break;
            case 3:
                setMultiPeriod([]);
                break;
            case 4:
                setMultiTheme([]);
                break;
            default:
                break;
        }
    }

    const displaybuttons = (step, subStage) => {
        if (step !== 3) {
            return (
                buttonArray[step].map((item, index) =>
                    <CircleButton name={item.name} className="child" key={index} sel={index} clicked={item.clickable} onClick={() => handleClickBtn(step, index)} />
                ));
        } else {
            if (subStage === 1) {
                const stage1_arr = buttonArray[step].slice(0, 5);
                return (
                    stage1_arr.map((item, index) =>
                        <CircleButton name={item.name} className="child" key={index} sel={index} clicked={item.clickable} onClick={() => handleClickBtn(step, index)} />
                    ));
            }
            if (subStage === 2) {
                const stage2_arr = buttonArray[step].slice(4, 9);
                return (
                    stage2_arr.map((item, index) =>
                        <CircleButton name={item.name} className="child" key={index} sel={index} clicked={item.clickable} onClick={() => handleClickBtn(step, index + 4)} />
                    ));
            }
            if (subStage === 3) {
                const stage3_arr = buttonArray[step].slice(0, 4).concat(buttonArray[step].slice(5, 8));
                return (
                    stage3_arr.map((item, index) =>
                        <CircleButton name={item.name} className="child" key={index} sel={index} clicked={item.clickable} onClick={() => { if (index < 4) handleClickBtn(step, index); else handleClickBtn(step, index + 1); }} />
                ));
            }
        }
    }

    function useMounted() {
        const [isMounted, setIsMounted] = useState(false)
        useEffect(() => {
            setIsMounted(true)
        }, [])
        return isMounted
    }

    useEffect(() => {
        if (isMounted) {
            if (isMultiple) {
                return;
            } else {
                for (let i = 0; i < buttonArray[1].length; i++) {
                    buttonArray[1][i]['clickable'] = false;
                    setbuttonArray({ ...buttonArray })
                }
                if (multiWho.length !== 0 && !(multiWho.includes('Solo') || multiWho.includes('Couple'))) {
                    setStep(2);
                }
                if (multiWho.includes('Solo') || multiWho.includes('Couple')) {
                    if (multiWho.includes('Solo')) {
                        setMultiNumber([...multiNumber, 1])
                    } else {
                        setMultiNumber([...multiNumber, 2])
                    }
                    setStep(3)
                }
            }
        }
    }, [multiWho])

    useEffect(() => {
        if (isMounted) {
            if (isMultiple) {
                return;
            } else {
                for (let i = 0; i < buttonArray[2].length; i++) {
                    buttonArray[2][i]['clickable'] = false;
                    setbuttonArray({ ...buttonArray })
                }
                if (multiNumber.length !== 0) {
                    setStep(3);
                }
            }
        }
    }, [multiNumber])

    useEffect(() => {
        if (isMounted) {
            if (isMultiple) {
                return;
            } else {
                for (let i = 0; i < buttonArray[3].length; i++) {
                    buttonArray[3][i]['clickable'] = false;
                    setbuttonArray({ ...buttonArray })
                }
                if (multiPeriod.length !== 0) {
                    setStep(4);
                }
            }
        }
    }, [multiPeriod])

    useEffect(() => {
        if (isMounted) {
            if (isMultiple) {
                return;
            } else {
                for (let i = 0; i < buttonArray[4].length; i++) {
                    buttonArray[4][i]['clickable'] = false;
                    setbuttonArray({ ...buttonArray })
                }
                if (multiTheme.length !== 0) {
                    setStep(5);
                }
            }
        }
    }, [multiTheme])

    useEffect(() => {
        switch(step){
            case 1:
                setMultiWho([]);
                break;
            case 2:
                setIsMultiple(false);
                setMultiNumber([]);
                break;
            case 3:
                setMultiPeriod([]);
                break;
            case 4:
                setMultiTheme([]);
                break;
            case 5:
                handleTransmitData();
                setTimeout(function(){setShowAdvancedSearchPage(true)},2000)
                break;
            default:
                break;
        }
    }, [step])

    const handleForwardBtnClick = () => {
        switch (step) {
            case 1:
                if ((multiWho.length === 1 && multiWho.includes('Solo')) ||
                    (multiWho.length === 1 && multiWho.includes('Couple')) ||
                    (multiWho.length === 2 && multiWho.includes('Solo') && multiWho.includes('Couple'))) {

                    if ((multiWho.length === 1 && multiWho.includes('Solo'))) setMultiNumber([...multiNumber, 1]);
                    if ((multiWho.length === 1 && multiWho.includes('Couple'))) setMultiNumber([...multiNumber, 2]);
                    if ((multiWho.length === 2 && multiWho.includes('Solo') && multiWho.includes('Couple'))) {
                        setMultiNumber([...multiNumber, 3]);
                    }
                    setStep(3)
                }
                else {
                    setStep(2);
                }
                break;
            case 2:
                setStep(3);
                break;
            case 3:
                setStep(4);
                break;
            case 4:
                setStep(5);
                break;
            default:
                break;
        }
        setIsMultiple(false);
    }

    const handleBackBtnClick = () => {
        setIsMultiple(false);
        switch (step) {
            case 2:
                setMultiNumber([]);
                setStep(1);
                break;
            case 3:
                setMultiPeriod([]);
                setStep(2);
                break;
            case 4:
                setMultiTheme([]);
                setStep(3);
                break;
            default:
                break;
        }
    }

    const handleClickBtn = (x, y) => {
        buttonArray[x][y]['clickable'] = true;
        setbuttonArray({ ...buttonArray })

        if (x === 1 && !multiWho.includes(buttonArray[x][y]['name'])) {
            setMultiWho([...multiWho, buttonArray[x][y]['name']])
        }
        if (x === 2) {
            setMultiNumber([...multiNumber, buttonArray[x][y]['name']])
            setStep(3);
            setIsMultiple(false)
        }
        if (x === 3 && !multiPeriod.includes(buttonArray[x][y]['name'])) {
            if (buttonArray[x][y]['name'] === "Longer") {
                setShowLongerPeriod(true);
            } else {
                setMultiPeriod([...multiPeriod, buttonArray[x][y]['name']])
            }

        }
        if (x === 4 && !multiTheme.includes(buttonArray[x][y]['name'])) {
            setMultiTheme([...multiTheme, buttonArray[x][y]['name']])
        }
    }

    const handleTransmitData = () => {

        console.log("who  " + multiWho);
        console.log("number  " + multiNumber);
        console.log("howlong  " + multiPeriod);
        console.log("theme  " + multiTheme);
        console.log(BACKEND_URL)
        axios
            .post(BACKEND_URL + '/api-vacation/storeData', {
                'who': multiWho,
                'number': multiNumber,
                'howlong': multiPeriod,
                'theme': multiTheme,
            }, {
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
            })
            .then(res => {return res.data;})
            .then(res => {setUserId(res)})
            .catch(err => console.log('Login error: ' + err))
    }

    return (
        <div className="w-full">
            <div className="w-full mx-auto">
                <div className="header bg-img">
                    <div className="d-flex justify-content-between align-items-center mx-5" style={{ paddingTop: "14px" }}>
                        <a className="logo" href="#home"><img src={logo} alt="logo" /></a>

                        <div className="d-flex topnav" style={{ flexGrow: "0" }}>
                            <a href="#home" style={{ color: "brown" }}>Home</a>
                            <a href="#about">About</a>
                            <a href="#contact">Contact</a>
                        </div>
                    </div>
                    <div className="d-flex mx-5 pt-3">
                        <p className="bg-white text-center rounded-lg py-1 notify">Find your next destination</p>
                    </div>
                </div>
                { !showAdvancedSearchPage?
                <div className="w-full d-flex align-items-center justify-content-center px-4 form-card">
                    {step < 5 ?
                        <div className="w-full mx-auto shadow-lg br-card" style={{ display: 'flex', flexDirection: 'column', width: "40vw", minWidth: "400px", position: 'relative' }}>
                            <div className="py-3 px-4">
                                <div className="d-flex justify-content-between">
                                    <p style={{ fontWeight: "300", fontSize: "1.2rem" }}>Adjust your search:</p>
                                    <div>
                                        {step === 1 && <CircularProgressBar percentage={0} />}
                                        {step > 1 && <CircularProgressBar percentage={25 * (step-1)} />}
                                    </div>
                                </div>
                                <h2 className="text-center">
                                    {step === 1 && "Who is travelling?"}
                                    {step === 2 && "How Many?"}
                                    {step === 3 && "How long?"}
                                    {step === 4 && "Vacation Theme"}
                                </h2>
                                <hr style={{ width: "30%", marginTop: "10px", marginBottom: "10px" }} />
                                <div className="d-flex justify-content-between">
                                    <div></div>
                                    <SwitchComponent onChange={handleSwitchChange} checked={isMultiple} />
                                </div>
                            </div>
                            <div className="circle-field w-full" style={{ height: "64%" }}>
                                {(step === 1) &&
                                    <MyComponent>
                                        {displaybuttons(1, 0)}
                                    </MyComponent>
                                }
                                {(step === 2) &&
                                    <MyComponent>
                                        {displaybuttons(2, 0)}
                                    </MyComponent>
                                }
                                {(step === 3 && !isMultiple) && (showLongerPeriod ?
                                    <MyComponent>
                                        {displaybuttons(3, 2)}
                                    </MyComponent> :
                                    <MyComponent>
                                        {displaybuttons(3, 1)}
                                    </MyComponent>)
                                }
                                {(step === 3 && isMultiple) &&
                                    <MyComponent>
                                        {displaybuttons(3, 3)}
                                    </MyComponent>
                                }
                                {(step === 4) &&
                                    <MyComponent>
                                        {displaybuttons(4, 0)}
                                    </MyComponent>
                                }
                            </div>

                            <div className="pb-3 px-3" style={{ width: "100%", position: 'absolute', bottom: 0 }}>
                                <div className="d-flex justify-content-between w-full align-items-center">
                                    {step > 1 ? <img src={backArrow} alt="backArrow" onClick={handleBackBtnClick} style={{ width: "1.8rem" }} /> : <div></div>}
                                    <div><img src={forwardArrow} alt="forwardArrow" onClick={handleForwardBtnClick} style={{ width: "1.8rem" }} /></div>
                                </div>
                            </div>
                        </div> : <p className="text-center font-weight-medium font-greeting">Searching <span style={{ display: "block" }}>for the best vacation</span> for you</p>}
                </div>:<div className="w-full pt-2 px-5 form-card"><Search userId = {userId} who={multiWho} number={multiNumber} howlong={multiPeriod} theme={multiTheme} /></div>}
            </div>
        </div>
    )
}

export default Home;