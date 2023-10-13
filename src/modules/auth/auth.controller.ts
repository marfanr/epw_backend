import { Controller, Post, Body, Get, UseGuards } from '@nestjs/common';
import { SignupDTO } from 'src/interfaces/signup_dto';
import { AuthService } from './auth.service';
import { ApiResponse } from 'src/interfaces/api_response_dto';
import { AuthGuard } from './auth.guard';

@Controller('auth')
@UseGuards(AuthGuard)
export class AuthController {
  constructor(public auth_: AuthService) {}
  @Post('signin')
  signin(
    @Body('username') username: string,
    @Body('password') password: string,
  ): string {
    return 'Ok';
  }

  @Post('signup')
  async signup (@Body() request_body: SignupDTO) {
    let is_exit = await this.auth_.is_exit(request_body.email);
    if (is_exit) return {status: 400, message: "Email sudah terdaftar", data: null}
    this.auth_.register(request_body)
    return {status: 200, message: "Berhasil mendaftar", data: null}    
  }

  @Get('status/:id')
  is_verify(@Body('id') id: number) {
  }
}
