export default class FilterBase {

    constructor() {
        this.filterType = null;
    }

    isEnabled(value) {
        return value !== null;
    }

    get defaultValue() {
        return null;
    }

    getFilterType() {
        return this.filterType;
    }

    filter(set) {
        return set;
    }
}