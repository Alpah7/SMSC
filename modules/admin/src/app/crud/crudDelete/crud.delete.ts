import {Component} from "@angular/core";
import {TranslatePipe, TranslateService} from "ng2-translate/ng2-translate";
import {MdCard, MD_CARD_DIRECTIVES} from '@angular2-material/card/card';
import {AgGridNg2} from 'ag-grid-ng2/main';
import {GridOptions} from 'ag-grid/main';
import {ActivatedRoute, Router} from "@angular/router";

import {CrudService} from "../crud.service";
import {CrudModel} from "../crud.model";

@Component({
    selector: 'crud-delete',
    template: require('./crud.delete.html'),
    styleUrls: [
        require('./crud.delete.scss')
    ],
    providers: [],
    directives: [],
    pipes: [TranslatePipe]
})

export class CrudDelete {
    public rowData = [];

    constructor(public translate:TranslateService,
                public crudService: CrudService,
                public crudModel: CrudModel,
                public router: Router) {
    }

    ngOnInit() {
        // init the row data
        this.crudModel.getStore(this.crudService.className)
            .then((store) => {
                this.rowData = store;
            }, (error) => {
                this.crudService.dataNotFound = true;
                this.crudService.errorMessage = 'orientdb.dataNotFound';
            });
    }

}
