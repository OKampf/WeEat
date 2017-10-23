import React from 'react'

export default class FiltersPanel extends React.Component{

    constructor(props){
        super(props);

        this.state = {
            filterCuisine: "",
            filterMinRating: 0,
            filterMaxDeliveryTime: "",
        }
    }

    handleChange(e){
        this.setState({[e.target.name]: e.target.value});

        this.props.onFilterChange(e.target.name, e.target.value);
    }

    render(){
        const cuisineOptions = this.props.cuisines.map((cuisine) => {
            return(
                <option key={cuisine.id} value={cuisine.name}>{cuisine.name}</option>
            );
        });

        return (
        <div className="filters-panel">

            <label className="filter">
                Cuisine Filter:
                <select name="filterCuisine" onChange={(e) => this.handleChange(e)}>
                    <option value=""></option>
                    {cuisineOptions}
                </select>
            </label>

            <label className="filter">
                Rating Filter:
                <input type="range" name="filterMinRating"
                       min="0" max="3"
                       value={this.state.filterMinRating} onChange={(e) => this.handleChange(e)}/>
                <span>({this.state.filterMinRating})</span>
            </label>

            <label className="filter">
                Delivery Time Filter:
                <input type="text" name="filterMaxDeliveryTime"
                       value={this.state.filterMaxDeliveryTime} onChange={(e) => this.handleChange(e)}/>
            </label>

        </div>
        );
    }
}