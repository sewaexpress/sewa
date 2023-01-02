<?php

use Illuminate\Auth\Notifications\VerifyEmail;
use Illuminate\Notifications\Messages\MailMessage;

class CustomVerifyEmail extends VerifyEmail
{
    public function toMail($notifiable)
    {
        $verificationUrl = $this->verificationUrl($notifiable);

        return (new MailMessage)
                    ->subject('Custom Subject')
                    ->greeting('Hello!')
                    ->line('Please click the button below to verify your email address.')
                    ->action('Verify Email Address', $verificationUrl)
                    ->line('Thank you for using our application!');
    }
}
