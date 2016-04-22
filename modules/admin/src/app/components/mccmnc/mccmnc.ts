import {Component} from 'angular2/core';
import {MCCMNCGrid} from './directives/mccmnc-grid';
import {TranslateService, TranslatePipe} from 'ng2-translate/ng2-translate';
import {Router} from 'angular2/router';

@Component({
    selector: 'mccmnc',
    templateUrl: 'app/components/mccmnc/mccmnc.html',
    styleUrls: [
        'app/components/mccmnc/mccmnc.css',
        'assets/css/theme/breadcrumb.css'
    ],
    providers: [],
    directives: [MCCMNCGrid],
    pipes: [TranslatePipe]
})
export class MCCMNC {

    constructor(public translate: TranslateService,  public router: Router) {}

    ngOnInit() {

    }

}