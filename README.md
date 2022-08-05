# Quotes

### Requirements

- Ruby 2.7.5
- Rails 6.1.6
- nodejs 16.15.0 or higher
- yarn 1.22.18 or higher

#### 1. Clone the repository

```bash
git clone git@github.com:yuliatokaryk/alpha-blog.git
cd alpha-blog
```

#### 2. Install dependencies

```bash
bundle && yarn
```

#### 3. Create and setup the database

```ruby
rails db:create && rails db:migrate && rails db:seed
```

#### 4. Start the app

Visit the app at http://localhost:3000
