import { Controller, Get } from '@nestjs/common';
import { ClockTypeService } from './clock_type.service';

@Controller('clock-type')
export class ClockTypeController {

    constructor(private readonly clockTypeService: ClockTypeService){}

    @Get()
    async getClock(){
        return await this.clockTypeService.getClocks();
    }
}
