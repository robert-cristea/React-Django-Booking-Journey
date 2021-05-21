import React from 'react'

const SelectSort = () => {
    return (
        <div className="d-flex align-items-center px-3 py-2">
            <label htmlFor="category" className="pr-4 filter-label">SORT BY</label>
            <select className="" id="category">
                <option value="match">Match</option>
                <option value="price">Price</option>
            </select>
        </div>
    )
}

export default SelectSort;