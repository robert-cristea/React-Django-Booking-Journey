import React, { useState, useEffect } from 'react';
import Select, { NonceProvider } from 'react-select';

const SelectSort = () => {

  // const [selectedOption, setSelectedOption] = useState("");
  const options = [
    { value: 'match', label: 'Match' },
    { value: 'price', label: 'Price' },
  ];

  const customStyles = {
    option: (provided, state) => ({
      ...provided,
      //   borderBottom: '1px dotted pink',
      color: state.isSelected ? 'white' : 'black',
      paddingLeft: 15,
    }),
    control: (styles) => ({
      ...styles,
      width: 100,
      border: 'none',
      paddingRight: 10,
      '&:hover': { borderColor: 'gray' }, // border style on hover
      boxShadow: 'none', // no box-shadow
    }),
    singleValue: (provided, state) => {
      const opacity = state.isDisabled ? 0.6 : 1;
      const transition = 'opacity 500ms';

      return { ...provided, opacity, transition };
    }
  }

  const handleChange = (value) => {
    console.log(value);
  };

  return (
    <div className="d-flex align-items-center px-3 py-2">
      <label htmlFor="category" className="pr-4 filter-label">SORT BY</label>
      <Select
        onChange={handleChange}
        options={options}
        styles={customStyles}
        defaultValue={options[0]}
        components={{
          IndicatorSeparator: () => null
        }}
        isSearchable={false}
      />
    </div>
  )
}

export default SelectSort;