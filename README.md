# helper-methods-part-3

There is no target for this project.

Lesson: https://learn.firstdraft.com/lessons/194-helper-methods-part-3

Video: https://share.descript.com/view/mQOqBmvJmSo

Grading: https://grades.firstdraft.com/resources/f220b8c2-f61f-4297-9ee4-becfc532e5c9

***
Notes:

1. Include the links to bootstrap CSS into the head tag of app/views/layouts/application.html.erb.
```
<!-- app/views/layouts/application.html.erb -->

<!-- Expand the number of characters we can use in the document beyond basic ASCII 🎉 -->
<meta charset="utf-8">

<!-- Make it responsive -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Connect Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<!-- Connect Bootstrap JavaScript and its dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<!-- Connect Font Awesome -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"></script>
```

2. Add nav tag:

```
<!-- app/views/layouts/application.html.erb -->

<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <!-- ... etc., etc. -->

</nav>
```

Use link_to helper method instead:
```
<!-- ... -->
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
      <div class="container-fluid">
        <!-- <a class="navbar-brand" href="#">Navbar</a> -->

        <!-- <a class="navbar-brand" href="/">Helper Methods 3</a> -->

        <%= link_to "Helper Methods 3", root_path, class: "navbar-brand" %>

       <!-- ... -->
```
