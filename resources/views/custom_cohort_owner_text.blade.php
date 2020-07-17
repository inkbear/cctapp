        
        @php $readonly = ''; @endphp
        @can('ownsCohort', $dataTypeContent)
            @php $readonly = 'readonly'; 
            @endphp
        @endcan  

        @if( isset($view) && ($view == 'edit' || $view == 'add') )
            <!-- Text  -->
            <input 
            type="text" class="form-control" 
            name="{{ $row->field }}"
            placeholder="{{ old($row->field, $options->placeholder ?? $row->getTranslatedAttribute('display_name')) }}"
            {!! isBreadSlugAutoGenerator($options) !!}
            value="{{ old($row->field, $dataTypeContent->{$row->field} ?? $options->default ?? '') }}"
            {{ $readonly }}>       
        @else
                {{ $content }}
        @endif

