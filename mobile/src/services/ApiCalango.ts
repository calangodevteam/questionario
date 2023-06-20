import axios from 'axios';
const baseUrl = 'http://localhost:8080';

const axiosInstance = axios.create({ baseURL: baseUrl });

export const listar = async () => {
    const response = await axiosInstance.get('/produto');
    return response.data;
}
