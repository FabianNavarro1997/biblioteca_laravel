<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class TableRolSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $rols = [
            'administrador',
            'editor',
            'supervisor'
        ];
        foreach ($rols as $key => $value) {
            DB::table('rol')->insert([
                'nombre' => $value,
                'created_at' => carbon::now()->format('y-m-d H:i:s')
            ]);
        }
    }
}
