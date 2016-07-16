# Revue

Find your next favorite venue for music, comedy, poetry, or theater.

![Build Status](https://codeship.com/projects/84a64250-250a-0134-b9d2-7683f31e7ecf/status?branch=master)
![Code Climate](https://codeclimate.com/github/rwhitten577/revue.png)
![Coverage Status](https://coveralls.io/repos/rwhitten577/revue/badge.png)

Authors:

[Rachel Adler](https://github.com/raadler)
[Kristin Ruben](https://github.com/kristinruben)
[Mike Jacques](https://github.com/michael-jacques)
[Ryan Whitten](https://github.com/rwhitten577)

Revue is a Ruby on Rails application that allows users to view, add, and review their favorite venues. Users can view a live-updating list of venues on the homepage and choose to add their own.

Users may also select a venue from the homepage, which brings them to the details page for that venue. On this page, viewers will see reviews for the venue, and can write their own if desired. Users can also upvote and downvote each review, which changes the order of the reviews to show the most helpful review for the venue first.

Administrators can moderate the site by deleting and editing venues and reviews.

This application can be seen at https://revue-app.herokuapp.com

## Setup

To run the app locally, run the following commands:

```no-highlight
$ git clone https://github.com/rwhitten577/revue.git
$ cd revue
$ bundle
```

If this is the first time running the app, you will also need to create a development and test database:

```no-highlight
$ rake db:setup
```

Open the `.env` file to edit the environment variables:

```no-highlight
AWS_ACCESS_KEY=
AWS_SECRET_KEY=
S3_BUCKET=
```

The `AWS_ACCESS_KEY`, `AWS_SECRET_KEY`, and `S3_BUCKET` are used when uploading user photos to Amazon S3.

## ERD

![Revue ERD](http://oi66.tinypic.com/f44kra.jpg)
