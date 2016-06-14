class Message < ActiveRecord::Base
    validates :title, presence: true, length: {maximum: 50, minimum: 3}
    validates :content, presence: true, length: {maximum: 100, minimum: 3}
end