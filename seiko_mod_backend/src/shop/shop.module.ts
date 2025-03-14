import { Module } from '@nestjs/common';
import { ShopService } from './shop.service';
import { ShopController } from './shop.controller';
import { MailModule } from 'src/mail/mail.module';
import { WatchModule } from 'src/watch/watch.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Purchase } from './purchase.entity';
import { Purchase_watch } from './purchase_watch.entity';
import { MailConfigModule } from 'src/mail_config/mail_config.module';

@Module({
  imports: [MailModule, WatchModule, MailConfigModule, TypeOrmModule.forFeature([Purchase, Purchase_watch])],
  providers: [ShopService],
  controllers: [ShopController]
})
export class ShopModule {}
