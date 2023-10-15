import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import {
  AnggotaInjectionDTO,
  InjectionDTO,
} from 'src/interfaces/injection_dto';

@Injectable()
export class InjectionService {
  constructor(private prisma: PrismaService) {}
  async register_team(body: InjectionDTO) {
    let body_ = [];
    let anggota: { anggota: AnggotaInjectionDTO[] } = JSON.parse(body.anggota);    

    for (let i = 0; i < anggota.anggota.length; i++) {
      body_.push({
        email: anggota.anggota[i].email,
        nim: anggota.anggota[i].nim,
        nama_lengkap: anggota.anggota[i].nama_lengkap,
        nomor_telepon: anggota.anggota[i].nomor_telepon,       
      });
    }
    this.prisma.injection.create({
      data: {
        asal_sekolah: body.asal_sekolah,
        link_berkas_bukti: body.link_berkas_bukti,
        link_berkas_abstrak: body.link_berkas_abstrak,
        nama_tim: body.nama_tim,
        nama_pembimbing: body.nama_pembimbing,
        no_telp_pembimbing: body.no_telp_pembimbing,
        AnggotaTimInjection: {
          create: body_,
        },
        team_type: {
          connectOrCreate: {
            where: {
              name: body.type == 1 ? 'Mahasiswa' : body.type == 2 ? 'SMA' : '',
            },
            create: {
              name: body.type == 1 ? 'Mahasiswa' : body.type == 2 ? 'SMA' : '',
            },
          },
        },
      },
    }).catch((e) => {      
      // console.log(e)
    }).then((v) => {
      if (!v) return false;
    })
    return true
  }

  async is_team_exit(name:string) {
    let f = await this.prisma.injection.findFirst({
      where: {
        nama_tim: name,
      },
    });
    return f    
  }
}
