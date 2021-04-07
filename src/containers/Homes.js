import React, { useState, useEffect } from 'react';

import logo from "../images/logo.png";
import step1 from "../images/eclipse1.png";
import backArrow from "../images/backArrow.png";

import "./home.css";
import { CircleButton } from "../components/CircleButton";
// import Bubbles from '../components/Bubble';
import { CircularProgress } from '@material-ui/core';
import { makeStyles, withStyles } from '@material-ui/core/styles';
import CustomizedProgressBar from '../components/CustomizedProgressBar';

import { set } from 'lodash';


const Home = (props) => {

    const [who, setWho] = useState("");
    const [number, setNumber] = useState("");
    const [theme, setTheme] = useState("");
    const [howLong, setHowLong] = useState("");
    const [timePeriod, setTimePeriod] = useState("");

    const [data, setdata] = useState({ step: 0, item: '' })
    const [showNumberPage, setShowNumberPage] = useState(0);

    useEffect(() => {
        if (data.step === 1) {
            setWho(data.item);
            switch (data.item) {
                case "Family":
                    setShowNumberPage(1);
                    break;
                case "Friends":
                    setShowNumberPage(2);
                    break;
                case "Solo":
                    setdata({ step: 2, item: "1" });
                    break;
                case "Couple":
                    setdata({ step: 2, item: "2" });
                    break;
                default:
                    setShowNumberPage(3);
            }
        }
        if (data.step === 2) {
            setNumber(data.item);
        }

        if (data.step === 3) {
            setTheme(data.item);
        }
        if (data.step === 4) {
            setHowLong(data.item);
        }
        if (data.step === 5) {
            setTimePeriod(data.item);
        }
    }, [data.item, data.step]);

    const handleClickBtn = (x, y) => {
        setdata({ step: x, item: y });
    }

    const handleClickBackBtn = () => {
        console.log(data.item);
        var step = data.step;

        console.log("step++++++" + step)

        switch (step) {
            case 1:
                setWho("");
                setdata({ step: 0, item: "" });
                setShowNumberPage(0);

                break;
            case 2:
                setNumber("");

                if (who === "Couple" || who === "Solo") {
                    alert("dkdkdkdkdkdkdkdk")
                    setdata({ step: 0, item: "" });
                }
                else {
                    setdata({ step: 1, item: who });
                }
                break;
            case 3:
                setTheme("");
                setdata({ step: 2, item: number });
                break;
            case 4:
                setHowLong("");
                setdata({ step: 3, item: theme });
                break;
            case 5:
                setTimePeriod("");
                setdata({ step: 4, item: howLong });
                break;

            default:
                break;
        }
        console.log("who  " + who);
        console.log("number  " + number);
        console.log("theme  " + theme);
        console.log("howlong  " + howLong);
    }

    const handleNumber = (x) => {
        setNumber(x);
        setdata({ step: 2, item: x });
        setShowNumberPage(0)
    }

    return (
        <div className="w-full">
            <div className="w-full mx-auto" style={{ maxWidth: "1440px" }}>
                <div className="bg-img">
                    <nav className="navbar navbar-expand-lg navbar-light justify-content-between">
                        <a className="navbar-brand" href="#home"><img src={logo} alt="logo" style={{ paddingTop: "14px", paddingLeft: "39px" }} /></a>
                        <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span className="navbar-toggler-icon"></span>
                        </button>
                        <div className="collapse navbar-collapse mr-5 pt-3" style={{ flexGrow: "0" }} id="navbarNav">
                            <ul className="navbar-nav topnav">
                                <li className="nav-item px-2 active">
                                    <a className="nav-link" href="#home" style={{ color: "brown" }}>Home</a>
                                </li>
                                <li className="nav-item px-2">
                                    <a className="nav-link" href="#about">About</a>
                                </li>
                                <li className="nav-item px-2">
                                    <a className="nav-link" href="#contact">Contact</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <div className="d-flex" style={{ paddingLeft: "39px", paddingRight: "39px", marginTop: "29px" }}>
                        <p className="bg-white text-center rounded-lg py-1" style={{ opacity: "50%", fontSize: "37px", fontWeight: "600", paddingLeft: "10px", paddingRight: "30px" }}>Find your next destination</p>
                    </div>

                </div>
                <div className="w-full px-4" style={{ paddingTop: "29px" }}>
                    <div className="w-full mx-auto shadow-lg" style={{ maxWidth: "519px", paddingTop: "16px", paddingBottom: "16px", paddingLeft: "25px", paddingRight: "25px", borderRadius: "40px" }}>
                        <div className="d-flex justify-content-between">
                            <p style={{ fontWeight: "300", fontSize: "20px" }}>Adjust your search:</p>
                            {data.step === 0 && <CustomizedProgressBar value={0} /> || <CustomizedProgressBar value={25 * (data.step - 1)} />}

                        </div>
                        <h1 className="text-center">
                            {(data.step === 0 || data.step === 1) && "Who is travelling?"}
                            {data.step === 2 && "Vacation Theme"}
                            {data.step === 3 && "How long?"}
                            {data.step === 4 && "Time frame"}

                        </h1>
                        <hr style={{ width: "30%" }} />
                        <div>
                            {(data.step === 0) &&
                                <>
                                    <CircleButton name="Family" onClick={() => handleClickBtn(1, "Family")} />
                                    <CircleButton name="Friends" onClick={() => handleClickBtn(1, "Friends")} />
                                    <CircleButton name="Couple" onClick={() => handleClickBtn(1, "Couple")} />
                                    <CircleButton name="Solo" onClick={() => handleClickBtn(1, "Solo")} />
                                </>
                            }

                            {(showNumberPage === 1) &&
                                <>
                                    <CircleButton name="Family" />
                                    <CircleButton name="3" onClick={() => handleNumber("3")} />
                                    <CircleButton name="4" onClick={() => handleNumber("4")} />
                                    <CircleButton name="5" onClick={() => handleNumber("5")} />
                                    <CircleButton name="6+" onClick={() => handleNumber("6+")} />
                                </>
                            }

                            {(showNumberPage === 2) &&
                                <>
                                    <CircleButton name="Friends" />
                                    <CircleButton name="2" onClick={() => handleNumber("2")} />
                                    <CircleButton name="3" onClick={() => handleNumber("3")} />
                                    <CircleButton name="4" onClick={() => handleNumber("4")} />
                                    <CircleButton name="5" onClick={() => handleNumber("5")} />
                                    <CircleButton name="6+" onClick={() => handleNumber("6+")} />
                                </>
                            }

                            {(number !== "" && data.step === 2) &&
                                <>
                                    <CircleButton name="Beach" onClick={() => handleClickBtn(3, "Beach")} />
                                    <CircleButton name="City life" onClick={() => handleClickBtn(3, "City life")} />
                                    <CircleButton name="Nature" onClick={() => handleClickBtn(3, "Nature")} />
                                    <CircleButton name="Suprise me" onClick={() => handleClickBtn(3, "Suprise me")} />
                                    <CircleButton name="Country side" onClick={() => handleClickBtn(3, "Country side")} />
                                </>
                            }

                            {(theme !== "" && data.step === 3) &&
                                <>
                                    <CircleButton name="Weekend" onClick={() => handleClickBtn(4, "Weekend")} />
                                    <CircleButton name="Weekish" onClick={() => handleClickBtn(4, "Weekish")} />
                                    <CircleButton name="Long Weekend" onClick={() => handleClickBtn(4, "Long Weekend")} />
                                    <CircleButton name="Longer" onClick={() => handleClickBtn(4, "Longer")} />
                                </>
                            }

                            {(howLong !== "" && data.step === 4) &&
                                <>
                                    <div>Time Frame</div>


                                </>
                            }
                        </div>

                        <div className="d-flex justify-content-between align-items-center" style={{ paddingBottom: "30px" }}>
                            {
                                data.step > 0 ? <div><img src={backArrow} alt="backArrow" onClick={handleClickBackBtn} style={{ float: "left", width: "38px" }} /></div> : <div></div>
                            }
                            <p style={{ fontSize: "18px", float: "right" }}>Skip</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default Home;