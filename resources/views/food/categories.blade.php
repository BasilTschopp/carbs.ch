@include('includes.header')

<div class='CategoryContainer'>

@foreach($ParentCategories as $ParentCategory)
    <div class='CategoryParentTitle'>{{ mb_strtoupper($ParentCategory->ParentCategoryName) }}</div>
   
        @foreach($ParentCategory->categories as $Category)
        	<a href='{{ url('getItems?CategoryID='.$Category->id) }}'>
            	<div class='CategoryTitle'>
            		<a href='{{ url('getItems?CategoryID='.$Category->id) }}'>{{ $Category->CategoryName }}
            	</div>
            </a>
        @endforeach

@endforeach

</div>

@include('includes.footer')
