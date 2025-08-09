<?php

namespace App\Providers;

use Exception;
use App\Traits\AddonHelper;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Sheet;
use App\CentralLogics\Helpers;
use App\Traits\ActivationClass;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\URL;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Redirect;

// ini_set('memory_limit', '512M');
ini_set("memory_limit",-1);
class AppServiceProvider extends ServiceProvider
{
    use ActivationClass,AddonHelper;

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {


    }

    /**
     * Bootstrap any application services.
     *
     */
    public function boot(Request $request)
{
    // Force https when behind a proxy in prod (or when FORCE_HTTPS=true)
    if (app()->environment('production')) {
        $forwardedProtoIsHttps = strtolower((string) $request->headers->get('x-forwarded-proto')) === 'https';

        if ($forwardedProtoIsHttps || env('FORCE_HTTPS', true)) {
            \Illuminate\Support\Facades\URL::forceScheme('https');
        }

        // Ensure URL::asset() etc. build absolute https URLs from APP_URL
        if ($appUrl = config('app.url')) {
            \Illuminate\Support\Facades\URL::forceRootUrl($appUrl);
        }
    }

    if (!\Illuminate\Support\Facades\App::runningInConsole()) {
        \Illuminate\Support\Facades\Config::set('addon_admin_routes', $this->get_addon_admin_routes());
        \Illuminate\Support\Facades\Config::set('get_payment_publish_status', $this->get_payment_publish_status());
        \Illuminate\Support\Facades\Config::set('default_pagination', 25);
        \Illuminate\Pagination\Paginator::useBootstrap();

        try {
            foreach (\App\CentralLogics\Helpers::get_view_keys() as $key => $value) {
                view()->share($key, $value);
            }
        } catch (\Exception $e) {
            // swallow
        }
    }
}

}
