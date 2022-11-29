import { Router, Request, Response } from 'express';

const personRouter: Router = Router();

personRouter.get('/person', (request: Request, response: Response) => {
  console.log('[mock] getting persons...');

  const persons = [
    {
      id: '1',
      name: 'John Doe',
      email: 'john@doe.com'
    },
    {
      id: '2',
      name: 'Mary Smith',
      email: 'mary@smith.com'
    },
  ];

  return response.status(200).json(persons);
});

export default personRouter;
