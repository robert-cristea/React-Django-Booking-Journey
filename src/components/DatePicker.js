import * as React from 'react';
import * as ReactDOM from 'react-dom';


import { DateInput, Calendar, DatePicker, TimePicker, MultiViewCalendar, DateRangePicker } from '@progress/kendo-react-dateinputs';

export default class CustomCalendar extends React.Component {
    render() {
        return <DateRangePicker
        defaultShow={this.defaultShow}
    />;
    }
}
