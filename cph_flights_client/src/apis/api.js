import axios from 'axios';

const api = axios.create({
    baseURL: 'http://localhost:3001/api/v1',
});

export const loadFlights = async (action) => {
    const { type, params } = action.payload;
    console.log(action.payload);
    const response = await api.get(`/flights/${type}`, {params});
    return response;
};