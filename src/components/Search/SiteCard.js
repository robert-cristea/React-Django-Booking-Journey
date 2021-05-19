import React, { Component, useState } from "react";
import ReactStars from "react-rating-stars-component";
import TagComponent from "./TagComponent";
import pic1 from "../../images/Cities/Amsterdam.jpeg";
import 'font-awesome/css/font-awesome.min.css';
import _ from "lodash";

const SiteCard = (props) => {
    const item = props.item;
    const [pic, setPic] = useState("")
    import(`../../images/Cities/${item.picture}`).then((module) => {
        setPic(module.default);
    });

    const displayTagsInList = (item) => {
        var keys = _.pickBy(item, (value,key) => value === 1)
        var keysExceptMonth = _.omit(keys,['id','january','february','march','april','may','june','july','august','september','october','november','december','budget_low','budget_normal','budget_high'])
        var arr = _.keys(keysExceptMonth)
        return (
            arr.map((value, index) =>
                <TagComponent name={_.startCase(_.camelCase(value)) + (_.isNumber(value) ? (value === 1 ? " person" : " people") : "")} key={index} case = "2" />
            )
        );
    }

    const displayBestTimeToVisit = (item) => {
        var months = _.pick(item,['january','february','march','april','may','june','july','august','september','october','november','december'])
        var monthsWithOne = _.omitBy(months,(value,key)=>value === 0)
        var arr = _.keys(monthsWithOne)
        return (
            arr.map((value,index)=>
            <span style = {{fontSize: "1rem", fontWeight: "500", margin: "0",fontWeight:"bold"}} key={index} >{_.startCase(value)}</span>)
        )
    }

    return (
        <div className="mx-auto w-100 d-flex my-2" style={{ border: "1px solid #555555", borderRadius: "5px" }}>
            <div className="d-flex align-items-center px-2 pb-2" style={{ width: "20%", borderRight: "1px solid #0000001A", paddingTop: "0.8rem" }}>
                <img src={pic} className="" alt="pic1" style={{ width: "100%", height: "100%", maxHeight:"100%" }} />
            </div>
            <div style={{ width: "80%", height: "100%", position: "relative" }}>
                <div className="d-flex align-items-center justify-content-between h-25" style={{ borderBottom: "1px solid #0000001A" }}>
                    <p className="pl-4" style={{ fontSize: "1.5rem", fontWeight: "500", margin: "0" }}>{item.city_name}</p>
                    <div className="d-flex align-items-center pr-3">
                        <div className="">
                            <p style={{ fontSize: "0.7rem", fontWeight: "500", margin: "0" }}>Did you like this recommendataion?</p>
                            <div className="d-flex justify-content-center align-items-centerm" style={{ marginTop: "-15px" }}>
                                <ReactStars
                                    count={5}
                                    // onChange={ratingChanged}
                                    value={4}
                                    size={30}
                                    edit={true}
                                    activeColor="#00DAF8"
                                />
                            </div>
                        </div>
                        <p className="pl-4" style={{ color: "#00B227", fontSize: "0.9rem", fontWeight: "500", margin: "0" }}>97% Match</p>
                    </div>
                </div>

                <div className="h-75 px-2" style={{ paddingTop: "5px" }}>
                    <div className="px-4">
                        <p style={{ fontSize: "0.9rem", fontWeight: "500", margin: "0", lineHeight: "1.2" }}>{item.short_description}</p>
                    </div>
                    <div className="d-flex align-items-center my-2">
                        <i className="fa fa-calendar" style={{ fontSize: "1.5rem" }}></i><p className="pl-3" style={{ fontSize: "1rem", fontWeight: "500", margin: "0" }}>Budget: <span style={{fontWeight:"bold"}}>{item.budget_low === 1?"Low":""}{((item.budget_low === 1 && item.budget_normal === 1) || (item.budget_high === 1 && item.budget_low === 1)) && " - "}{item.budget_normal === 1?"Normal":""}{(item.budget_high === 1 && item.budget_normal === 1) && " - "}{item.budget_high === 1?"High":""}</span></p>
                    </div>
                    <div className="d-flex align-items-center my-2">
                        <i className="fa fa-calendar" style={{ fontSize: "1.5rem" }}></i><p className="pl-3" style={{ fontSize: "1rem", fontWeight: "500", margin: "0" }}>Known Sites: <span style={{fontWeight:"bold"}}>{item.sites}</span></p>
                    </div>
                    <div className="d-flex align-items-center my-2">
                        <i className="fa fa-calendar" style={{ fontSize: "1.5rem" }}></i><p className="pl-3" style={{ fontSize: "1rem", fontWeight: "500", margin: "0" }}>Best time to visit: <span style={{fontWeight:"bold"}}>{displayBestTimeToVisit(item)}</span></p>
                    </div>
                    <div className="d-flex align-items-center flex-wrap">
                        {displayTagsInList(item)}
                    </div>
                </div>
            </div>
        </div>
    );
}

export default SiteCard;