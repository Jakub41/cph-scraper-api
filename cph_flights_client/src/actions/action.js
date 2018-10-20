import { LOAD_FLIGHT } from '../constant';

export function loadFlights(filter) {
    return {
        type: LOAD_FLIGHT,
        filter
    }
}