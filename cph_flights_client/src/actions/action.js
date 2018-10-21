import { LOAD_FLIGHT } from '../constant';

export function loadFlights(payload) {
    return {
        type: LOAD_FLIGHT,
        payload
    }
}