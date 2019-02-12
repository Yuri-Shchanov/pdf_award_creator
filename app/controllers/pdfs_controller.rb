class PdfsController < ApplicationController

  def show
    respond_to do |format|
      format.pdf do
        render template: 'pdfs/show.html.erb',
               layout: 'pdf',
               pdf: 'show',
               locals: {contributor: params[:contributor], number: params[:number]}
      end
    end
  end

  def zip
    respond_to do |format|
      format.zip do
        @contributors = GithubAPI::Contributors.get_top_contributors(params[:url])
        data = AwardZip::generate_zip(@contributors)
        send_data(data, :type => 'application/zip', :filename => "test_dec_page.zip")
      end
    end
  end
end