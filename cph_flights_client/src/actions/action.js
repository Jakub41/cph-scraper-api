import { LOAD_FLIGHT, SHOW_LOADER, HIDE_LOADER } from '../constant';

export function loadFlights(payload) {
    return {
        type: LOAD_FLIGHT,
        payload
    }
}

export function showLoading() {
    return {
        type: SHOW_LOADER
    }
}

export function hideLoading() {
    return {
        type: HIDE_LOADER
    }
}