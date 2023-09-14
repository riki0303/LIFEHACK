module ApplicationHelper
  def default_meta_tags
    {
      site: 'LIFEHACK',
      title: '人生を変えるアイテムがここに',
      reverse: true,
      charset: 'utf-8',
      description: 'LIFEHACKは便利なアイテムを投稿できるSNSサービスです。',
      keywords: 'ライフハック,ガジェット,',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('top-logo.png'), # 配置するパスやファイル名によって変更すること
        local: 'ja-JP'
      },
      # Twitter用の設定を個別で設定する
      twitter: {
        card: 'summary', # Twitterで表示する場合は大きいカードにする
        # site: '@', # アプリの公式Twitterアカウントがあれば、アカウント名を書く
        image: image_url('twitter-ogp.png') # 配置するパスやファイル名によって変更すること
      }
    }
  end
end
