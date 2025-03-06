import { Test, TestingModule } from '@nestjs/testing';
import { ClockTypeController } from './clock_type.controller';

describe('ClockTypeController', () => {
  let controller: ClockTypeController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [ClockTypeController],
    }).compile();

    controller = module.get<ClockTypeController>(ClockTypeController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
