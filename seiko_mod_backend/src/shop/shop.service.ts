import { Injectable } from '@nestjs/common';
import { MailService } from 'src/mail/mail.service';
import { WatchService } from 'src/watch/watch.service';
import { Purchase } from './purchase.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Purchase_watch } from './purchase_watch.entity';
import { MailConfigService } from 'src/mail_config/mail_config.service';

@Injectable()
export class ShopService {

    constructor(
        @InjectRepository(Purchase)
        private purchaseRepository: Repository<Purchase>,
        @InjectRepository(Purchase_watch)
        private purchase_watchRepository: Repository<Purchase_watch>,
        private readonly mailService: MailService,
        private readonly watchService: WatchService,
        private readonly mailConfigService: MailConfigService
    ) { }

    async shopRegister(inputData: any) {
        let watches = inputData.payment.watchs
        let watchList = await this.getwatches(watches);
        await this.createPurchase(inputData, watchList);
        let mailContent = await this.generateMailContent(watchList, inputData);
        this.mailService.sendMail(inputData.direcion.email, 'Compra realizada', mailContent);
    }

    async getwatches(watchesList: any[]) {
        let wList = []
        for (let w of watchesList) {
            let watch = await this.watchService.getWatchById(w.id);
            wList.push({ watch: watch, amount: w.amount });
        }
        return wList
    }

    async createPurchase(inputData: any, watchList) {
        const purchase = this.purchaseRepository.create({ mail: inputData.direcion.email, total: inputData.payment.pay });
        await this.purchaseRepository.save(purchase)

        const purchaseWatches = watchList.map(w => {
            const pWatch = new Purchase_watch();
            pWatch.purchase_id = purchase.id
            pWatch.watch_id = w.watch.id
            pWatch.amount = w.amount
            return pWatch;
        })

        await Promise.all(purchaseWatches.map(pw => this.purchase_watchRepository.save(pw)));
        return purchase;
    }

    async setItems(watchList, payObject) {

        let htmlItem = ``;
        let item = await this.mailConfigService.getMailByName('watch-item');
        for (let w of watchList) {
            const find = payObject.payment.watchs.find(item => item.id === w.watch.id);
            if (find) {
                let i = item.content;
                i = i
                    .replaceAll('${w.name}', w.watch.name)
                    .replace('${w.background_image}', w.watch.background_image)
                    .replace('${w.price}', w.watch.price)
                    .replace('${find.amount}', find.amount);
                htmlItem += i;
            }
        }
        return htmlItem;
    }

    async generateMailContent(watchList, payObject) {

        let htmlItem = await this.setItems(watchList, payObject);
        let htmlContent = await this.mailConfigService.getMailByName('purchase-content');

        let html = htmlContent.content;

        html = html
            .replace('${htmlItem}', htmlItem)
            .replace('${payObject.direcion.nombre}', payObject.direcion.nombre)
            .replace('${payObject.direcion.apellidos}', payObject.direcion.apellidos)
            .replace('${payObject.direcion.telefono}', payObject.direcion.telefono)
            .replace('${payObject.direcion.direcion}', payObject.direcion.direcion)
            .replace('${payObject.direcion.ciudad}', payObject.direcion.ciudad)
            .replace('${payObject.direcion.localidad}', payObject.direcion.localidad)
            .replace('${payObject.direcion.cp}', payObject.direcion.cp)
            .replace('${payObject.payment.pay}', payObject.payment.pay);

        return html
    }
}
