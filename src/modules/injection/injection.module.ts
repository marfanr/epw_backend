import { Module } from '@nestjs/common';
import { InjectionController } from './injection.controller';
import { InjectionService } from './injection.service';
import { PrismaModule } from '../prisma/prisma.module';

@Module({
  controllers: [InjectionController],
  providers: [InjectionService],
  imports: [PrismaModule],
})
export class InjectionModule {}
