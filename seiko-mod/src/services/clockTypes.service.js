import axios from "axios";

const BACK_URL = process.env.VUE_APP_BACKEND_URL

const getClockTypes = async () => {
    try {
        const response = await axios.get(`${BACK_URL}/clock-type`);
        return response.data
    } catch (error) {
        throw new Error(error.message);
    }
}

export default {getClockTypes}