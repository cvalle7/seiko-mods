import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Mail_config } from './mail_config.entity';
import { Repository } from 'typeorm';

@Injectable()
export class MailConfigService {

    constructor(
        @InjectRepository(Mail_config)
        private mailConfigRepository: Repository<Mail_config>
    ){}

    async getMailByName(name){
        try {
            const response = await this.mailConfigRepository.findOneBy({name: name});
            return response;
        } catch (error) {
            throw new Error(error.message)
        }
    }
}
