/// <reference-path="../_all.d.ts" />
module olive.app {
    export interface IIndexScope extends ng.IScope {
    }

    export class IndexController {
        static $inject = [
            '$scope'
        ];

        constructor(
            private $scope: IIndexScope
        ) {
            console.log('aaaa');
        }
    }
}
