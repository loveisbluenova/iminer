<?php

namespace App\Http\Controllers\Front;

use Illuminate\Http\Request;

use App\Http\Requests;
use Illuminate\Support\Facades\Mail;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Http\FormRequest;
use Validator;

class ContactController extends Controller
{
    public function show()
    {
        return view('contact.show');
    }

    public function send(Request $request)
    {
        $messages = [
            'email.required' => 'The Email field is required.',
            'email.email' => 'Please provide a valid email address.',
            'name.required' => 'The Full Name field is required.',
            'message.required' => 'The Message field is required.',
            // 'g-recaptcha-response.required' => 'The Recaptcha field is required.',
        ];
        $rules = [
            'email' => 'required|email',
            'name' => 'required|string',
            'message' => 'required|string',
            // 'g-recaptcha-response'=>'required|recaptcha'
        ];

        $this->validate($request, $rules, $messages);

        $fullName = $request->input('name');
        $subject = $request->input('subject');
        $email = $request->input('email');
        $body = $request->input('message');
        // var_dump($body);
        // exit();
        Mail::send('emails.inquiry.contact', [
                'from' => $fullName,
                'email' => $email,
                'body' => $body,
            ], function($m) use ($request)
            {
                $m->from($request->input('email'), $request->input('name'));
                $m->to('dev@iminers.io', 'Administrator')->subject($request->input('subject'));
            }
        );

        return redirect()->back()->with('message', 'Thanks for your feedback, we\'ll get to you asap!');
    }
}
