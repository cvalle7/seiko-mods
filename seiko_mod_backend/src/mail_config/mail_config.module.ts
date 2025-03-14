import { Module } from '@nestjs/common';
import { MailConfigService } from './mail_config.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Mail_config } from './mail_config.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Mail_config])],
  providers: [MailConfigService],
  exports: [MailConfigService]
})
export class MailConfigModule {}
