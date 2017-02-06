import {
    Component,
    OnInit,
    NgModule,
    ModuleWithProviders,
    Input,
    Output,
    EventEmitter,
    ViewEncapsulation
} from "@angular/core";
import { CommonModule } from "@angular/common";
import { FormsModule } from "@angular/forms";
import { AutoCompleteModule } from "primeng/components/autocomplete/autocomplete";
import { CrudRepository } from "../../interfaces/crud-repository";
import { ActivatedRoute } from "@angular/router";

@Component({
    selector: 'one-to-one',
    encapsulation: ViewEncapsulation.None,
    templateUrl: `
        <div id="one-to-one-component">
            <p-autoComplete [ngModel]="model[subEntityService.titleColumns]" (ngModelChange)="model=$event;onSelectResource($event)"
             [suggestions]="filteredResources" (completeMethod)="filterResources($event)" [size]="30"
                [minLength]="1" [dropdown]="true" (onDropdownClick)="handleDropdownClick($event)">
                <template let-model pTemplate="item">
                    <div class="ui-helper-clearfix">
                        <div class="titleColumns">{{ model[subEntityService.titleColumns] || model['id'] }}</div>
                    </div>
                </template>
            </p-autoComplete>
        </div>
    `,
    styleUrls: ['./one-to-one.component.scss']
})
export class OneToOneComponent implements OnInit {
    // A entity service. See https://en.wikipedia.org/wiki/One-to-one_(data_model)
    @Input('mainEntityService')
    public mainEntityService: CrudRepository<any>;

    // B entity service. See https://en.wikipedia.org/wiki/One-to-one_(data_model)
    @Input('subEntityService')
    public subEntityService: CrudRepository<any>;

    @Input('propertyName')
    public propertyName: string;

    @Input()
    public model;

    @Output()
    public modelChange = new EventEmitter();

    public resources: any[] = [];

    public filteredResources: any[];

    public id: number;

    constructor(public route: ActivatedRoute) {
    }

    ngOnInit() {
        this.id = this.route.params['value'].id;
        this.model = this.model || {};

        this.subEntityService.getResources()
            .map(res => res['_embedded'][this.subEntityService.repositoryName])
            .subscribe(resources => {
                this.resources = resources;
            });
    }

    filterResources(event) {
        this.filteredResources = [];

        this.resources.forEach(i => {
            let resource = i,
                titleColumns = i[this.subEntityService.titleColumns] ? this.subEntityService.titleColumns : 'id';
            if (resource[titleColumns].toLowerCase().includes(event.query.toLowerCase())) {
                this.filteredResources.push(resource);
            }
        });
    }

    handleDropdownClick() {
        this.filteredResources = [];

        this.subEntityService.getResources()
            .map(res => res['_embedded'][this.subEntityService.repositoryName])
            .subscribe(resources => {
                this.filteredResources = resources;
            });
    }

    onSelectResource(event) {
        let _selfLink = event['_links'].self.href;

        this.mainEntityService.getResource(this.id)
            .subscribe(res => {
                res[this.propertyName] = _selfLink;

                // delete all properties of type URI
                delete res['customerUsers'];
                delete res['contacts'];

                this.mainEntityService.updateResource(this.id, res)
                    .subscribe(_res => {
                        console.log('success');
                    }, err => {
                        console.log(err);
                    });
            });
    }

}

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        AutoCompleteModule
    ],
    exports: [OneToOneComponent],
    declarations: [OneToOneComponent]
})
export class OneToOneModule {
    static forRoot(): ModuleWithProviders {
        return {
            ngModule: OneToOneModule,
            providers: []
        };
    }
}
