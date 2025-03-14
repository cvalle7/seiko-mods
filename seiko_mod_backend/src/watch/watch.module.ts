import { Module } from '@nestjs/common';
import { WatchService } from './watch.service';
import { WatchController } from './watch.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Watch } from './watch.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Watch])],
  providers: [WatchService],
  controllers: [WatchController],
  exports: [WatchService]
})
export class WatchModule {}
