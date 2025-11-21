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
        Schema::create('member_contacts', function (Blueprint $table) {
            $table->id();
            $table->foreignId('member_id')->nullable()->constrained()->onDelete('cascade');
            $table->string('rank_abbreviation')->nullable(); // e.g., OÄ, OK, K, M
            $table->string('member_name'); // e.g., "Tüftel der experimentelle Narrenspross"
            $table->text('member_title_details')->nullable(); // Full title with ranks, dates, etc.
            $table->string('real_name')->nullable(); // e.g., "RUBBA Klaus (Maki)"
            $table->string('profession')->nullable(); // e.g., "Informatiker"
            $table->date('birth_date')->nullable(); // e.g., "18.6.1974"
            $table->text('address')->nullable();
            $table->string('phone_home')->nullable();
            $table->string('phone_cell')->nullable();
            $table->string('phone_fax')->nullable();
            $table->string('email')->nullable();
            $table->string('category')->nullable(); // e.g., "WÜRDENTRÄGER", "ERBWÜRDENTRÄGER", "SESSHAFTE RITTER", etc.
            $table->integer('sort_order')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('member_contacts');
    }
};
