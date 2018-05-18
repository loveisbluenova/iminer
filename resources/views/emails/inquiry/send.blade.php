@component('mail::message')

# Inquiry Message from the website

## Name : {{ $from }}

## Email : {{ $email }}

## Message : {{ $message }}

Thanks,<br>
{{ config('app.name') }} Team
@endcomponent
