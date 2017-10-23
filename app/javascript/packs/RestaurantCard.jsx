import React from 'react'
import {cuisineFontMapper} from './cuisineFontMapper'
import StarsPanel from './StarsPanel'


export default class RestaurantCard extends React.Component {

    constructor(props) {
        super(props);
    }

    render() {
        const restaurant = this.props.restaurant;
        return (
            <div className='restaurant-card'>

                <div className='row'>
                    <span className='cuisine-font'>{cuisineFontMapper[restaurant.cuisine.name]}</span>
                    <span className='restaurant-name'>{restaurant.name}</span>
                    <span><StarsPanel numTotal={3} numGolden={Math.floor(restaurant.rating)}/></span>
                </div>

                <div className='row'>
                    <span className='address'>{restaurant.address}</span>
                </div>

                <div className='row'>
                    <span class="max-delivery-time">Max Delivery Time: {restaurant.max_delivery_time} Minutes</span>

                    {restaurant.accept_10bis && (
                        <span><img className="icon-10bis"/></span>
                    )}
                </div>
            </div>
        );
    }
}