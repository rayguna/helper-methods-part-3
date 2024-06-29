# helper-methods-part-3

There is no target for this project.

Lesson: https://learn.firstdraft.com/lessons/194-helper-methods-part-3

Video: https://share.descript.com/view/mQOqBmvJmSo

Grading: https://grades.firstdraft.com/resources/f220b8c2-f61f-4297-9ee4-becfc532e5c9

Resources: https://getbootstrap.com/docs/5.3/examples/ 

***
Notes:

1. () Include the links to bootstrap CSS into the head tag of app/views/layouts/application.html.erb.
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

ref.: https://getbootstrap.com/docs/5.3/components/navbar/#how-it-works

```
<!-- app/views/layouts/application.html.erb -->

<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" aria-disabled="true">Disabled</a>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
```
(2 min)

3. Modify the link

Replace
```
<a class="navbar-brand" href="/"> Helper Method 3 </a>
```
With
```
<%= link_to "Helper Methods 3", root_path, class: "navbar-brand" %>
```

4. Simplify the above to:
```
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
      <div class="container-fluid">
        <%= link_to "Helper Methods 3", root_path, class: "navbar-brand" %>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <%= link_to "Movies", movies_path, class: "nav-link" %>
              <%# <a class="nav-link active" aria-current="page" href="#">Home</a> %>
            </li>
          </ul>
          <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
          </form>
        </div>
      </div>
    </nav>
```

5. 
