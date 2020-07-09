<?php

use munkireport\models\MRModel as Eloquent;

class Cisco_amp_model extends Eloquent
{
    protected $table = 'cisco_amp';

    protected $hidden = ['id', 'serial_number'];

    protected $fillable = [
      'serial_number',
      'status',
      'mode',
      'scan',
      'last_scan',
      'policy',
      'command_line',
      'faults',
      'quarantine_behavior',
      'protection',
      'proxy',
      'notifications',
      'last_update',
      'definition_version',
      'definition_last_updated',
      'app_version',

    ];
}
