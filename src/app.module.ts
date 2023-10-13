import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule} from './modules/auth/auth.module';
import { CacheModule } from '@nestjs/cache-manager';
import { InjectionModule } from './modules/injection/injection.module';
import { ThrottlerModule } from '@nestjs/throttler';
import { JwtModule } from '@nestjs/jwt';

@Module({
  imports: [
    AuthModule, 
    CacheModule.register(),
    InjectionModule,
    ThrottlerModule.forRoot([{
      ttl: 1000,
      limit: 100,
    }]),
    JwtModule.register({
      global: true,
      secret: "EPWTahunDepanUndangJKT#48",
      signOptions: { expiresIn: '60m', algorithm: 'ES512' },
    }),

  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
