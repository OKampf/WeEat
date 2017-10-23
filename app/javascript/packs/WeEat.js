import React from 'react';
import {Header} from './Header.js'
import {Map} from './Map.js'
import RestaurantsSideBar from './RestaurantsSidebar.js'
import FiltersPanel from "./FiltersPanel";

export default class WeEat extends React.Component {

    constructor(props) {
        super(props);

        this.state = {
            cuisines: [],
            restaurants: [],
            filterCuisine: "",
            filterMinRating: 0,
            filterMaxDeliveryTime: ""
        };

        this.updateFilters = this.updateFilters.bind(this);
    }

    componentDidMount() {
        this.fetchCuisines();
        this.fetchRestaurants();
    }

    fetchRestaurants() {
        fetch("/restaurants.json")
            .then(restaurants => {
                return restaurants.json();
            })
            .then(restaurants => {
                this.setState({
                    restaurants: restaurants
                });
            });
    }

    fetchCuisines() {
        fetch("/cuisines.json")
            .then(cuisines => {
                return cuisines.json();
            })
            .then((cuisines) => {
                this.setState({
                    cuisines: cuisines
                });
            });
    }

    updateFilters(filterName, filterValue) {
        this.setState({[filterName]: filterValue});
    }

    render() {
        return (
            <div className="we-eat">

                <Header/>

                <FiltersPanel cuisines={this.state.cuisines} onFilterChange={this.updateFilters}/>

                <Map/>

                <RestaurantsSideBar
                    restaurants={this.state.restaurants}
                    filterCuisine={this.state.filterCuisine}
                    filterMinRating={this.state.filterMinRating}
                    filterMaxDeliveryTime={this.state.filterMaxDeliveryTime}
                />

            </div>
        );
    }
}