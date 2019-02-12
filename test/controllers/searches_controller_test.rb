class SearchesesControllerTest < ActionDispatch::IntegrationTest
  test "should be valid github url" do
    assert_raises(Exception) {
      get search_path
    }
    assert_raises(Exception) {
      get search_path(url: 'https://google.com')
    }
    assert_raises(Exception) {
      get search_path(url: 'https://github.com')
    }
    assert_raises(Exception) {
      get search_path(url: 'https://github.com/rails')
    }
    get search_path(url: 'https://github.com/rails/rails')
    assert_response(:success)
  end
end
