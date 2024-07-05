import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { HttpExceptionFilter } from './tratamento-erro/https-exception.filter';

async function bootstrap() {
  const app = await NestFactory.create(AppModule, { bodyParser: false });
  app.useGlobalFilters(new HttpExceptionFilter());
  app.enableCors();
  await app.listen(3001);
  console.info('Servidor Node pronto em http://localhost:3001');
}
bootstrap();