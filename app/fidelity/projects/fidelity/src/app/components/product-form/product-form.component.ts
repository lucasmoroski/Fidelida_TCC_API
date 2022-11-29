import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { HttpEvent, HttpEventType } from '@angular/common/http';

import { IProduct } from '@fidelity/interfaces/product.interface';
import { IUser } from '@fidelity/interfaces/user.interface';
import { AuthService } from '@fidelity/services/auth/auth.service';
import { MenuService } from '@fidelity/services/menu/menu.service';
import { ProductService } from '@fidelity/services/product/product.service';
import { ICategory } from '@fidelity/interfaces/category.interface';
import { CategoryService } from '@fidelity/services/category/category.service';
import { IMessage } from '@fidelity/interfaces/message.interface';
import { MessageService } from '@fidelity/services/message/message.service';

@Component({
  selector: 'app-product-form',
  templateUrl: './product-form.component.html',
  styleUrls: ['./product-form.component.scss']
})
export class ProductFormComponent implements OnInit {

  productForm: FormGroup;
  product: IProduct;
  categories: ICategory[];
  user: IUser;
  selectedPhoto: File;
  photoPreview: any;
  uploadProgress: number;

  constructor(
    private menuService: MenuService,
    private activatedRouter: ActivatedRoute,
    private productService: ProductService,
    private authService: AuthService,
    private formBuilder: FormBuilder,
    private categoryService: CategoryService,
    private messageService: MessageService,
    private router: Router
  ) { }

  ngOnInit(): void {
    this.menuService.displayMenu.next(true);
    this.menuService.pageTitle.next('Novo produto');
    this.loadProduct();
  }

  loadProduct(): void {
    this.authService.getLoggedUserData().subscribe((user: IUser) => this.user = user);
    this.categoryService.getCategories(this.user.companyId).subscribe(
      (categories: ICategory[]) => this.categories = categories
    );
    this.product = this.productService.buildProduct();
    this.initializeForm();
    const productId = parseInt(this.activatedRouter.snapshot.paramMap.get('id'), 10);
    if (productId) {
      this.menuService.pageTitle.next('Editar produto');
      this.productService.getProduct(this.user.companyId, productId).subscribe(
        (product: IProduct) => {
          this.product = product;
          this.initializeForm();
        }
      );
    }
  }

  initializeForm(): void {
    this.productForm = this.formBuilder.group({
      name: new FormControl(this.product.name, Validators.required),
      value: new FormControl(this.product.value, Validators.required),
      category: new FormControl(this.product.category.id, Validators.required),
      description: new FormControl(this.product.description),
      photo: new FormControl(this.product.photo),
      active: new FormControl(this.product.active),
    });
  }

  onFileSelect(event: any): void {
    this.selectedPhoto = <File> event.target.files[0];
    const reader: FileReader = new FileReader();
    reader.onload = () => this.photoPreview = reader.result;
    reader.readAsDataURL(this.selectedPhoto);
  }

  onFileClear() {
    this.selectedPhoto = null;
    this.photoPreview = null;
    this.productForm.get('photo').reset();
  }

  onReset() {
    this.selectedPhoto = null;
    this.photoPreview = null;
  }

  onSubmit(): void {
    Object.assign(this.product, this.productForm.value);
    if (this.product.id) {
      this.productService.updateProduct(this.product).subscribe(
        () => {
          this.router.navigate(['product']);
          const message: IMessage = {
            context: 'success',
            title: 'Sucesso!',
            description: 'Produto salvo com sucesso',
          };
          this.messageService.addMessage(message);
        },
        () => {
          const message: IMessage = {
            context: 'danger',
            title: 'Não foi possível salvar o produto!',
            description: 'Verifique os campos e tente novamente',
          };
          this.messageService.addMessage(message);
        }
      );
      return;
    }
    this.productService.createProduct(this.product).subscribe(
      () => {
        this.router.navigate(['product']);
        const message: IMessage = {
          context: 'success',
          title: 'Sucesso!',
          description: 'Produto salvo com sucesso',
        };
        this.messageService.addMessage(message);
      },
      () => {
        const message: IMessage = {
          context: 'danger',
          title: 'Não foi possível salvar o produto!',
          description: 'Verifique os campos e tente novamente',
        };
        this.messageService.addMessage(message);
      }
    );
    if (this.selectedPhoto) {
      this.uploadProductPhoto();
    }
  }

  uploadProductPhoto(): void {
    this.productService.uploadProductPhoto(this.user.companyId, this.selectedPhoto).subscribe(
      (event: HttpEvent<Object>) => {
        if (event.type === HttpEventType.UploadProgress) {
          this.uploadProgress = Math.round(event.loaded / event.total * 100);
        }
      },
      () => {
        const message: IMessage = {
          context: 'danger',
          title: 'Problemas ao salvar a foto do produto!',
          description: 'Verifique os dados do produto e tente novamente',
        };
        this.messageService.addMessage(message);
      }
    );
  }

}
