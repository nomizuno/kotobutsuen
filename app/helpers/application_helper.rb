module ApplicationHelper

  APP_NAME = 'kotobutsuen'

  def default_meta_tags
   {
     site: 'kotobutsuen.com',
     title: 'ことぶつえん',
     reverse: true,
     charset: 'utf-8',
     description: '「ことぶつえん」は投稿型辞書アプリです。一緒にことばの新しい意味を考えてみない？',
     separator: '|'
     # icon: [
       # { href: image_url('favicon.ico') },
       # { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
     # ],
     # og: {
       # site_name: 'サイト名',
       # title: 'タイトル',
       # description: 'description',
       # type: 'website',
       # url: request.original_url,
       # image: image_url('ogp.png'),
       # locale: 'ja_JP',
     # },
     # twitter: {
       # card: 'summary',
       # site: '@ツイッターのアカウント名',
     # }
   }
 end

end
