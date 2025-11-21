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
        Schema::create('krystalline_entries', function (Blueprint $table) {
            $table->id();
            $table->foreignId('krystallinen_id')->constrained('krystallinen')->onDelete('cascade');
            $table->date('date')->nullable(); // e.g., "10.6.164"
            $table->text('description')->nullable(); // e.g., "Krystalline in der Heimburg von Ritter Beton-Narr"
            $table->string('time')->nullable(); // e.g., "Glock 2 am Mittag"
            $table->string('lageplan_file')->nullable(); // Image or PDF file path
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
        Schema::dropIfExists('krystalline_entries');
    }
};
