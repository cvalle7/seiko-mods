import { Injectable } from '@nestjs/common';
import * as nodemailer from 'nodemailer';
import { Subject } from 'rxjs';

@Injectable()
export class MailService {

    private transporter;

    constructor() {
        this.transporter = nodemailer.createTransport({
            service: 'gmail',
            auth: {
                user: process.env.MAIL,
                pass: process.env.MAIL_PASSWORD
            }
        })
    }

    async sendMail(to: string, subject: string, html: string) {
        const mailOptions = {
            from: process.env.MAIL,
            to,
            subject,
            html
        }
        try {
            const info = await this.transporter.sendMail(mailOptions);
        } catch (error) {
            console.error('Error al enviar el correo: ', error);
            throw new Error('Error al enviar el correo');
        }
    }
}
