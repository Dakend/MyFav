require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  let!(:user) { create(:user, name: 'Alice') }
  let!(:post) { create(:post, user: user, title: '個人的べストライブin2020') }
  before do
    create_list(:movie, 4, post: post)
  end

  describe 'Post Card View' do
    before do
      visit root_path
    end

    it 'display items' do
      expect(all('.card-img__cont').size).to eq(4)
      expect(page).to have_selector '.info-header__icon'
      expect(page).to have_selector '.info-header__ttl', text: '個人的べストライブin2020'
      expect(page).to have_selector '.section-1__favorite-logo'
      expect(page).to have_selector '.section-1__username', text: 'Alice'
    end

    context 'when push post-card' do
      it 'complete redirect post-show-page' do
        find('.post-card').click
        expect(current_path).to eq post_path(post)
      end
    end
  end

  describe 'Post Favorite/Bookmark Delete View ' do
    context 'when posted-user is login' do
      it 'display delete-item and not display bookmark-item' do
        login(user)
        visit post_path(post)
        expect(page).to have_selector '.post-show-content-head__info-delete-logo'
        expect(page).to_not have_selector '.post-show-content-head__info-bookmark-logo'
      end
    end

    context 'when not-posted-user is login' do
      it 'display not delete-item and display bookmark-item' do
        other_user = create(:user, name: 'Taylor', email: 'taylor@example.com')
        login(other_user)
        visit post_path(post)
        expect(page).to_not have_selector '.post-show-content-head__info-delete-logo'
        expect(page).to have_selector '.post-show-content-head__info-bookmark-logo'
      end
    end
  end

  describe 'Post Create Function' do
    context 'when input valid contents' do
      it 'complete post and display items' do
        login(user)
        find('#modal-post-open').click
        fill_in '投稿記事のタイトル*', with: '2020年心が震えたスポーツ名場面4選'
        fill_in '投稿記事の説明 #ハッシュタグも付けてみよう！', with: '個人的に心が震えたスポーツ名場面を4つ選びました！是非、みなさんも見て下さい！ #2020年スポーツ名場面 #心震える名場面'
        fill_in 'おすすめ動画#1 YouTube動画URL*', with: 'https://www.youtube.com/watch?v=osxRYKeoWTo&t=501s'
        fill_in 'post_form_movie_content_1', with: '洗練された堀口恭司のカーフキックとリベンジ成功と悔しがる朝倉海は見応えありです！'
        fill_in 'おすすめ動画#2 YouTube動画URL*', with: 'https://www.youtube.com/watch?v=XxxlkINbMls'
        fill_in 'post_form_movie_content_2', with: 'コロナ渦での羽生結弦が魅せてくれた演技は感動ものでした！'
        fill_in 'おすすめ動画#3 YouTube動画URL*', with: 'https://www.youtube.com/watch?v=EyEKsLI4ZEQ&t=2s'
        fill_in 'post_form_movie_content_3', with: 'パリーグ新人王の平とホームラン王の浅村との力と力のガチンコ勝負は痺れます！'
        fill_in 'おすすめ動画#4 YouTube動画URL*', with: 'https://www.youtube.com/watch?v=tw-G2nMnM8A'
        fill_in 'post_form_movie_content_4', with: 'サムベネットのシャンゼリゼでの最終スプリントは印象に残りました。'
        click_button '投稿'
        sleep 2
        expect(page).to have_content '投稿が完了しました。'
        expect(all('.post-show-content-head__card-flame-img').size).to eq(4)
        expect(all('.post-movie-content__img-cont').size).to eq(4)
        expect(all('.post-movie-content__ttl').size).to eq(4)
        expect(page).to have_selector '.relation-flame', text: '#2020年スポーツ名場面'
        expect(page).to have_selector '.relation-flame', text: '#心震える名場面'
        expect(page).to have_selector '.post-tag', text: '#2020年スポーツ名場面'
        expect(page).to have_selector '.post-tag', text: '#心震える名場面'
        expect(page).to have_content 'Alice'
        expect(page).to have_content '2020年心が震えたスポーツ名場面4選'
        expect(page).to have_content '洗練された堀口恭司のカーフキックとリベンジ成功と悔しがる朝倉海は見応えありです！'
        expect(page).to have_content 'コロナ渦での羽生結弦が魅せてくれた演技は感動ものでした！'
        expect(page).to have_content 'パリーグ新人王の平とホームラン王の浅村との力と力のガチンコ勝負は痺れます！'
        expect(page).to have_content 'サムベネットのシャンゼリゼでの最終スプリントは印象に残りました。'
      end
    end

    context 'when input invalid contents' do
      it 'display error-item' do
        login(user)
        find('#modal-post-open').click
        fill_in '投稿記事のタイトル*', with: '2020年心が震えたスポーツ名場面4選'
        fill_in '投稿記事の説明 #ハッシュタグも付けてみよう！', with: '個人的に心が震えたスポーツ名場面を4つ選びました！是非、みなさんも見て下さい！ #2020年スポーツ名場面 #心震える名場面'
        fill_in 'おすすめ動画#1 YouTube動画URL*', with: 'invalid url'
        fill_in 'post_form_movie_content_1', with: '洗練された堀口恭司のカーフキックとリベンジ成功と悔しがる朝倉海は見応えありです！'
        fill_in 'おすすめ動画#2 YouTube動画URL*', with: 'https://www.youtube.com/watch?v=XxxlkINbMls'
        fill_in 'post_form_movie_content_2', with: 'コロナ渦での羽生結弦が魅せてくれた演技は感動ものでした！'
        fill_in 'おすすめ動画#3 YouTube動画URL*', with: 'https://www.youtube.com/watch?v=EyEKsLI4ZEQ&t=2s'
        fill_in 'post_form_movie_content_3', with: 'パリーグ新人王の平とホームラン王の浅村との力と力のガチンコ勝負は痺れます！'
        fill_in 'おすすめ動画#4 YouTube動画URL*', with: 'https://www.youtube.com/watch?v=tw-G2nMnM8A'
        fill_in 'post_form_movie_content_4', with: 'サムベネットのシャンゼリゼでの最終スプリントは印象に残りました。'
        click_button '投稿'
        expect(page).to have_content 'エラーが発生しました。以下の項目について確認してください。'
      end
    end
  end

  describe 'Post Delete Function  ' do
    context 'when posted-user is login' do
      it 'complete post-delete' do
        login(user)
        visit post_path(post)
        page.accept_confirm '削除しますか？' do
          find('.post-show-content-head__info-delete-logo').click
        end
        sleep 3
        expect(page).to have_content '投稿を削除しました。'
        expect(current_path).to eq root_path
      end
    end
  end

  describe 'User Show View ' do
    context 'when push user-icon or user-name' do
      it 'complete redirect user-show-page' do
        login(user)
        visit post_path(post)
        find('.post-show-content-article__head-info-icon-img').click
        expect(current_path).to eq user_path(user)
        visit post_path(post)
        find('.post-show-content-article__head-info-username').click
        expect(current_path).to eq user_path(user)
      end
    end
  end

  describe 'Post Category Show View ' do
    let!(:category) { create(:category, name: 'エンターテイメント') } 
    before do
      create(:post_category, post: post, category: category)
    end

    context 'when push category in top-page' do
      it 'complete redirect category-show-page' do
        visit root_path
        click_link 'すべて見る', href: category_path(category)
        expect(current_path).to eq category_path(category)
      end
    end

    context 'when push item in category-menu' do
      it 'complete redirect category-show-page' do
        visit root_path
        find('#category-menu-open').click
        click_link 'エンターテイメント'
        expect(current_path).to eq category_path(category)
      end
    end

    context 'when push category in relation-info' do
      it 'complete redirect category-show-page' do
        visit post_path(post)
        find('.relation-flame__content').click
        expect(current_path).to eq category_path(category)
      end
    end
  end

  describe 'Post Tag Show View ' do
    let!(:tag) { create(:tag, name: 'MyBest') }
    before do
      create(:post_tag, post: post, tag: tag)
    end
    context 'when push item in tag-menu' do
      it 'complete redirect tag-show-page' do
        visit root_path
        find('#tag-menu-open').click
        click_link 'MyBest'
        expect(current_path).to eq tag_path(tag)
      end
    end

    context 'when push tag in relation-info' do
      it 'complete redirect tag-show-page' do
        visit post_path(post)
        find('.relation-flame__content').click
        expect(current_path).to eq tag_path(tag)
      end
    end
  end

  describe 'Post Comment Function' do
    before do
      login(user)
      visit post_path(post)
    end
    context 'when comments' do
      it 'complete comments and display items' do
        expect(page).to have_selector '#comment-count', text: '0'
        fill_in 'post-comment-form-body', with: 'とても参考になりました！'
        click_button 'コメント'
        expect(page).to have_content 'とても参考になりました！'
        expect(page).to have_selector '#comment-count', text: '1'
        expect(page).to have_selector '.comment-info__username', text: 'Alice'
        expect(page).to have_selector '.comment-info__date'
      end
    end

    context 'when delete comment' do
      it 'complete delete and display no items' do
        fill_in 'post-comment-form-body', with: 'とても参考になりました！'
        click_button 'コメント'
        expect(page).to have_selector '#comment-count', text: '1'
        page.accept_confirm '削除しますか？' do
          find('.comment-info__delete').click
        end
        expect(page).to have_selector '#comment-count', text: '0'
        expect(page).to_not have_content 'とても参考になりました！'
      end
    end

    context 'when input invalid comment' do
      it 'display error-item' do
        invalid_comment = 'a' * 500
        fill_in 'post-comment-form-body', with: invalid_comment
        click_button 'コメント'
        expect(page).to have_content 'エラーが発生しました。以下の項目について確認してください。'
      end
    end
  end

  describe 'Post Favorite Function' do
    context 'when not-posted-user check and remove favorite', js: true do
      it 'change item color and number' do
        other_user = create(:user, name: 'Taylor', email: 'taylor@example.com')
        login(other_user)
        visit post_path(post)
        expect(page).to have_selector '.post-show-content-head__info-favorite-number', text: '0'
        find('.post-show-content-head__info-favorite-logo-nonmarked').click
        expect(page).to have_selector '.post-show-content-head__info-favorite-number', text: '1'
        expect(page).to have_selector '.post-show-content-head__info-favorite-logo-marked'
        find('.post-show-content-head__info-favorite-logo-marked').click
        expect(page).to have_selector '.post-show-content-head__info-favorite-number', text: '0'
        expect(page).to have_selector '.post-show-content-head__info-favorite-logo-nonmarked'
      end
    end
  end

  describe 'Post Bookmark Function' do
    context 'when not-posted-user check and remove bookmark', js: true do
      it 'change item color' do
        other_user = create(:user, name: 'Taylor', email: 'taylor@example.com')
        login(other_user)
        visit post_path(post)
        find('.post-show-content-head__info-bookmark-logo-nonmarked').click
        expect(page).to have_selector '.post-show-content-head__info-bookmark-logo-nonmarked'
        find('.post-show-content-head__info-bookmark-logo-marked').click
        expect(page).to have_selector '.post-show-content-head__info-bookmark-logo-marked'
      end
    end
  end
end
