class GithubController < ApplicationController
  load_and_authorize_resource

  def authorize
    github = Github.new :client_id => '6aad652b8fdf192d6a09', :client_secret => '095cdc9c9337cff345e43610b334a0db0c97a196'
    address = github.authorize_url :redirect_uri => 'http://localhost:3000', :scope => 'repo'
    redirect_to address
  end

  def callback
    authorization_code = params[:code]
    token = github.get_token authorization_code
    access_token = token.token
  end

	def index
		@github = Github.new
		@commit_list = @github.repos.commits.list 'brianpetro', 'aeh'
	end

	def show
		@sha = params[:sha]
		github = Github.new
		@commit = github.git_data.commits.get 'brianpetro', 'aehalo', @sha
	end
end
