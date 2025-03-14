import { Test, TestingModule } from '@nestjs/testing';
import { MailConfigController } from './mail_config.controller';

describe('MailConfigController', () => {
  let controller: MailConfigController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [MailConfigController],
    }).compile();

    controller = module.get<MailConfigController>(MailConfigController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
