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
        Schema::create('meetings', function (Blueprint $table) {
            $table->id();
            $table->date('date');
            $table->integer('meeting_number')->nullable(); // e.g., 1912, 1913
            $table->string('theme')->nullable(); // e.g., "Schwarzer Humor", "Pilgerabend"
            $table->string('month_name')->nullable(); // e.g., "Lethemond", "Windmond", "Christmond"
            $table->enum('event_type', ['regular', 'schlaraffiade', 'special', 'cancelled'])->default('regular');
            $table->text('notes')->nullable(); // Additional notes
            $table->boolean('is_cancelled')->default(false);
            $table->text('cancellation_reason')->nullable(); // e.g., "fällt aus (Erntedankfest)"
            $table->integer('sort_order')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('meetings');
    }
};
