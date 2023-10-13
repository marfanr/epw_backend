import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { SignupDTO } from 'src/interfaces/signup_dto';
import { sha512 } from 'sha512-crypt-ts';
import { QueueService } from '../queue/queue.service';

@Injectable()
export class AuthService {
  constructor(private prisma: PrismaService, private queue: QueueService) {}
  async register(body: SignupDTO) {
    console.log('Register start...');
    setTimeout(() => {
      this.prisma.user
        .create({
          data: {
            email: body.email,
            namalengkap: body.nama_lengkap,
            password: sha512.crypt(body.password, 'epwEPWepw'),
          },
        })
        .then((u) => {
          this.send_verification(u.id);
        });
    }, 10);
    console.log('Register end...');
  }
  async send_verification(id: number) {
    console.log('Send verification start...');
    this.queue.add_job(
      async (e: { prisma: PrismaService; id: number }) => {
        await e.prisma.verifikasi.create({
          data: {
            user_id: e.id,
            status: false,
          },
        });
      },
      {
        prisma: this.prisma,
        id: id,
      },
    );
    console.log('Send verification end...');
  }
  async is_exit(email: string): Promise<boolean> {
    return await this.prisma.user
      .findUnique({
        where: {
          email: email,
        },
      })
      .then((user) => {
        if (user) {
          return true;
        }
        return false;
      });
  }
}
