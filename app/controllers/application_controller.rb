class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  def pagination(list)
    page = params.fetch(:page, '')
    page_number = page.empty? ? 1 : page.fetch(:number, '')
    page_size = page.empty? ? 30 : page.fetch(:size, '')
    list.paginate(page: page_number, per_page: page_size)
  end
end
