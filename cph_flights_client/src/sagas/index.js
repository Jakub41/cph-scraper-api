import { all } from 'redux-saga/effects';
import { flightSaga } from './saga';

export default function* rootSaga() {
    yield all([
        ...flightSaga,
    ]);
}