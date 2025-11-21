<?php

use App\Http\Controllers\HomeController;
use App\Http\Controllers\MemberController;
use App\Http\Controllers\MeetingController;
use App\Http\Controllers\FechsungController;
use App\Http\Controllers\PageController;
use Illuminate\Support\Facades\Route;

Route::get('/', [HomeController::class, 'index'])->name('home');
Route::get('/wappen', [MemberController::class, 'index'])->name('members.index');
Route::get('/fechsungen', [FechsungController::class, 'index'])->name('fechsungen.index');
Route::get('/sippungsfolge', [PageController::class, 'show'])->name('pages.sippungsfolge');
Route::get('/privat/sassenschaft', [PageController::class, 'show'])->name('pages.sassenschaft');
// Route for privat files (images, PDFs) - must come after sassenschaft
Route::get('/privat/{file}', function($file) {
    // Don't serve sassenschaft.html through this route
    if ($file === 'sassenschaft.html') {
        abort(404);
    }
    $path = storage_path('app/public/privat/' . $file);
    if (file_exists($path)) {
        return response()->file($path);
    }
    abort(404);
})->where('file', '.*');
Route::get('/krystallinen', [PageController::class, 'show'])->name('pages.krystallinen');
Route::get('/{slug}', [PageController::class, 'show'])->name('pages.show')->where('slug', '^(?!admin|wappen|sippungsfolge|fechsungen|privat|krystallinen).*$');
