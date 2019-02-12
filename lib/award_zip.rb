module AwardZip
  require 'zip'
  def self.generate_zip(contributors)
    stringio = Zip::OutputStream.write_buffer do |zio|
      contributors.each_with_index do |contributor, index|
        dec_pdf = render_to_string pdf: "#{contributor}_dec.pdf",
                                   template: 'pdfs/show.html',
                                   locals: {contributor: contributor, number: index + 1},
                                   layout: 'pdf'
        zio.put_next_entry("#{contributor}_dec.pdf")
        zio << dec_pdf
      end
    end
    stringio.rewind
    stringio.sysread
  end
end
