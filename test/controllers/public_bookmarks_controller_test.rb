require 'test_helper'

class PublicBookmarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @public_bookmark = public_bookmarks(:one)
  end

  test "should get index" do
    get public_bookmarks_url
    assert_response :success
  end

  test "should get new" do
    get new_public_bookmark_url
    assert_response :success
  end

  test "should create public_bookmark" do
    assert_difference('PublicBookmark.count') do
      post public_bookmarks_url, params: { public_bookmark: { description: @public_bookmark.description, submitter_email: @public_bookmark.submitter_email, title: @public_bookmark.title, url: @public_bookmark.url } }
    end

    assert_redirected_to public_bookmark_url(PublicBookmark.last)
  end

  test "should show public_bookmark" do
    get public_bookmark_url(@public_bookmark)
    assert_response :success
  end

  test "should get edit" do
    get edit_public_bookmark_url(@public_bookmark)
    assert_response :success
  end

  test "should update public_bookmark" do
    patch public_bookmark_url(@public_bookmark), params: { public_bookmark: { description: @public_bookmark.description, submitter_email: @public_bookmark.submitter_email, title: @public_bookmark.title, url: @public_bookmark.url } }
    assert_redirected_to public_bookmark_url(@public_bookmark)
  end

  test "should destroy public_bookmark" do
    assert_difference('PublicBookmark.count', -1) do
      delete public_bookmark_url(@public_bookmark)
    end

    assert_redirected_to public_bookmarks_url
  end
end
