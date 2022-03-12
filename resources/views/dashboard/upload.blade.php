<form method="POST" action="http://localhost:8888/buy-and-sell-2/api/products" enctype="multipart/form-data" class="adpost-form">
    @csrf
    <div class="form-group"><label class="form-label">Product photos</label>
        <input type="file" id="input-b6a" name="images[]" required
            accept=".jpeg,.jpg,.png,.gif" required
            data-allowed-file-extensions='["jpeg", "jpg","png","gif"]' multiple>
    </div>

 <button type="submit">submit</button>
</form>