# Use an official Ruby runtime as a parent image
FROM ruby:3.0.0

# Set the working directory in the container
WORKDIR /app

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install gems
RUN gem install bundler
RUN bundle install

# Copy the rest of the application code into the container
COPY . .

# Expose a port for the Rails application to run on (default is 3000)
EXPOSE 3001

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
