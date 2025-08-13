<?php

use App\CentralLogics\Helpers;

// Get storage settings from database
$localStorageStatus = 1;
$s3Credentials = [];

try {
    $localStorageStatus = Helpers::get_business_settings('local_storage') ?? 1;
    $s3Credentials = Helpers::get_business_settings('s3_credential') ?? [];
} catch (\Exception $e) {
    // Fallback during migrations or when database is not available
}

return [
    'default' => ($localStorageStatus == 0 && !empty($s3Credentials)) ? 's3' : 'local',

    'disks' => [
        'local' => [
            'driver' => 'local',
            'root' => storage_path('app'),
            'url' => env('APP_URL').'storage/app',
        ],

        'public' => [
            'driver' => 'local',
            'root' => storage_path('app/public'),
            'url' => env('APP_URL').'storage/public',
            'visibility' => 'public',
        ],

        's3' => [
            'driver' => 's3',
            'key' => $s3Credentials['key'] ?? env('AWS_ACCESS_KEY_ID'),
            'secret' => $s3Credentials['secret'] ?? env('AWS_SECRET_ACCESS_KEY'),
            'region' => $s3Credentials['region'] ?? env('AWS_DEFAULT_REGION'),
            'bucket' => $s3Credentials['bucket'] ?? env('AWS_BUCKET'),
            'url' => $s3Credentials['url'] ?? env('AWS_URL'),
            'endpoint' => $s3Credentials['end_point'] ?? env('AWS_ENDPOINT'),
        ],
    ],

    'links' => [
        public_path('storage') => storage_path('app/public'),
    ],
];
