import { Injectable } from '@nestjs/common';
import * as paypal from '@paypal/checkout-server-sdk';

@Injectable()
export class PaypalService {
    private client: paypal.core.PayPalHttpClient;

    constructor() {
        const { SandboxEnvironment, PayPalHttpClient } = paypal.core;

        const environment = new SandboxEnvironment(
            process.env.PAYPAL_CLIENT_ID,
            process.env.PAYPAL_CLIENT_SECRET
        );

        this.client = new PayPalHttpClient(environment);
    }

    async createOrder(amount: string) {
        const request = new paypal.orders.OrdersCreateRequest();

        request.requestBody({
            intent: 'CAPTURE',
            purchase_units: [
                {
                    amount: { currency_code: 'EUR', value: amount },
                    payee: { email_address: process.env.PAYPAL_BUSINESS_EMAIL },
                }
            ]
        });

        const response = await this.client.execute(request);
        return response.result;
    }

    async captureOrder(orderId: string) {
        const request = new paypal.orders.OrdersCaptureRequest(orderId);
        request.requestBody({});
        const response = await this.client.execute(request);
        return response.result;
    }
}