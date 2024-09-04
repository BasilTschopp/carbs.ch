@include('includes.header')

<form action="/items" method="POST" class="p-4 bg-light rounded shadow-sm">
    @csrf

    <div class="mb-3">
        <label for="Category" class="form-label">Kategorie</label>
        <select name="Category" id="Category" class="form-select">
            @foreach($Categories as $category)
                <option value="{{ $category->id }}">{{ $category->CategoryName }}</option>
            @endforeach
        </select>
    </div>

    <div class="mb-3">
        <label for="Name" class="form-label">Name</label>
        <input type="text" name="Name" id="Name" class="form-control">
    </div>

    <div class="mb-3">
        <label for="Carbs" class="form-label">Kohlenhydrate pro 100 g/ml</label>
        <input type="number" step="0.01" name="Carbs" id="Carbs" class="form-control">
    </div>

    <div class="mb-3">
        <label for="Sugar" class="form-label">davon Zucker pro 100 g/ml</label>
        <input type="number" step="0.01" name="Sugar" id="Sugar" class="form-control">
    </div>

    <div class="mb-3">
        <label for="Fibers" class="form-label">Ballaststoffe pro 100 g/ml</label>
        <input type="number" step="0.01" name="Fibers" id="Fibers" class="form-control">
    </div>

    <div class="mb-3">
        <label for="Fat" class="form-label">Fettgehalt pro 100 g/ml</label>
        <input type="number" step="0.01" name="Fat" id="Fat" class="form-control">
    </div>

    <button type="submit" class="btn btn-primary">Item erstellen</button>
</form>

@include('includes.footer')