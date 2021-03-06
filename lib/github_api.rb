module GithubAPI
  module Contributors
    require 'net/http'

    HOST = 'https://api.github.com'
    def self.get_top_contributors(url, count = 3)
      owner, repo = get_url_parts url
      raise Exception.new('Invalid url') if repo.nil?
      contributors_url = URI("#{HOST}/repos/#{owner}/#{repo}/contributors")
      res = Net::HTTP.get_response contributors_url
      raise Exception.new('Invalid url') if res.code != '200'
      body = JSON(res.body)
      # Так как гитхаб выводит список контрибьюторов уже отсортированным, опускаем сортировку
      body.collect{|c| c["login"]}.take(count)
    end

    private
    def self.get_url_parts(url)
      raise Exception.new('Invalid url') unless url.starts_with?('https://github.com/')
      uri = URI.parse(url)
      raise Exception.new('Invalid url') if uri.path.blank?
      uri.path[1..-1].split('/')
    end
  end
end
