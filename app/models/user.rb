# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  account                :string           not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_account               (account) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :account, length: {minimum: 6}, uniqueness: true

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorites, through: :likes, source: :post
  has_one :profile, dependent: :destroy

  # フォローする関係
  has_many :following_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :followings, through: :following_relationships, source: :following
  # フォローされている関係
  has_many :follower_relationships, foreign_key: 'following_id', class_name: 'Relationship', dependent: :destroy
  has_many :follower, through: :follower_relationships, source: :follower


  def prepare_profile
    profile || build_profile
  end

  def follow!(user)
    following_relationships.create!(following_id: user.id)
  end

  def unfollow!(user)
    relation = following_relationships.find_by(following_id: user.id)
    relation.destory!
  end
end

