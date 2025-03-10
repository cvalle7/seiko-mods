import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Watch } from './watch.entity';

@Injectable()
export class WatchService {


    constructor(
        @InjectRepository(Watch)
        private watchRepository: Repository<Watch>
    ) { }

    async getWatchById(id: number) {
        try {
            const watch = this.watchRepository.findOneBy({ id })
            if (!watch) {
                throw new Error('Watch not found');
            }
            return watch;
        } catch (error) {
            throw new Error(error.message)
        }
    }
}
