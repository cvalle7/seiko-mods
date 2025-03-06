import { Test, TestingModule } from '@nestjs/testing';
import { ClockTypeService } from './clock_type.service';

describe('ClockTypeService', () => {
  let service: ClockTypeService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [ClockTypeService],
    }).compile();

    service = module.get<ClockTypeService>(ClockTypeService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
