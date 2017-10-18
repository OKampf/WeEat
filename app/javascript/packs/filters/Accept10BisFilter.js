import FilterBase from './FilterBase.js'

export default class Accept10BisFilter extends FilterBase {

    constructor() {
        super();

        this.filterType = RestaurantFilters.IS_10_BIS;
    }

    isEnabled(value) {
        return (value === true);
    }

    get defaultValue() {
        return false;
    }

    filter(restaurants, value) {
        if (this.isEnabled(value)) {
            restaurants = restaurants.filter((restaurant) => {
                return restaurant.accept_10bis;
            });
        }
        return restaurants;
    }
}