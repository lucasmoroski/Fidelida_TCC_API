import { Router, Request, Response } from 'express';

import { IUser } from '@fidelity/interfaces/user.interface';

const authRouter: Router = Router();

authRouter.post('/auth', (request: Request, response: Response) => {
  console.log('[mock] authenticating...');

  if (request.body.username === 'david') {
    const data: IUser = {
      id: 1,
      name: 'David Cabral',
      photo: '../../../assets/user/avatar.png',
      companyId: 1,
      token: 'JWT'
    };

    return response.status(200).json(data);
  }

  return response.status(401).send();
});

export default authRouter;
