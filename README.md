# helper-methods-part-3

There is no target for this project.

Lesson: https://learn.firstdraft.com/lessons/194-helper-methods-part-3

Video: https://share.descript.com/view/mQOqBmvJmSo

Grading: https://grades.firstdraft.com/resources/f220b8c2-f61f-4297-9ee4-becfc532e5c9

Resources: https://getbootstrap.com/docs/5.3/examples/ 

***
Notes:

### A. Add boostrap CSS 

#### A1. Add nav tag

1. (1 min) Include the links to bootstrap CSS into the head tag of app/views/layouts/application.html.erb.
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

4. Customize the above script to:
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

#### A2. Add alerts

5. (8 min) Add alerts: https://getbootstrap.com/docs/5.3/components/alerts/

Change from:
```
  <div style="color: green;">
    <%= notice %>
  </div>

  <div style="color: red;">
    <%= alert %>
  </div>
```

To:
```
<div class="alert alert-success" role="alert">
  <%= notice %>
</div>
<div class="alert alert-danger" role="alert">
  <%= alert %>
</div>
```

6. (10 min) Change the above script to:

```
<% if notice.present? %>
  <div class="alert alert-success" role="alert">
    <%= notice %>
  </div>
<%end%>

<% if alert.present? %>
  <div class="alert alert-danger" role="alert">
    <%= alert %>
  </div>
<%end%>
```

7. (12 min) Add padding by enclosing body within the div container:
```
    <div class="container mt-4" >

      <% if notice.present? %>
        <div class="alert alert-success" role="alert">
          <%= notice %>
        </div>
      <%end%>

      <% if alert.present? %>
        <div class="alert alert-danger" role="alert">
          <%= alert %>
        </div>
      <%end%>

      <%= yield %>

    </div>
```

### B. Add a new column to an existing table

#### B1. Add a new column - go through RCAV

8. (16 min) Add a new column to your table:
```
rails g migration AddImageUrlToMovies image_url:string
```

output:
```
helper-methods-part-3 main % rails g migration AddImageUrlToMovies image_url:string
      invoke  active_record
      create    db/migrate/20240629045942_add_image_url_to_movies.rb
```
Then, type:
```
rails db:migrate
```

output:
```
helper-methods-part-3 main % rails db:migrate
== 20240629045942 AddImageUrlToMovies: migrating ==============================
-- add_column(:movies, :image_url, :string)
   -> 0.0024s
== 20240629045942 AddImageUrlToMovies: migrated (0.0025s) =====================

Annotated (2): app/models/movie.rb, test/fixtures/movies.yml
```

9. db/schema.rb shows that image_url column now exists.
(17.33 min)
```
  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
  end
```

10. (19 min) Another way to update your table is to modify the db/migrate/...movies table and tye in the terminal rails DB rollback, followed by rails db:migrate.

11. Go to views/movies/new.html.erb. Add a new form.
```
<div>
  <%=form.label :image_url %>
  <%=form.text_area :image_url %>
</div>
```

12. (21 min) Add a new column in the table of movies to display the image_url column in index.html.erb. HOwever, the value of image_url is not shown. why?

  - Answer: the def create method within the movies_controller.rb, params.. permit has not included image_url. Fix it to:

    ```
    def create
      movie_params = params.require(:movie).permit(:title, :description, :image_url)
      
      @movie = Movie.new(movie_params)

      if @movie.valid?
        @movie.save

        redirect_to movies_url, notice: "Movie created successfully."
      else
        render "new"
      end
    end
    ```
TIPS: ALWAYS LOOK AT YOUR SERVER LOG TO TROUBLESHOOT ISSUE.

#### B2. Refactor methods by turning certain repeating blocks into private methods.

13. **Amazing!** (22 min) Refactor into:
```
  def create
    @movie = Movie.new(self.movie_params)
    ...
  end

   def update
    @movie = Movie.find(params.fetch(:id))

    if @movie.update(self.movie_params)
      redirect_to @movie, notice: "Movie updated successfully."
    else
      render "edit"
    end
  end

  private

  def movie_params
    movie_params = params.require(:movie).permit(:title, :description, :image_url, :director_id)
  end
```

Note: 
- by functionalizing the movie params, it can be called by multiple other functions. It is a refactoring strategy.
- you are placing the def movie params at the aend and precede it with the keyword private, so it is only accessible only by the class internally.
(23 min)


### C. Refactor html templates

#### C1. separate html templates into separate files

14. (24.35 min) new.html.erb - partial view templates.

partial view templates can be distinguished from full view templates by its name:

```
app/views/zebra/_giragge.html.erb.
```

You can embed into any other html pages with:
`<%= render "zebra/giraffe" %>`

When rendering the file, you don't include the underscore in the tag.

(26 min)

15. (27 min) Refactoring strategy using partial view templates.

***

16. To keep the code length short, separate it into sections and make a separate file within views called shared/_flash_messaged.html.erb and migrate the flash message section into this file.

```
<!-- views/shared/_flash_messages.html.erb-->

<% if notice.present? %>
  <div class="alert alert-success" role="alert">
    <%= notice %>
  </div>
<%end%>

<% if alert.present? %>
  <div class="alert alert-danger" role="alert">
    <%= alert %>
  </div>
<%end%>
```

17. Replace this block within views/layouts/applications.html.erb with just `<%= render "shared/flash_messages" %>`. 

18. (27 min) Likewise, do the same for navbar, which is called within applications.html.erb with just `<%= render "shared/navbar" %>`:

```
<!-- views/shared/_navbar.html.erb-->

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

19. Likewise, refactors cdn_assets, which is called within applications.html.erb with just `<%= render "shared/cdn_assets" %>`:

```
<!-- views/shared/_cdn_assets.html.erb-->

    <!-- Make it responsive -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Connect Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

    <!-- Connect Bootstrap JavaScript and its dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Connect Font Awesome -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"></script>
```

#### C2. Place meta charset at the top

Note that the meta charset tag is not included. It is left off and moved to the uppermost of the <head> tag:

```
<!-- Expand the number of characters we can use in the document beyond basic ASCII 🎉 -->
    <meta charset="utf-8">
```

The browser needs to know at the very start which font to use before doing anything else.



### Appendix A

1. You can also pass variables into the partial view templates as follows:

```
<!-- shared/_elephant.html.erb -->

<h1> Hello <%=person%> <> </h1>
```

And

```
<!-- movies/index.html.erb -->

<render partial: "shared/elephant", locals: {person: "Alice"}>
```


Here, you are passing the variables via a hash called locals.

***
