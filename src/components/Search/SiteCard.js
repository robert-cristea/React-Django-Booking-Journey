import React, { useState, useRef } from "react";
import ReactStars from "react-rating-stars-component";
import TagComponent from "./tagComponent";
import 'font-awesome/css/font-awesome.min.css';
import './SiteCard.css'
import _ from "lodash";
import axios from "axios";
import { BACKEND_URL } from "../../utils/request";

const SiteCard = (props) => {
    const starRef = useRef(null)
    const item = props.item;
    const [rating, setRating] = useState(0)

    const displayTagsInList = (item) => {
        var keys = _.pickBy(item, (value,key) => value === 1)
        var keysExceptMonth = _.omit(keys,['solo','couple','friends','family','weekend','long_weekend','weekish','midweek','two_weeks','three_weeks','four_weeks','five_weeks','other','one_passengers','two_passengers','three_passengers','four_passengers','five_passengers','six_passengers','one_weeks','comp_allgirls','comp_allboys','comp_elderly','comp_kids_babies','id','january','february','march','april','may','june','july','august','september','october','november','december','budget_low','budget_normal','budget_high','holidays','surprise'])
        var arr = _.keys(keysExceptMonth)
        return (
            arr.map((value, index) =>
                <TagComponent name={_.startCase(_.camelCase(value)) + (_.isNumber(value) ? (value === 1 ? " person" : " people") : "")} key={index} case = "2" />
            )
        );
    }

    const displayBestTimeToVisit = (item) => {
        const keys = ['january','february','march','april','may','june','july','august','september','october','november','december'];
        var months = _.pick(item,['january','february','march','april','may','june','july','august','september','october','november','december'])
        var finalArray = []
        for(let i=0;i<12;i++){
            if(i === 0){
                var subarr = [];
            }
            if(months[keys[i]] === 1){
                subarr.push(keys[i])
            }else{
                if(subarr.length !== 0 ){
                    finalArray.push(subarr);
                    subarr = []
                }
            }
            if(subarr.length === 12){
                finalArray.push(subarr);
                break;
            }
        }
        return (
            finalArray.map((value,index)=>
                <span className="pr-3 best-time-content" key={index} >{_.startCase(value[0]) + ((value.length > 1)?(" - "+_.startCase(value[(value.length-1)])):"")}</span>)
            );
    }

    const ratingChanged = (city,newRating) => {
        // setRating(newRating);

        const data = {
            'userId': props.userId,
            'users_rating': newRating,
            'city_name':city
        }

        axios
            .post(BACKEND_URL + '/api-vacation/add-rating-matching', data, {
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
            })
            .then(res => { return res; })
            .catch(err => console.log('Login error: ' + err))
      }

    return (
        <div className="mx-auto w-100 d-flex my-2 custom-card-border">
            <div className="d-flex align-items-center px-2 pb-2 pic-wrapper">
                <img src={item.picture} className="pic" alt="pic" />
            </div>
            <div className="custom-card-body">
                <div className="d-flex align-items-center justify-content-between h-25 custom-card-body-header">
                    <p className="pl-4 custom-card-title">{item.city_name}</p>
                    <div className="d-flex align-items-center pr-3">
                        <div>
                            <p className="raty-header">Did you like this recommendataion?</p>
                            <div className="d-flex justify-content-center align-items-centerm" style={{ marginTop: "-15px" }}>
                                <ReactStars
                                    count={5}
                                    onChange={(raty)=>{setRating(raty); ratingChanged(item.city_name,raty);}}
                                    value={rating}
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
                        <p className="custom-card-body-description">{item.short_description}</p>
                    </div>
                    <div className="d-flex align-items-center my-2">
                        <i className="fa fa-money" style={{ fontSize: "1.5rem" }}></i><p className="pl-3 card-body-icon-title">Budget: <span className="font-weight-bold">{item.budget_low === 1?"Low":""}{((item.budget_low === 1 && item.budget_normal === 1) || (item.budget_high === 1 && item.budget_low === 1)) && " - "}{item.budget_normal === 1?"Normal":""}{(item.budget_high === 1 && item.budget_normal === 1) && " - "}{item.budget_high === 1?"High":""}</span></p>
                    </div>
                    <div className="d-flex align-items-center my-2">
                        <i className="fa fa-home" style={{ fontSize: "1.5rem" }}></i><p className="pl-3 card-body-icon-title">Known Sites: <span className="font-weight-bold">{item.sites}</span></p>
                    </div>
                    <div className="d-flex align-items-center my-2">
                        <i className="fa fa-calendar" style={{ fontSize: "1.5rem" }}></i><p className="pl-3 card-body-icon-title">Best time to visit: <span className="font-weight-bold">{displayBestTimeToVisit(item)}</span></p>
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