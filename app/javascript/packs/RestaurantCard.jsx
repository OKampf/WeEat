import React from 'react'
import { cuisineFontMapper } from './cuisineFontMapper'
import StarsPanel from './stars_panel'


export default class RestaurantCard extends React.Component {

    constructor(props) {
        super(props);
    }

    render() {
        const restaurant = this.props.restaurant;
        return (
            <div className="restaurant-card">

                <div>
                    <p className='cuisine-font'>{cuisineFontMapper[restaurant.cuisine.name]}</p>
                    <p className='restaurant-name'>{restaurant.name}</p>
                </div>

                <p>{restaurant.address}</p>
                <StarsPanel numTotal={3} numGolden={Math.floor(restaurant.rating)}/>
                { restaurant.accept_10bis && (
                    <img className="icon-10bis"/>
                ) }
                <p>{restaurant.rating}</p>
                <p>Max Delivery Time: {restaurant.max_delivery_time} Minutes</p>
            </div>
        );
    }
}