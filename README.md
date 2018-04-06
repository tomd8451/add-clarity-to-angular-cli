# Adding clarity to your fresh Angular-cli project

1) copy add-clarity.sh to the root of your new cli project  
2) copy app.component.html to the root of your new cli project
3) Import the ClarityModule into your Angular application's module. Your application's main module might look like this:  
```
import { NgModule } from "@angular/core";
import { BrowserModule } from "@angular/platform-browser";
import { ClarityModule } from "@clr/angular";
import { AppComponent } from "./app.component";

@NgModule({
    imports: [
        BrowserModule,
        ClarityModule,
        ...
     ],
     declarations: [ AppComponent ],
     bootstrap: [ AppComponent ]
})
export class AppModule {    }
```
