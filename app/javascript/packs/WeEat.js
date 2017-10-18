import React from 'react';
import { Header } from './Header.js'
import RestaurantsSideBar from './restaurants_sidebar.jsx'
import FiltersPanel from "./FiltersPanel";

export default class WeEat extends React.Component {

    constructor(props) {
        super(props);

        this.state = {
            cuisines: [],
            restaurants: [],
            filterCuisine: "",
            filterMinRating: 0,
            filterMaxDeliveryTime: 240
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

    updateFilters(filterName, filterValue)
    {
        this.setState({[filterName]: filterValue});
    }

    render() {
        return (
            <div className="we-eat">

                <header className="header">
                    <Header/>
                </header>

                <div className="middle">

                    <div>
                        <FiltersPanel cuisines={this.state.cuisines} onFilterChange={this.updateFilters}/>
                    </div>

                    <div className="restaurants-sidebar">
                        <RestaurantsSideBar
                            restaurants={this.state.restaurants}
                            filterCuisine={this.state.filterCuisine}
                            filterMinRating={this.state.filterMinRating}
                            filterMaxDeliveryTime={this.state.filterMaxDeliveryTime}
                        />
                    </div>

                </div>

                <footer className="footer">

                </footer>

            </div>
        );
    }
}