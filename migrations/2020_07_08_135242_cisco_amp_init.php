<?php
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Capsule\Manager as Capsule;

class CiscoAmpInit extends Migration
{
    public function up()
    {
        $capsule = new Capsule();
        $capsule::schema()->create('cisco_amp', function (Blueprint $table) {
            $table->increments('id');
            $table->string('serial_number');
            $table->string('status')->nullable();
            $table->string('mode')->nullable();
            $table->string('scan')->nullable();
            $table->integer('last_scan')->nullable();
            $table->string('policy')->nullable();
            $table->string('command_line')->nullable();
            $table->text('faults')->nullable();
            $table->string('quarantine_behavior')->nullable();
            $table->text('protection')->nullable();
            $table->string('proxy')->nullable();
            $table->string('notifications')->nullable();
            $table->integer('last_update')->nullable();
            $table->string('definition_version')->nullable();
            $table->integer('definition_last_updated')->nullable();
            $table->integer('app_version')->nullable();


            $table->unique('serial_number');
            $table->index('mode');
            $table->index('scan');
            $table->index('last_scan');
            $table->index('policy');

        });
    }
    
    public function down()
    {
        $capsule = new Capsule();
        $capsule::schema()->dropIfExists('cisco_amp');
    }
}
