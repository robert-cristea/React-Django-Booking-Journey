import React, { useState, useEffect } from 'react';
import './SelectSort.css'
const SelectSort = () => {

  const [selectedOption, setSelectedOption] = useState("Match");
  const handleChange = (value) => {
    setSelectedOption(value);
  };

  return (
    <div className="d-flex align-items-center px-3 py-2">
      <label htmlFor="category" className="pr-4 filter-label">SORT BY</label>
      <div class="selectsort dropdown">
        <button class="btn bg-white dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          {selectedOption}<i class="fa fa-chevron-down ml-2" style={{fontSize:10, fontWeight:100}}></i>
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <a class="dropdown-item" onClick={() => handleChange('Match')} style={{borderBottom:"1px solid lightgray"}}>Match</a>
          <a class="dropdown-item" onClick={() => handleChange('Price')}>Price</a>
        </div>
      </div>
    </div>
  )
}

export default SelectSort;