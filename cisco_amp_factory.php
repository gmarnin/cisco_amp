<?php

// Database seeder
// Please visit https://github.com/fzaninotto/Faker for more options

/** @var \Illuminate\Database\Eloquent\Factory $factory */
$factory->define(Cisco_amp_model::class, function (Faker\Generator $faker) {

    return [
        'status' => $faker->word(),
        'mode' => $faker->word(),
        'scan' => $faker->word(),
        'last_scan' => $faker->randomNumber($nbDigits = 4, $strict = false),
        'policy' => $faker->word(),
        'command_line' => $faker->word(),
        'faults' => $faker->,
        'quarantine_behavior' => $faker->word(),
        'protection' => $faker->,
        'proxy' => $faker->word(),
        'notifications' => $faker->word(),
        'last_update' => $faker->randomNumber($nbDigits = 4, $strict = false),
        'definition_version' => $faker->word(),
        'definition_last_updated' => $faker->randomNumber($nbDigits = 4, $strict = false),
        'app_version' => $faker->randomNumber($nbDigits = 4, $strict = false),
    ];
});
