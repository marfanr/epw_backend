import { Contains, IsEmail, IsNotEmpty, IsString, MinLength } from "class-validator";

export class SignupDTO {
    @IsEmail()
    email: string;
    @IsString()
    nama_lengkap: string;
    @IsNotEmpty()
    @MinLength(8)    
    password: string;
}  