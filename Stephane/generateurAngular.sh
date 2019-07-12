#!/bin/bash
nom=$lenomduprojet;
objet=$lenomdelobjet;

echo -e "\e[92mCreation du CRUD Angular\e[0m";

cd $nom/angularApp/src/app/;

objetup=$objet;
objetup=`echo ${objetup:0:1} | tr  '[a-z]' '[A-Z]'`${objetup:1};
objets=$objet's';

#=============================APP.MODULE;TS==========================================
echo "import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeaderComponent } from './header/header.component';
import { AccueilComponent } from './accueil/accueil.component';
import { NotfoundComponent } from './notfound/notfound.component';

import { "$objetup"ListComponent } from './"$objet"-list/"$objet"-list.component';
import { "$objetup"FormComponent } from './"$objet"-list/"$objet"-form/"$objet"-form.component';
import { "$objetup"EditComponent } from './"$objet"-list/"$objet"-edit/"$objet"-edit.component';
import { "$objetup"SingleComponent } from './"$objet"-list/"$objet"-single/"$objet"-single.component';
import { "$objetup"Service } from './services/"$objet".service';


@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    NotfoundComponent,
    AccueilComponent,
    "$objetup"ListComponent,
    "$objetup"FormComponent,
    "$objetup"EditComponent,
    "$objetup"SingleComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule
  ],
  providers: ["$objetup"Service],
  bootstrap: [AppComponent]
})
export class AppModule { }

" > app.module.ts;


#========================APP.COMPONENT.TS=============================================

echo "import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = '$nom';
}" > app.component.ts;


#========================APP.COMPONENT.SPEC.TS=======================================

echo "
import { TestBed, async } from '@angular/core/testing';
import { RouterTestingModule } from '@angular/router/testing';
import { AppComponent } from './app.component';

describe('AppComponent', () => {
  beforeEach(async(() => {
    TestBed.configureTestingModule({
      imports: [
        RouterTestingModule
      ],
      declarations: [
        AppComponent
      ],
    }).compileComponents();
  }));

  it('should create the app', () => {
    const fixture = TestBed.createComponent(AppComponent);
    const app = fixture.debugElement.componentInstance;
    expect(app).toBeTruthy();
  });

  it(\"hould have as title '$nom'\", () => {
    const fixture = TestBed.createComponent(AppComponent);
    const app = fixture.debugElement.componentInstance;
    expect(app.title).toEqual('$nom');
  });

  it('should render title in a h1 tag', () => {
    const fixture = TestBed.createComponent(AppComponent);
    fixture.detectChanges();
    const compiled = fixture.debugElement.nativeElement;
    expect(compiled.querySelector('h1').textContent).toContain('Welcome to $nom!');
  });
});
" > app.component.spec.ts;

#=======================APP.COMPONENT.HTML===========================================

echo "<app-header></app-header>
<div class=\"container\">
  <router-outlet></router-outlet>
</div>" > app.component.html;

#=====================APP-ROUTING.MODULE.TS===========================================

echo "import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AccueilComponent } from './accueil/accueil.component';
import { "$objetup"ListComponent } from './"$objet"-list/"$objet"-list.component';
import { "$objetup"FormComponent } from './"$objet"-list/"$objet"-form/"$objet"-form.component';
import { "$objetup"SingleComponent } from './"$objet"-list/"$objet"-single/"$objet"-single.component';
import { "$objetup"EditComponent } from './"$objet"-list/"$objet"-edit/"$objet"-edit.component';
import { NotfoundComponent} from './notfound/notfound.component'

const routes: Routes = [
  { path: 'accueil', component: AccueilComponent },
  { path: '"$objet"', component: "$objetup"ListComponent },
  { path: '"$objet"/new', component: "$objetup"FormComponent },
  { path: '"$objet"/view/:id', component: "$objetup"SingleComponent },
  { path: '"$objet"/edit/:id', component: "$objetup"EditComponent },
  { path: '', component: AccueilComponent },
  { path: '**', component: NotfoundComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
" > app-routing.module.ts
#====================================================================================

touch app.component.scss;

#=============================SERVICE.TS============================================
mkdir services;
cd services;

echo "import { Injectable, OnInit } from '@angular/core';
import { "$objet" } from '../models/"$objet".model';
import { Observable } from 'rxjs';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class "$objetup"Service implements OnInit {
  addr = \"http://127.0.0.1:8080/api/v1/"$objet"\"
  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json'
    })
  }
  constructor(private http: HttpClient) {
  }

  "$objets": "$objet"[] = [];
  "$objet"Observable = new Observable<"$objet"[]>();


  ngOnInit() {
    this.get"$objets"();
  }

  get"$objets"() {
    this."$objet"Observable = this.http.get<"$objet"[]>(this.addr);
  }

  getsingle"$objet"(id: number) {
    return this.http.get<"$objet">(this.addr + '/' + id);
  }

  createNew"$objet"(obj: "$objet") {
    return this.http.post<"$objet">(this.addr, obj, this.httpOptions);
  }

  editOne"$objet"(obj: "$objet") {
    return this.http.put<"$objet">(this.addr, obj, this.httpOptions);
  }

  remove"$objet"(obj: "$objet") {
    return this.http.delete<"$objet">(this.addr + '/' + obj.id, this.httpOptions);
  }

}
" > $objet.service.ts;

#====================================================================================

echo "import { TestBed } from '@angular/core/testing';

import { "$objetup"Service } from './"$objet".service';

describe('"$objetup"Service', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: "$objetup"Service = TestBed.get("$objetup"Service);
    expect(service).toBeTruthy();
  });
});
" > $objet.service.spec.ts;

cd ..;
#====================================================================================

mkdir notfound;
cd notfound;

#========================NOTFOUND.COMPONENT.TS=======================================

echo "import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router'

@Component({
  selector: 'app-notfound',
  templateUrl: './notfound.component.html',
  styleUrls: ['./notfound.component.scss']
})
export class NotfoundComponent implements OnInit {

  constructor(private route: Router) { }

  retour() {
    this.route.navigate(['accueil']);
  }
}
" > notfound.component.ts;

#========================NOTFOUND.COMPONENT.SPEC.TS==================================

echo "import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { NotfoundComponent } from './notfound.component';

describe('NotfoundComponent', () => {
  let component: NotfoundComponent;
  let fixture: ComponentFixture<NotfoundComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NotfoundComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NotfoundComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
" > notfound.component.spec.ts;

#=====================NOTFOUND.COMPONENT.SPEC.TS=====================================

touch notfound.component.scss;

#=====================NOTFOUND.COMPONENT.HTML========================================

echo "PAGE INTROUVABLE VEUILLEZ VERIFIER L'ADRESSE
<p (click)=\"retour()\">Cliquez ici pour retourner a l'accueil</p>" > notfound.component.html;

#====================================================================================

cd ..;
mkdir $objet-list;
cd $objet-list;

#=======================OBJET-LIST.COMPONENT.TS======================================

echo "import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { "$objet" } from '../models/"$objet".model';
import { "$objetup"Service } from '../services/"$objet".service';

@Component({
  selector: 'app-"$objet"-list',
  templateUrl: './"$objet"-list.component.html',
  styleUrls: ['./"$objet"-list.component.scss']
})
export class "$objetup"ListComponent implements OnInit {

  constructor(private router : Router, private service : "$objetup"Service) { }

"$objet"Observable: Observable<"$objet"[]>;
"$objets": "$objet"[];

  ngOnInit() {
    this.service.get"$objets"();
    this.service."$objet"Observable.subscribe("$objets" => this."$objets" = "$objets");
  }

  onNew"$objet"() {
    this.router.navigate(['/"$objet"', 'new']);
  }

  onView"$objet"(id: number) {
    this.router.navigate(['/"$objet"', 'view', id]);
  }
}" > $objet-list.component.ts;

#===========================OBJET-LIST.COMPONENT.SPEC.TS============================

echo "import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { "$objetup"ListComponent } from './"$objet"-list.component';

describe('"$objetup"ListComponent', () => {
  let component: "$objetup"ListComponent;
  let fixture: ComponentFixture<"$objetup"ListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ "$objetup"ListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent("$objetup"ListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
" > $objet-list.component.spec.ts

#========================OBJET-LIST.COMPONENT.SCSS===================================

touch "$objet"-list.component.scss;

#========================OBJET-LIST.COMPONENT.HMTL===================================

echo "<div class=\"row\">
  <div class=\"col-xs-12\">
    <h2>"$objet"</h2>
    <div class=\"list-group\">
      <button class=\"list-group-item\" *ngFor=\"let "$objet" of "$objets"; let i = index\"
        (click)=\"onView"$objet"("$objet".id)\">" > "$objet"-list.component.html


for var in "${objetsvaleurs[@]}"
	do
	if [ $((i%2)) -eq 0 ];then
		nomvar=${var};
		declare -l nomvar
		echo "<p class=\"list-group-item-text\">"$nomvar" : {{ "$objet"."$nomvar" }}</p>" >> "$objet"-list.component.html
	
	fi
	let "i++";
	done

 echo "</button>
    </div>
    <button class=\"btn btn-primary\" (click)=\"on"$objetup"()\">Nouveau "$objet"</button>
  </div>
</div>" >> "$objet"-list.component.html

#====================================================================================

mkdir $objet-single;
cd $objet-single;

#======================OBJET-SINGLE.COMPONENT.TS=====================================

echo "import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { "$objetup"Service } from 'src/app/services/"$objet".service';
import { "$objet" } from '../../models/"$objet".model'

@Component({
  selector: 'app-"$objet"-single',
  templateUrl: './"$objet"-single.component.html',
  styleUrls: ['./"$objet"-single.component.scss']
})
export class "$objetup"SingleComponent implements OnInit {
  "$objet": "$objet";
  id: any;

  constructor(private route: ActivatedRoute, private "$objet"Service: "$objetup"Service, private router: Router) {
  }

  ngOnInit() {
    this."$objet" = new "$objet"();
    this.id = this.route.snapshot.params['id'];
    this."$objet"Service.getsingle"$objet"(this.id).subscribe("$objet" => this."$objet" = "$objet")
  }

  onBack() {
    this.router.navigate(['/"$objet"']);
  }

  onEdit() {
    this.router.navigate(['/"$objet"', 'edit', this.id]);
  }

  onDelete() {
    if (window.confirm('Etes vous sur ?')) {
      this."$objet"Service.remove"$objet"(this."$objet").subscribe(data =>{this.router.navigate(['/"$objet"']);});
    };
  }
}
" > $objet-single.component.ts;

#====================OBJET-SINGLE.COMPONENT.SPEC.TS==================================

echo "import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { "$objetup"SingleComponent } from './"$objet"-single.component';

describe('"$objetup"SingleComponent', () => {
  let component: "$objetup"SingleComponent;
  let fixture: ComponentFixture<"$objetup"SingleComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ "$objetup"SingleComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent("$objetup"SingleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
"> $objet-single.component.spec.ts

#==================OBJET-SINGLE.COMPONENT.SCSS=======================================

touch $objet-single.component.scss;

#==================OBJET-SINGLE.COMPONENT.HTML=======================================

echo "
<div class=\"row\">
    <div class=\"col-xs-12\">" > $objet-single.component.html;


for var in "${objetsvaleurs[@]}"
	do
	if [  $((i%2)) -eq 0 ];then
		nomvar=${var};
		declare -l nomvar
		echo "<p class=\"list-group-item-text\">"$nomvar" : {{ "$objet"."$nomvar" }}</p>" >> $objet-single.component.html;
	
	fi
	let "i++";
	done

echo "
      <button class=\"btn btn-warning\" (click)=\"onBack()\">Retour</button>
      <button class=\"btn btn-info\" (click)=\"onEdit()\">Modifier</button>
      <button class=\"btn btn-default btn-danger\" (click)=\"onDelete()\">Supprimer</button>
    </div>
  </div>
" >> $objet-single.component.html;

#====================================================================================
cd ..;
mkdir $objet-form;
cd $objet-form;

#=============OBJET-FORM.COMPONENT.TS================================================

echo "
import { Component } from '@angular/core';
import { "$objetup"Service } from '../../services/"$objet".service';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { "$objet" } from '../../models/"$objet".model';

@Component({
  selector: 'app-"$objet"-form',
  templateUrl: './"$objet"-form.component.html',
  styleUrls: ['./"$objet"-form.component.scss']
})
export class "$objetup"FormComponent {

  "$objet"NewForm = this.formBuilder.group({
"> $objet-form.component.ts;

for var in "${objetsvaleurs[@]}"
	do
	if [  $((i%2)) -eq 0 ];then
		nomvar=${var};
		declare -l nomvar
		echo "$nomvar : ['', Validators.required]," >> $objet-form.component.ts
	fi
	let "i++";
	done

echo "  });

  constructor(private formBuilder: FormBuilder,
    private service: "$objetup"Service,
    private router: Router,
  ) { }

  ngOnInit() {
  }

  onSave"$objet"() {" >> $objet-form.component.ts

for var in "${objetsvaleurs[@]}"
	do
	if [  $((i%2)) -eq 0 ];then
		nomvar=${var};
		declare -l nomvar
		echo "const $nomvar = this."$objet"NewForm.get('$nomvar').value;" >> $objet-form.component.ts
	fi
	let "i++";
	done


echo "
    const new"$objet" = new "$objet"();" >> $objet-form.component.ts

for var in "${objetsvaleurs[@]}"
	do
	if [  $((i%2)) -eq 0 ];then
		nomvar=${var};
		declare -l nomvar
		echo "new$objet.$nomvar = $nomvar;" >> $objet-form.component.ts
	fi
	let "i++";
	done
    echo "this.service.create"$objetup"(new"$objet").subscribe(data => { this.router.navigate(['/"$objet"']); });

  }

  onAnnuler() {
    this.router.navigate(['/"$objet"']);
  }

}" >> $objet-form.component.ts;


#========================OBJET-FORM.COMPONENT.SPEC.TS=============================

echo "import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { "$objetup"FormComponent } from './"$objet"-form.component';

describe('"$objetup"FormComponent', () => {
  let component: "$objetup"FormComponent;
  let fixture: ComponentFixture<"$objetup"FormComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ "$objetup"FormComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent("$objetup"FormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
" > $objet-form.component.spec.ts

#=====================OBJET-FORM.COMPONENT.SCSS======================================

touch $objet-form.component.scss;

#=====================OBJET-FORM.COMPONENT.HTML======================================

echo "<div class=\"row\">
  <div class=\"col-sm-8 col-sm-offset-2\">
    <h2>Créer un "$objetup"</h2>
    <form [formGroup]=\""$objet"NewForm\" (ngSubmit)=\"onSave"$objet"()\">" > $objet-form.component.html;

for var in "${objetsvaleurs[@]}"
	do
	if [  $((i%2)) -eq 0 ];then
		nomvar=${var};
		declare -l nomvar
		nomvarup=$nomvar;
		nomvarup=`echo ${nomvarup:0:1} | tr  '[a-z]' '[A-Z]'`${nomvarup:1}	
	else
		nomtype=${var};
#ECHO ICI
echo "<div class=\"form-group\">
 <label for=\"$nomvar\">$nomvarup</label>" >>$objet-form.component.html;

	if [ "$nomtype" == "String" ] || [ "$nomtype" == "char" ];then
		echo "<input type=\"text\" id=\"$nomvar\" class=\"form-control\" formControlName=\"$nomvar\">" >> $objet-form.component.html;

	elif  [ "$nomtype" == "int" ] || [ "$nomtype" == "float" ];then
echo "<input type=\"number\" id=\"$nomvar\" class=\"form-control\" formControlName=\"$nomvar\">" >> $objet-form.component.html;
fi
echo "</div>" >> $objet-form.component.html;


	fi
	let "i++";
	done
    
   echo "<button class=\"btn btn-success\" [disabled]=\""$objet"NewForm.invalid\" type=\"submit\">Enregistrer
      </button>
    </form>
    <button class=\"btn btn-danger\" (click)=\"onAnnuler()\">Annuler
    </button>
  </div>
</div>
" >> $objet-form.component.html;


#====================================================================================
cd ..;
mkdir $objet-edit;
cd $objet-edit;

#==================OBJET-EDIT.COMPONENT.TS===========================================

echo "import { Component, OnInit } from '@angular/core';
import { Validators, FormBuilder } from '@angular/forms';
import { "$objetup"Service } from 'src/app/services/"$objet".service';
import { Router, ActivatedRoute } from '@angular/router';
import { "$objet" } from 'src/app/models/"$objet".model';

@Component({
  selector: 'app-"$objet"-edit',
  templateUrl: './"$objet"-edit.component.html',
  styleUrls: ['./"$objet"-edit.component.scss']
})
export class "$objetup"EditComponent implements OnInit {

  "$objet"EditForm = this.formBuilder.group({" > "$objet"-edit.component.ts;

for var in "${objetsvaleurs[@]}"
	do
	if [  $((i%2)) -eq 0 ];then
		nomvar=${var};
		declare -l nomvar
echo $nomvar": ['', Validators.required]," >>  "$objet"-edit.component.ts;	
fi
	let "i++";
done


echo "  });
  
  constructor(private formBuilder: FormBuilder,
    private service: "$objetup"Service,
    private router: Router,
    private route: ActivatedRoute) { }

  id: any;
  "$objet"1: "$objet";

  ngOnInit() {
    this.id = this.route.snapshot.params['id'];
    this.service.getsingle"$objet"(+this.id).subscribe((value) => {
    this."$objet"1 = value
    this.initForm();
    });
  }

  initForm() {
    this."$objet"EditForm.setValue({" >> "$objet"-edit.component.ts;

i=0;
for var in "${objetsvaleurs[@]}"
	do
	if [ $((i%2)) -eq 0 ];then
		nomvar=${var};
		declare -l nomvar
echo $nomvar": this."$objet"1."$nomvar"," >>  "$objet"-edit.component.ts;	
fi
	let "i++";
done
 echo " });
  }

  onSave"$objet"() {
 	const new"$objet" = new "$objet"();
	new"$objet".id=+this.id;
" >> "$objet"-edit.component.ts;
i=0;
for var in "${objetsvaleurs[@]}"
	do
	if [ $((i%2)) -eq 0 ];then
		nomvar=${var};
		declare -l nomvar
echo "const "$nomvar" = this."$objet"EditForm.get('"$nomvar"').value;
new"$objet"."$nomvar" = "$nomvar"; " >>  "$objet"-edit.component.ts;	
fi
	let "i++";
done
 echo "   this.service.editOne"$objet"(new"$objet").subscribe(data =>{this.router.navigate(['/"$objet"']);});
  }

  onAnnuler() {
    this.router.navigate(['/"$objet"']);
  }

}
" >> "$objet"-edit.component.ts;

#===================OBJET-EDIT.COMPONENT.SPEC.TS=====================================

echo "import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { "$objetup"EditComponent } from './"$objet"-edit.component';

describe('"$objetup"EditComponent', () => {
  let component: "$objetup"EditComponent;
  let fixture: ComponentFixture<"$objetup"EditComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ "$objetup"EditComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent("$objetup"EditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
}); " > "$objet"-edit.component.spec.ts;


#================OBJET-EDIT.COMPONENT.SCSS===========================================

touch "$objet"-edit.component.scss;

#================OBJET-EDIT.COMPONENT.HTML===========================================

echo "<div class=\"row\">
  <div class=\"col-sm-8 col-sm-offset-2\">
    <h2>Editer un "$objetup"</h2>
    <form [formGroup]=\""$objet"EditForm\" (ngSubmit)=\"onSave"$objet"()\">" > $objet-edit.component.html;

for var in "${objetsvaleurs[@]}"
	do
	if [  $((i%2)) -eq 0 ];then
		nomvar=${var};
		declare -l nomvar
		nomvarup=$nomvar;
		nomvarup=`echo ${nomvarup:0:1} | tr  '[a-z]' '[A-Z]'`${nomvarup:1}	
	else
		nomtype=${var};
#ECHO ICI
echo "<div class=\"form-group\">
 <label for=\"$nomvar\">$nomvarup</label>" >>$objet-edit.component.html;
	if [ "$nomtype" == "String" ] || [ "$nomtype" == "char" ]; then
		echo "<input type=\"text\" id=\"$nomvar\" class=\"form-control\" formControlName=\"$nomvar\">" >> $objet-edit.component.html;

	elif  [ "$nomtype" == "int" ] || [ "$nomtype" == "float" ]; then
echo "<input type=\"number\" id=\"$nomvar\" class=\"form-control\" formControlName=\"$nomvar\">" >> $objet-edit.component.html;
fi
echo "</div>" >> $objet-edit.component.html;
	fi
	let "i++";
	done
    
   echo "<button class=\"btn btn-success\" [disabled]=\""$objet"EditForm.invalid\" type=\"submit\">Enregistrer
      </button>
    </form>
    <button class=\"btn btn-danger\" (click)=\"onAnnuler()\">Annuler
    </button>
  </div>
</div>
" >> $objet-edit.component.html;

#====================================================================================

cd ../.. ;
mkdir header;
cd header;

#====================HEADER COMPONENT TS=============================================

echo "import { Component } from '@angular/core';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent {
  constructor() { }
}
" > header.component.ts;

#=================HEADER COMPONENT SPEC TS===========================================

echo "import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { HeaderComponent } from './header.component';

describe('HeaderComponent', () => {
  let component: HeaderComponent;
  let fixture: ComponentFixture<HeaderComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ HeaderComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HeaderComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
" > header.component.spec.ts;

#====================================================================================

touch header.component.scss;

#====================================================================================

echo "<nav class=\"navbar navbar-default\">
  <div class=\"container-fluid\">
    <ul class=\"nav navbar-nav\">
        <li routerLinkActive=\"active\">
            <a routerLink=\"accueil\">Accueil</a>
          </li>
      <li routerLinkActive=\"active\">
        <a routerLink=\""$objet"\">"$objetup"</a>
      </li>
    </ul>
  </div>
</nav>
" > header.component.html;

#====================================================================================

cd ..;
mkdir accueil;
cd accueil;

#====================================================================================

echo "import { Component } from '@angular/core';

  @Component({
    selector: 'app-accueil',
    templateUrl: './accueil.component.html',
    styleUrls: ['./accueil.component.scss']
  })
  export class AccueilComponent {

    constructor() { }
  }
" > accueil.component.ts;

#====================================================================================

echo "import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AccueilComponent } from './accueil.component';

describe('AccueilComponent', () => {
  let component: AccueilComponent;
  let fixture: ComponentFixture<AccueilComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AccueilComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AccueilComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
" > accueil.component.spec.ts;

#====================================================================================

touch accueil.component.scss;

#====================================================================================

echo "<h1>J-INTM</h1>
<h2>Bienvenue sur JITNM</h2>< br/>un generateur de code angular, maven." > accueil.component.html;

#====================================================================================
echo -e "\e[91mFin de la création du CRUD Angular \e[0m";

