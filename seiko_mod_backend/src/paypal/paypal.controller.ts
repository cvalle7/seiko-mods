import { Body, Controller, Param, Post } from '@nestjs/common';
import { PaypalService } from './paypal.service';

@Controller('/api/paypal')
export class PaypalController {

    constructor(private readonly paypalService: PaypalService) { }

    @Post()
    async createOrder(@Body('amount') amount: string) {
        return this.paypalService.createOrder(amount);
    }

    @Post('/capture')
    async captureOrder(@Body('orderId') orderId: string) {
        return this.paypalService.captureOrder(orderId);
    }
}
