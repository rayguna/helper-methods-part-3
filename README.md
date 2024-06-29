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
    <div class="container mt-3" >

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
`<%= render partial: "zebra/giraffe" %>`

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

17. Replace this block within views/layouts/applications.html.erb with just `<%= render partial: "shared/flash_messages" %>`. 

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

19. Likewise, refactors cdn_assets, which is called within applications.html.erb with just `<%= render partial: "shared/cdn_assets" %>`:

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

### D. Refactor codes

#### D1. Move form tag within movies/new.tml.erb.

1. (32 min) Migrate form tag into a partial view template called _form.html.erb. Call it from movies/new.html.erb with `<%= render partial: "movies/form" %>`.

```
<!-- movies/_form.html.erb -->

<% @movie.errors.full_messages.each do |message| %>
  <p style="color: red;"><%= message %></p>
<% end %>

<%= form_with(model: @movie, data: { turbo: :false }) do |form| %>
  <div>
    <%= form.label :title %>
    <%= form.text_field :title %>
  </div>

  <div>
    <%= form.label :description %>
    <%= form.text_area :description %>
  </div>

  <div>
    <%=form.label :image_url %>
    <%=form.text_area :image_url %>
  </div>

  <div>
    <%= form.submit %>
  </div>
<% end %>
```

### E. Passing variables via <% render partial:... %>
(37 min)

#### E1. views/movies/_form.html.erb
partial view templates pass html scripts between html files.

1. You can pass the variables from _form.html.erb to new.html.erb via a variable called, e.g., foo. Foo is an iterable object.

```
<!-- new.html.erb -->

<h1>New movie</h1>

<%= render partial: "movies/form", locals: {foo: @movie} %>
```

Here is the shorthand:

```
<!-- new.html.erb -->

<h1>New movie</h1>

<%= render: "movies/form", foo: @movie %>
```
(36 min)
In the above, @movie is a table object

Here is the corresponding script for movies/_form.html.erb

```
<% @movie.errors.full_messages.each do |message| %>
  <p style="color: red;"><%= message %></p>
<% end %>

<%= form_with(model: @movie, data: { turbo: :false }) do |form| %>
  <div>
    <%= form.label :title %>
    <%= form.text_field :title %>
  </div>

  <div>
    <%= form.label :description %>
    <%= form.text_area :description %>
  </div>

  <div>
    <%=form.label :image_url %>
    <%=form.text_area :image_url %>
  </div>

  <div>
    <%= form.submit %>
  </div>
<% end %>
```

Instance variables that are defined in the action controller are available in the view and any partials granted by that view. Therefore, @movie can be called in movies/new.html.erb.

(34 min)

#### E2. Let's pass instance variables around with specific names
**Amazing!**
We will utilize the fact that: 
- instance variables that are defined in the movies_controller are accessible by the forms and the partial html files for refactorig purposes.
- The new movie and edit movie forms are exactly the same, except that they maipulate different objects.
- Hence, we refactor _form.html.erb as partial view template with the object being referred to as a variable called foo, which we can pass as either @new_movie or @the_movie objects.

1. Within movies_controller.rb:
rename #movie to @new_movie and @the_movie, respectively for def new and def edit to differentiate. Remember that any instance variables defined here can be accessed by the files within views.

```
def new
  @new_movie = Movie.new
end

def edit
  @the_movie = Movie.find(params.fetch(:id))
end
```

2. Correspondingly, rename the reference to the instance variable @movie within _form.html.erb to an arbitrary variable called foo as follows:

```
<!-- _form.html.erb -->

<% foo.errors.full_messages.each do |message| %>
  <p style="color: red;"><%= message %></p>
<% end %>

<%= form_with(model: foo, data: { turbo: :false }) do |form| %>
  <div>
    <%= form.label :title %>
    <%= form.text_field :title %>
  </div>

  <div>
    <%= form.label :description %>
    <%= form.text_area :description %>
  </div>

  <div>
    <%=form.label :image_url %>
    <%=form.text_area :image_url %>
  </div>

  <div>
    <%= form.submit %>
  </div>
<% end %>
```
3. Having made the above changes, we can flexibly call the now universal _form.html.erb template from new.html.erb and edit.html.erb, as follows.

```
<!-- new.html.erb -->

<h1>New movie</h1>

<%= render partial: "movies/form", locals: {foo: @new_movie } %>
```

And

```
<!-- edit.html.erb -->

<h1>Edit movie</h1>

<%= render partial: "movies/form", locals: {foo: @the_movie } %>
```

### F. Create a new column
(37min)

#### F1. Add a date column called released_on

1. Type in the terminal: `rails g migration AddReleasedOnToMovies released_on:date` (Rails).

```
helper-methods-part-3 main % rails g migration AddReleasedOnToMovies released_on:date
      invoke  active_record
      create    db/migrate/20240629152130_add_released_on_to_movies.rb
```

Then, type:
```
rails db:migrate
```

2. Subsequently, you need to add this new variable into: 
  - the list of permitted variables within def movie_params method to be accessible (Controller).
  - the _form.html.erb (Views) 

```
<!-- _form.html.erb -->
  <div>
    <%=form.label :released_on %>
    <%=form.date_select :released_on %>
  </div>
```

### G. Beautify the movie details page

#### G1. Bootstrap cards for show page

1. Initial code:

```
<!-- app/view/movies/show.html.erb -->

<div>
  <div>
    <h1>
      Movie #<%= @movie.id %> details
    </h1>

    <div>
      <div>
        <%= link_to "Go back", movies_path %>
      </div>

      <div>
        <%= link_to "Edit Movie", edit_movie_path(@movie) %>
      </div>

      <div>
        <%= link_to "Delete Movie", @movie, data: { turbo_method: :delete } %>
      </div>
    </div>

    <dl>
      <dt>
        Title
      </dt>
      <dd>
        <%= @movie.title %>
      </dd>

      <dt>
        Description
      </dt>
      <dd>
        <%= @movie.description %>
      </dd>

      <dt>
        Created at
      </dt>
      <dd>
        <%= time_ago_in_words(@movie.created_at) %> ago
      </dd>

      <dt>
        Updated at
      </dt>
      <dd>
        <%= time_ago_in_words(@movie.updated_at) %> ago
      </dd>
    </dl>
  </div>
</div>
```

copy and paste the following code into show.html.erb:

```
<div class="card">
  <div class="card-header">
    <%= link_to "Movie ##{@movie.id}", @movie %>
  </div>

  <div class="card-body">
    <dl>
      <dt>
        Title
      </dt>
      <dd>
        <%= @movie.title %>
      </dd>

      <dt>
        Description
      </dt>
      <dd>
        <%= @movie.description %>
      </dd>
    </dl>

    <div class="row">
      <div class="col">
        <div class="d-grid">
          <%= link_to edit_movie_path(@movie), class: "btn btn-outline-secondary" do %>
            <i class="fa-regular fa-pen-to-square"></i>
          <% end %>
        </div>
      </div>
      <div class="col">
        <div class="d-grid">
          <%= link_to @movie, data: { turbo_method: :delete }, class: "btn btn-outline-secondary" do %>
            <i class="fa-regular fa-trash-can"></i>
          <% end %>
        </div>
      </div>
    </div>
  </div>

  <div class="card-footer">
    Last updated <%= time_ago_in_words(@movie.updated_at) %> ago
  </div>
</div>
```

2. (40 min - 45 min) Bootstrap card formatting. Write the grid first, then put the contents into each cell. 

#### G2. Movies index page - index.html.erb

1. (45 min - 46 min) Reduce the code from:

```
<h1>
  List of all movies
</h1>

<hr>

<!--<%= render "zebra/giraffe" %>-->

<div>
  <%= link_to "Add a new movie", new_movie_path %>
</div>

<hr>

<table>
  <tr>
    <th>
      ID
    </th>

    <th>
      Title
    </th>

    <th>
      Description
    </th>

    <th>
      image_url
    </th>

    <th>
      Created at
    </th>

    <th>
      Updated at
    </th>

    <th>
    </th>
  </tr>

  <% @movies.each do |movie| %>
  <tr>
    <td>
      <%= movie.id %>
    </td>

    <td>
      <%= movie.title %>
    </td>

    <td>
      <%= movie.description %>
    </td>

    <td>
      <%= movie.image_url %>
    </td>

    <td>
      <%= time_ago_in_words(movie.created_at) %> ago
    </td>
    <td>
      <%= time_ago_in_words(movie.updated_at) %> ago
    </td>

    <td>
      <%= link_to "Show details", movie %>
    </td>
  </tr>
  <% end %>
</table>
```

To using partial:

```
<!-- app/views/movies/_movie_card.html.erb -->

<div class="col-md-3">
  <div class="card">
    <div class="card-header">
      <%= link_to "Movie ##{movie.id}", movie %>
    </div>

    <div class="card-body">
      <dl>
        <dt>
          Title
        </dt>
        <dd>
          <%= movie.title %>
        </dd>

        <dt>
          Description
        </dt>
        <dd>
          <%= movie.description %>
        </dd>
      </dl>

      <div class="row">
        <div class="col">
          <div class="d-grid">
            <%= link_to edit_movie_path(movie), class: "btn btn-outline-secondary" do %>
              <i class="fa-regular fa-pen-to-square"></i>
            <% end %>
          </div>
        </div>
        <div class="col">
          <div class="d-grid">
            <%= link_to movie, data: { turbo_method: :delete }, class: "btn btn-outline-secondary" do %>
              <i class="fa-regular fa-trash-can"></i>
            <% end %>
          </div>
        </div>
      </div>
    </div>

    <div class="card-footer">
      Last updated <%= time_ago_in_words(movie.updated_at) %> ago
    </div>
  </div>
</div>
```

call the above partial from: 

```
<!-- index.html.erb -->

<h1>
  List of all movies
</h1>

<hr>

<div>
  <%= link_to "Add a new movie", new_movie_path %>
</div>

<hr>

  <div class="row">
    <% @movies.each do |movie| %>
      <%= render partial: "movies/movie_card", locals: { movie: movie } %>
    <% end %>
  </div>
</div>
```
Note: 
- the use of columns in the above codes.
- an instance variable is being passed in the render partial tag as: `<%= render partial: "movies/movie_card", locals: { movie: movie } %>`.

(47 min) refactor with _movie_card.html.erb partial.


### G3. Refactors show.html.erb - 49 min



```

### Appendix A

1. You can also pass variables into the partial view templates as follows:

```
<!-- shared/_elephant.html.erb -->

<h1> Hello, <%=person%>! </h1>
```

And

```
<!-- movies/index.html.erb -->

<render partial: "shared/elephant", locals: {person: "Alice"}>
```


Here, you are passing the variables via a hash called locals.

***
