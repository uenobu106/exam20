class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
  #メッセージの内容やひもづく会話、ユーザのIDが値が空でないかをチェック
  validates_presence_of :body, :conversation_id, :user_id
  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
    #日付データをフォーマットするメソッド
  end
end
