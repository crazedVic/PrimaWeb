<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('krystallinen', function (Blueprint $table) {
            $table->id();
            $table->string('header')->nullable(); // e.g., "Sommerkrystallinen a.U. 164"
            $table->text('intro_text')->nullable(); // e.g., "Bitte erkundigt Euch..."
            $table->string('section_name')->nullable(); // e.g., "Sommerkrystallinen", "Krystallinen der Rocky Mountania"
            $table->integer('sort_order')->default(0);
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('krystallinen');
    }
};
