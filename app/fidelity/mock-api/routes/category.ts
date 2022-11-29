import { Router, Request, Response } from 'express';

import { ICategory } from '@fidelity/interfaces/category.interface';

const categoryRouter: Router = Router();

categoryRouter.get('/company/:companyId/category', (request: Request, response: Response) => {
  console.log('[mock] getting categories...');

  const companyId = parseInt(request.params.companyId, 10);

  const categories: ICategory[] = [
    {
      id: 1,
      companyId,
      name: 'Food',
    },
    {
      id: 2,
      companyId,
      name: 'Service',
    },
  ];

  return response.status(200).json(categories);
});

export default categoryRouter;
