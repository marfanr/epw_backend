import { IsEmail, IsJSON, IsNotEmpty, IsNumber, IsString } from "class-validator";

export class AnggotaInjectionDTO {
    @IsString()
    nama_lengkap: string;
    @IsEmail()
    email: string;
    nomor_telepon: string;
    nim: string;    
}

export class InjectionDTO {
    @IsString()
    nama_tim: string;
    @IsString()
    asal_sekolah: string;    
    type: number;
    @IsString()
    nama_pembimbing: string;
    @IsString()
    no_telp_pembimbing: string;
    @IsString()
    link_berkas_bukti: string;
    @IsString()
    link_berkas_abstrak: string;
    @IsString()
    @IsJSON()
    anggota: string;
}