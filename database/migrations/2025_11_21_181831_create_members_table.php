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
        Schema::create('members', function (Blueprint $table) {
            $table->id();
            $table->foreignId('member_rank_id')->constrained()->onDelete('cascade');
            $table->string('name'); // e.g., "Tüftel", "Weswolf"
            $table->string('title')->nullable(); // e.g., "der experimentelle Narrenspross"
            $table->string('rank_abbreviation')->nullable(); // e.g., "OÄ.", "K.", "M."
            $table->string('shield_image')->nullable(); // Path to shield image
            $table->string('shield_thumbnail')->nullable(); // Path to thumbnail
            $table->integer('meeting_number')->nullable(); // Some members have numbers like (110), (408)
            $table->boolean('is_active')->default(true);
            $table->integer('sort_order')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('members');
    }
};
