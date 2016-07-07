import {LocalStorageService} from 'angular2-localStorage/LocalStorageEmitter';
export * from './app.component';
export * from './app.service';

import { AppState } from './app.service';
import { HTTP_PROVIDERS, Http } from '@angular/http';
import { ROUTER_DIRECTIVES } from '@angular/router';
import {
    TRANSLATE_PROVIDERS,
    TranslateService
} from 'ng2-translate/ng2-translate';
import { provide } from '@angular/core';
import { ODatabaseService } from './orientdb/orientdb.service';
import {MdIconRegistry} from '@angular2-material/icon/icon-registry';

import { AuthGuard } from './login/login.guard';
import {DashboardGuard} from './dashboard/dashboard.guard';

export const APP_PROVIDERS = [
    AuthGuard,
    DashboardGuard,
    AppState,
    HTTP_PROVIDERS,
    ROUTER_DIRECTIVES,
    LocalStorageService,
    MdIconRegistry,
    provide(ODatabaseService, {
        useFactory: (http: Http) => new ODatabaseService('/orientdb/smsc', http),
        deps: [Http]
    }),
    TRANSLATE_PROVIDERS,
    TranslateService
];
