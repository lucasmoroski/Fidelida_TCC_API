import { ICategory } from '@fidelity/interfaces/category.interface';

export interface IProduct {
  id: number;
  companyId: number;
  category: ICategory;
  fidelities?: number[];
  name: string;
  value: number;
  photo?: string;
  description?: string;
  active: boolean;
}
