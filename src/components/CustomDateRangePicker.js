import React, { Component } from 'react';
import PropTypes from 'prop-types';
import {DateRange, DefinedRange} from 'react-date-range';
// import DefinedRange from '../DefinedRange';
import { findNextRangeIndex, generateStyles } from 'react-date-range/src/utils';
import classnames from 'classnames';
import coreStyles from 'react-date-range/src/styles';

class DateRangePicker extends Component {
  constructor(props) {
    super(props);
    this.state = {
      focusedRange: [findNextRangeIndex(props.ranges), 0],
    };
    this.styles = generateStyles([coreStyles, props.classNames]);
  }
  render() {
    const { focusedRange } = this.state;
    return (
      <div className={classnames(this.styles.dateRangePickerWrapper, this.props.className)}>
        <DateRange
          onRangeFocusChange={focusedRange => this.setState({ focusedRange })}
          focusedRange={focusedRange}
          {...this.props}
          ref={t => (this.dateRange = t)}
          className={undefined}
        />
      </div>
    );
  }
}

DateRangePicker.defaultProps = {};

DateRangePicker.propTypes = {
  ...DateRange.propTypes,
  ...DefinedRange.propTypes,
  className: PropTypes.string,
};

export default DateRangePicker;