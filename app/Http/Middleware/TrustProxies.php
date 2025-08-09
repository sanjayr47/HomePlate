<?php

namespace App\Http\Middleware;

use Fideloper\Proxy\TrustProxies as Middleware;
use Illuminate\Http\Request;

class TrustProxies extends Middleware
{
    /**
     * Trust DO’s edge proxy/load balancer.
     * Use "*" so X-Forwarded-* headers are honored.
     */
    protected $proxies;

    public function __construct()
    {
        // You can override with TRUSTED_PROXIES in .env if needed.
        $this->proxies = env('TRUSTED_PROXIES', '*');
    }

    /**
     * Use all X-Forwarded-* headers so Laravel knows the original scheme/host.
     */
    protected $headers = Request::HEADER_X_FORWARDED_ALL;
}
