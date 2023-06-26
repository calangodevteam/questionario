import axios from 'axios';
import { Aluno } from '../@types/aluno';
const baseUrl = 'http://localhost:8080';

const axiosInstance = axios.create({ baseURL: baseUrl });

export const findAlunoByEmail = async (email:string) => {
    const response = await axiosInstance.get(`/aluno?email=${email}`);
    return response.data as Aluno;
};
