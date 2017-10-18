import React from 'react'
import RestaurantCard from './RestaurantCard.jsx'

export default class RestaurantsSideBar extends React.Component {

    constructor(props) {
        super(props)

        this.filterByCuisine = this.filterByCuisine.bind(this);
        this.filterByRating = this.filterByRating.bind(this);
        this.filterByDeliveryTime = this.filterByDeliveryTime.bind(this);
    }

    filterByCuisine(restaurant) {
        if (this.props.filterCuisine == "") {
            return true;
        }
        return restaurant.cuisine.name == this.props.filterCuisine;
    }

    filterByRating(restaurant) {
        if (this.props.filterMinRating == "") {
            return true;
        }
        return restaurant.rating >= this.props.filterMinRating;
    }

    filterByDeliveryTime(restaurant) {
        if (this.props.filterMaxDeliveryTime == "") {
            return true;
        }
        return restaurant.max_delivery_time <= this.props.filterMaxDeliveryTime;
    }

    render() {

        const filteredRestaurants = this.props.restaurants
            .filter(this.filterByCuisine)
            .filter(this.filterByRating)
            .filter(this.filterByDeliveryTime);

        const restaurantsList = filteredRestaurants.map((restaurant) => {
            return (
                <div key={restaurant.id}>
                    <RestaurantCard restaurant={restaurant}/>
                </div>
            );
        });

        return (
            <div>
                {restaurantsList}
            </div>
        );
    }
}