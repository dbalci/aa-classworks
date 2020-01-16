require 'sqlite3'
require 'singleton'

class QuestioneDatabase < SQLite3::Database
  include Singleton
  def initialize 
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Questions
  attr_accessor :id, :title, :body, :author_id
  def self.find_by_id(id)
    question = QuestioneDatabase.instance.execute(<<-SQL, id)
    SELECT 
      *
    FROM
      questions
    WHERE
      id = ?
    SQL
    return nil unless question.length > 0
    Questions.new(question.first)
  end

  def self.find_by_author_id(author_id)
    question = QuestioneDatabase.instance.execute(<<-SQL, author_id)
    SELECT *
    FROM questions
    WHERE author_id = ?
    SQL
    return nil unless question.length > 0
    Question.new(question.first)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def author
    Users.find_by_id(@author_id)
  end

  def replies 
    Replies.find_by_question_id(@id)
  end
end

class Users
  attr_accessor :id, :fname, :lname

  def self.find_by_id(id)
    user = QuestioneDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM questions
    WHERE id = ?
    SQL
    return nil unless user.length > 0
    Users.new(user.first)
  end

  def self.find_by_name(fname, lname)
    user = QuestioneDatabase.instance.execute(<<-SQL, fname, lname)
    SELECT 
      *
    FROM
      users
    WHERE
      fname = ?
    AND
      lname = ?
    SQL
    return nil unless user.length > 0

    Users.new(user.first)

  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Questions.find_by_author_id
  end

  def author_replies
    Replies.find_by_user_id
  end

  def create
    raise "#{self} already in database" if @id
    QuestioneDatabase.instance.execute(<<-SQL, fname, lname)
      INSERT INTO
        users (fname, lname)
      VALUES
        (?, ?)
    SQL
    @id = QuestioneDatabase.instance.last_insert_row_id
  end
end

class QuestionFollows
  attr_accessor :id, :users_id, :question_id
  def self.find_by_id(id)
    question_follow = QuestioneDatabase.instance.execute(<<-SQL, id)
    SELECT 
      *
    FROM
      question_follows
    WHERE
      id = ?
    SQL
    return nil unless question_follow.length > 0
    QuestionFollows.new(question_follow.first)
  end

  def initialize(options)
    @id =  options['id']
    @users_id =  options['users_id']
    @question_id =  options['question_id']
  end
end

class Replies
  attr_accessor :id, :users_id, :question_id, :child_reply_id, :body
  def self.find_by_id(id)
    reply = QuestioneDatabase.instance.execute(<<-SQL, id)
    SELECT 
      *
    FROM
      replies
    WHERE
      id = ?
    SQL
    return nil unless reply.length > 0
    Replies.new(reply.first)
  end

  def self.find_by_user_id(user_id)
    reply = QuestioneDatabase.instance.execute(<<-SQL, user_id)
    SELECT 
      *
    FROM
      replies
    WHERE
      user_id = ?
    SQL
    return nil unless reply.length > 0
    Replies.new(reply.first)
  end
  
  def self.find_by_question_id(question_id)
    reply = QuestioneDatabase.instance.execute(<<-SQL, question_id)
    SELECT 
      *
    FROM
      replies
    WHERE
      question_id = ?
    SQL
    return nil unless reply.length > 0
    Replies.new(reply.first)
  end

  def initialize(options)
    @id = options['id']
    @users_id =  options['users_id']
    @question_id =  options['question_id']
    @child_reply_id = options['child_reply_id']
    @body = options['body']
  end

  def author
    Users.find_by_id(@users_id)
  end

  def question
    Questions.find_by_id(@question_id)
  end

  def parent_reply
    self.find_by_question_id(@question_id)
  end

  def child_replies
    reply = QuestioneDatabase.instance.execute(<<-SQL, child_reply)
    SELECT body
    FROM replies
    WHERE replies.id = child_reply_id 
    SQL
    return nil unless reply.length > 0
    Replies.new(reply.first)
  end
end

class QuestionLikes
  attr_accessor :id, :users_id, :question_id, :likes
  def self.find_by_id(id)
    question_like = QuestioneDatabase.instance.execute(<<-SQL, id)
    SELECT 
      *
    FROM
      question_likes
    WHERE
      id = ?
    SQL
    return nil unless question_like.length > 0
    Question_likes.new(question_like.first)
  end

   def initialize(options)
    @id =  options['id']
    @users_id =  options['users_id']
    @question_id =  options['question_id']
    @likes = options['likes']
  end
end


