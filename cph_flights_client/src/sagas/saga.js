import { call, put, takeLatest } from 'redux-saga/effects';
import { LOAD_FLIGHT,
    LOAD_FLIGHT_SUCCEED,
    LOAD_FLIGHT_FAILED } from '../constant';

import { loadFlights } from '../apis/api';

function* getFlights (action) {
    const response = yield call(loadFlights, action);
    console.log("response: ", response);
    if(response.statusText === 'OK') {
        yield put({type: LOAD_FLIGHT_SUCCEED, flights: response.data});
    } else {
        yield put({type: LOAD_FLIGHT_FAILED, errors: response.errors});
    }
}

export const flightSaga = [
    takeLatest(LOAD_FLIGHT, getFlights),
];
