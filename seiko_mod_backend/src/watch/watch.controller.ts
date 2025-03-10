import { Controller, Get, Query } from '@nestjs/common';
import { WatchService } from './watch.service';

@Controller('/api/watch')
export class WatchController {

    constructor(
        private readonly watchService: WatchService){}

    @Get()
    async getWatchById(@Query("id") id: number){
        try {
            return this.watchService.getWatchById(id);
        } catch (error) {
            throw new Error(error.message)
        }
    }
}
