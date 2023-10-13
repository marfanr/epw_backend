import { Body, Controller, Post } from '@nestjs/common';
import { InjectionDTO } from 'src/interfaces/injection_dto';
import { PrismaService } from '../prisma/prisma.service';
import { InjectionService } from './injection.service';

@Controller('injection')
export class InjectionController {
  constructor(private service: InjectionService) {}
  @Post('register')
  async register(@Body() body: InjectionDTO) {
    if (await this.service.is_team_exit(body.nama_tim))
      return { status: 400, message: 'Team already exist', data: null };
    this.service
      .register_team(body)
      .then((e) => {
        if (!e) return { status: 200, message: 'Register failed', data: null };
      })
      .catch((e) => {
        return { status: 500, message: 'Internal Server Error', data: null };
      });

    return { status: 200, message: 'Ok', data: null };
  }
}
