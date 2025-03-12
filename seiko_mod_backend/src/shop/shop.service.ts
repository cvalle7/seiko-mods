import { Inject, Injectable } from '@nestjs/common';
import { MailService } from 'src/mail/mail.service';

@Injectable()
export class ShopService {

    constructor(private readonly mailService: MailService){}

    shopRegister(inputData: any, mailContent: string) {
        mailContent = mailContent.replace(/\n/g, '')
        this.mailService.sendMail(inputData.direcion.email, 'Compra realizada', mailContent);
    }
}
