<?php

namespace App\Services\Extra;

use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Response;
use Carbon\Carbon;
use App\Models\{
    Appointment,
    Inquiry,
    Subscribe,
    Image
};
use App\Traits\GlobalTrait;
use \stdClass;
use GuzzleHttp\Client;

class ExtraService
{
    /**
     * @var GlobalTrait
     */
    use GlobalTrait;


    /**
     * ExtraService dashboard
     * @return Response
     */
    public function dashboard (): Response
    {
        $appointments = Appointment::get()->count();
        $inquiries = Inquiry::get()->count();
        $subscribes = Subscribe::get()->count();
        $records = [
            (object) [
                'title' => 'Appointment',
                'link'  => '/inquiries/appointment',
                'count' => $appointments
            ],
            (object) [
                'title' => 'Contact Us',
                'link'  => '/inquiries/contact-us',
                'count' => $inquiries
            ],
            (object) [
                'title' => 'Subscribe',
                'link'  => '/inquiries/subscribe',
                'count' => $subscribes
            ]
        ];

        return response([
            'records' => $records
        ]);
    }

    /**
     * ExtraService verifyCaptcha
     * @param  Request $request
     * @return Object
     */
    public function verifyCaptcha ($request): Object
    {
        $captcha = $request->response;

        $client = new Client([
            'base_uri' => 'https://google.com/recaptcha/api/',
            'timeout' => 5.0
        ]);

        $response = $client->request('POST', 'siteverify', [
            'query' => [
                'secret' => "6LfKypwiAAAAANnzdHoMpbK0kVf0aaK3O-k7Fk9H",
                'response' => $captcha
            ]
        ]);

        return $response->getBody();
    }


    /**
     * ExtraService deleteImage
     * @param  Image $image
     * @param  Request $request
     * @return Response
     */
    public function deleteImage ($image, $request): Response
    {
        $disk = 'public';
        $path = explode('uploads', $image->path);
        $path_resized = explode('uploads', $image->path_resized);
        Storage::disk($disk)->delete("uploads$path[1]");
        Storage::disk($disk)->delete("uploads$path_resized[1]");

        $image->forceDelete();

        return response([
            'record' => $path
        ]);
    }
}