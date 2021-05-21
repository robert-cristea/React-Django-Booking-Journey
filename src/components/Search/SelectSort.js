import React from 'react'

const SelectSort = () => {
    return (
        <div className="d-flex align-items-center">
            <label htmlFor="category" className="pr-4 filter-label">SORT BY</label>
            <select className="d-flex justify-content-between px-2 py-2" id="category" style={{width: "80px", borderRadius: "5px", border: "1px solid black"}}>
                <option value="value" style={{textAlign: "center"}}>Value</option>
                <option value="price">Price</option>
            </select>
        </div>
    )
}

export default SelectSort;