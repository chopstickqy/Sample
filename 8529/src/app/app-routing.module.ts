import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { LoginComponent } from './login/login.component';
import { MainComponent } from './main/main.component';
import { SelectComponent } from './select/select.component';
import { CumulativeSalesComponent } from './cumulative-sales/cumulative-sales.component';
import { CustomerComponent } from './customer/customer.component';
import { MysurveyComponent } from './mysurvey/mysurvey.component';
import {MyProductComponent} from './my-product/my-product.component';
import { ExpressionComponent} from './expression/expression.component';
import { NationalProfileComponent } from './national-profile/national-profile.component';


const routes: Routes = [
  {
    path: 'login',
    component: LoginComponent
  },
  {
    path: 'main',
    component: MainComponent
  },
  {
  	path:'mysurvey',
  	component:MysurveyComponent
  },
  {
      path: 'select',
      component: SelectComponent
  },
  {
    path: 'customer',
    component: CustomerComponent
  },
  {
    path: 'myproduct',
    component: MyProductComponent
  },
  {
      path: 'expression',
      component: ExpressionComponent
  },
  {
    path: 'national-profile',
    component: NationalProfileComponent
}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule { }
