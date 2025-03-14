import axios from "axios";

const BACK_URL = process.env.VUE_APP_BACKEND_URL

const sendData = async (payObject) => {
    try {
        const response = await axios.post(`${BACK_URL}/shop`, {
            'inputData': payObject
        }, {
            headers: {
                'content-type': 'application/json'
            }
        });
        return response.data;
    } catch (error) {
        throw new Error(error.message)
    }
}

export default { sendData }