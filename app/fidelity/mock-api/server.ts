import express, { json, Request, Response } from 'express';
import cors from 'cors';

import authRouter from './routes/auth';
import personRouter from './routes/person';
import productRouter from './routes/product';
import categoryRouter from './routes/category';

const port = 3333;
const app: express.Application = express();

app.use(cors());
app.use(json());
app.use(authRouter);
app.use(personRouter);
app.use(productRouter);
app.use(categoryRouter);

app.get('/', (request: Request, response: Response) => {
  response.status(200).send('Mock API');
});

app.listen(3333, () => {
  console.log(`[mock] server started at http://localhost:${port}`);
});
