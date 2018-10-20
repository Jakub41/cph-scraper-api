import axios from 'axios';

const api = axios.create({
    baseURL: 'http://localhost:3001/api/v1',
});

export const loadFlights = async (action) => {
    const params = {type: action.filter};
    const response = await api.get('/flights', {params});
    return response;
};