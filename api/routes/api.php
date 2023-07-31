<?php

use Illuminate\Support\Facades\Route;

Route::group(['prefix' => 'v1', 'middleware' => 'throttle:1000,1'], function () {
    Route::apiResource('users', 'UserController')->only(['index', 'store']);
    // Global
    Route::group(['prefix' => 'global'], function () {
        Route::group(['prefix' => 'user', 'controller' => 'UserController'], function () {
            Route::group(['middleware' => 'auth.global'], function () {
                Route::post('logout', 'logout');
                Route::get('check-token', 'checkToken');
            });
            Route::post('login', 'login');
        });
    });

    // CMS
    Route::group(['prefix' => 'cms', 'middleware' => 'auth.admin'], function () {
        // User
        Route::apiResource('users', 'UserController');

        // Role
        Route::apiResource('roles', 'RoleController');

        // Extra
        // Route::group(['prefix' => 'extra', 'controller' => 'ExtraController'], function () {
        //     Route::get('dashboard', 'dashboard');
        //     Route::delete('delete-image/{image}', 'deleteImage');
        // });
    });

    // Web
    Route::group(['prefix' => 'web'], function () {
    });
});
