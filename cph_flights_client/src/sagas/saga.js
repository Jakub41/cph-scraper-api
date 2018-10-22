import { call, put, takeLatest } from 'redux-saga/effects';
import { LOAD_FLIGHT,
    LOAD_FLIGHT_SUCCEED,
    LOAD_FLIGHT_FAILED,
    SHOW_LOADER,
    HIDE_LOADER
} from '../constant';

import { loadFlights } from '../apis/api';

function* getFlights (action) {

    yield put({ type: SHOW_LOADER });

    const response = yield call(loadFlights, action);
    console.log("response: ", response);
    if(response.statusText === 'OK') {
        yield put({type: LOAD_FLIGHT_SUCCEED, flights: response.data});
    } else {
        yield put({type: LOAD_FLIGHT_FAILED, errors: response.errors});
    }
    yield put({ type: HIDE_LOADER });
}

export const flightSaga = [
    takeLatest(LOAD_FLIGHT, getFlights),
];
