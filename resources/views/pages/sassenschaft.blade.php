@extends('layouts.app')

@section('content')
<div id="sassencontent">
    @if($page->content && trim(strip_tags($page->content)))
        {!! $page->content !!}
    @else
        @foreach($contacts as $category => $categoryContacts)
        <table class="{{ $loop->first ? '' : 'l2' }}">
            <thead>
                <tr>
                    <th></th>
                    <th>{{ $category }}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($categoryContacts as $contact)
                    <tr>
                        <td class="sas1">{{ $contact->rank_abbreviation ?? '' }}</td>
                        <td class="sas2">
                            <p>
                                <span class="b">{{ $contact->member_name }}{!! $contact->member_title_details ? ', ' . e($contact->member_title_details) : '' !!}</span>
                            </p>
                            @if($contact->real_name)
                                <p>
                                    {{ $contact->real_name }}
                                    @if($contact->profession)
                                        , {{ $contact->profession }}
                                    @endif
                                    @if($contact->birth_date)
                                        ({{ $contact->birth_date->format('j.n.Y') }})
                                    @endif
                                </p>
                            @endif
                            @if($contact->address)
                                <p>{{ $contact->address }}</p>
                            @endif
                            @if($contact->phone_home || $contact->phone_cell || $contact->phone_fax)
                                <p>
                                    T: 
                                    @if($contact->phone_home)
                                        {{ preg_replace('/(\d{3})(\d{3})(\d{4})/', '$1-$2-$3', $contact->phone_home) }} (Hb)
                                    @endif
                                    @if($contact->phone_cell)
                                        {{ preg_replace('/(\d{3})(\d{3})(\d{4})/', '$1-$2-$3', $contact->phone_cell) }} (Cell)
                                    @endif
                                    @if($contact->phone_fax)
                                        {{ preg_replace('/(\d{3})(\d{3})(\d{4})/', '$1-$2-$3', $contact->phone_fax) }} (Fb)
                                    @endif
                                </p>
                            @endif
                            @if($contact->email)
                                <p>e-mail: <a href="mailto:{{ $contact->email }}">{{ $contact->email }}</a></p>
                            @endif
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        @endforeach
    @endif
</div>

<style>
#sassencontent table {
    text-align: center;
}

#sassencontent table tbody tr {
    border: 1px solid #999;
    margin-bottom: 0.5rem;
}

#sassencontent table tbody tr td {
    padding: 0.5rem;
}
</style>
@endsection

