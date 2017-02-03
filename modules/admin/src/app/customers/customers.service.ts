import { Injectable } from "@angular/core";
import { Router, ActivatedRoute } from "@angular/router";
import { TranslateService } from "ng2-translate/ng2-translate";
import { LoadingGridService } from "../services/loading/loading-grid.service";
import { Observable } from "rxjs";
import { Location } from "@angular/common";
import { RequestOptions, Headers, RequestMethod, Http, URLSearchParams } from "@angular/http";
import { ConfigService } from "../config/config.service";
import "rxjs/add/operator/map";
import "rxjs/add/operator/share";
import * as Rx from "rxjs/Rx";
import { Customer } from "./model/customer";
import { URIColumn } from "./model/uri-column";
const clone = require("js.clone");

export const REPOSITORY_NAME: string = 'customers';
export const PROJECTION_NAME: string = 'withContactsAndUsers';
export const URI_COLUMNS: URIColumn[] = [
    { name: 'users', columnsTitle: 'username' },
    { name: 'contacts', columnsTitle: 'emailAddress' },
    { name: 'parentCustomer', columnsTitle: 'customerId' },
];

@Injectable()
export class CustomersService {
    private apiUrl: string;

    constructor(public router: Router,
                public route: ActivatedRoute,
                public translate: TranslateService,
                public loadingService: LoadingGridService,
                public location: Location,
                public http: Http,
                public configService: ConfigService) {
        this.apiUrl = configService.config.apiUrl;
    }

    /**
     * Creates the new customer
     * @param data
     * @returns {Observable<R>}
     */
    createCustomer(data: Customer): Rx.Observable<Customer> {
        let requestOptions = new RequestOptions({
            headers: new Headers({
                'Content-Type': 'application/json'
            }),
            method: RequestMethod.Post,
            body: data
        });

        return this.http.request(this.apiUrl + '/repository/' + REPOSITORY_NAME, requestOptions)
            .map(res => res.json())
            .share();
    }

    /**
     * Replaces the customer identified by id
     * @param id
     * @param data
     * @returns {Observable<R>}
     */
    updateCustomer(id: number, data: Customer): Rx.Observable<Customer> {
        let requestOptions = new RequestOptions({
            headers: new Headers({
                'Content-Type': 'application/json'
            }),
            method: RequestMethod.Put,
            body: data
        });

        return this.http.request(this.apiUrl + '/repository/' + REPOSITORY_NAME + '/' + id, requestOptions)
            .map(res => res.json())
            .share();
    }

    /**
     * Removes the customer with id
     * @param id
     * @returns {Observable<R>}
     */
    deleteCustomer(id: number): Rx.Observable<Customer> {
        let requestOptions = new RequestOptions({
            method: RequestMethod.Delete
        });

        return this.http.request(this.apiUrl + '/repository/' + REPOSITORY_NAME + '/' + id, requestOptions)
            .map(res => res.json())
            .share();
    }

    /**
     * Retrieves a single customer with the given id
     * @param id
     * @returns {Observable<R>}
     */
    getCustomer(id: number): Rx.Observable<Customer> {
        let search = new URLSearchParams();
        search.set('projection', PROJECTION_NAME);

        let requestOptions = new RequestOptions({
            method: RequestMethod.Get,
            search: search
        });

        return this.http.request(this.apiUrl + '/repository/' + REPOSITORY_NAME + '/' + id, requestOptions)
            .map(res => res.json())
            .share();
    }

    /**
     * Retrieves a list of all customers with pagination
     * @param page
     * @param size
     * @returns {Observable<R>}
     */
    getCustomers(page?: number, size?: number): Rx.Observable<Customer[]> {
        let search = new URLSearchParams();

        if (typeof page !== 'undefined' && typeof size !== 'undefined') {
            search.set('page', page + '');
            search.set('size', size + '');
        }

        let requestOptions = new RequestOptions({
            method: RequestMethod.Get,
            search: search
        });

        return this.http.request(this.apiUrl + '/repository/' + REPOSITORY_NAME, requestOptions)
            .map(res => res.json())
            .share();
    }
}
