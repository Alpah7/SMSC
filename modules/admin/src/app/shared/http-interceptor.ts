import {
    Http,
    Request,
    RequestOptionsArgs,
    Response,
    RequestOptions,
    ConnectionBackend,
    Headers,
    XHRBackend
} from "@angular/http";
import {Router} from "@angular/router";
import {Observable} from "rxjs/Observable";
import {Injectable} from "@angular/core";
import * as _ from "lodash";
import {TokenService} from "../services/auth/token.service";

@Injectable()
export class HttpInterceptor extends Http {
    readonly _tokenService = new TokenService();

    constructor(backend: ConnectionBackend, defaultOptions: RequestOptions,
                public _router: Router) {
        super(backend, defaultOptions);
    }

    request(url: string | Request, options?: RequestOptionsArgs): Observable<Response> {
        return this.intercept(super.request(url, this.getAuthTokenKey(url, options)));
    }

    get(url: string, options?: RequestOptionsArgs): Observable<Response> {
        return this.intercept(super.get(url, options));
    }

    post(url: string, body: string, options?: RequestOptionsArgs): Observable<Response> {
        return this.intercept(super.post(url, body, this.getRequestOptionArgs(options)));
    }

    put(url: string, body: string, options?: RequestOptionsArgs): Observable<Response> {
        return this.intercept(super.put(url, body, this.getRequestOptionArgs(options)));
    }

    delete(url: string, options?: RequestOptionsArgs): Observable<Response> {
        return this.intercept(super.delete(url, options));
    }

    getAuthTokenKey(url: string | Request, options?: RequestOptionsArgs) {
        const _url = url instanceof Request ? url.url : url;

        if (options == null) {
            options = new RequestOptions();
        }
        if (options.headers == null) {
            options.headers = new Headers();
        }
        if (_.includes(_url, 'rest/') && !_.includes(_url, 'auth/token')) {
            options.headers.append('X-Authorization', this._tokenService.getToken());
        }

        return options;
    }

    getRequestOptionArgs(options?: RequestOptionsArgs): RequestOptionsArgs {
        if (options == null) {
            options = new RequestOptions();
        }
        if (options.headers == null) {
            options.headers = new Headers();
        }
        options.headers.append('Content-Type', 'application/json');
        return options;
    }

    intercept(observable: Observable<Response>): Observable<Response> {
        return observable.catch((err, source) => {
            if (err.status === 401 && !_.includes(err.url, 'auth/token')) {
                this._router.navigateByUrl('/login');
                this._tokenService.resetToken();
                return Observable.empty();
            } else {
                return Observable.throw(err);
            }
        });
    }
}

export function httpInterceptorFactory(xhrBackend: XHRBackend, requestOptions: RequestOptions, router: Router) {
    return new HttpInterceptor(xhrBackend, requestOptions, router);
}

export const HTTP_INTERCEPTOR_PROVIDER = {
    provide: Http,
    useFactory: httpInterceptorFactory,
    deps: [XHRBackend, RequestOptions, Router]
};
