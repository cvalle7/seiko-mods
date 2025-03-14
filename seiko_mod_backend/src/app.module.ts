import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ClockTypeModule } from './clock_type/clock_type.module';
import { ClockType } from './clock_type/clock_type.entity';
import { WatchModule } from './watch/watch.module';
import { Watch } from './watch/watch.entity';
import { ShopModule } from './shop/shop.module';
import { MailService } from './mail/mail.service';
import { MailModule } from './mail/mail.module';
import { PaypalModule } from './paypal/paypal.module';
import { Purchase } from './shop/purchase.entity';
import { Purchase_watch } from './shop/purchase_watch.entity';
import { MailConfigModule } from './mail_config/mail_config.module';
import { Mail_config } from './mail_config/mail_config.entity';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      envFilePath: '.env'
    }),
    TypeOrmModule.forRoot({
        type: 'postgres',
        host: process.env.BD_HOST,
        port: parseInt(process.env.BD_PORT),
        username: process.env.BD_USERNAME,
        password: process.env.BD_PASSWORD,
        database: process.env.BD_DATABASE,
        entities: [ClockType, Watch, Purchase, Purchase_watch, Mail_config],
        synchronize: false
      }),
    ClockTypeModule,
    WatchModule,
    ShopModule,
    MailModule,
    PaypalModule,
    MailConfigModule],
  controllers: [],
  providers: [MailService],
})
export class AppModule {}
