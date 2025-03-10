import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ClockTypeModule } from './clock_type/clock_type.module';
import { ClockType } from './clock_type/clock_type.entity';
import { WatchModule } from './watch/watch.module';
import { Watch } from './watch/watch.entity';

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
        entities: [ClockType, Watch],
        synchronize: true
      }),
    ClockTypeModule,
    WatchModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
