# Questions to Answer

- What technologies will you use?
- What domain knowledge do you need?
- What are the specs and acceptability requirements?

# Technologies

The API challenge is perfect for a **Rails** back-end. I am familiar with (though a little rusty at) creating APIs in Rails.

# Domain Knowledge

The sample API response seems to imply the existence of some domain objects, models, and schema. I should investigate exactly what these models and schema are, and how they relate. (Hooray, relational data modeling!)

Am I allowed to use `rails-api`? It's a gem that removes parts of a Rails project that an API-only back-end doesn't need...actually, you know what, I think I'll avoid relying on gems for this.

# Specs and Acceptability Requirements

Per the API prompt, this is the acceptance criteria for the challenge:

```markdown
Overview: Implement a basic listings RESTful API endpoint

Acceptance criteria:
- Create an API with a GET and PUT
- The listings endpoint should have the following:

##### /listings GET should return:

````
{
    "listings": {
        "uid": "BoxStore123",
        "is_active": true,
        "name": "NewBoxStoreBoston",
        "email": "boxstore@boxstore.net",
        "description": "lots of information goes here!",
        "address": "524 Harrison Ave",
        "city": "Boston",
        "state": "MA",
        "zipcode": "23462",
        "lat": "40.7143528",
        "lng": "-74.0059731",
        "phone_number": "6179557522",
        "photos": [
            {
                "id": 902348586,
                "interest_point_id": 850924880,
                "image": {
                    "url": "/uploads/photo/image/902348586/rsz_facefull.png",
                    "thumb": {
                        "url": "/uploads/photo/image/902348586/thumb_rsz_facefull.png"
                    }
                },
                "created_at": "2015-05-25T10:49:58.387Z",
                "updated_at": "2015-05-25T10:49:58.387Z",
                "name": "rsz_facefull.png"
            }
        ],
        "tag_list": [
            "tag1",
            "tag2",
            "tag3"
        ],
        "updated_at": 1432550998
    }
}

````

Note: The data that is returned can be mocked.
```

So, assuming that this is a typical REST API, we expect this API to:

- Have a `/listings` endpoint
  - That returns an index of `Listing`s as an array of JSON objects
- Model a `Listing` data object with the given (exposed) attributes:
  - UUID
  - Activity state ("is-active")
  - Name
  - Email
  - Description
  - Address
  - City
  - State
  - Zipcode
  - Latitude
  - Longitude
  - Phone number
  - Many `Photo`s, with model information nested in result
  - Many `Tag`s through a `TagList`, returning strings only (instead of fully serialized data models)
  - "Updated" timestamp
- Also model a `Photo` data object with the given (exposed) attributes:
  - ID
  - "Interest point ID" (appears to be an integer type?)
  - One `Image` data model related to the `Photo`
    - This `Image` also has a `Thumb` data object...
  - Name
  - "Created" timestamp
  - "Updated" timestamp
- Also model an `Image` data object with the given (exposed) attributes:
  - URL
  - One `Thumb` data model related to the `Image`
- Also model a `Thumb` data object with the given (exposed) attribute:
  - URL

# Questions

What is the `PUT` method on `/listings` used for? Updating a specific `Listing`? Updating all `Listing`s? Creating a `Listing`?

Am I expected to implement CRUD methods for each data model? Or is it just the one index endpoint?

Is it okay if I alter the API's response slightly to return data in a more standard, REST-like format? e.g. arrays for nested data models. I noticed that the `/listings` endpoint returns a singular JavaScript object, and typically API consumers expect an index REST endpoint to return an array (in my experience).

Am I allowed to use gems like RSpec? Or can I not use anything like that at all?

# Answers

I will be using the `rspec-rails` and `rails-api` gems to streamline development of the API. The former allows a TDD approach, since I know *what* I want but not yet *how* to do it, and the latter creates a Rails project specifically for serving as an API - I use it for every Rails API I create.

The `PUT` method is semantically used for updating a REST entity. Usually, you call the `PUT` method with `POST` parameters on an endpoint such as `/listings/123`. As per the response I received regarding the methods on the `/listings` endpoint, I will implement `GET /listings`, `GET /listings/:id`, `POST /listings`, and `PUT /listings:id`. It's a little more full-featured than the challenge calls for, but I can always scale back. (In the past, `POST` was used for updating as well as creating, but common convention recommends using `PUT` for this purpose now.)

The API's response will be slightly different from that given in the example.
