import { Router, Request, Response } from 'express';
import multer, { Multer } from 'multer';

import { IProduct } from '@fidelity/interfaces/product.interface';

const productRouter: Router = Router();
const uploader: Multer = multer({ dest: '../uploads/product' });

productRouter.get('/company/:companyId/product', (request: Request, response: Response) => {
  console.log('[mock] getting products...');

  const companyId = parseInt(request.params.companyId, 10);

  const products: IProduct[] = [
    {
      id: 1,
      companyId,
      category: {
        id: 1,
        companyId,
        name: 'Food'
      },
      fidelities: null,
      name: 'X-Burguer',
      value: 20,
      photo: null,
      description: null,
      active: true
    },
    {
      id: 2,
      companyId,
      category: {
        id: 1,
        companyId,
        name: 'Food'
      },
      fidelities: null,
      name: 'Hot Dog',
      value: 8.50,
      photo: null,
      description: null,
      active: false
    },
    {
      id: 3,
      companyId,
      category: {
        id: 2,
        companyId,
        name: 'Service'
      },
      fidelities: null,
      name: 'Hair Cut',
      value: 3500.00,
      photo: null,
      description: null,
      active: true
    },
  ];

  return response.status(200).json(products);
});

productRouter.get('/company/:companyId/product/:productId', (request: Request, response: Response) => {
  console.log('[mock] getting product...');

  const companyId = parseInt(request.params.companyId, 10);
  const productId = parseInt(request.params.productId, 10);

  const products: IProduct[] = [
    {
      id: 1,
      companyId,
      category: {
        id: 1,
        companyId,
        name: 'Food'
      },
      fidelities: null,
      name: 'X-Burguer',
      value: 20,
      photo: null,
      description: null,
      active: true
    },
    {
      id: 2,
      companyId,
      category: {
        id: 1,
        companyId,
        name: 'Food'
      },
      fidelities: null,
      name: 'Hot Dog',
      value: 8.50,
      photo: null,
      description: null,
      active: false
    },
    {
      id: 3,
      companyId,
      category: {
        id: 2,
        companyId,
        name: 'Service'
      },
      fidelities: null,
      name: 'Hair Cut',
      value: 3500.00,
      photo: '../../../assets/user/avatar.png',
      description: 'By Edward',
      active: true
    },
  ];

  const filtered: IProduct[] = products.filter((product: IProduct) => product.id === productId);

  return response.status(200).json(filtered[0]);
});

productRouter.put('/company/:companyId/product/:productId', (request: Request, response: Response) => {
  console.log('[mock] updating product...');

  if (request.body.product) {
    return response.status(204).send();
  }

  return response.status(400).send();
});

productRouter.post('/company/:companyId/product/new', (request: Request, response: Response) => {
  console.log('[mock] creating product...');

  if (request.body.product) {
    return response.status(201).json({ id: 4 });
  }

  return response.status(400).send();
});

productRouter.post('/company/:companyId/product/upload', uploader.any(), (request: Request, response: Response) => {
  console.log('[mock] uploading product photo...');

  if (request.files[0]) {
    return response.status(201).send();
  }

  return response.status(400).send();
});

export default productRouter;
