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
        Schema::create('member_ranks', function (Blueprint $table) {
            $table->id();
            $table->string('name'); // e.g., "Würdenträger", "Erbwürdenträger", "Sesshafte Ritter"
            $table->string('slug')->unique();
            $table->integer('sort_order')->default(0);
            $table->text('description')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('member_ranks');
    }
};
