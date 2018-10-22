import {
    LOAD_FLIGHT_SUCCEED,
    LOAD_FLIGHT_FAILED,
    SHOW_LOADER,
    HIDE_LOADER,
} from '../constant';
import moment from 'moment';

const initialState = {
    flights: [],
    error: false,
    isLoading: false,
    lastUpdatedDate: moment()
};

export default function(state = initialState, action) {
    switch(action.type) {
        case LOAD_FLIGHT_SUCCEED:
            return {
                ...state,
                error: false,
                flights: action.flights,
                lastUpdatedDate: moment()
            };
        case LOAD_FLIGHT_FAILED:
            return {
                ...state,
                error: true
            };
        case SHOW_LOADER:
            return {
                ...state,
                isLoading: true
            };
        case HIDE_LOADER:
            return {
                ...state,
                isLoading: false
            };
        default:
            return state;
    }
}