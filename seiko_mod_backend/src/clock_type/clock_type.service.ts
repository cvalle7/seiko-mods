import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ClockType } from './clock_type.entity';
import { Repository } from 'typeorm';

@Injectable()
export class ClockTypeService {

    constructor(
        @InjectRepository(ClockType)
        private clockRepository: Repository<ClockType>
    ){}

    async getClocks(){
        try {
            const clocks = await this.clockRepository.find({
                order: {
                    created_at: 'ASC'
                }
            })
            return clocks;
        } catch (error) {
            throw new Error(error.message)
        }
    }

}
