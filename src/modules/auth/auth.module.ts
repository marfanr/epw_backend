import { Module } from '@nestjs/common';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';
import { PrismaModule } from '../prisma/prisma.module';
import { QueueModule } from '../queue/queue.module';

@Module({
  controllers: [AuthController],
  providers: [AuthService],
  imports: [PrismaModule, QueueModule]
})
export class AuthModule {}
