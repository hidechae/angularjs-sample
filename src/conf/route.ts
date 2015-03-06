/// <reference path='./app.ts' />
module olive {
    'use strict';

    appModule.config([
        '$locationProvider',
        '$stateProvider',
        '$urlRouterProvider',
        '$modalProvider',
        function(
            $locationProvider: ng.ILocationProvider,
            $stateProvider: ng.ui.IStateProvider,
            $urlRouterProvider: ng.ui.IUrlRouterProvider,
            $modalProvider: any
        ) {
            $modalProvider.options.backdrop = 'static';
            $locationProvider.html5Mode(true);

            var states = {
                'index': {
                    url: '/',
                    controller: app.IndexController,
                    templateUrl: 'assets/tpl/app/index.html'
                },
            }
        }
    ]);
}
