import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { NgxEchartsModule } from 'ngx-echarts';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { MainComponent } from './main/main.component';
import { CumulativeSalesComponent } from './cumulative-sales/cumulative-sales.component';
import { SelectComponent } from './select/select.component';
import { MysurveyComponent } from './mysurvey/mysurvey.component';
import { CustomerComponent } from './customer/customer.component';
import { MyProductComponent } from './my-product/my-product.component';
import { ExpressionComponent } from './expression/expression.component';
import { NationalProfileComponent } from './national-profile/national-profile.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    MainComponent,
    CumulativeSalesComponent,
    SelectComponent,
    MysurveyComponent,
    SelectComponent,
    CustomerComponent,
    MyProductComponent,
    ExpressionComponent,
    NationalProfileComponent
  ],
  imports: [
    BrowserModule,
    RouterModule,
    AppRoutingModule,
    NgxEchartsModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
