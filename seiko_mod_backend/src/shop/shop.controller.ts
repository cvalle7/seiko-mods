import { Body, Controller, Post } from '@nestjs/common';
import { ShopService } from './shop.service';

@Controller('/api/shop')
export class ShopController {

    constructor(private readonly shopService: ShopService){}

    @Post()
    shopRegister(@Body() data: {inputData: any,  mailContent: any}){
        const {inputData, mailContent} = data;
        this.shopService.shopRegister(inputData, mailContent)
        return true;
    }
}
