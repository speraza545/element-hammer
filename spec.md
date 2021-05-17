Use the Ruby on Rails framework.

Your models must:

[x] Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships

user and faction each has_many user factions

user has_many factions through user_faction

faction has many users through user_faction

[x] Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user

Join table allows submission of an army name

[x] Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.

emails must be unique as well as army names. Both pop up errors if one tries to ignore that. Also pops up errors for wrong passwords.

[x] You must include at least one class level ActiveRecord scope methodLinks to an external site.. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methodsLinks to an external site. within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).

I have a scope method that limits the return of factions by 100, as well as then organizes the armies associated with the user alphabetically.

[x] Your application must provide standard user authentication, including signup, login, logout, and passwords.

users can sign up on the site or have the option to login or signup with google

[x] Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...

users can sign up on the site or have the option to login or signup with google



[x] You must include and make use of a nested resource with the appropriate RESTful URLs.

• You must include a nested new route with form that relates to the parent resource

• You must include a nested index or show route

Your forms should correctly display validation errors.

user_factions is nested in user. There is a new user_factions form, edit user_factions form, and a show user_factions form


[x] Your fields should be enclosed within a fieldswitherrors class

my error helper works in this fashion.

[x] Error messages describing the validation failures must be present within the view.

explains whether email is taken, password is wrong, or army name is taken

[x] Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.

it is fairly dry, most code that is repeated in ways that can be extrapolated have been.

[x] Logic present in your controllers should be encapsulated as methods in your models.

admin logic is stored in the users model.

[x] Your views should use helper methods and partials when appropriate.

helper methods are used for error handling

helper methods also (when it made sense) reference the models for functionality as well.

[x] Follow patterns in the Rails Style GuideLinks to an external site. and the Ruby Style GuideLinks to an external site..

[x] Do not use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding.

everything was written by me. No generators used as I appreciated the full learning experience this provided me.