import axios from "axios";

const BACK_URL = process.env.VUE_APP_BACKEND_URL

const sendData = async (payObject, mailContent) => {
    try {
        const response = await axios.post(`${BACK_URL}/shop`, {
            'inputData': payObject,
            'mailContent': mailContent
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

const setItems = (watchList, payObject) => {

    let htmlItem = ``;
    for (let w of watchList) {
        const find = payObject.payment.watchs.find(item => item.id === w.id);
        if (find) {
            htmlItem += `
            <div class="shop-container">
                <img src="${w.background_image}" alt="${w.name}">
                <div class="text-box">
                    <p class="tittle">${w.name}</p>
                    <p>${w.price}€</p>
                </div>
                <p class="amount">${find.amount}</p>
            </div>`

        }
    }
    return htmlItem;
}

const generateMailContent = (watchList, payObject) => {

    console.log(watchList)
    console.log(payObject)

    let htmlItem = setItems(watchList, payObject);


    let htmlContent = `
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Confirmación del pedido</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color:rgb(163, 163, 163);
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                padding: 20px;
            }
            .container {
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 70%;
                max-width: 600px;
                margin-bottom: 10px;
            }
            h2 {
                font-size: 1.5rem;
                font-weight: bold;
                text-align: center;
            }
            .shop-card-main-container {
                display: flex;
                justify-content: center;
                align-items: flex-start;
                flex-direction: column;
                width: 100%;
            }
            .shop-container {
                display: flex;
                flex-direction: row;
                justify-content: space-between;
                width: 100%;
                margin-bottom: 10px;
            }
            .shop-container img {
                width: 20vh;
                object-fit: contain;
            }
            .text-box {
                display: flex;
                width: 20vh;
                flex-direction: column;
                justify-content: center;
                align-items: flex-start;
                margin-left: 10%;
            }
            .tittle {
                font-weight: 600;
            }
            .amount {
                display: flex;
                justify-content: center;
                align-items: center;
                width: 10vh;
                font-weight: 600;
            }
        </style>
    </head>
    <body>
        <h2>Confirmación del pedido</h2>

        <div class="container">
            <h3>Productos</h3>
            <div class="shop-card-main-container">
                ${htmlItem}
            </div>
        </div>

        <div class="container">
            <h3>Dirección de entrega</h3>
            <p>${payObject.direcion.nombre}   ${payObject.direcion.apellidos}  , ${payObject.direcion.telefono}  </p>
            <p>${payObject.direcion.direcion}</p>
            <p>${payObject.direcion.ciudad},  ${payObject.direcion.localidad}  , ${payObject.direcion.cp}</p>
        </div>

        <div class="container">
            <h3>Resumen</h3>
            <p>Total: <strong>${payObject.payment.pay}€</strong></p>
        </div>
    </body>
    </html>
`

    return htmlContent
}

export default { generateMailContent, sendData }