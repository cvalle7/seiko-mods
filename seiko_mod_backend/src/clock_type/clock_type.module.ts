import { Module } from '@nestjs/common';
import { ClockTypeService } from './clock_type.service';
import { ClockTypeController } from './clock_type.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ClockType } from './clock_type.entity';

@Module({
  imports: [ TypeOrmModule.forFeature([ClockType])],
  providers: [ClockTypeService],
  controllers: [ClockTypeController]
})
export class ClockTypeModule {}
