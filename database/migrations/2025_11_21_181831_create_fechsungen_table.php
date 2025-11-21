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
        Schema::create('fechsungen', function (Blueprint $table) {
            $table->id();
            $table->string('title'); // e.g., "Das Leben vor Schlaraffia"
            $table->text('description')->nullable();
            $table->string('author')->nullable(); // e.g., "Rt. DaDa-Lust (110)"
            $table->string('author_meeting_number')->nullable(); // e.g., "110"
            $table->string('meeting_reference')->nullable(); // e.g., "zur Luega-Sippung a.U. 146"
            $table->string('image')->nullable(); // Path to preview image
            $table->string('pdf_file')->nullable(); // Path to PDF file
            $table->integer('sort_order')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('fechsungen');
    }
};
