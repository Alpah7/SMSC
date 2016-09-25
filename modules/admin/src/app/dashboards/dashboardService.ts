import { ODatabaseService } from "../orientdb/orientdb.service";
import { Injectable } from "@angular/core";
import { Response } from "@angular/http";
import { DashboardBox } from "./models/dashboardBox.ts";
import { CrudService } from "../crud/crud.service";
import { GridService } from "../services/grid.service";
import { ActivatedRouteSnapshot, RouterStateSnapshot } from "@angular/router";
import { Location } from "@angular/common";
import { Observable } from "rxjs/Observable";
import { ColumnDefsModel } from "../crud/model/columnDefs.model";
import { Observer } from "rxjs/Observer";
import { BatchType } from "../orientdb/model/batchType";
import { Operation } from "../orientdb/model/operation";
import { EditModel } from "../crud/crudEdit/crud.edit.model";

const squel = require('squel');

@Injectable()
export class DashboardService {
    constructor(private databaseService: ODatabaseService,
                public crudService: CrudService,
                public location: Location,
                public gridService: GridService) {

    }

    /**
     * Get dashboard boxes
     *
     * @returns {any}
     */
    public getDashboardBoxes(): Observable<Array<DashboardBox>> {
        this.databaseService.query("select codeLanguage['type'] from DashboardBoxType").subscribe((res) => {
            console.log(res);
        });

        let query = squel.select()
            .from('DashboardBox')
            .field('*')
            .toString();

        return Observable.create((observer: Observer<Array<DashboardBox>>) => {
            this.databaseService.query(query, 50, '*:3').subscribe((res: Response) => {
                let result: Array = [];

                for (let item of res.json().result) {
                    item.width = parseInt(item.width[0]);
                    item.height = parseInt(item.height[0]);
                    result.push(new DashboardBox(item));
                }

                observer.next(result);
                observer.complete();
            }, (ex) => {
                observer.error(ex);
                observer.complete();
            })
        });
    }

    /**
     * Get single dashboard box
     *
     * @param rid - dashboard rid
     * @returns {Promise<DashboardBox>|Promise<TResult|DashboardBox>|Promise<U>}
     */
    public getDashboardBox(rid: string): Observable<DashboardBox> {
        let query = squel.select()
            .from('DashboardBox')
            .field('*')
            .where('@rid = ?', rid)
            .toString();

        return Observable.create((observer: Observer<DashboardBox>) => {
            this.databaseService.query(query, 1, '*:3').subscribe((res: Response) => {
                let result:DashboardBox = new DashboardBox(res.json().result[0])

                observer.next(result);
                observer.complete();
            }, (ex) => {
                observer.error(ex);
                observer.complete();
            })
        });
    }

    /**
     * Update box width
     *
     * width - box width(25/50/75/100)
     * height - box height(25/50/75/100)
     * rid - @rid
     */
    public updateBoxSize(size: Object, item: DashboardBox): Observable<Object> {
        let send: Object = item.getORecord();
        send['width'] = size['width'];
        send['height'] = size['height'];
        let obj:any = {
            type: BatchType.Update,
            record: send
        };
        let options: Array<Operation> = [obj];

        return Observable.create((observer: Observer<Object>) => {
            this.databaseService.batch(options).subscribe((res) => {
                let result = JSON.parse(res['_body']);

                observer.next(result.result[0]);
                observer.complete();
            });
        });
    }

    /**
     * Delete one box
     * @param rid - box @rid
     */
    public deleteBox(box: DashboardBox) {
        let obj:any = {
            type: BatchType.Delete,
            record: box.getORecord()
        };
        let options: Array<Operation> = [obj];

        this.databaseService.batch(options).subscribe((res) => {
            console.log(res);
        });
    }

    /**
     * Batch update
     *
     * @param list - list of boxes
     */
    public batchUpdateDashboardBox(list: Array<DashboardBox>): Observable<Array<DashboardBox>> {
        let operations: Array<Operation> = [];

        for (let key in list) {
            let oRecord: Object = list[key].getORecord();

            let tmp: any = {
                type: BatchType.Update,//    Operation what we do('u' - update)
                record: oRecord
            };

            operations.push(tmp);
        }

        return Observable.create((observer: Observer<Array<DashboardBox>>) => {
            this.databaseService.batch(operations).subscribe((res) => {
                this.getDashboardBoxes().subscribe((res) => {
                    observer.next(res);
                    observer.complete();
                }, (ex) => {
                    observer.error(ex);
                    observer.complete();
                });
            });
        });
    }

    /**
     * Get dashboard box class columns
     *
     * @param route
     * @param state
     * @param id
     * @param className
     * @returns {Subscription}
     */
    public getBoxFormColumns(route: ActivatedRouteSnapshot, state: RouterStateSnapshot, id: string, className: string): Observer<EditModel>{
        this.crudService.setParentPath(route.parent.pathFromRoot);
        this.crudService.setClassName(className);

        return Observable.create((observer: Observer<EditModel>) => {
            this.crudService.databaseService.load(id)
                .then((res: Response) => {
                    let result = JSON.parse(res['_body']);
                    let model = [];
                    this.crudService.model = this.crudService.model || {};

                    if (!Object.keys(this.crudService.model).length) {
                        model.push(result);
                    }

                    this.crudService.getColumnDefs(className, false)
                        .subscribe((columnDefs) => {
                            return this.gridService.selectLinksetProperties(columnDefs.form, model)
                                .then(() => {
                                    let editModel: EditModel = {
                                        columnDefs: columnDefs,
                                        inputModel: model[0]
                                    };

                                    observer.next(editModel);
                                    observer.complete();
                                });
                        }, (error) => {
                            this.crudService.serviceNotifications.createNotificationOnResponse(error);
                            observer.error(error);
                            observer.complete();
                        });
                }, error => {
                    this.crudService.serviceNotifications.createNotificationOnResponse(error);
                    this.location.back();
                    observer.error(error);
                    observer.complete();
                });
        });
    }
}