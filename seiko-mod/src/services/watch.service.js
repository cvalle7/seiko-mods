import axios from "axios";

const BACK_URL = process.env.VUE_APP_BACKEND_URL

const getWatch = async (id) => {
    try {
        const response = await axios.get(`${BACK_URL}/watch?id=${id}`);
        return response.data
    } catch (error) {
        throw new Error(error.message);
    }
}

export default {getWatch}