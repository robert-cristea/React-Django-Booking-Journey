import React, { useRef } from 'react';
import Scrollbar from 'react-perfect-scrollbar';
import TagComponent from './tagComponent'
import _ from 'lodash';

const TagBox = (props) => {

    const { who, number, howlong, themes, onClick } = props;

    const displayTag = (values) => {
        return (
            values.map((value, index) =>
                <TagComponent name={value + (_.isNumber(value) ? (value === 1 ? " person" : " people") : "")} key={index} onClick={() => onClick(value)} case="1" />
            )
        );
    };

    return (
        <div className="px-2 item-spacing">
            <div className="tag-area">
                <Scrollbar
                    options={{ wheelSpeed: 0.2, wheelPropagation: (!_.isEmpty(who) || !_.isEmpty(number) || !_.isEmpty(themes) || !_.isEmpty(howlong)) ? false : true }}
                >
                    <div className="d-flex flex-wrap pt-2 px-2">
                        {displayTag(who)}
                        {displayTag(number)}
                        {displayTag(themes)}
                        {displayTag(howlong)}
                    </div>
                </Scrollbar>
            </div>
        </div>
    );
}

export default TagBox;