<?php

namespace App\Providers;

use App\Models\Document;
use App\Models\User;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //só pode deletar seus proprios documentos
        Gate::define('delete-document', function (User $user, Document $document){
            return $user->id === $document->user_id;

        });

    }
}
